Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8883C897E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:15:03 +0200 (CEST)
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iTO-00005j-0P
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m3iN4-0006BU-N4
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m3iN3-0002cU-51
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626282508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pENw184fACnSZLpy/r2d4M3jJhjg34w0pPVINZ+AW14=;
 b=Zj1kBinOPYgm6NcZo5e41lomHZrJLxRj8F6QvjRWT1tGw0DdtwRxFZBZvK71//RMiCxnhW
 qRu9akXNYn7g4nwFkITuNHWZoUnUI3kAM8g26spNtgt4lbiYmkSEaanCW7/EqqT4i6ISjJ
 ZZUFWYXpyScmyslXzSJKtO1loGJCK3U=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-EmQ2XaL7MWGBDmIU5ZSp2g-1; Wed, 14 Jul 2021 13:08:24 -0400
X-MC-Unique: EmQ2XaL7MWGBDmIU5ZSp2g-1
Received: by mail-pf1-f200.google.com with SMTP id
 b10-20020a056a000ccab029032dc5f71f6aso2250691pfv.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 10:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pENw184fACnSZLpy/r2d4M3jJhjg34w0pPVINZ+AW14=;
 b=guwoqgbyPtSu1qkYVc8t2w9Pfmk00j1Nlfj5qU+njFH2IY9TnbynsN9KL+vj30R5qY
 Nk28zCt5r7Dv7llguJAHppTeKJhTvCAFbNZVdOv2E0wmlhS68LiymcftaApwtS4UYOi/
 wqvMZQGZ90ZEnmQIOLLff/iYomBmcwcyUXQqGTE88x/pDC3L57wvef0zuSHB6+trp46h
 uoLlGv7Ou90sq85RywpuxD+W94adHzxb3zCgkj5jRv/6QDbEOhS7l0C6hB3ZVxPREC2b
 5180ykQTPFrZfHedULckS2U++Uqo0YOCrTSROmSJNxpDjx3QdqK/Pq0U1N/oKzCjOid+
 Ew9Q==
X-Gm-Message-State: AOAM530BklChZ4+K6lBDch9r5/P53aGVdqvSbl6vG11W/T9LWppT8pCe
 TwTCrSz0z8D8gkgJFm1ZGIuBV6/u3Vvf5JnnVWZ/1azSe7ap4zw8V4HDrc8KU+m67GcgCzx1UsN
 O2mPxzyDHAcB7moM=
X-Received: by 2002:a17:902:9a81:b029:121:a348:fa68 with SMTP id
 w1-20020a1709029a81b0290121a348fa68mr8248808plp.46.1626282503274; 
 Wed, 14 Jul 2021 10:08:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziD22Akx0RXbQFalHrdhbWbA4ZDqEMNVz3xQRcoxzgc9J8+rP2Z14fKZBstE/JRve4gyQQaA==
X-Received: by 2002:a17:902:9a81:b029:121:a348:fa68 with SMTP id
 w1-20020a1709029a81b0290121a348fa68mr8248775plp.46.1626282502945; 
 Wed, 14 Jul 2021 10:08:22 -0700 (PDT)
Received: from [192.168.0.18] ([65.129.103.82])
 by smtp.gmail.com with ESMTPSA id 11sm3927643pge.7.2021.07.14.10.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 10:08:22 -0700 (PDT)
Subject: Re: [RFC PATCH 5/6] i386/sev: add support to encrypt BIOS when
 SEV-SNP is enabled
To: Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org
References: <20210709215550.32496-1-brijesh.singh@amd.com>
 <20210709215550.32496-6-brijesh.singh@amd.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <3976829d-770e-b9fd-ffa8-2c2f79f3c503@redhat.com>
Date: Wed, 14 Jul 2021 11:08:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709215550.32496-6-brijesh.singh@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 3:55 PM, Brijesh Singh wrote:
> The KVM_SEV_SNP_LAUNCH_UPDATE command is used for encrypting the bios
> image used for booting the SEV-SNP guest.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  target/i386/sev.c        | 33 ++++++++++++++++++++++++++++++++-
>  target/i386/trace-events |  1 +
>  2 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 259408a8f1..41dcb084d1 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -883,6 +883,30 @@ out:
>      return ret;
>  }
>  
> +static int
> +sev_snp_launch_update(SevGuestState *sev, uint8_t *addr, uint64_t len, int type)
> +{
> +    int ret, fw_error;
> +    struct kvm_sev_snp_launch_update update = {};
> +
> +    if (!addr || !len) {
> +        return 1;

Should this be a -1? It looks like the caller checks if this function
returns < 0, but doesn't check for res == 1.

Alternatively, invoking error_report might provide more useful
information that the preconditions to this function were violated.

Connor


