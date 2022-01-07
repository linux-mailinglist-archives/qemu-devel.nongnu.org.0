Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F787487389
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 08:26:53 +0100 (CET)
Received: from localhost ([::1]:42190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5jeF-0000jA-ON
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 02:26:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5jXj-0006Tp-Uv
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 02:20:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5jXe-0003Of-UT
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 02:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641539999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4X9I6cir+umJGRyQiHhLsquyt9RsFgwpmHz7Lkv3Hc=;
 b=ICgAigXXpN1BYq8m0K0f4kmNkncSse6PboeP1mxa8pkpwQODDrfoQDU/iIjMBuW4uPBtWx
 DID0W2qjxSVTRsnZ+SLNznrUQC4hGpT3lrRDYHhdYrLcKEF36Oz/Vz38RrjaW413J73kjm
 YN5ryJNANoCJPgVKAFFIxH7fO6dhv8I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-ZFetg2n4M_qoekNOIJOEFQ-1; Fri, 07 Jan 2022 02:19:29 -0500
X-MC-Unique: ZFetg2n4M_qoekNOIJOEFQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 az9-20020a05600c600900b0034692565ca8so3207679wmb.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 23:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V4X9I6cir+umJGRyQiHhLsquyt9RsFgwpmHz7Lkv3Hc=;
 b=UJZHRKonmqoE52blqDdNz/FDhHkq4e83c9eQbzz9bmsqaPSKFp+sUcXp72q1x4j/s0
 V4JWwNL9bKpRIBdbEec4ybWcO9U87CLOFd3bOXTRJU+PDr9mEpJcSKgTmo5DV1ZB6xtX
 ABDHBEBV4Zc3b+5TdJNYhMMY5Q2P7nQrAmWOu5VBt8z4ALNMMgtPYGs+YOczARyQG/oU
 57qtcBTAiBJLzyDWQdXFd0TLtwaE4VxQN2yY5P6p/fzBF3lsfC390rilEQeJY+rm7t/v
 pDUaTcaTGR42xKIrOCBgzqOtxSJXjPDReOa8xMIbZRqWWc+uRQbSn+9UHIvZ3l7sOTZn
 VSVA==
X-Gm-Message-State: AOAM531mDF/3h4cD5kvoVfP6YS6XfcLYOldwWygG/xF7IP6lTlCRbTm2
 hE8oXkG4CcRh5+QptDuWwJFbbX89XxtriiYV/JA7H6JmbSYa0qOOcdv+TFegF63K7v7jcPiS6Sn
 qCWnvcuFbJ5ojG88=
X-Received: by 2002:a5d:64eb:: with SMTP id g11mr23059169wri.135.1641539968594; 
 Thu, 06 Jan 2022 23:19:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTK+nfEC63JX56CVKGlZo7XXnX0xa0T9pgslVTpRlbdSKOrokF946k0dwB+OeAV1jC6VDJxA==
X-Received: by 2002:a5d:64eb:: with SMTP id g11mr23059156wri.135.1641539968409; 
 Thu, 06 Jan 2022 23:19:28 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id j13sm7778168wmq.11.2022.01.06.23.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 23:19:27 -0800 (PST)
Message-ID: <f46243a7-dca7-00d5-9cd6-991dca3b1522@redhat.com>
Date: Fri, 7 Jan 2022 08:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] docs/can: convert to restructuredText
To: Lucas Ramage <lucas.ramage@infinite-omicron.com>
References: <20211217212146.2573-1-oxr463@gmx.us>
 <9311d288-22bc-fb94-ad64-ddbd1c5e32f8@redhat.com>
 <UzkASXLpdM1kPkwP0fy-YM9n_cqQD5FJcSpZLwil4YCIZNm8XXWF8D18XU4cxjiOwfDf4oDILe-HmF3WcLKaifLTuT4Lq9V5cF-8LBQJ5MM=@infinite-omicron.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <UzkASXLpdM1kPkwP0fy-YM9n_cqQD5FJcSpZLwil4YCIZNm8XXWF8D18XU4cxjiOwfDf4oDILe-HmF3WcLKaifLTuT4Lq9V5cF-8LBQJ5MM=@infinite-omicron.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: oxr463@gmx.us, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2022 20.52, Lucas Ramage wrote:
> Hi Thomas,
> 
> I intentionally sent the email via my gmx address. But I want my commit under the infinite-omicron email address.
> 
> I had a few warnings on my end, but it builds fine with Sphinx v3.4.3 on Debian Bullseye. I can clean up the warnings in the new patch.

Yes, please do so. If you add "--enable-werror" to your "configure" options, 
the warnings should be turned into errors as well - and that's what we do in 
our CI, so the warnings have to be fixed first before this patch can be 
included.

  Thanks,
   Thomas


