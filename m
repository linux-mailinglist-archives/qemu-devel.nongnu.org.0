Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52261681DF3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 23:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMcWS-0006r7-Nc; Mon, 30 Jan 2023 17:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pMcWL-0006qg-0F
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:21:01 -0500
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pMcWJ-0003yk-6S
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1675117254; bh=GBYrAMZlWUvhGzZcZnqGFitlKLJe3k6gxpCo5CWKGzA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=JUrIRxgCqR5K3ZyZy2hKkz/FZANtxi1TVtn8UnJXh4B2iG9pnt7/fXYLs2Pv3rzA8
 ZEdjf1YeHS5FkSmTd7usslL0rF7039MmEE+9JtdsTTgUn4LCP7wvAdEFj26ftHVezb
 SpwIm5COGzSLi7QKn682aq/Vj9+3ywW1BVeMMhw3HkCUu5t++BQPcslQd8OH98L1Ag
 QFueMnV2DIl9TEkBy0+BS9pXzhPXaAsq++fpuKCzRMXdqbWphaVfhv3As2efeqaBGZ
 ESzBz794IdYLYM4HXCoBTCbpdRt4e7I0kq0FuuhbvKlu6hoxOyZupHq93xrcnYgLvC
 USv0Bj2fzu3jA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.179.117]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU5R-1ok07J342V-00egfn; Mon, 30
 Jan 2023 23:20:54 +0100
Date: Mon, 30 Jan 2023 23:20:53 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Show 4th argument of rt_sigprocmask() in strace
Message-ID: <Y9hCxdvdM1o+/iHC@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:GEJ6TW3xlabT3KxRTdV5OluPGoJfW6VrqM/73O5Yl2NLTzAq0da
 2dvOLhGs3xwJ83i6f5NRotEodLvgj8aZAw5NzE1JvavCCpnBKYWWeADYTwNraoWue3gKHeZ
 w2KvQou4NvDGZpC/1z51uySEiPeigIwjx5NLSI2DpVje/wUh9Rm1YfMIXcROuS6bwMEY4Z3
 PPD74k3RI9Q36mXr7+hVg==
UI-OutboundReport: notjunk:1;M01:P0:O1LXv8JUVYA=;g6JEoui6gvrCutTZrcDlasRpCa/
 7TGoK8EWvTUQIKMBsUX42eyi6Ciz9PH+U3as7Pd5yWocyHHIQneDFozYrqYP68Za0jLT456oH
 PGZn8W6oO3KSFpYNFm45GTXha/0JIGTbhtMi2f607Te7U7/G95flhEpK3BvGEktcoWt/7BKp2
 IbzsCPJTjqNTtdhOjxdFWWBZeS3t8SiPACQGpWS+5nYaV+a/BQKuzOEq8AMbaQ+0dz7YexWhO
 kWS/joYxuZaCPcF9g/+04fjs8AQj3MVXckr9fz5qS468Xnip0jlMkaBjWtfucurcUQqoY3Glv
 FVvnNRCEsSoZV+UeZq3aKCfF+eXI3Vki5s4h7cbMKiHFUS9pf7Rnf8HzKGdR5kvbo7Mlodq3v
 3y8YQEZy41SVCcZNF2PTYK/tu0AQK8u0l8/w6uoknW5GRUhmsNBwz5rRwvJWsmzjvAHfvCjK8
 CrQlDSp1krPUTSFTc5ThnxAnp36xwGOTSOtmBZLq92Bmc7UdB4q1HhNqSWojNW7bn4U1OUJb4
 WfR41no833hQXKhNXxR5TvRA4e76vbGXFR3+O1UJgdCRDiTthnRRCyn/BWK4ofhAFBRUMrQf2
 VhNB5VpAJVe1CElVuRTEtfZn8J7/WpxDeXEipW0U/2BUdjwjNI7rwnUIoTOy0QbtVeNXw39RB
 06gadMD46NeB4En1Pwbp99Dd8qiIJmS7NN+lWaSQCD5oGo/iufSNvUlsYvUxMdrK7WRbYbE+Y
 TcsDP0WeDoEHPwuaSzVTtY4w6EfmvXbXlPBnaMMjR0A+1OcBlnCR0rh0o9zwybLv5Sg0ImpKe
 hOf7v/Nf2jhguzR3NJPPijJU6EnklybrnYQCq7XeTWHg9SXwvbn0aysVCjW5kg+7kl1IPFUyv
 ejtzIylaOCtClTwbUZ0Yp1Q3s156ggMX5iZpHWZ4SgS6Ra2jttKnWkigEtTHLw8RnJbfrBMVD
 mIiNYKfvdd++0RY5pocYsNfp6Pg=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
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

Add output for the missing 4th parameter (size_t sigsetsize).

Signed-off-by: Helge Deller <deller@gmx.de>
---
v2: Use %u instead of %d, as suggested by Laurent Vivier


diff --git a/linux-user/strace.c b/linux-user/strace.c
index 3157e4b420..f0f6ada8cb 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3146,7 +3146,8 @@ print_rt_sigprocmask(CPUArchState *cpu_env, const struct syscallname *name,
     }
     qemu_log("%s,", how);
     print_pointer(arg1, 0);
-    print_pointer(arg2, 1);
+    print_pointer(arg2, 0);
+    print_raw_param("%u", arg3, 1);
     print_syscall_epilogue(name);
 }
 #endif

