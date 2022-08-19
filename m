Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C96F599D69
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 16:23:18 +0200 (CEST)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP2u4-0000gG-6b
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 10:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oP2qc-0006fH-3A
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 10:19:43 -0400
Received: from mout.gmx.net ([212.227.17.22]:55395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oP2qW-00027X-5x
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 10:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1660918770;
 bh=jFt06cqGIkjhSSRKfkdtEBeGp9IYpP0anj4PyawVC5I=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=U9D8/JxgsCEjDdLsL+q3zvRqtiCK7nDZQc79WBsZrruChD8fBTfqyoo3mbj+E3B7I
 /n1l/VFtADR3yM5oOGq5KNHLXl1btQg3xi9Z0il1J7u81yXWJ0XK4a/9elh+hQG+Pu
 zGvyXCSf5Lsp0kW2yTZPIXKqoShlSXqdvc7LQibY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.153.160]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQXN-1nWo6B2yaj-00sNtf; Fri, 19
 Aug 2022 16:19:30 +0200
Date: Fri, 19 Aug 2022 16:19:28 +0200
From: Helge Deller <deller@gmx.de>
To: peter.maydell@linaro.org, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PULL for 7.1] Fix proberi instruction for qemu-hppa-user
Message-ID: <Yv+b8ArTlrskWIMN@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:XQJyFWzCYFYXC5ac6wQSIfIBG5hBe3B24emmBstF1OU4SVCMxFK
 CjGVn1MyHzhxiYzq2HuVxCDm27big8RGn5DgTT2YFCICFZDMwwsKcOrIA+UAVgYrQil3eHG
 sEiyYWAwUst8QgJ8k7/3URIrQduyQsD8+Mb6Gj4biKlPI2FgjcK6j5riOsK7t0bYrkPVZLN
 PQE9EcZ/I7ibsBp8kPq+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ms4qOgwtFu8=:hSgAU8Hxoh0uFtayHFHdpL
 3bBnVGjp+VMtEBk+8EwzqG1kZ99YWildBvMlR/16GX/cryceisohsfQNCfI+9DOeHwmgPhGXR
 p6C5PaFzwZrJemqGbApayutfe5BTIBE8bW80yN71liluHOFXV+yRm1S6J9/i6SYdAMFVBpejq
 PZNeVM0TGk9/ZezDPP+O4Pwo3HsktgflgTneBZqBlU0uchPjGlwffX31pdDbLoERUOE63Hg5p
 eB2rF7fj0pn2NgJ2mwLyRxykUSf98QLacBkIwmoq7o3IMwuNWdDFe7UMBdOIc9d+hzPr2r8rZ
 v55MDhWHJRGewCIRCtczMwj4HzoQxLKGq7fW/CIPRP5/66Sj4urSTLxoqu8ZddVVB1S28wrvv
 zptCzbAQ+bp9bWWm5obpxEyfwKgE4rc8fMsGffeiBbhub+vYT7xydt2coNEjdbQZTep1SUzwk
 BA8UQ47BdcQMBIQTUwLHLwYXWELAE3fYYPm8JnWgOHYclejzqzyTwSZcGtE98Iv/WY/FeXlFG
 qxVf72PYKsdz6bkzr8/Ke5wmiBcZIYVUW1NdsgyhSPS5sU+q8el/wpuYcKHEa3rebsma4lWEh
 QJRS2tL27gQI/TXV0bMDpahZoArTFm3svVXdj6iJFS1NCIb3pr9WWsRSiT7DD7JUlqFQB+lzX
 8m8HatVVGYcqtaiguvmRzk9vUDPoBWmSJAPrOvO7rXZv27bIwhOb9pUUsIOeM7dc3HQcGlICI
 2wI62zJi0OaJzUW6GVmCNMmPgVhZ/3BsdqSN/4n3LAfUkmXZeWy8XWi9NmdOGO8UUyQe5WG2M
 RVwL/hdlp+O6KOXSfXRBrLCpot+Lws4TW9+X+/qQl+eNxvbeEvQYXRS2ByK0N5MYDBON4MkNN
 HbeinmLSuy+IQySvb2PmcMdHQ7oc9/Oka2GowC8pdOP1NMAG+++NkPRvw2UqHEXLskgU1V36Q
 jkfJFmuPRy2iE62QzjRwXcUeifgISN4jgOzv3ZXtWqhZwt0rJ1bagseU/BbOfArOcXJkagqQ/
 oGVc5THx4OUH2CjcIA4r+9azbiWOnZ+kkJQdZhUCm2SXpyC5BuIFoodY6paqQ/Lx4c/Ud5KHA
 1//8HXLN5ZRosu8SbWsSdQFe8CijbBxg4S4tx+qc8u1iwYpAB0OWkaLxw==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
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

Peter & Richard,

would you please pull this one-line fix for target-hppa ?
It fixes a mistranslation of the "proberi" hppa assembler instruction
when run as linux-user. Without the fix many debian packages won't
build in a hppa-chroot.

There is no need to extend the release cycle of qemu-7.1 due to this
fix.

Thanks,
Helge

-------

The following changes since commit c7208a6e0d049f9e8af15df908168a79b1f99685:

  Update version for v7.1.0-rc3 release (2022-08-16 20:45:19 -0500)

are available in the Git repository at:

  https://github.com/hdeller/qemu-hppa.git tags/for-7.1-hppa

for you to fetch changes up to 6fab0c182dabaca5b3d56e60a8de3122ce9afbea:

  target/hppa: Fix proberi instruction emulation for linux-user (2022-08-19 15:59:14 +0200)

----------------------------------------------------------------
target/hppa: Fix proberi instruction emulation for linux-user

----------------------------------------------------------------
Helge Deller (1):
      target/hppa: Fix proberi instruction emulation for linux-user

 target/hppa/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

