Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907BD5A2A1F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:56:18 +0200 (CEST)
Received: from localhost ([::1]:47702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRakr-0000cU-Kl
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAn-0000bz-8y
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:01 -0400
Received: from mout.gmx.net ([212.227.15.18]:42225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAk-00054y-7V
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523534;
 bh=MvuGN0117Kzch7knV2cMwdQNjBkK08lvfNFVOeDg1no=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=b2pReOEXsGMgD7pTmZyTRUwhIwhzkPz+jFO11I5NGK+c4KKVZ+OVuGuFDtR0KjlwO
 Ofz42ZgPNwBfdELYrOYUAaocGOXp0JcIQZZ7E7FdB6QDBg5oW3SnZEwym3jRYapFbj
 ad30QMgIzzPlU82nQz5W5j5+QCnkw7vWnDEBgluQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9dsV-1pWlGF39rJ-015ced; Fri, 26
 Aug 2022 16:18:54 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 05/13] linux-user: Log failing executable in EXCP_DUMP()
Date: Fri, 26 Aug 2022 16:18:45 +0200
Message-Id: <20220826141853.419564-6-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yR+WNuaCaV2cmmWNcsyjggo9bfduiGnNXqd2ahH+7y4zUGBCi3B
 6+fTft0yGH9gftgGGD7HKnipJp7yHlaM9bVgupvJEEb5SWa+lZSGHl9C0ZbVNHc3Z22iwcN
 iNtIRpX1aW2YFdhPi20mul/iM31Ave3iBICZF6zxYCfm50RmhuC1edhSFPYbeT7vXBLM6XD
 fpc8wZidpgtOfwJr8TBLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SlZhwamysH0=:dcgk6iKfpkbYtCey8NX8vr
 IzoAORvLbWobOjuC2uDb43J0TV/hwpk0j1PKV+Hg/2hYGzod7NcVo53efTQiV+aRz3w1qwOk4
 KomHzLkXTjxdvJHPipXYZ25nCszopAvtco0F70sj141CsqRe8ylzh+onGzPUMRfd1/Cu6GQdg
 Pddc69WLoZkTXfGw8zSiG2ftvGIZTL7n2D6JSSiSoqjIYy6xsYHScdLt4fNGd6Y0ZMmfxOQQn
 VnO4z/MR0E+laRRYOutw914HPqJn59gQj1f57Ig7EyE3fAXOxrVX73VPEl6UbubtTvBQChegt
 16MC6b3CCGUDgGdwIfxDmDbuJKJmCtjFuokZz1oXAD0hrkcIz5dgNb4BydPqRwLfcDxhouaYW
 VeXrytw9iZRXYJiI+fuFpmbEWxC43vp2oMHxhzsFKv/Fj1PhB4cvoSSOQRF2uRGiFr8PBzkEQ
 tzX7M8WdP0HwaO8+fTd7fevEI/vc/ITyEZ3Se5HDgE/EFhzlaPuHCT9uGMYzIIEOgLM5P9esL
 zSaUvXH/xf8CoeqZPg8r0hEXv4i4bTM5pcqUNXKdw0qdATUcFVECMZS1391AjZrP7ikXmVKAp
 MaA/fL4OxXr//99F7pL2a6YsBUERpkxvepJec4yuEgkKZb+qpn6s/o1h/ISfuBQzYUxdTrpMS
 +CHMR83l4ZhS5N9euYNqx3bU9SkTvTQVEfB66zNSajYEsUT99Ag+kGMwV6399cE7PyotyQoD6
 uIXzD+x7BjfmleCfsZNP8Fca6yru+jh9URrjUr8Ps9Aabt0Ry/hsz20Xg+TLvcIkBplosamdg
 7d0fHmiKr1ERgJWJHos6dGA7cFmr4kRVOH3lMaEi+PmKaFr9y7ue04d+tb/V9jnquxUZJe2DZ
 tioBYB+wsWG7LYVCfzSOEnarim0ClA9vFFaH9EsvVP64LjqIrpxYkqzvFsyPD5pdPHUnLFnJG
 Xl2tYmwS8goBRgIfSSTfb/S2zBsJrg1quEHkno0dH/Bzw8R2TyIMtuRMNsEvJ30hNIkdcvooJ
 IBTs7GxTWUuOZeXZcMaZz6FXWDugGEJx9OJFlMrRo+jVz/krolDVQY6DdU6VgF0BsLK2wxIsm
 TbbE+K9AWCuwK+33MaQFpxWHNiXB1CrZBNSsliEVklCFJ+WEyc7VFSlOg==
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
2.37.1


