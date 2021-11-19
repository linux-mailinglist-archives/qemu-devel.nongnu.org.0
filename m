Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E25456897
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 04:21:47 +0100 (CET)
Received: from localhost ([::1]:51366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnuTC-00034f-Qi
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 22:21:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnuRF-0000Xa-L3
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 22:19:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnuRC-00066U-Ut
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 22:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637291982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+lVFe/Qv89wkBj6vh2uOAjhK72+xkD/W1zcFv0cNJI=;
 b=OKdgtJjGTuaMIfChahXzGToCKuKR/iIAV6aE+mHQmERq5kFwMArdpP6HNCypL179bRyEXL
 pxLN3DOz80D9foBYEt3BZhMCU4oLetFPojjZJdftR8LtZayPjenPRuoCa1Vkj6wtrjkBQS
 Nc4Z2lAcds6R9FaVQ6j5+zl5iaSPHp8=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-At39ePNsPEqPzCtGlyAObw-1; Thu, 18 Nov 2021 22:19:41 -0500
X-MC-Unique: At39ePNsPEqPzCtGlyAObw-1
Received: by mail-pf1-f199.google.com with SMTP id
 a127-20020a627f85000000b0047feae4a8d9so4827922pfd.19
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 19:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z+lVFe/Qv89wkBj6vh2uOAjhK72+xkD/W1zcFv0cNJI=;
 b=QhQp5175+WJcW3w8Q9W07MxMjiSglpyufaNrBYEb/EIet8rk+kXxDDxy5XK7uWcSWI
 HQm9HPtLTqzmOSaakm9UPDJmbbADEfo4t/dbFZ3e61wDpbb3hah+5x5zVg5QXfEtyANp
 xFh0oJH4GrRtXqQtD8BpjniL11pBzLCi6/w5yim5XHVysC9OH/FeSBF4O4+C4uAU7cum
 yBgpG7ea/1xUZtj8e/s9HyEjfRgTznVslmuXTXlOmRAC8YTpysDxW0k8S2vTYsm4ivOO
 XcnOYNUEvRIiERZ0VpTM6m6V4L5rH8hfceCHJP2uBIk7jy02PBcVor2fVsQyWtd0ajBk
 pCng==
X-Gm-Message-State: AOAM5316pA5zMN1YrrUSP43CgCYjB1pvm1HZ48QrLYL0lcawhbHoyzFi
 LlzzcDhULDOnVTdAoMqYFNOg5R/Kx32y1f1FUIxfHzdNR/c9f6IAPruLAU0bosYiKNkEr85i4GK
 wKWyKQA5iIdrBj8E=
X-Received: by 2002:a65:408c:: with SMTP id t12mr15106600pgp.262.1637291979961; 
 Thu, 18 Nov 2021 19:19:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTm5kurXOdUvrJbAiiJMdlg7wL+F9qGrJFj75yqQ9/FF19RlD4RFZSK39Fm1gb4IQGbMS53Q==
X-Received: by 2002:a65:408c:: with SMTP id t12mr15106585pgp.262.1637291979748; 
 Thu, 18 Nov 2021 19:19:39 -0800 (PST)
Received: from [10.72.13.18] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id d13sm967693pfu.196.2021.11.18.19.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 19:19:39 -0800 (PST)
Message-ID: <5bab6e91-b469-17cd-dc3c-5b788d703bbf@redhat.com>
Date: Fri, 19 Nov 2021 11:19:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 2/2] net/colo-compare.c: Fix incorrect return when input
 wrong size
To: Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
References: <20211118032011.249517-1-chen.zhang@intel.com>
 <20211118032011.249517-2-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20211118032011.249517-2-chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/11/18 上午11:20, Zhang Chen 写道:
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---


Applied.

Thanks


>   net/colo-compare.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 1225f40e41..b966e7e514 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -807,7 +807,7 @@ static int compare_chr_send(CompareState *s,
>       }
>   
>       if (!size) {
> -        return 0;
> +        return -1;
>       }
>   
>       entry = g_slice_new(SendEntry);


