Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D515B50A8
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:37:47 +0200 (CEST)
Received: from localhost ([::1]:59476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRpz-0000l4-06
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXW-0002S2-Pd
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:43 -0400
Received: from mout.gmx.net ([212.227.15.18]:47233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXR-0002lL-E5
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920314;
 bh=+t9TnZiLd8rHKtd7DNCL/ZYGAwF3CfcJ9/nMiBzejt8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Kg1LqgJqzVV6pUGar50xfP9RfDGP6bQGaKCkZQU6OfZ4vdGc70n6qiJlgVxfZbG75
 NAPiNuvkU/2dtiLxbwpErtXbALt3F7BDZwchWgAFqW9UEyOj9INNT6rOhiMAtmOmqA
 to6UxS3bFzMQvfMRG//cQCnrL4kwiAM8WgafyhgY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6bk4-1pOysp46T0-0183db; Sun, 11
 Sep 2022 20:18:34 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 04/12] linux-user: Log failing executable in EXCP_DUMP()
Date: Sun, 11 Sep 2022 20:18:22 +0200
Message-Id: <20220911181830.15851-5-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911181830.15851-1-deller@gmx.de>
References: <20220911181830.15851-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ks0nRtvOEX/b7KP8pT3ZHSCgo1yb1iT/DaOHpbT30iez4cVp7OV
 h5DG8jqWCbsmMFahl7cZD0Zfx7vx4bLeWcuP6bvZuEjFEDOMwGmGakhbUaEQ//iJM58yXmQ
 r/JvEetC6NGy0AKs7iJuc5DS4dWJ1b3YZZCQWObBQL+18GBseduxRXqSp6chi0q0YKX/7Sl
 dcXyuJRQ503gKeYE03bLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4ik7UIc406o=:4c9Bh8vMnTTZB8BtJ+mON8
 KjXozjQWh/WFPq57NIMs62gjF+qORKUtTnoUVVN5uKq6VLY5yW8Pcdh4aI5cMcqPEAMEvyE4n
 wQv7qsq/Zn1JevcezVX8vRND1I5D9VZDqUX718KOWTRQvYuYPCu90GK06a8bB3+c4P/2yBJr5
 Rpk6YoG2nJ2E01jALdnAjLrJ8hAaeo2wEDA8OAvqlMT+MqEU7Mh66ePOXzMYbkhvOcusOjAGc
 4dwU+JCnw0AEcZ/05803YfuirUdSL4fWwVkWai70P3weEeKCKEmc/L+f3n0ttbpWnURqnqRhp
 J9XZJ/mBIJajkL1HZCzZeb3liVW12byLtni11VIvhI45Q7DWAIm1O7Hrz9zBHcsuO9oCKBH/w
 +wIk0FvCsPVxukHX7g/Y/2q2BX+GBbpAzg0iPFvUNOYWuPTbyrFYZ6UgFEKIdAVArW6ntw/pU
 hioKgha0SebwK1ewqGa+cabae42ElG66QcjW7ZgfJ6ensZE0MtzDiH7tH4M8S4XL36WkS0IWg
 4KslQEZ/D/mytVko0j/SaEp6RWwApr8JjI3y2r/2YSZpwA7edZ2fxha4V4EwX54I9+6Mc4KHa
 n7ac8CunAVAQt+U+ArdsafptSIZasZ62tB6/MCAzVdc9JtNrxPNeRTXBT8cemtAYvXvSM2jOI
 BoDEIBYXxqx5fBUuko1alUMtgOr9srDMvC/lfYZGunpNSvG8DooZaSqS91dkvRwSFTW/BXwCQ
 fXywZtXp05dXM9FX4wG2dD+NAoffd86QEsSaHpOOtc/+MmbNdPZwnfhitOqHqWNX3UYTSr9zH
 95AYLSSrP58XOcMufuDtR7ls7FkyQ8JKZMzh6BYuk/jaBQ4lyA0NqDVkequQaVuVJkfJk7Mlz
 ObxlkzPfbUhJG+4bb5Cr02yyR3xoPtSQb5wnRdaD3agK9S7mBZExoZqFqnwQ0oE4CpFEOFxwJ
 QChoTnD7AcWJ6RZeSFI4xrth/SNX9KANFxGES0kQdln0ePvXFUvQzMiF62YHFjB2MqJpwVx7i
 9vf4iJGkpl4eVsUZrAhHeLy7fIqUZGxQAWtdXIG1uVbzEfVEws2y7Df9zucsDpj7pJbpAai89
 FTdRdkGFf3Rhr2aPjgJKXDLcg/VkcUdzEbpqzVn9OBKbqM64uFxJOHCo0p0QdgIkXUHvADjWu
 XmXxSUBsm4bqdcAMHV3MbENqgF
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Enhance the EXCP_DUMP() macro to print out the failing program too.
During debugging it's sometimes hard to track down the actual failing
program if you are e.g. building a whole debian package.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/cpu_loop-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
index dc0042e4de..36ff5b14f2 100644
=2D-- a/linux-user/cpu_loop-common.h
+++ b/linux-user/cpu_loop-common.h
@@ -27,9 +27,11 @@
 do {                                                                    \
     CPUState *cs =3D env_cpu(env);                                       =
 \
     fprintf(stderr, fmt , ## __VA_ARGS__);                              \
+    fprintf(stderr, "Failing executable: %s\n", exec_path);             \
     cpu_dump_state(cs, stderr, 0);                                      \
     if (qemu_log_separate()) {                                          \
         qemu_log(fmt, ## __VA_ARGS__);                                  \
+        qemu_log("Failing executable: %s\n", exec_path);                \
         log_cpu_state(cs, 0);                                           \
     }                                                                   \
 } while (0)
=2D-
2.37.2


