Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0374F31BA81
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:44:17 +0100 (CET)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBeAi-0006SA-10
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBe7j-0004Ob-VT
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:41:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBe7e-0007Os-8P
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613396465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4E7lYHNQqysqcSM1giL818+iqIB6QexLGJgq0kr1v9E=;
 b=HYSTPchhqCwCXhkTplWGoiN9E9fU1KAPBZz5h5HcqmKJocNokE1PNzEcm1B/RcgmfJX+Es
 vQdxGb6AQBtZ+j2aGv9xQcKZzdBE6rFWy/Lc6lh/X8tDETDWw8KMuOC3i1L+gEt7OH843g
 EhxirUpxcx9nyIHXjTMbHqBCn0rDoqk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-FNpFJLdoNBeRBxN6CkUhmQ-1; Mon, 15 Feb 2021 08:41:01 -0500
X-MC-Unique: FNpFJLdoNBeRBxN6CkUhmQ-1
Received: by mail-wr1-f72.google.com with SMTP id o16so9937347wrn.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:41:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4E7lYHNQqysqcSM1giL818+iqIB6QexLGJgq0kr1v9E=;
 b=ZSu2DH8aXqsuwNLVPeb2hrKTzZE9r9NL5xWjSd4Qn2iDh+64Z9benfvHEFoaZP1BSD
 kpfz7ZQB0I3GujNFnA5x9nQAUJOGvSg8KQWwX9MtU5AIys9flNHuHdzisFC0KtDtHG3M
 TTXRm4I2pVBmu56Goy5J61Bq25gw81t6WhKLEv+yOygPdsL+hhlLoOXnJhUqb665vUWZ
 W+ThQbVHAHSL3MSTKpwB/slZRLbxz4Dev8hFEJDn2ZQd1x+ZRe44FlmH4W38YwYKAXH+
 rzo7R3rp6kycZ/hmGogX53aGOWKoJl/7RbpCznQixfBD9t8uMrIsmTMdVKo1Lp7FTGoO
 y6UA==
X-Gm-Message-State: AOAM530hofEHA+6Fzzi+NOACPa9Wx3jJgBxOv4bijeAW5Hebc6QnYKf+
 /U+UeXyvJb0tec4Dxj3UQdIsJVqVizoINTM3eWyJHDrrhChC64lC9FjM5ls52vX/m7UENXwPAff
 aikVuv3Fh9v5UhA4=
X-Received: by 2002:adf:ab55:: with SMTP id r21mr18164673wrc.270.1613396460775; 
 Mon, 15 Feb 2021 05:41:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0qW/3MiGbMNBb+ZupNANXZ28kkqDr7hlvBetRP6pw4IsGfebek8J9dANn1nZEb7NXU0KfcA==
X-Received: by 2002:adf:ab55:: with SMTP id r21mr18164522wrc.270.1613396457327; 
 Mon, 15 Feb 2021 05:40:57 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i7sm54976166wmq.2.2021.02.15.05.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 05:40:56 -0800 (PST)
Subject: Re: [PULL 00/13] Linux user for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Stefan <stefan-guix@vodafonemail.de>
References: <20210215124519.720265-1-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <813f55f9-5d45-28f5-3507-78872e1625ca@redhat.com>
Date: Mon, 15 Feb 2021 14:40:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 1:45 PM, Laurent Vivier wrote:
> The following changes since commit f4ceebdec531243dd72e38f85f085287e6e63258:
> 
>   Merge remote-tracking branch 'remotes/vivier/tags/m68k-for-6.0-pull-request=
> ' into staging (2021-02-13 18:16:43 +0000)
> 
> are available in the Git repository at:
> 
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
> 
> for you to fetch changes up to b8f91fd49c5c6993e06f0cd7bf024d176051320e:
> 
>   linux-user/mips: Support the n32 ABI for the R5900 (2021-02-15 12:10:03 +01=
> 00)
> 
> ----------------------------------------------------------------
> Pull request linux-user 20210215
> 
> mips o32 ABI update / R5900 update
> Remove outdated info from docs
> Add definitions of TARGET_SS_AUTODISARM, TARGET_SO_DOMAIN, TARGET_SO_PROTOCOL
> Fix ioctl(), waitid(), mremap(), signalfd4(), eventfd2()
> Fix O_NONBLOCK (hppa), __O_TMPFILE (hppa/alpha)
> 
> ----------------------------------------------------------------
> 
> Alistair Francis (1):
>   linux-user/signal: Decode waitid si_code
> 
> Chen Gang (1):
>   linux-user: target: signal: Support TARGET_SS_AUTODISARM
> 
> Fredrik Noring (1):
>   linux-user/mips: Support the n32 ABI for the R5900
> 
> Giuseppe Musacchio (1):
>   linux-user: Fix loading of BSS segments
> 
> Helge Deller (3):
>   linux-user: Add missing TARGET___O_TMPFILE for hppa and alpha
>   linux-user: fix O_NONBLOCK usage for hppa target
>   linux-user: fix O_NONBLOCK in signalfd4() and eventfd2() syscalls
> 
> Jason A. Donenfeld (1):
>   linux-user: add TARGET_SO_{DOMAIN,PROTOCOL}
> 
> Peter Maydell (1):
>   docs/user: Remove outdated 'Quick Start' section
> 
> Philippe Mathieu-Daud=C3=A9 (2):
>   linux-user/mips64: Restore setup_frame() for o32 ABI
>   linux-user/mips64: Support o32 ABI syscalls
> 
> Richard Purdie (1):
>   linux-user/mmap: Avoid asserts for out of range mremap calls
> 
> Stefan (1):
>   linux-user/syscall: Fix do_ioctl_ifconf() for 64 bit targets.

Not sure this is very important, but from the QEMU guidelines
about submitting patches [*]: "Please use your real name to sign
a patch (not an alias or acronym)."

[*]
https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line


