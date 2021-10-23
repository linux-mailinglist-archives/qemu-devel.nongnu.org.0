Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E281F4384C2
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:43:27 +0200 (CEST)
Received: from localhost ([::1]:37498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meLzK-0004as-VZ
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLo1-0005Ki-2F; Sat, 23 Oct 2021 14:31:45 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:56111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnx-0006dx-T8; Sat, 23 Oct 2021 14:31:44 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N0WsG-1mqUwG2Jhk-00wUou; Sat, 23
 Oct 2021 20:31:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/11] hw/nvram: Fix Memory Leak in Xilinx eFuse QOM
Date: Sat, 23 Oct 2021 20:31:18 +0200
Message-Id: <20211023183123.813116-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023183123.813116-1-laurent@vivier.eu>
References: <20211023183123.813116-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cXqw9ESDNcHugyGqugIWENMhtlWj0lOJmmCxaatdevUCiZbQwAF
 86uBVUyU5FBLNzy/0CuZxLpXyBytKBWRSaHSY4Mo7mGDXRJTxxROJ/7eKvRwFssfMYXnrux
 xU5GqbMF1wR1TUyclklUjFT7EmOE4ikGBG7uibZT4qkyKXsoUXv6qPDcCtmttakxh/btKmm
 NIHVM+9ySeokMIKJfsjrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J9XLkhMOaM8=:cOC5P4jVEtWApA0f9oxVV9
 H8IOmS/zRU3vpSdmeZqZMNsl9OFFgYtrmJQGxOnP9SUAslPQrw8KYPPBx20DTY03/RGeTG6Lm
 c3tEyTgQknxcZCW29KPZeipnheFAV7h4MA+mdXPZb52pJ2WamuPFqGYDyEx8YL7umnFkAFFOr
 ZWptsDzr+BCVQpY9Lokfc7R2tvDw1xCotKtQsaCD/ak58LpmsgK/y7Bah1a89B3ubNal34l54
 c6pnyLCLWxsZUVkSEK3uUCHvDprum5xbeeFFYXo2XCr4JRmg71SEbnZHO7Ifh0I4qdUCpzdfK
 KaU1WtD25k4vQl27LdEF7L8ZCE9nSwNxnMQrdJCwpQx7scm9Blzrjx5hPNoyyMq+ltMVFi4rv
 69hFQOjXuZ9WNFG2auGudZeipat4tT6tNmGZGNq9ocKvxuWUSWGxY/rhWhh10IpFyv0b5pxcl
 YGcIxJlbBVPAjwtDr7p/XNa7bXx5EjPcvmaNQuGkPC+hJaLG00D71roGfUiV1S6pWpzNnvPaN
 RoPt5FIqcu6bHydVIK/g357qHS6/OmfMOKRSqJ13/3RnFm4NjZ+4MuR4bN4D8wvHiekTI7xTG
 DMTqCKaLKt9vAK7KXYETM4bJx39N5AR/fIQVWKaom9+zyOFwnjbrVUk/E44578Mhhouf/RzPu
 9vqSJmqgGVWNmLNWpOWjtwZ1SyOgkh34sjc8RrsVMAR5Ju8S1ik+mkJI16snK+iBJbvE=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-trivial@nongnu.org,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tong Ho <tong.ho@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tong Ho <tong.ho@xilinx.com>

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211015203532.2463705-2-tong.ho@xilinx.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nvram/xlnx-efuse.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
index ee1caab54cba..a0fd77b586dc 100644
--- a/hw/nvram/xlnx-efuse.c
+++ b/hw/nvram/xlnx-efuse.c
@@ -144,10 +144,11 @@ static bool efuse_ro_bits_find(XlnxEFuse *s, uint32_t k)
 bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int bit)
 {
     if (efuse_ro_bits_find(s, bit)) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         qemu_log_mask(LOG_GUEST_ERROR, "%s: WARN: "
                       "Ignored setting of readonly efuse bit<%u,%u>!\n",
-                      object_get_canonical_path(OBJECT(s)),
-                      (bit / 32), (bit % 32));
+                      path, (bit / 32), (bit % 32));
         return false;
     }
 
@@ -202,9 +203,11 @@ static void efuse_realize(DeviceState *dev, Error **errp)
     efuse_ro_bits_sort(s);
 
     if ((s->efuse_size % 32) != 0) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         error_setg(errp,
                    "%s.efuse-size: %u: property value not multiple of 32.",
-                   object_get_canonical_path(OBJECT(dev)), s->efuse_size);
+                   path, s->efuse_size);
         return;
     }
 
-- 
2.31.1


