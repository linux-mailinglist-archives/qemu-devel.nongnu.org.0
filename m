Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DF72D963A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:21:49 +0100 (CET)
Received: from localhost ([::1]:37422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kokzE-000575-A1
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kokxz-0004Ea-6w
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:20:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kokxx-0000gl-2y
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607941228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKJuWEjZ7HEqn+md8jv6dUOfhVZW6quQNiqaNPkOsHc=;
 b=T5PxpI14sCZ1XsiI3RPPOiiU3L9q5vn69dpEIkHiuS0X/jHDrNKwJnbpyCWbN+Au/8LesD
 pTBGQZj9fQ3acRrH4cDXrXOOQB0LWEHqf70y18LsyorLShTawKywkFK7FUAQZ/uO7Fnh3v
 87XUbPaakiZyITQZ0vkKMuvC8yta5E0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-sd5-bfFQMLaFMfC4EsPo-Q-1; Mon, 14 Dec 2020 05:20:26 -0500
X-MC-Unique: sd5-bfFQMLaFMfC4EsPo-Q-1
Received: by mail-wm1-f70.google.com with SMTP id r5so6553304wma.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VKJuWEjZ7HEqn+md8jv6dUOfhVZW6quQNiqaNPkOsHc=;
 b=PWz7ErgfRvHfDf+vcefRfL/nGtvpxFma5Ilf6bpJ+GYJzvVj3A9RBXRs9B1O/lyR5E
 B3fQsXaozYDfMltGuGYa0mSOu9TotYV2wJ2B16SS6fl241nREnRyb0oxkS97tOnKQ85s
 fKYQ2MFzJo91eWV22QzfqYNQW2anxaVtnvqx9/IAW7aLYt3p6UHjgouatq1m1lXMWyIn
 SP+r3T0nXIjHCTQru4EoB2TFoDwTjhYF18E7p9pBiGqRUwXEDTudn0VG1NncK0NXHIsD
 DEy1DE8MtS4mBHkz0CSLoGhPNByIZJbN241xZnk85MchIl/YMGWctZYn3S8WSjbedC1v
 lcLw==
X-Gm-Message-State: AOAM531dUVNXUHwY6hK0jHgz7LN0ebMCP2A5RLZN2d7yc7Z8D2qmcC+o
 N14wd9vHnMXXGW/fKQGR3+Sw3CXvWmw5ofaXHli0LwERB+W5ZC2zT/V3Be0YHvFVqhpL/LLr8xv
 z8HNrHMir6SqMcWs=
X-Received: by 2002:a1c:f017:: with SMTP id a23mr26187767wmb.56.1607941225279; 
 Mon, 14 Dec 2020 02:20:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzf3/oGm0fU19mZH+puOGsoNRp7IG0cdANi1T7twa2ceqU7+cBZmSBiH5yH7AKXpx6CW0C0kg==
X-Received: by 2002:a1c:f017:: with SMTP id a23mr26187738wmb.56.1607941225059; 
 Mon, 14 Dec 2020 02:20:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id r2sm31320917wrn.83.2020.12.14.02.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 02:20:24 -0800 (PST)
Subject: Re: [PATCH v3 00/13] Remove GCC < 4.8 checks
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9df914a2-cf0a-6cf5-76ee-502a75873825@redhat.com>
Date: Mon, 14 Dec 2020 11:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 14:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> Since commit efc6c07 ("configure: Add a test for the minimum compiler version"),
> QEMU explicitely depends on GCC >= 4.8.
> 
> v3:
>   - drop first patch replacing QEMU_GNUC_PREREQ with G_GNUC_CHECK_VERSION
>   - add last patch to remove QEMU_GNUC_PREREQ
>   - tweak commit messages to replace clang 3.8 with clang 3.4
>   - fix some extra coding style
>   - collect r-b/a-b tags
> 
> v2:
>   - include reviewed Philippe earlier series
>   - drop problematic patch to replace GCC_FMT_ATTR, but tweak the check to be clang
>   - replace QEMU_GNUC_PREREQ with G_GNUC_CHECK_VERSION
>   - split changes
>   - add patches to drop __GNUC__ checks (clang advertizes itself as 4.2.1, unless
>     -fgnuc-version=0)
> 
> Marc-André Lureau (11):
>    compiler.h: remove GCC < 3 __builtin_expect fallback
>    qemu-plugin.h: remove GCC < 4
>    tests: remove GCC < 4 fallbacks
>    virtiofsd: replace _Static_assert with QEMU_BUILD_BUG_ON
>    compiler.h: explicit case for Clang printf attribute
>    audio: remove GNUC & MSVC check
>    poison: remove GNUC check
>    xen: remove GNUC check
>    compiler: remove GNUC check
>    linux-user: remove GNUC check
>    compiler.h: remove QEMU_GNUC_PREREQ
> 
> Philippe Mathieu-Daudé (2):
>    qemu/atomic: Drop special case for unsupported compiler
>    accel/tcg: Remove special case for GCC < 4.6
> 
>   include/exec/poison.h              |  2 --
>   include/hw/xen/interface/io/ring.h |  9 ------
>   include/qemu/atomic.h              | 17 -----------
>   include/qemu/compiler.h            | 45 ++++++++----------------------
>   include/qemu/qemu-plugin.h         |  9 ++----
>   scripts/cocci-macro-file.h         |  1 -
>   tools/virtiofsd/fuse_common.h      | 11 +-------
>   accel/tcg/cpu-exec.c               |  2 +-
>   audio/audio.c                      |  8 +-----
>   linux-user/strace.c                |  4 ---
>   tests/tcg/arm/fcvt.c               |  8 ++----
>   11 files changed, 20 insertions(+), 96 deletions(-)
> 

Queued, thanks.

Paolo


