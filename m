Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F2D597170
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 16:41:05 +0200 (CEST)
Received: from localhost ([::1]:59476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKEC-0001kd-D7
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 10:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1oOKAr-0007md-35
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:37:37 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:55351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1oOKAm-0001e2-OP
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:37:36 -0400
Date: Wed, 17 Aug 2022 14:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1660747050; x=1661006250;
 bh=1xusjNSpDtivCGQCgOWnDakxrNhb0Bpw74ZWHpmTucc=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=Iifvu6f/hTURTdVF+ogxVdyJp2LnuJQeMRL38OE9F6lcl3HB0EF+Gbu0Mns7BrYKV
 oyIC+nz6tX1HoK8Bg8gD5BKiCcP7Pi2QqBPpOK8CuzDR13FYVgN/gLk5ZtmlP5xEef
 685i30eMVCUnvGoJ7RlACRjWZzio2esJpCAJyJNsfZMN3uaeQUfvClb7ASAlK8WA/v
 HmdLrB11BGqBmPcJG2nvlfCKa0ZrbSRC4+zCsIDAoVv8zGkcldk3DxtT1CRD9w+CGE
 kjYbNNm/ZnTP9SpCqxJAoNCQVUvyp0y5OXX8aYnyLZW4OtfVf8T1GwBqu3/enwePEV
 lMywNrRDM9uWQ==
To: qemu-devel@nongnu.org
From: Anton Kochkov <anton.kochkov@proton.me>
Cc: Anton Kochkov <anton.kochkov@proton.me>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2] meson: be strict for boolean options
Message-ID: <20220817143538.2107779-1-anton.kochkov@proton.me>
Feedback-ID: 53490844:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.131;
 envelope-from=anton.kochkov@proton.me; helo=mail-40131.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Anton Kochkov <anton.kochkov@proton.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While Meson buildsystem accepts the 'false' as a value
for boolean options, it's not covered by the specification
and in general invalid. Some alternative Meson implementations,
like Muon, do not accept 'false' or 'true' as a valid value
for the boolean options.

See https://mesonbuild.com/Build-options.html

Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 meson_options.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index e58e158396..63f0725174 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -82,9 +82,9 @@ option('tcg', type: 'feature', value: 'enabled',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
        description: 'TCG with bytecode interpreter (slow)')
-option('cfi', type: 'boolean', value: 'false',
+option('cfi', type: 'boolean', value: false,
        description: 'Control-Flow Integrity (CFI)')
-option('cfi_debug', type: 'boolean', value: 'false',
+option('cfi_debug', type: 'boolean', value: false,
        description: 'Verbose errors in case of CFI violation')
 option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
--
2.37.2



