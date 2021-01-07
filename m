Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A852ECDE9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:35:19 +0100 (CET)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSdS-0008QR-MJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxSX6-0002My-Sq
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:28:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxSX4-0000ar-VA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610015322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfASqMH51ICbnYZw4HvP/GEVi6NVQKK+d14oq73MpEA=;
 b=gI9VAM8DfYbdJfgBYWRa4XOjRkoGdHrjjw6ZRWUH28DFxpDYjLjpySACgVxHZz9+zbdGG4
 s/vwRNQTVk3Os72snbslaZ+1Zhol2QRTJIwaOdiMqSCEdyIRW1xYRbdc5eCkY9Z0nLNIVD
 zZ6HpZrNrf1ewJUUUwwRV4elC3CgZ3s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-6Nci2u8mMCmKBngnqAK23g-1; Thu, 07 Jan 2021 05:28:39 -0500
X-MC-Unique: 6Nci2u8mMCmKBngnqAK23g-1
Received: by mail-wm1-f70.google.com with SMTP id z12so2114889wmf.9
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 02:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yfASqMH51ICbnYZw4HvP/GEVi6NVQKK+d14oq73MpEA=;
 b=Qxgp0b7eyKFvcBZrPWD76vOl/2a/ypftNZvVQpYNMPTtf2JkQotwajJZUZtXnqrizM
 eIDmvXXHcNTdG5c3B4GXR3yOhfx9jOfcud1pUs9nbBDbB8iiAWWo52tBXAQwXjOWwmsu
 2dcmXcqUcDHqIhiAmJlYQgcbskaxMT9KR93NKmJHRZpyvoRfuSKbFhtBhlYz2QyLed9C
 gZGkltIe4VSiKmJ8Knbm374ibRWaDGug/iE6k3Sd+hLY+r88y0mwo8px2af0zFv9xIOH
 yIOd3oj7vDKst3iVmSdlhCTRLf9bkPlYQ+sm3AWKEKBlxQq84ThjY5tJTeKGjZhqW9SA
 E46w==
X-Gm-Message-State: AOAM533SoIcvps1ZXVzAXgqPhiPSUQlnOgWpZqiB7ZEZ/jNs8gWZWRfx
 XJZQtx0SyYRMI3Qyk7AShCtKgPjDO4aNNxnLOGbQDEE55CqyRyvopV7vHdaIL5Fr/VGp7OLX0nj
 5ryK2SX2ru8QUJ2o=
X-Received: by 2002:a05:600c:220b:: with SMTP id
 z11mr7566494wml.64.1610015317854; 
 Thu, 07 Jan 2021 02:28:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWgXEIAyjGzVVRunieJ/AQV4ufi3oprYYJDOzueEOfMJ5N13jMVEGshKmMM6bDKQsG16AdUQ==
X-Received: by 2002:a05:600c:220b:: with SMTP id
 z11mr7566478wml.64.1610015317630; 
 Thu, 07 Jan 2021 02:28:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id c6sm7843052wrh.7.2021.01.07.02.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 02:28:36 -0800 (PST)
Subject: Re: [PATCH v4 0/5] Misc meson fixes along test-vmstate fixes
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20210107101919.80-1-luoyonggang@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <86c4007d-8fbd-43ce-a996-1796798aa2a4@redhat.com>
Date: Thu, 7 Jan 2021 11:28:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210107101919.80-1-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/21 11:19, Yonggang Luo wrote:
> V1-V2
> Fixes whpx: Fixes include of whp-dispatch.h in whpx.h by
>    the suggestion of Philippe Mathieu-Daudé <philmd@redhat.com>
> Add new patch whpx: move whpx_lapic_state from header to c file
> 
> The test-vmstate can be passed under win32 too
> so enable it on win32,
> This is based on Bonzini's upstream tag along
> 
> Yonggang Luo (5):
>    cirrus/msys2: Exit powershell with $LastExitCode
>    cirrus/msys2: Cache msys2 mingw in a better way.
>    maintainers: Add me as Windows Hosted Continuous Integration
>      maintainer
>    whpx: Fixes include of whp-dispatch.h in whpx.h
>    whpx: move whpx_lapic_state from header to c file
> 
>   .cirrus.yml                  | 119 ++++++++++++++++++++---------------
>   MAINTAINERS                  |   6 ++
>   include/sysemu/whpx.h        |   9 +--
>   target/i386/whpx/whpx-apic.c |   7 +++
>   4 files changed, 84 insertions(+), 57 deletions(-)
> 

Instead of your patch 4, can you look at 
https://patchew.org/QEMU/20201219090637.1700900-1-pbonzini@redhat.com/ 
instead?

Paolo


