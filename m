Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061895E8C01
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 13:58:52 +0200 (CEST)
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc3o3-0007xf-4Q
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 07:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3au-0004NA-OB
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:16 -0400
Received: from mout.gmx.net ([212.227.15.18]:34955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3ao-0003QX-PX
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664019904;
 bh=lFc+aSczTf/lfEWnrgRAr9DsesvWR7zUq4s0rUImplE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DjBiPYVu8PdsWcj0Qn3SFZyPcs5ECbzGLL/VyF61P13TM+sSGFtDDdFll5DXss7D6
 sYNpV40VYrNiUbmUuFltszHvJjcm0hfRSmmoh0+REY6Vnb0l1I1UkYPt1KJUDVO+vG
 T59CnkJJu3/nRCngKGVfUwJ30H+mnZVk6ysvzjzc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.155.187]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYPi-1pDKDw1c8O-00fyRS; Sat, 24
 Sep 2022 13:45:04 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/7] linux-user: Fix TARGET_PROT_SEM for XTENSA
Date: Sat, 24 Sep 2022 13:44:55 +0200
Message-Id: <20220924114501.21767-2-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220924114501.21767-1-deller@gmx.de>
References: <20220924114501.21767-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SSnw3jWag7EDyaKLVBnQ1aKZQZMaTwIF245BGGn8NmWtlPwygfs
 G1rYMxSCXnjTC5ItzM5N/iHwkQsEFuinhwL+g6nFFVMs35pmOc4AGhulBmcNjxWqS23q0Sn
 TClDwy/YtA4gq35e1q3IFzdpnhQMjVdFzNxHmM/3UrZPY/pzIR4jFLyWOg1PAgF7pk9IuNN
 X/ayybd9bEpL2fvm7/eGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oRWQNlyahjM=:zlc0Nk6hhyxn/nOtMQgY2S
 j80ixdpC1XFJSFe+k7uPuc8EswrPZa3220AbGVaz845bKSQANuJW5YueYHChw0IOCAihoekuv
 cTmcdKT6A6Ywb2D43sjRchl1GYe/FCiZl9g5LmLAP+/iD5BpWy1XXxGrpYFVznOZ27iMugXVf
 Z4O9HcfDQMM1H5dJ5S+Wk0tG7U049KESN16cap9vv84MYnnKam/05Kojxd0U9C33D45+6GzZP
 J5C0QiTML5d6I0HWQmOmWo32IcxQjwOmFw5z4trFOo3wXAttQkhxxpGWWOeq8Odt9M0miB1tD
 5+eH+RuJC2F11XUvulCihwNexF43ITSx64VaQwuvhZJlHH1SqSMRib/snxXj5AQgoFIY0X975
 eYx0WGwb9TCNMgt//yKcs9amP+gCvj804cwiz65tWDIBeTZt0ACQfRTqHCJl08bqjt3gyFQj2
 cMmheMP6taywyMVIim0YR56Oid3X7Edcc8rHwlX3PliMOr0ibRb+7htCO4tUGcv/ZFdPzlO3Q
 HlsALTgwBkVu7D5bS88Qz2gs0yr+D5ait4fVITEFTDUpaPOUvr48iZlt5kDX4uNh+RUWQpp1/
 DKN+SoTcOAgxym3/35bztsk0SWa1rLAVLanEiqeQB9CS5WZiKJUxFMlSWrRW158b+INRnyNWB
 QBUbmu5hrmOT7bPN/XiaXbHWaBqI2jerj8r6vsayR4YjziAOe1jW80axeEgyp/9M/aB9q7f4K
 q34LXBXlA588tu/PKWwvm8Hfj76ncDf0T/HDKakKiGUMZcliOcOEXFGL1Q71XCOHGB4+ltSl7
 L0UtUH+JE97Xm8OiA6OJ+UbfZVH8R/6X6NBjFNd31xjYrlZzQwk21WdMnh2RaCkdCzrrniH7/
 U7MOnzX4+HCKUjTr3wSEENcjImOjM8uADwrJtb+Be+azYmvycTP3B4uzA/+S9u0q655yhZrpw
 JV5WajUHMpSByaY2hmHzJxJFc4ru+cUK/f8/WjQyMbSY+0lscph9ueddoQeL2Lmw6L0Xh24Gu
 pU197D+mGd10bHlXotrv7Ikxq/G0zrwl/sxx8PFiwVNcTUa7c4oqxNF0LDSy0hosvRGMBS4Fu
 P7okZa0ZAv81tLLAIzl0MNQWLl+HY1UwBf/fWmiLpmviMhe/GNSJMGgKmRbqAA7FvCYwoDWXa
 FN+iTiTXtJUhTqet6ilq5rlQBK
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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

The xtensa platform has a value of 0x10 for PROT_SEM.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/syscall_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 85b0f33e91..1e3577bfa5 100644
=2D-- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1246,7 +1246,7 @@ struct target_winsize {

 #include "termbits.h"

-#if defined(TARGET_MIPS)
+#if defined(TARGET_MIPS) || defined(TARGET_XTENSA)
 #define TARGET_PROT_SEM         0x10
 #else
 #define TARGET_PROT_SEM         0x08
=2D-
2.37.3


