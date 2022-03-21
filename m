Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B84E2DE7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:28:57 +0100 (CET)
Received: from localhost ([::1]:56780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKtr-0001sc-KO
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:28:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWKnb-0000Ps-02
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:22:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWKnZ-0004eJ-8f
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647879744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSaMjPtUL/t3yDtYwpuxiJQuCTDqmYDQUbpQ8hW7ixI=;
 b=a2sMUjfNHQMPEfnLnIddPUbuUf6p4oY0YTGoIfCiVyaOANA+r5VVbBn86z4yi8SE8cuSQl
 EudY7TrqgApfYjWIdlJUCwbP30/Q4hi3m6srVc+lpuetxUuOAlMkClRP1y9amnAysJqM6e
 CrkEs9xASck5pWs7rQ6+XhJYWTBNeM4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-9CHvQWYIMBqYy5WX2_1PPw-1; Mon, 21 Mar 2022 12:22:23 -0400
X-MC-Unique: 9CHvQWYIMBqYy5WX2_1PPw-1
Received: by mail-ej1-f71.google.com with SMTP id
 zd21-20020a17090698d500b006df778721f7so7272841ejb.3
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YSaMjPtUL/t3yDtYwpuxiJQuCTDqmYDQUbpQ8hW7ixI=;
 b=REdkUjeazH/uBcnYDxTWZ8cCUK6hXaONj4xAezsbZd+NuVw9eYjg1vFj10sq0MQVG+
 sldXxomT/WORuxj1yy44hermWXQqo/ftgExgm2Etvo2qjLW32YeGmbfhsMtLXIc5QfmT
 b2nAXmldqEeRMvSgDcC9cGM08zNvo4MzNoMVtZBM2SLEpCSW7WHUqmBqTFa89dNoltqy
 Cp69uxNjVnfZ+zXreQVpaqA3elzm+pQgyp9Yyq8asF7hb14HAJI/Cm1p83IvG35kompI
 8bjqhrkQf/AJHTnTgpCbsHJihEy2iMaIfdmuIn0ES14hTT9IsaFFDn/ezLnuqQRZ4ygO
 UekQ==
X-Gm-Message-State: AOAM5304rVxDSyijWQcuWxms9SQvxc2wEKzZcjtZ5WcKs+UWDujfcAVc
 4JAXe5fdv1VO3nd+QGqUlh2NK/PbUFteDXjrOrKNZoeTf6g+UQ+LnVwyPH7q4lPOnm9MnSAJsTj
 tUBo2easPw5gqyw4=
X-Received: by 2002:a05:6402:1d4d:b0:419:430b:5734 with SMTP id
 dz13-20020a0564021d4d00b00419430b5734mr5077916edb.212.1647879742221; 
 Mon, 21 Mar 2022 09:22:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0idp573oltbriih1fYDSEqs2f8Q5r1ot1M+a8ddav7Avl2vbUHDjTLirBXI5+7e28J1GxPg==
X-Received: by 2002:a05:6402:1d4d:b0:419:430b:5734 with SMTP id
 dz13-20020a0564021d4d00b00419430b5734mr5077890edb.212.1647879741932; 
 Mon, 21 Mar 2022 09:22:21 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a170906145000b006bdaf981589sm7076696ejc.81.2022.03.21.09.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 09:22:21 -0700 (PDT)
Message-ID: <218ffc35-dcc5-e522-db14-7d193e279787@redhat.com>
Date: Mon, 21 Mar 2022 17:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/qemu-iotests/testrunner: Supply a test plan in TAP
 mode
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220223095816.2663005-1-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220223095816.2663005-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.02.22 10:58, Thomas Huth wrote:
> Quoting the TAP specification: "The plan tells how many tests will be
> run [...]. It’s a check that the test file hasn’t stopped prematurely."
> That's a good idea of course, so let's support that in the iotest
> testrunner, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/testrunner.py | 1 +
>   1 file changed, 1 insertion(+)

Yep, that seems to work nicely.  Thanks!

Applied to my block branch (better late than never):

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna


