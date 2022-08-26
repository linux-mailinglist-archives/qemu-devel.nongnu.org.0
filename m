Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B875A29B1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:40:23 +0200 (CEST)
Received: from localhost ([::1]:53162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaVJ-0001zz-0Z
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAn-0000c0-8f
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:01 -0400
Received: from mout.gmx.net ([212.227.15.18]:51101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAk-000550-7D
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523535;
 bh=iXsvkP3ev12f2ThXbBYeEGC5zXB7ceY2b2oHuAaIKO8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lWi1Mh1IhpH6lsMzemgmZiNcER2r5r2LI776rPNsqkzmXNOtZdzxh2Q8F7mXIYMsl
 vZQq+gH9vYFiCkyRfsLDGzIagyPESOyQGkucixuf0xmJ5CywwjjtouYTNjZw969WXC
 mZnbjm+X93MRDyao3QlHfZhFHIsikSBPrZ9CZRlU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAh0-1oyS5047Ee-00bYeQ; Fri, 26
 Aug 2022 16:18:55 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 07/13] linux-user/hppa: Dump IIR on register dump
Date: Fri, 26 Aug 2022 16:18:47 +0200
Message-Id: <20220826141853.419564-8-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dgIl2OKFHhGxco+FUoNG4lc5rMaqkzz7cBeMXT1Dsnxi8jlpKX9
 RJAoitsEl2aTwM/JZvv+vjY05s5wCetjJtlns/mnYDUBwGLGL4gZZM/xHgVFOgvpAO5mca6
 zKAlaNRKwcSXexNviLe25L5S7+BksSi8BDekg5axQ3Kz3HOnz2Zl/FBg5WIWxoDOaSkp7lc
 1Ht7xCry1y9ZRW+hQsEjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5gSqPZoIVe0=:/l4vJljeVvr0bY3J7vojFV
 NieJvSdoutaTI9aEGbOCpWZjz1Y2viF/e/cWi/Ue8poTxxZVIu97KDncW5DOp++uVR5VAwNeA
 XWZaLk3VcAVKIytWsFFp5yM/V9yHmkI7X/Vj+Urh8NAl4R415TmBh0NsMwW6Kr9FXK0ohgGl8
 acdoKESraGB481f5HdQ/mYvWLnkFhm0ni6dwB0RT9VtcVRLeRT0709x4uFkd7+uCt4t0K20aM
 aGdEdj5v/EkZVta0NKknMifLtcdlAMTFqRDGB4FeW0FQ3iLJG/eTyMuGfUHXeRnyHvxY/HsLY
 RjX+m3p449kVUVo28BI6pzsKwsVVjBorA98g7QlAw84ejOEv1T9OIaFqy7wkgV57U2i4IrtH+
 iuvLwTdC7uV6YRe2IXNaeStJVzY91vEWumXMfnLrk23pvgjuZ8GKfyJg2YW/Y2yu+vmAtQGhK
 nzdqsgQQm5ArLCssWDrwKAjCX3oD5lK+XPNfg9yZ8P01erFIt5Q3ueTLBDf4FBuWFcpjAPTbF
 drTdJLQPybAI4i/k+pBqGecSyv+A8phjXB0mv+vmJC0uDHEvti09q+IHG39Yd+gV6UDIRW0V8
 QARmL8ftLtiAhVPA9Du/CAkmA/gd09NEXiyGJCYJDLJKDHWPTETiKB9wRR5Xdm14QH2MUp9tV
 MaaHAUGd7CvFjm9+O7n9RN+mF1MxVtF3mXy8F9IB9pQbxVYSYQrK6FgQT6PyLxDe2PatplYLg
 SLIvFmszfL8IDu49/J7J57u275ZfvPwnXLCcLadsVO+vq/0Hjw5Qgmm+uoon1o6KHzN0idGWQ
 53CS2jfmxj2YT/eg1r+2SxbGIDpzL+oLIZVOG+3owYu8XD36cj1e63FGr/93BKL94V2gtWvC9
 C24urOdJe5l1nwYudWtydT0n9202a0TA2JMWEemCZj0phRcz3yAJ2/zDC3i+vhHzTt2jJ/hJ2
 1RLHUTYQ3JkMn66vlKN/S8pqqZtAIlCWL2uHdwHXDfjCU4eS3Nd1UxpPeXx/QO0GEl8yaH+n9
 W8qihUF3+k0eSyn6bDLvZ/WcEEG8y/faNBqkZGIuYZBXk4v8y+g27TKt3m48cgeUCZo8sKQNC
 gde/iAKWvCvw2JGmHGXU+E56BEwvmbT9+O7CDBc+Gk6+VIuhWoYOgGMHg==
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

Include the IIR register (which holds the opcode of the failing
instruction) when dumping the hppa registers.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 target/hppa/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/hppa/helper.c b/target/hppa/helper.c
index e2758d8df3..74b8747083 100644
=2D-- a/target/hppa/helper.c
+++ b/target/hppa/helper.c
@@ -85,9 +85,11 @@ void hppa_cpu_dump_state(CPUState *cs, FILE *f, int fla=
gs)
     char psw_c[20];
     int i;

-    qemu_fprintf(f, "IA_F " TARGET_FMT_lx " IA_B " TARGET_FMT_lx "\n",
+    qemu_fprintf(f, "IA_F " TARGET_FMT_lx " IA_B " TARGET_FMT_lx
+                 " IIR " TREG_FMT_lx  "\n",
                  hppa_form_gva_psw(psw, env->iasq_f, env->iaoq_f),
-                 hppa_form_gva_psw(psw, env->iasq_b, env->iaoq_b));
+                 hppa_form_gva_psw(psw, env->iasq_b, env->iaoq_b),
+                 env->cr[CR_IIR]);

     psw_c[0]  =3D (psw & PSW_W ? 'W' : '-');
     psw_c[1]  =3D (psw & PSW_E ? 'E' : '-');
=2D-
2.37.1


