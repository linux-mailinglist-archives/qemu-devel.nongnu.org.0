Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7DF4C6F2B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:18:33 +0100 (CET)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgrA-0001AP-Ep
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:18:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn6-0001Yc-2z; Mon, 28 Feb 2022 01:45:52 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:58192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn2-0003IL-Iv; Mon, 28 Feb 2022 01:45:51 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id A8B8311EEDB;
 Mon, 28 Feb 2022 06:45:45 +0000 (UTC)
From: ~ubzeme <ubzeme@git.sr.ht>
Date: Mon, 28 Feb 2022 06:45:45 +0000
Subject: [PATCH qemu 0/7] Many improvements to HVF memory-related codes
MIME-Version: 1.0
Message-ID: <164603074537.20094.1732342403585879912-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Feb 2022 09:07:40 -0500
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
Reply-To: ~ubzeme <ubzeme@gmail.com>
Cc: Yan-Jie Wang <ubzeme@gmail.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I recently bought a Mac with M1 Pro chip, and use QEMU to setup a Linux
virtual machine.  QEMU crashed when I started a VM with HVF accelerator
enabled and with the device, bochs-display, added.

After digging into the source code, I found that dirty-tracking in HVF
did not work properly, which made QEMU crashed. Therefore I made this
series of patches to fix the problem.

Followings are the summary of the changes that these patches make:
 1. Move HVF memory-related functions and codes into a new file
    hvf-mem.c
 2. Simplify the logics of adding and removing memory regions in HVF
    memory listener
 3. Fix HVF dirty-tracking logics for both Intel and Apple Silicon Macs
 4. Use GTree and dynamically-allocated structures to store HVF memory
    slots instead of fixed-size arrays. This makes memory slots more
    scalable. It is inspired by the recent changes in Linux kernel
    (v5.17) that use red-black trees instead of arrays to store
    in-kernel KVM memory slots.
 5. Add a lock to protect the data structures of HVF memory slots

Patches have been tested on Apple Silicon Macs and Intel Macs.

Yan-Jie Wang (7):
  hvf: move memory related functions from hvf-accel-ops.c to hvf-mem.c
  hvf: simplify data structures and codes of memory related functions
  hvf: use correct data types for addresses in memory related functions
  hvf: rename struct hvf_slot to HVFSlot
  hvf: fix memory dirty-tracking
  hvf: add a lock for memory related functions
  hvf: use GTree to store memory slots instead of fixed-size array

 accel/hvf/hvf-accel-ops.c | 221 +-------------------------
 accel/hvf/hvf-mem.c       | 318 ++++++++++++++++++++++++++++++++++++++
 accel/hvf/meson.build     |   1 +
 include/sysemu/hvf_int.h  |  18 +--
 target/arm/hvf/hvf.c      |   5 +
 target/i386/hvf/hvf.c     |  25 +--
 6 files changed, 334 insertions(+), 254 deletions(-)
 create mode 100644 accel/hvf/hvf-mem.c

-- 
2.34.1

