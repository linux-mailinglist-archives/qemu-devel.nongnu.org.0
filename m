Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB86678F17
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 04:49:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAHh-0001Pn-9k; Mon, 23 Jan 2023 22:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1pKAHf-0001PY-CV
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 22:47:43 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1pKAHc-0003AC-3O
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 22:47:43 -0500
Date: Tue, 24 Jan 2023 03:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1674532050; x=1674791250;
 bh=AVUNt5NxmzGqXrHzpS6EsPjgdgbfTC2k5gC8XZb6VUI=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=bI4zCqVDR0kzwwRb8Xh74YAkMMjVT5782xE1iE7+yId7RNeV40QiR2S1GQJZONgbd
 ktkg//hBFz+Ky7glRZfaM+nH5SQSPScIu9kmRJNAOuPQd7URYYvS2M+jNuAvDv3oAO
 /1Lakh4aHBFlPy/cBirywFjy18GZfxKqUWlhJPsP+jAoHH/fkaumXrdA+99XSmkqTK
 o1kzkZPMSRZvi+10D/Kdd0rxP6sqxnhb0TRvDwiBuSPeD2/CEtiy1tkdWLK6NnMgKr
 J35UjC3f3trrwDyNxM5S7DD0eI0MotNjBm81av+94A5KPPGys3ClpW//avhzQVy0kV
 fCYxgWjA92Rqw==
To: qemu-devel@nongnu.org
From: Anton Kochkov <anton.kochkov@proton.me>
Cc: Anton Kochkov <anton.kochkov@proton.me>
Subject: [PATCH] po/meson: make i18n module optional
Message-ID: <20230124034632.1268545-1-anton.kochkov@proton.me>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is necessary for Muon build system compatibility and
prevents the following error:

meson.build:4:8: error module 'i18n' is unimplemented,
  If you would like to make your build files portable to muon,
  use `import('i18n', required: false)`,
  and then check the .found() method before use.
  4 |   i18n.gettext(meson.project_name(),
             ^
qemu/meson.build:3640:3: error in function subdir()
3640 |   subdir('po')
         ^

Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
---
 po/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/po/meson.build b/po/meson.build
index a863f0575f..f7be95cf5f 100644
--- a/po/meson.build
+++ b/po/meson.build
@@ -1,4 +1,4 @@
-i18n =3D import('i18n')
+i18n =3D import('i18n', required: false)

 if find_program('xgettext', required: get_option('gettext')).found()
   i18n.gettext(meson.project_name(),
--
2.39.1



