Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE2C3A2EB5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:56:00 +0200 (CEST)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrM6B-0004aF-JU
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lrM3G-0007bF-Nt
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:52:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lrM3B-00061L-Ee
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:52:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623336772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApnUIAb5paOarkc9kqn0ochYlijH3G4mHQMCSe5mlnM=;
 b=aIrsf1Yf0BhnhVLY33T530PaomIEoitmgRvJcIKTnXfXB18lCYbKQ8fqifcSvpiUOuJXAU
 ry7ZVKjLMYbUcZ3QjicozsS3Le++V7Bo01dRLbruJYPsAYiRMY4kzVXurbNQ5/PjQVDTZ8
 8/3+EdtI3DrMg4qvSo/0ZKSH6kIxbM4=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-KKmYB-6zNQ-ikqKwRh5_wA-1; Thu, 10 Jun 2021 10:52:51 -0400
X-MC-Unique: KKmYB-6zNQ-ikqKwRh5_wA-1
Received: by mail-oo1-f69.google.com with SMTP id
 t19-20020a4ae4130000b029023950cb8d35so17432619oov.6
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ApnUIAb5paOarkc9kqn0ochYlijH3G4mHQMCSe5mlnM=;
 b=aWr6uRDiFNye3MDWlnDYGwJVjDFY3Bt9XRSpB8bwdt+quJJv8jk/ncD31DnOJbBNGn
 T4jVZjjGyshT7Uw7Sq58IPkH8si69vd6070trAhLIezDfX+ha5eRSEsrttV6qFshGCH5
 to4l3AMN24xtmV1Fy1xjH3UqJlXe+gT+eGlBr0k2HCXXp6WpCu6v1Bz5rAenYSJjMTjc
 dUYr5hTKclxQ1OvPbgSHSw4EpLNjFtVCj0OfBNI6g7Ak+uBm/6twtmzCfvvhiNupUcp0
 ls4zxSzYaWxCZRnhExx9Mzlln+HBNsPtRgR+NXBKNWFjZTxVOMK52BYh/TwZJTahE1Tp
 GfAQ==
X-Gm-Message-State: AOAM533IgTeYkOVh54sLAohi4KQGo6nBo+0G1Qjha9bGnzci5D/ywaMS
 gL9WddtyHV4QEeVzUXEenR6iNP/u3AI9/cId+afMuB7bZyYLHeOIESpvBUHRQX+s5rXWqqBjCWL
 d51kmAWJiIvQ0nCs=
X-Received: by 2002:a05:6830:1284:: with SMTP id
 z4mr2795313otp.148.1623336771113; 
 Thu, 10 Jun 2021 07:52:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8iFn5X7rnLXsjNpxVDcEjKwk5USAN3wcnmtX5T3eFnGSzd9u1jq3Ljc1YqFIu7R8D4l5oaA==
X-Received: by 2002:a05:6830:1284:: with SMTP id
 z4mr2795302otp.148.1623336770971; 
 Thu, 10 Jun 2021 07:52:50 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 m18sm625249otr.61.2021.06.10.07.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:52:50 -0700 (PDT)
Subject: Re: [PATCH 06/11] target/i386/sev: Remove sev_get_me_mask()
To: qemu-devel@nongnu.org, Brijesh Singh <brijesh.singh@amd.com>
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-7-philmd@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <284cccdd-2e3d-d800-1f1b-7057893c1da2@redhat.com>
Date: Thu, 10 Jun 2021 09:52:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610064556.1421620-7-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 1:45 AM, Philippe Mathieu-Daudé wrote:
> -uint64_t
> -sev_get_me_mask(void)
> -{
> -    return sev_guest ? sev_guest->me_mask : ~0;
> -}
> -
>  uint32_t
>  sev_get_cbit_position(void)
>  {
> @@ -810,8 +803,6 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>          goto err;
>      }
>  
> -    sev->me_mask = ~(1UL << sev->cbitpos);
> -
>      devname = object_property_get_str(OBJECT(sev), "sev-device", NULL);
>      sev->sev_fd = open(devname, O_RDWR);
>      if (sev->sev_fd < 0) {
> 

Brijesh, do you remember if this was added with the intent that it would
be useful in a future series?

Otherwise:

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


