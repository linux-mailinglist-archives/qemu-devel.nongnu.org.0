Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576664F7B9F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:28:20 +0200 (CEST)
Received: from localhost ([::1]:33060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncOR9-0004By-5h
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncOJZ-0007Dc-6c
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:20:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncOJW-00064A-RQ
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 05:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649323225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3p+CnLGGti/jVs8t1y8AqDBo8K31jHF15SmR6g77Oo=;
 b=aZCrn+n5ntcyOaBLDlPsJXH8rKuu70+2Z0C974OXRVsO5oqXOI1niT9Yk0aaDHTjmQg/59
 DHoyNO5NrrND+HnisqGva/AKkiktAKiRPy0+0iwL1nt9FF3r7RgyFO4lbRyTlqBcpzA/li
 ZaFftyAVSf7vX3RfVUMGAO7UwZWkXhY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-Pok7xI9JPGO17XvnKag8hQ-1; Thu, 07 Apr 2022 05:20:24 -0400
X-MC-Unique: Pok7xI9JPGO17XvnKag8hQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 sd5-20020a1709076e0500b006e6e277d2b4so2698645ejc.14
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 02:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+3p+CnLGGti/jVs8t1y8AqDBo8K31jHF15SmR6g77Oo=;
 b=F1woGa+Zy9WRNrLg+RV0oLU/RsT0o0yG1qDWZ/xiWhyVVYjqrS3w7mXRfkUh04RWt2
 1D7+9xjQU6Rh+6VaSmFZZjPuxN8P6cmyG08qrw74cMc0GDkxXAQ8FSiy5OkwHekEArl4
 eVfCJvvZ4W+IrcS7la5UuYUwZ/IJgmg9N6N0DLFKYV6wZVMonBFkQJIUquppiaxBPr8/
 gWP4GfwJ51rlRR31TMs6YF8Jf2JRR9x+eXaw1B1wwBzI9dfuVGV/aN1c0maiStAopAH8
 NiFQ+K9+47m3YF+R5d5Ej2I4v+8Z3bIxzLfTaHjnUHb7rUCQahVXNG2jqrtnc2dw2bqL
 8xpQ==
X-Gm-Message-State: AOAM532DYD4/EGejsdcm7aBsdlQkLNcmkpo/gumhsugJuOlrLwof8js0
 dqs5Ti3U4hym61T0YoC4XGhhGOSLTV0IGdG40Con7mCOWV4TlG5/CklkEgReRyoNcai7j4b6p5W
 WbDjNnYxiGY2HoMc=
X-Received: by 2002:a50:ed0b:0:b0:41c:cf60:a882 with SMTP id
 j11-20020a50ed0b000000b0041ccf60a882mr13359677eds.12.1649323222917; 
 Thu, 07 Apr 2022 02:20:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRYmckvrMKAh016CGNmC6EzPn1w6yzrXeWi3sT/FfPIVMAGYchzz3G8TDfYucpiXtFvHSeMA==
X-Received: by 2002:a50:ed0b:0:b0:41c:cf60:a882 with SMTP id
 j11-20020a50ed0b000000b0041ccf60a882mr13359662eds.12.1649323222760; 
 Thu, 07 Apr 2022 02:20:22 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 do8-20020a170906c10800b006dfe2af50d8sm7408079ejc.121.2022.04.07.02.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 02:20:22 -0700 (PDT)
Message-ID: <4585e3b5-8c49-7704-e524-9c7d8e53baa4@redhat.com>
Date: Thu, 7 Apr 2022 11:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/7] block/block-copy: block_copy(): add timeout_ns
 parameter
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220406180801.374844-1-vsementsov@openvz.org>
 <20220406180801.374844-6-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220406180801.374844-6-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.04.22 20:07, Vladimir Sementsov-Ogievskiy wrote:
> Add possibility to limit block_copy() call in time. To be used in the
> next commit.
>
> As timed-out block_copy() call will continue in background anyway (we
> can't immediately cancel IO operation), it's important also give user a
> possibility to pass a callback, to do some additional actions on
> block-copy call finish.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   include/block/block-copy.h |  4 +++-
>   block/block-copy.c         | 33 ++++++++++++++++++++++++++-------
>   block/copy-before-write.c  |  2 +-
>   3 files changed, 30 insertions(+), 9 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


