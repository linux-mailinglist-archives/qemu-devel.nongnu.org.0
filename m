Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD36930B28F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 23:07:35 +0100 (CET)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6hM6-0006kw-TY
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 17:07:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1l6hKk-00069Q-Am
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:06:10 -0500
Received: from mout.gmx.net ([212.227.17.21]:50937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1l6hKh-0004uT-Nc
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612217153;
 bh=F3x76zn/alXB+au4+ZIdy2sgRGweHzkE4lTNfkhBC54=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=fqvGsB/wGpE8PnH7LBbCvChTg8+YBacoOWAgIt5WIH0ENk6PaUBkWwlxlSZxUd3e7
 FtKRmOI80mKEauvbwpTVoG6smhyLtnLLAJnOnoZPqk8sPWFPycW+KCqPGfjH01eQDo
 jBYXiSKoe9GwWAIZMO0NfxGY2OjVatMaC7fEl9Zc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.182.87]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6Mt-1lgr5u1XjX-00aCfS; Mon, 01
 Feb 2021 23:05:53 +0100
Date: Mon, 1 Feb 2021 23:05:51 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v2] linux-user: fix O_NONBLOCK usage for hppa target
Message-ID: <20210201220551.GA8015@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:Ri3mzIY5XIaVF/3CArGBq1eb8NK7DgYSFzzDon8m6qxwc3qi2hv
 PvKXyKK7yqAlNBTMCaKpll7RwG/tH2hGYfVuWZyqU2DNAWz8SPhWOjyMLaKrw+cp7scnkU+
 L7snrDufsIGVkjndePHtL/5/A2UQZupwmdgxuLas1+jh7pGAzZ87/71efEj81Lo85YMcoRS
 +nd6UDBYCnTN3UAYscuNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IIZUHlKYGRM=:/WwbYRcIv3Fw7w4aU8d2uA
 6QKiokTkA24QuyO4LNEzHuV4nfZOxdiNQIfzUno0KBXD374Bt5VnZamyctCqwxrDYbxM21U3K
 pZSr4ODMZKxSmZWImlUjtbHFmoRcdmqgklRW3dY/rup/hphotWw+QW5HeAR3MLsIU9l9Xuywa
 yeKBep28JAKXw1mfa3u/ow8riRciSq5bmIVz90J6LgPPxn+J90EqgCAt1t+BGwBkLdSirhhks
 R7lmRHsdny9Kuwz/hpksP9ZynrDZMhYu+M0DnaO56FXpIFPVicM24zSfzinui3VyYVBX06eVM
 DkbU6lt1PeUlZrECy2xCM15M+eZh2rNgY31dD73BwCCiLqVgO7ZNXrec5LQ1ElbBEAdyn5CWb
 jVDqCgpMUGFL6NiHXsRha1qZWtqAsgPp8n//f2AT+PQikhc6M5N29GAC1g4IpzN+9X3IVaHc8
 HzRPi5P8xuaAew5FShr94Diibt/Dahg9Ll43zkrshDKZQd6rkwBTnQ4Zd64PHfjuJ2+qYBUqc
 vrechDyQOQzh4HWqitD4sb7dczdn2qfOhkSkcYwHRUNMAmyWKG8IlojHWOMIzIvgnTM9xRWRQ
 zFfS5dp89oQEjSas7mLlONiTRAVDfh+i1rX9nSQJ1EESmiQEyH6VuNC52KHmenVRHNUgTvYoJ
 omkCFtkRSKY8RDWtPRzGfpA/mZy6HdSz/ErZ5ehuK6WAdJWwaRojINQ8XtMUSqh9nkhpIZ1wn
 t2ni3bt3ok+w03xH9+K1tLqCsqp6+/fAKVr+Kx/t8cbZpYgZPjucsGf0ud+6dCnyurIuL67m4
 EdVjib9J1TmxArMxACQDwChGmunQoR7dTK4Dl1xx2pgWe/EVSQ1qtauqRQVVi/Hvp5mERY9NL
 qLNHf61nM36dQIRmzLZQ==
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Historically the parisc linux port tried to be compatible with HP-UX
userspace and as such defined the O_NONBLOCK constant to 0200004 to
emulate separate NDELAY & NONBLOCK values.

Since parisc was the only Linux platform which had two bits set, this
produced various userspace issues. Finally it was decided to drop the
(never completed) HP-UX compatibilty, which is why O_NONBLOCK was
changed upstream to only have one bit set in future with this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D75ae04206a4d0e4f541c1d692b7febd1c0fdb814

This patch simply adjusts the value for qemu-user too.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D--

diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl=
.h
index bd966a59b8..08e3a4fcb0 100644
=2D-- a/linux-user/hppa/target_fcntl.h
+++ b/linux-user/hppa/target_fcntl.h
@@ -8,7 +8,7 @@
 #ifndef HPPA_TARGET_FCNTL_H
 #define HPPA_TARGET_FCNTL_H

-#define TARGET_O_NONBLOCK    000200004 /* HPUX has separate NDELAY & NONB=
LOCK */
+#define TARGET_O_NONBLOCK    000200000
 #define TARGET_O_APPEND      000000010
 #define TARGET_O_CREAT       000000400 /* not fcntl */
 #define TARGET_O_EXCL        000002000 /* not fcntl */

