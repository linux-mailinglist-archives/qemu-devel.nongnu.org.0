Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0B94C31B4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 17:43:36 +0100 (CET)
Received: from localhost ([::1]:44466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNHDL-00016j-UK
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 11:43:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNHBV-0007vX-J3
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:41:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNHBT-0000uC-48
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645720898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rO3KM2eQnXfZE6lgRIT4j8Y39dvdHomoYSqMPm10GIc=;
 b=PRlPYX7ka8+N52g5c5ETNhI9JaUkp/ahTKvr2N7l0A/uh370BegkkDBz9DlkPxLBcRELMF
 hfengNEpmlG7MMQNhEkd69EUXUqx9feTrIC5P9WDcjEuOdMknjDNwvtBvVuA5MmeId4wWP
 tVUK47qF+1uDJFYYYnVmiZJBch1IOm0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-CWi0PcXbNhaMm_RXA4Z2Og-1; Thu, 24 Feb 2022 11:41:35 -0500
X-MC-Unique: CWi0PcXbNhaMm_RXA4Z2Og-1
Received: by mail-ej1-f72.google.com with SMTP id
 gn20-20020a1709070d1400b006cf1fcb4c8dso1475343ejc.12
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 08:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rO3KM2eQnXfZE6lgRIT4j8Y39dvdHomoYSqMPm10GIc=;
 b=F8vnAQmCbn3aMPqlVtZFNupLT87aq7VVHxSjLDg4E4J0inANMc9ExU5GbeL5MLMdIJ
 7c1LtfZ0DX18P1HYxBvtaQFIaHhF3WZtWalH6UtaOYK6hh2dFnV5phxNQ0/Tuhw39E0T
 hzB1nRGH9K78vDtpHFrF8ZCyk6IGjaIyXUu87nh+uIB1c5z7KGX9xgnSf3XDIRZPK3TH
 8U14cIjt+oH0hFkaAVKyq1ij/lVfgotY0zE+RHxuL8t2dCsnwfe7dkYcF9EpEayCHedk
 P/mfMKMDaSrxil5npWicCT6YwN/8cgP7+G7N7yfJS1NgYJNrq3jgRGD/9xxvaZE73xB4
 LrCQ==
X-Gm-Message-State: AOAM533l4Bn4zi/OTLS1zTgQfawfi2WmTxPdEzDuNbj/wBYmFHovh5JJ
 eAdt2IIwlCNoA6KW/9CWun3GNqMozGM9kIr5JCMwZEGsS4K8CoveQjR+cu0XKwYX9nFNyBcdaT0
 pByOf69iTURpUOOM=
X-Received: by 2002:a17:906:2619:b0:6cf:54ad:fff3 with SMTP id
 h25-20020a170906261900b006cf54adfff3mr3067894ejc.262.1645720894389; 
 Thu, 24 Feb 2022 08:41:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/kDkHa5hyxmi71iKP9DJFDWsNOX9jEpywTQ+UxLWitPLTm9arbv5T5sntuGkqSIDiQ+BDcQ==
X-Received: by 2002:a17:906:2619:b0:6cf:54ad:fff3 with SMTP id
 h25-20020a170906261900b006cf54adfff3mr3067875ejc.262.1645720894088; 
 Thu, 24 Feb 2022 08:41:34 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id a10sm1011800edf.14.2022.02.24.08.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 08:41:33 -0800 (PST)
Message-ID: <d4c3401e-9429-a40d-6cfd-0c4d89d83d3a@redhat.com>
Date: Thu, 24 Feb 2022 17:41:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/qemu-iotests/040: Skip TestCommitWithFilters
 without 'throttle'
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
References: <20220223123127.3206042-1-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220223123127.3206042-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.02.22 13:31, Thomas Huth wrote:
> iotest 040 already has some checks for the availability of the 'throttle'
> driver, but some new code has been added in the course of time that
> depends on 'throttle' but does not check for its availability. Add
> a check to the TestCommitWithFilters class so that this iotest now
> also passes again if 'throttle' has not been enabled in the QEMU
> binaries.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/040 | 1 +
>   1 file changed, 1 insertion(+)

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna


