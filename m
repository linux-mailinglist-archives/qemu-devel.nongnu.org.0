Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577A861DDE9
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 20:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orPDd-0008FW-Ow; Sat, 05 Nov 2022 15:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDb-0008Ct-34; Sat, 05 Nov 2022 15:52:39 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDZ-0003aQ-Bs; Sat, 05 Nov 2022 15:52:38 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N2EHo-1p0dUX0X1i-013ajx; Sat, 05
 Nov 2022 20:52:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Chuck Zmudzinski <brchuckz@aol.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 3/7] xen/pt: fix syntax error that causes FTBFS in some
 configurations
Date: Sat,  5 Nov 2022 20:52:23 +0100
Message-Id: <20221105195227.354769-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221105195227.354769-1-laurent@vivier.eu>
References: <20221105195227.354769-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cF7pQnyMj3zkUn98Bq+nsABEkYPPift2ikhTQsHi89/JeT5LHe9
 QYmkZkV1hR0Lh0O/4gbb/W+ndmsBVHf1GW25Dz9pB+I39bvxxu4VpRUc6Y94ba5ii+j3m66
 ux7hiNmf+LJE6bDhk5ElCZa0seDTCuq0VIhVryHRse6sMYNOHAeMPy+Z3dx64Pw9VGYpLBT
 5xJ1W3dJr30dWVM2uvOYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:n9OfBEKRMZ8=:N99XNzBEcKu/Appa5ZYMqr
 d4GNoYKg1MEjBGYGP54ft+A/i4EouprzAQr2IlmsnW2xqWjBIRc4l6GR+JB9jjVfjIHzvA70r
 fKwnKiOhCUxtKPn6anfh2h3reyMwnPm3k5GP+EflD2DIVaIavKE96t87dH/Zwz4JzVQRAo3KA
 xAM1l3en8JXoaM377Qo3ZygIvgpYoEjesrMQZiOYFeKcVAHNoQtpPeREAGY7OSeOdDE3rYr4D
 8c5k9/VJlN/cZtHTeX43HbZSt8o7AvRstQd9ft9bdkNtMN0SCqTHuonGEKyZmHnX1+KgctbIP
 W1Wrn6ljN8RTqOZPsmyRvPg0qsJxsZaWQYbuM7tzFxxOf8DbbZ+iGmNY4LQcE7cOV9V5N0ouX
 rv57Uxmh2SzFM9uAN3gLIVPU00zMczxXlHLghjTyYIiLyFC4v9+bygTE57JmWcHXLfvZ44x4D
 Dij+s8fNKXWNZyZu2iMGhF53982ic+/4Zj3UwcujtFGVuktWqRYx5FJhl9Wdu3uqRY1MnDXLN
 craW66atmQwsMZqZmNozQuasAa8NO5ITgsXM2Jwn/2FQbBX9asF1AfUAKVigwuqqvCffI73xE
 3qr0WBAaI1hKQdcrO4e0MaQmPhJixDGx+Trcds6Zq+IvjT93hKoePISz0B9sHoSWJs78sG/fy
 svBYluPul0FG5myUePs+PrGYEGGz+3vCEGx6wiptI+RP5SBO5kqW4TvwLxA3Edq2h4A3SfA6g
 OUQV8tJS12rPKYqSpbAtvr5HYGTyLEhm8YZzPkUPDRKagJ83BJNMttOlhpOhMBR7VXXWoN6cX
 8CQGr49
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Chuck Zmudzinski <brchuckz@aol.com>

When Qemu is built with --enable-xen and --disable-xen-pci-passthrough
and the target os is linux, the build fails with:

meson.build:3477:2: ERROR: File xen_pt_stub.c does not exist.

Fixes: 582ea95f5f93 ("meson: convert hw/xen")

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <5f1342a13c09af77b1a7b0aeaba5955bcea89731.1667242033.git.brchuckz@aol.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/xen/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 08dc1f685738..ae0ace3046b8 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -18,7 +18,7 @@ if have_xen_pci_passthrough
     'xen_pt_msi.c',
   ))
 else
-  xen_specific_ss.add('xen_pt_stub.c')
+  xen_specific_ss.add(files('xen_pt_stub.c'))
 endif
 
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
-- 
2.37.3


