Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC030AC8F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:29:36 +0100 (CET)
Received: from localhost ([::1]:43382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6c51-0005DQ-Sj
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1l6c2h-0003Lu-Nl
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:27:11 -0500
Received: from mout.gmx.net ([212.227.17.22]:49277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1l6c2e-000055-38
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612196814;
 bh=us+oMKC1S3zptV4fk0fp/Io8hBNgg8mDm4y7c7s+E58=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=C/MwlYUrLXzqRP3ny4qa+k8GbepFKTX4kyWSC+M4BNV2eqeKEoeZrAjpd85xZYRrZ
 nZNB8RdKfFSMbJDZBnyfwUMaKpRgYfHkzz5+PHqWoKqQLx/yx9rWjQDMiqF2i6kY/r
 SCnp7pK/UVnnWcUJ9shakfcLUkpTUjuGl3K7Omxs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.182.87]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVeI8-1lY9Ji3EHc-00RVAb; Mon, 01
 Feb 2021 17:26:54 +0100
Date: Mon, 1 Feb 2021 17:26:52 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH] linux-user: fix O_NONBLOCK usage for hppa target
Message-ID: <20210201162652.GA25611@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:POUqRyqOxIOcNdQlwLFOXYDqhJX88kTrQBEyse+r44ura24zH67
 pKh+gz9axXtYG2tnePzKpaaZVNK89t14inkKhz6rIIhCQxpVg/y0hwrSJNrhHoOav9SAp3g
 xK6LxuFAm0kij88aURJhLRo61uEfH0k+J+0zo9rb3FhNXg9tqWCBWKivX185rx/O6auqQaT
 QwkfbxKuhGwr5peBbtFsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:feqkG8N40PI=:EPXG+M2CYVSpQKMerHUr37
 357WOCQ30Jl+lySKG8iKeSxQltxp+SXIHdInvniECOpV2BA8GOLkWy9mRoW6g0TecTs56IsPL
 UOrtJZo7rqtvy8iQ+6gMlrJzWLK4q8/VzqhtuL7k67svHjSziHH6f5zQfA2wL1vlOI99YB9Wt
 wdfqPn+2kEsjJm1ucdX1/OncBNgSrOarvtCTy8kSDqm/cZ2F/4FIosZI40gP5Zc+PAvDKyqYr
 YteZ4hSdCJ5DrNrmEGo2KXrvZwht6Vz+SFk84Vf/FEdIor1H2c9ja7wJ8affZfcW+rIY14knd
 rZfJi69IoGow++FX7hmdtrTtiBjCQ6CqVHOwhMeqbYam+3Q4lcpW7JjCbUro14bde4lLZmM3b
 QKcsMznXQyeYvNotlLJSyDkhiXNSIm/doO/9k/L9Cb+fMmWY/TAvhXiBJL5SykYI3eNL/45+I
 8/qRX8fVxmfyVGqfcXU0Meq+MWIARx5bDf1+IF4y1gFQmNRG0/4jw0mYL0dlDpsbzNo7kGIvh
 8Mw6ZLP7UtYjqySAJDfGpnewLA+2wiqecNIR3RyqQ47AFO1V50V/kC520dFWk+45o0wl/rEIh
 S4GG99an987V4PNaEP8tbEqXrVrEg15T91j9UocAHg0SxQ9Jj8jpn+ffE4+X25tdl2hsSeca3
 rCT9KM3Y8Xf6bBGD5HMLZ95cG/7rmuq97FWgBMsuJVTfEfFfm0Ey1qSN7gfKScyPN3wFtr1I5
 w4VCzVo5hxkp8Gox99wS4J24q2UDlL7VD2iE3dLM2pDmQwVFO5I3tzodniywyClfCIAP3e9H6
 a1jx5MSSoBAHraKbenB/gBUmtDH53flXuN87Y6Hqh3QAt+2I/keyHYssqbS9dIlBlWn8BHEdg
 aWq6G3/x/5c4+YBvsHnw==
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Historically the the parisc linux port tried to be compatible with
HP-UX userspace and as such defined the O_NONBLOCK constant to 0200004
to emulate separate NDELAY & NONBLOCK values.

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

