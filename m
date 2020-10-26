Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF1F299950
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 23:07:01 +0100 (CET)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXAdn-0007JC-W4
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 18:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kXAah-0005aS-Ah
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 18:03:47 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:47085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kXAaf-0005Ec-BU
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 18:03:46 -0400
Received: from localhost.localdomain ([82.252.139.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MWRmF-1kuX131Ofr-00XqGc; Mon, 26 Oct 2020 23:03:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] linux-user: Support f_flags in statfs64 when available.
Date: Mon, 26 Oct 2020 23:03:33 +0100
Message-Id: <20201026220339.195790-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026220339.195790-1-laurent@vivier.eu>
References: <20201026220339.195790-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5f9zUHYgH9rAO/nYwfyBTWxSGUst/T65iCdLCEyBjdYTlTYPrgq
 q53xhrOfAAiuL1WWmSQnn8my315nOpjzJ65dOvsgYAlBOaV3TOkNY3LPwWgL6qrH3O3Dylg
 mzQvtBUHBuTQerf9utMZrBaprWuJ2ISV2k+we6Rjo70nWSoUqUzRhra+Rw4I4mLZcoggpvK
 oDydw39bF12bc/tOQmuZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Nco7D38+LM4=:bwo8vtBL2FEi1MP2Mpvbs0
 CNm7yZcLni6Iuelpf62k8sKaxBzFGwWsm9k1AWByir5oZzs9MbEO3qHZ1ZkbbFo0Err/ZKlbU
 S1L54xJal8S6ErjMz39JXLseX+zNRvVVQkaCKCOo8NPZ4k6+FJzeH3g8RvPaSmwzyzALBtuYl
 dlZFq754qwz7BnYrwPs4TXvW61oQRDIFk6JEWz7rfMd+GlbczEUwIDJFNtYDYum+4FXnZM10N
 feeSKW4fFuSyu9nCANa9FyVe2YBJmgDbXg7KJNY2HIJRWBvc8emrLMg7+oJ0MVK23vrNBc5d9
 I05wkOVAaFTbbQCxSktFdYPGPO47onFiPAoze2ONSQ7crxwUBCJTGISvFxkqghmnGawYbM+Dt
 KLCdzsI1ovnKKORctqKyR+wE22+HDZS2HGqlnUdh6oPfGsQGohEa8TNbQtLTl
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 18:03:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Frajo <franz.haider@jolla.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frajo <franz.haider@jolla.com>

Same as d4247ec2d79ef2477cb886fa688706b068119736 but for statfs64
When running rpm within qemu-arm-dynamic this could cause rpm fail with
an error like
"installing package A needs B MB on the C filesystem" depending on what
is in memory in f_flags.
https://github.com/rpm-software-management/rpm/blob/af06db1d5558870f7fb8f5c502572c2d27af5c71/lib/transaction.c#L164

Signed-off-by: Franz-Josef Haider <franz.haider@jolla.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <2e405fe7-efab-dae5-93d6-02575773fd6e@jolla.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 3e0f14f2e67f..cd520ae42e6d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9787,6 +9787,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             __put_user(stfs.f_fsid.__val[1], &target_stfs->f_fsid.val[1]);
             __put_user(stfs.f_namelen, &target_stfs->f_namelen);
             __put_user(stfs.f_frsize, &target_stfs->f_frsize);
+#ifdef _STATFS_F_FLAGS
+            __put_user(stfs.f_flags, &target_stfs->f_flags);
+#else
+            __put_user(0, &target_stfs->f_flags);
+#endif
             memset(target_stfs->f_spare, 0, sizeof(target_stfs->f_spare));
             unlock_user_struct(target_stfs, arg3, 1);
         }
-- 
2.26.2


