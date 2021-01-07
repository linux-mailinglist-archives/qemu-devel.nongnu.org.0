Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6DD2ECEC9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:36:32 +0100 (CET)
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxTag-0000xx-TI
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxTZW-0000Qy-8L
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:35:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxTZS-00071p-R9
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610019311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F3DnzwrhwvAld0Ub+bHv4Fp47oXgJq61OGN/7SAQ+us=;
 b=SfOS2bDNvKVR7Lxa6yri6L+XCgwzp+muGhLie/CA4YwLlvelPEX4BdpSdyU7luZIX08TPy
 cKH9v0KXYHBKHcmj3SkXz9tJrlYqYfmuXAAA6OCC7ee0zo0dhf1gkQ6OQAlak3X/ID5z9E
 QYp/JXgInhSbrHwroVTu4+rWEz7lL/g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-AJs1a1M8Oxa32kJpTGyvmQ-1; Thu, 07 Jan 2021 06:35:10 -0500
X-MC-Unique: AJs1a1M8Oxa32kJpTGyvmQ-1
Received: by mail-wr1-f72.google.com with SMTP id v5so2548019wrr.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 03:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F3DnzwrhwvAld0Ub+bHv4Fp47oXgJq61OGN/7SAQ+us=;
 b=S1+KK8jWwLhb+VTz0YJ94OfEGS+3VPto59Mg1tUBtOiAD6NctrOBxqSzyF9ROvAol3
 QHlfqyS3mFYxBeGA2BVD8i0S9CBXAtW9134b+JhkKU5eivDrlFed9LCX1lPNjGUJtqu6
 2bMlCiKgrl4bumMBKIoKyxN268nuPiK9lMj/J6hFqB9MU5pKIY4Z3cmNS2CYAXcb2jEa
 xQbHaPixPJI+mnzFG32M4XgPJrhDBgct3Q4/DjD/TZ7IBcl7r4LbDh++F8zFV8cWCpm7
 OeXgIqtBbQ2wE0uNQdtIDEhLqCuA3MNHIG4Z5fgy9sNfT3tx6pU7R9CiEaX/QAtBRiAZ
 ggAQ==
X-Gm-Message-State: AOAM532bdl7up2RC7TwB9khsxtWFi4ADRCDFIvR4LlaXzd+2ko6ZJj9X
 y336GktLPJHCZKuJef5tdOkK+/GPG2nKbv52Q0lzFzTH4Oe1oUPOBk0Mgeq0IzT7Ll3hvKLP5fm
 3k0xXW2IMBidQtKI=
X-Received: by 2002:a1c:a501:: with SMTP id o1mr7610747wme.44.1610019309034;
 Thu, 07 Jan 2021 03:35:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHwpjRAdm31Q0XMsd0j2l2GCl/NauOH3GYAHtKFiH8sBawaR53a0JsvjYhEO8erXHpOKk8dA==
X-Received: by 2002:a1c:a501:: with SMTP id o1mr7610733wme.44.1610019308849;
 Thu, 07 Jan 2021 03:35:08 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id m8sm7506637wmc.27.2021.01.07.03.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 03:35:08 -0800 (PST)
Subject: Re: [PATCH v4 0/5] Misc meson fixes along test-vmstate fixes
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20210107101919.80-1-luoyonggang@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0662bf11-5743-9afd-ce1c-6f266f1fb5fe@redhat.com>
Date: Thu, 7 Jan 2021 12:35:07 +0100
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

Queued, thanks.

Paolo


