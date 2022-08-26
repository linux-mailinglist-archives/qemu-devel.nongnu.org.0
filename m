Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52A45A2A37
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:01:23 +0200 (CEST)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRapm-0001pd-On
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAp-0000ew-LB
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:04 -0400
Received: from mout.gmx.net ([212.227.15.15]:40995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAk-00055O-Rg
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523535;
 bh=2qvus0U1Qcq+tymskvFkUyGJqKVQ/WZ7b2//9XLrNAI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WsnuHA2appTzhaYdcAriiGlAIWw0zWHos8JWiGHYJcPhQNjTLd9rT+KRgZpdo7AnV
 OrRr3JcNE5ef8ZjIK1oLjV0hGopHNimsOnTquV6GTMxxhnrY3kzsBuVwm0hXZuMDMH
 R5AchE+J9QtCUcxhlOJGqhBJqhCfFQZiSUZQ7PqY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzBj-1ojO8c37c9-00HyZ1; Fri, 26
 Aug 2022 16:18:55 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 13/13] linux-user: Add parameters of getrandom() syscall for
 strace
Date: Fri, 26 Aug 2022 16:18:53 +0200
Message-Id: <20220826141853.419564-14-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NFAgJDiUFT2vpvdqUpmPuXRFF0a5lkP2Xbk7TRR60Vg9FIdngVm
 4IomLIAy1AsTl0dQGDa0TuilBnzTAKTcEgJf4rC/6PS0Isddz2HuVlvoVnafqKNjcukpfMt
 fLZWhtp2gHbdTt8VxGwqtdzhq/nmk6ZWyxRbebe1fPW20iH3iBRtuZvP+fTYoWZ+p6zx81c
 R+ScpzJA5B5qeD03qNnPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eT7pfxJfEKw=:9DZubapLY+cV36kMhYCHqH
 mdWEk5M8N7xJT5XrEPwww81SlqjuIDvTff/tTv+8URp6KeyR+nu18kkOTwM9tg3KPBYGDdmgb
 ISdtl7pFUoDT15P+1Hr8/Zm1l3H+ZJ+alkTNvtXfzrvjgAenGkMKi8QlwLLaYXDmdMGBuoGP4
 jPswbb4CJBVEUG5sS1ss9Eca2ZzxspfPNwmuSsZWSDdTdOd6F7O6RuUyRd4yvWfjN34u9XY5I
 RnhlZ/yyCeuRAt1dKrom60SEOt/ZLVnDwyl/6C/HWFZz0vBeV6e48k7jBC+aGzqrBcOzshOHb
 S7i+uekqBi/JInKniqtxDgpdhHUQLzU5XZcOrEHWJ3HFfvjsgnYDzS9FdOryQqdCT1HnTal+2
 oY7/ycBW+laMhk94IKvBWzQnk7VPVZoa0sg/kyEEiHQ0VF8DC/0G4CVdcZIG/3XlH7xATWXdd
 f1kG2LhDur76Rx3xgDxpnajE8fDKA0Q0/huG9qy4F7l2/GhkCuxKg9hg8uZUKKrTFRYZkfEkK
 Y3rbZ98ZM0pJQO4RwEy+rKbgvXJPzEORBjTIJE2M3x7ru1JXn4+XtDnvbbGqbFSbhjMH48GuC
 NXqlw0dfS9uKjtLJG4KxK2oqwz7FW86802cvrYnRDVxvoyV/GadH5XIkkSqYoQzEIblIpHFwh
 HUwySmiQG+tdM1r7hUPnO1aBUzw6Z2f7zK5HdkJzaIMk79M/sMx1zk5qaRShOigwovUwXFA0a
 lW0D+21OrxSSEwQDBfcYso2GRUcdB1xc6El+lN+5+rdoAymyc1+bwt+3J53TcoQLxFH1q9sSs
 m85itroTXOvUTT+Ulq6WTPA+lcvzcylSqVRdIIBBulyX3r4zvSLT12IHBHT7zlGwTnyE0TyLC
 TqIyN+GdOxQzY801cVGygGmLtiLyux/3AshLos86tzTIoa2A+56Dsmw/ZT+GUDtX4FXmMHanM
 lG7Bwvs8t2jiGT2x05LMiU4QDV+bp9qHk9wgcFHHyL2T5ZGPdiBIG7zVlekn7p18kAs6JsFiJ
 XaRQmraQeuWkOVcPHhv+ZDXD2z9iLUSW0hOEfCS9STvlkE9WOaUdKIYcpNtCCh4uhsMSgMmUm
 K32jr52adCbGWMc7wDFZlCbin8H4hbzPIGaosSGoFbRFVCAPlv1+hNFEA==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
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

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 4560a01d88..da8c1bf34e 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -358,7 +358,7 @@
 { TARGET_NR_getpriority, "getpriority", "%s(%#x,%#x)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getrandom
-{ TARGET_NR_getrandom, "getrandom", NULL, NULL, NULL },
+{ TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresgid
 { TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
=2D-
2.37.1


