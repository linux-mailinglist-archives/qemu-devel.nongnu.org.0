Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808C95659E9
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:33:58 +0200 (CEST)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8O5F-0007XN-J8
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8O1j-0004Qn-5C
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:30:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8O1g-0003T2-Ex
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656948615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/C4pq4kIM5axi/efr7b9Dtgbp8UKKb8qgVoy+jmXmQE=;
 b=Y3apAQdwWLdb7H9OCA5sDsbAz6ijcBaVswluPf5brg1KDJY3FQyNYbPD5DsAuiuxcGhuqj
 Dzem33P0zj3h7nAsapnwxnclA5gdivxmztoOKSVJew5HW0bh/eT3GOTo6u0d9ulncNVvGD
 8LWGoEeDdXeQ0bKGrXP00cTCbFmV8K8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-21--hjYeNSut77Y44dj1Ng-1; Mon, 04 Jul 2022 11:30:14 -0400
X-MC-Unique: 21--hjYeNSut77Y44dj1Ng-1
Received: by mail-ej1-f69.google.com with SMTP id
 sh39-20020a1709076ea700b0072aa3156a68so981032ejc.19
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/C4pq4kIM5axi/efr7b9Dtgbp8UKKb8qgVoy+jmXmQE=;
 b=pp92FoppZXeWBq8Rl4uxmm+ymBW75e40KIXsX0VcfufKWnIfz2bVYJpbBrlDsdbDfm
 jfPLJMqdVavrnNJqQokPfRw9keke2lN6xjvONxVm5UN2T6lhOJzo8+IW/VMjG2h1Xw5N
 1GmAkeH7MvnSOqxpV9so1Fhwk+ykr2/YuS+eaj44WcSp4q6rPmg3hrtsJ787eZSUiAFw
 jWac4WxqF8gbvkeIGF+gMENfC3VV/IL1fnqXdnBy84sbvK/VW2AsCiNM25NMVuVXo4Mi
 jDpqxrN8aPGaqibx5x5ggX+IzqjgK2LtlQLDZtMrHNdaVVEwLPkKgf3o5q73CnfEdcTP
 ZYrQ==
X-Gm-Message-State: AJIora9IAJjI7LtshZx69CY6dEd0z4pRw5zIQjaKcMC5I3VW/4SaMxEW
 egQ8UjjsGcTdqNllaakOk5P/ASfAz91Nbf+2Q3BtZNk5Bkc2fFAs89SulpmycTVBeVGZgBC8gGq
 XGGfjWfV089iwqw8=
X-Received: by 2002:a17:906:4fc6:b0:722:e730:2355 with SMTP id
 i6-20020a1709064fc600b00722e7302355mr29033800ejw.50.1656948613397; 
 Mon, 04 Jul 2022 08:30:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1tQJbncnBByhQRp2yXr3kL4aeTGk7by41CAuZqBNr0ce6nPMqCsaOjFu/Py0Oo+QnTYK+Tg==
X-Received: by 2002:a17:906:4fc6:b0:722:e730:2355 with SMTP id
 i6-20020a1709064fc600b00722e7302355mr29033774ejw.50.1656948613093; 
 Mon, 04 Jul 2022 08:30:13 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 fx14-20020a170906b74e00b00726297021absm14290859ejb.152.2022.07.04.08.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 08:30:12 -0700 (PDT)
Message-ID: <b2398818-52e3-bc4c-0929-3f1a9ef1a809@redhat.com>
Date: Mon, 4 Jul 2022 17:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/18] block: Implement blk_{pread,pwrite}() using
 generated_co_wrapper
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-2-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113837.199696-2-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.22 13:38, Alberto Faria wrote:
> We need to add include/sysemu/block-backend-io.h to the inputs of the
> block-gen.c target defined in block/meson.build.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 23 -----------------------
>   block/coroutines.h                |  4 ----
>   block/meson.build                 |  1 +
>   include/sysemu/block-backend-io.h | 10 ++++++----
>   4 files changed, 7 insertions(+), 31 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


