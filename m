Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055EA47FD4D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 14:23:31 +0100 (CET)
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1pyL-0001OE-Jp
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 08:23:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1n1pwT-0000cK-9c
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 08:21:33 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:41754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1n1pwR-0001HU-EQ
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 08:21:33 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1CBC6210F1;
 Mon, 27 Dec 2021 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1640611288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ypfYge6PCKXrBpxwHvlgS3fj8mBAWHG8/D7eDKN4EK8=;
 b=txmvaJwUiKtY5WMYf0/UTrR0Uy/Wqbfvcy3x7yPrEyBIyN/gTQ+QPgN/5Fp8L97LlKVgC+
 Mxg6jzWI2Dhts9eFqlqwiJIGWSEl9UnHUJu3Ll3WgyQ1yJgRJRKyWbrkjh8q9K0ToOA9sk
 c2esrQiZn2uAFqqT++6WN/Ja1k94M5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1640611288;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ypfYge6PCKXrBpxwHvlgS3fj8mBAWHG8/D7eDKN4EK8=;
 b=kjHqrFgxr1S160geEWmPAqeIh60koVpHw3bnWegQm3iTPqvwrCuW8LT4Jhqe+gC9J9uwcq
 WxHYRRBX1kI7XJAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8B22139C1;
 Mon, 27 Dec 2021 13:21:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pxWVNte9yWEeFgAAMHmgww
 (envelope-from <lizhang@suse.de>); Mon, 27 Dec 2021 13:21:27 +0000
To: pbonzini@redhat.com, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
From: Li Zhang <lizhang@suse.de>
Subject: test: test fails with --enable-modules
Message-ID: <a5a6d2b1-6f81-c20e-3613-ca59cb7eb7c0@suse.de>
Date: Mon, 27 Dec 2021 14:21:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi Paolo,

I am running qtest with --enable-modules, it fails with error
"qemu-system-x86_64: -accel qtest: invalid accelerator qtest"

Here are the steps:
1. ./configure --target-list=x86_64-softmmu --enable-kvm --enable-modules
2. make -j8 check-qtest-x86_64 V=1

I found that the problem happens because the accel-qtest-x86_64.so
file couldn't be built successfully and the file libmodule-common.a
is not built.

With git bisect, this patch causes the problem.

 From 69c4c5c1c47f5dac140eb6485c5281a9f145dcf3 Mon Sep 17 00:00:00 2001

From: Paolo Bonzini <pbonzini@redhat.com>

Date: Tue, 9 Mar 2021 14:50:00 +0100

Subject: [PATCH 1/1] meson: bump submodule to 0.59.2



The update to 0.57 has been delayed due to it causing warnings for

some actual issues, but it brings in important bugfixes and new

features.  0.58 also brings in a bugfix that is useful for modinfo.



Important bugfixes:



- 0.57: https://github.com/mesonbuild/meson/pull/7760, build: use PIE

objects for non-PIC static libraries if b_pie=true



- 0.57: https://github.com/mesonbuild/meson/pull/7900, thus avoiding

unnecessary rebuilds after running meson.



- 0.58.2: https://github.com/mesonbuild/meson/pull/8900, fixes for

passing extract_objects() to custom_target (useful for modinfo)



Features:



- 0.57: the keyval module has now been stabilized



- 0.57: env argument to custom_target (useful for hexagon)



- 0.57: Feature parity between "meson test" and QEMU's TAP driver



- 0.57: https://github.com/mesonbuild/meson/pull/8231, allows bringing

back version numbers in the configuration summary



- 0.59: Utility methods for feature objects



Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

---

  meson | 2 +-

  1 file changed, 1 insertion(+), 1 deletion(-)



Thanks
Li


