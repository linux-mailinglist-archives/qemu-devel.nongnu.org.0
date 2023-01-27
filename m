Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051DF67EF84
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 21:26:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLVI0-0003ln-Bo; Fri, 27 Jan 2023 15:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pLVHy-0003lY-2J
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 15:25:34 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pLVHw-0002Q1-9l
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 15:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1674851129; bh=MMzMG49wz6/qN7eZbG/RPN4H+OVEb5P6KsewhZGllrY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=kXk/PFkXr3Kw5T2XGC9jX6gissZzlwq3OTUVvoSuVDJtx1/HCq57KXEAzMd3gfHZs
 Cg+TCCvn5cHdodN91ihAP/yl2qu2rdg+X38+yWIU8Ac8S2eVt6CkeD3r/9jt7XInfx
 xlLI42ZvJFnIr2NlNsITDIM+4gpwLBhAQDxJIkYUAM0h+5jB3yBjqkOeYZ1s/+uSJj
 jkCggv4lxF6r/Et1O6VHr9BqkkSwXRpPuvcoL6BBNMfiK9zzGDjaLqlVVy01SztBE3
 gumA+fO5anOqnnUZiJfHp/3TnQdUm9n8YCYv/GVgE7Y/euZXFhuky0fHfhZJ0S6eLE
 u0WM6A66gtdow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.191.252]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79uI-1oaNIj2E7Y-017UOn; Fri, 27
 Jan 2023 21:25:29 +0100
Date: Fri, 27 Jan 2023 21:25:27 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Fix SO_ERROR return code of getsockopt()
Message-ID: <Y9QzNzXg0hrzHQeo@p100>
References: <20221216101033.8352-1-deller@gmx.de>
 <8ec83c02-0e87-90c2-835d-e01a330b1969@vivier.eu>
 <db38ab56-d632-8cb4-9e60-aef83477ca74@gmx.de>
 <059795f6-97f0-b112-1802-fc47668986a5@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <059795f6-97f0-b112-1802-fc47668986a5@vivier.eu>
X-Provags-ID: V03:K1:BAtpC+bliT0bHgh7KTbxYIwCYcuyvW0Mds9hVHzyul9488+QQlK
 cQ1d2yIaJ8mbq/v9mGjUDDCe0fLqv58r/MzPgsecQoW8QhZcxZSI0HsPqgpUKpkDUHTkUTp
 36/OTKduutgpkr4e3ARk84n6uZQdVeNwpxljqFblzFrROZY4U4EHzBTY6t/miU5pv2z7n+s
 gaztXLEV3RXhi+il3540w==
UI-OutboundReport: notjunk:1;M01:P0:CxkVAwRbxzI=;/fSCg73chVwiPoQ2OFb7CqtjiQ2
 WoWdq1MJc0hsHHtEx0nUoWPXhRJ1kCu9qZCLdjvptLJXYgPR/ajbQoQQvcA5XGHeNeCnqvF7E
 A5vBIRXW1Gvhhm8h4D+9+VxF35m2Av/qgxnPsqvSJHQQGelzgjTujLXAQstOoWVls2nLCq0/z
 DLXUJ9AdCzKycR2fOc+DqZz+AFS0T5NTYl/xEwxbPpv65srH4PcU43zQN+3euCH03ZmTgkfkF
 9IlHuJWYjZaMULHbmJ+A6R393TcoSoOxTEtkyjmC0IC3Vo4ZYdi485NCPnt57o/MdmA9WVUcf
 Rrexjh6Ep/30F/f6q9+AgQLnBppTCVPWF1+mhcOIXM3AsGOQaga9ovKf+7js4CussBcJrqr/W
 c5dKLN7LLDPEsH/I1ZGovTFIKClQNXu2OkNAGV+xFqUuyc5B7eJBjumXMEEU1v+fwqOilF6DD
 5AAOJtNDCPwZGrxg2nATgTVc/Ar1PlYgIhV523AYEavRCQ7WYSGMqbOiBS/aCxuFvp/Xl6s5g
 tzE9xxcehBPpzZoH/d3eM+lwFwywl+PstbVuz0Jlt7M9GY4FXlcffHccubEGAGXR9rHV5eQq0
 YBjuNzXVX96ZAo2Foc9ZrEbhZdPm51bSW051QD1TQ2u30ujTYgzPcVd3lNM0H8aHYhkg3mCVK
 /ff6JvjJTyYbCmTr5GGkPK3dVGIcT1BsXplXqmGe5WBfIw3C4HqB8qQ1G9UTu0SungyKSPnxf
 xOHiuR13FnrGU+diZbD9kMLG0oO/6bGgo2VluAD6M+/60r7wnoupMo8lmzl8YcwooXI4d28SG
 K+GogCavE6uR9TB3KrEG+CPK1r57omwS3tw9MaFqs3+dDu67Sl847NqX5Kj6MVEmoimFg3iiV
 0+AlHbhtbDapU+ZVv3d5qd5QBJM2B3Rb2/DQQo0zcczjx5UfcSaT7g7keMmnSjXSSYJjf/B6k
 kRi884gmMmYUkeGklfNaiL9uJH0=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Add translation for the host error return code of:
    getsockopt(19, SOL_SOCKET, SO_ERROR, [ECONNREFUSED], [4]) = 0

This fixes the testsuite of the cockpit debian package with a
hppa-linux guest on a x86-64 host.

Signed-off-by: Helge Deller <deller@gmx.de>
---
v2: Fix indenting to make checkscript.sh happy


diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index dac0cfe6c4..06e8612675 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2809,8 +2809,13 @@ get_timeout:
         ret = get_errno(getsockopt(sockfd, level, optname, &val, &lv));
         if (ret < 0)
             return ret;
-        if (optname == SO_TYPE) {
+        switch (optname) {
+        case SO_TYPE:
             val = host_to_target_sock_type(val);
+            break;
+        case SO_ERROR:
+            val = host_to_target_errno(val);
+            break;
         }
         if (len > lv)
             len = lv;

