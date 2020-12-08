Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427262D3528
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:25:48 +0100 (CET)
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkUU-0001bt-MZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjEa-00037v-07; Tue, 08 Dec 2020 15:05:16 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=604abd949=dmitry.fomichev@wdc.com>)
 id 1kmjEX-00062i-Vy; Tue, 08 Dec 2020 15:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607458907; x=1638994907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/IGJYqm9RK5e5DNI9iQEd33TlkrwUOrLHugKF2LwdZs=;
 b=SIQ6/HGR3R5cNYLanBE4bxDesHQqequ/OHS9purbnZAQbZKZKkAg09uO
 N2r2y3PqxZg87PemuVrckJ6iYNu2h9F4OBUafEOlKOszSWuATtvuwmrjG
 LNJ+hkoX4DiFPRj5F/lK2xrmZ+G51Apm8mbi6zgCyWODrULqPp04Fhsq7
 E9HvOIEM5jHBMjbDeBP9bxT27EN9Tskn6N36+41cUd3c3bUNNpYSINYdl
 2byn059DpTALHOriUxKXCDVWpX74IwgQo6foPSD5jSsD2Pssl6xUbPS2j
 HdABQWVuW/QVv15swCNnmmv4TdcoxyokNTg0Apdh7pOdzOSokOfDHzV+6 w==;
IronPort-SDR: LSRq+Jg4DmY6y0e0vhTQ3yPec5h51C2EYNrPxqGBUKl5E3qOsMvb2eSciuApATphO0NZQZhD/6
 ICIC9jAyTCsTOVpAjwTMTPm2fXZQSCwd2gA2rswrQY3lqzIpUTAmtb0XqlX44Ff4hmJrVvI9r2
 Tdep25WJMAR+DPCi01botIMe/OMMBtvtfR7rWkUJ6eW8qE28WffWMebkg2aWjo0akPLUeC1iRz
 aoBfLsXaf6wMvHJMw9cReI6WbxqYM5DVBAQPe4AYpkESTsNZgc1F/JcWwzAvfNAFMbxDSP0awu
 Z6Q=
X-IronPort-AV: E=Sophos;i="5.78,403,1599494400"; d="scan'208";a="258433482"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 04:21:02 +0800
IronPort-SDR: N7PNgYjW0lzh43UmaDjyt5KCfSqaubk1hVi3irV0E6+GretKHaLJ9cWIvabXmdte01p91F/FSV
 UqrhdG7KiiRqzfDR0bDYfwjlXLLftB3qo=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 11:48:44 -0800
IronPort-SDR: dI51EYu48+jrtAm2M+F+CyUIeJPtAm732Rbfu0dbsdK6ySdfnPQjkks/qRE9r5QuuI6fDZrmdA
 cy0dExN7juHg==
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 12:04:43 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v11 13/13] hw/block/nvme: Document zoned parameters in usage
 text
Date: Wed,  9 Dec 2020 05:04:10 +0900
Message-Id: <20201208200410.27900-14-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
References: <20201208200410.27900-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=604abd949=dmitry.fomichev@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added brief descriptions of the new device properties that are
now available to users to configure features of Zoned Namespace
Command Set in the emulator.

This patch is for documentation only, no functionality change.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
---
 hw/block/nvme.c | 47 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index c2336bfd67..fbb69c82c6 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -9,7 +9,7 @@
  */
 
 /**
- * Reference Specs: http://www.nvmexpress.org, 1.2, 1.1, 1.0e
+ * Reference Specs: http://www.nvmexpress.org, 1.4, 1.3, 1.2, 1.1, 1.0e
  *
  *  https://nvmexpress.org/developers/nvme-specification/
  */
@@ -22,8 +22,9 @@
  *              [pmrdev=<mem_backend_file_id>,] \
  *              max_ioqpairs=<N[optional]>, \
  *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
- *              mdts=<N[optional]>
- *      -device nvme-ns,drive=<drive_id>,bus=bus_name,nsid=<nsid>
+ *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]> \
+ *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
+ *              zoned=<true|false[optional]>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now.
@@ -41,14 +42,50 @@
  * ~~~~~~~~~~~~~~~~~~~~~~
  * - `aerl`
  *   The Asynchronous Event Request Limit (AERL). Indicates the maximum number
- *   of concurrently outstanding Asynchronous Event Request commands suppoert
+ *   of concurrently outstanding Asynchronous Event Request commands support
  *   by the controller. This is a 0's based value.
  *
  * - `aer_max_queued`
  *   This is the maximum number of events that the device will enqueue for
- *   completion when there are no oustanding AERs. When the maximum number of
+ *   completion when there are no outstanding AERs. When the maximum number of
  *   enqueued events are reached, subsequent events will be dropped.
  *
+ * - `zoned.append_size_limit`
+ *   The maximum I/O size in bytes that is allowed in Zone Append command.
+ *   The default is 128KiB. Since internally this this value is maintained as
+ *   ZASL = log2(<maximum append size> / <page size>), some values assigned
+ *   to this property may be rounded down and result in a lower maximum ZA
+ *   data size being in effect. By setting this property to 0, users can make
+ *   ZASL to be equal to MDTS. This property only affects zoned namespaces.
+ *
+ * Setting `zoned` to true selects Zoned Command Set at the namespace.
+ * In this case, the following namespace properties are available to configure
+ * zoned operation:
+ *     zoned.zsze=<zone size in bytes, default: 128MiB>
+ *         The number may be followed by K, M, G as in kilo-, mega- or giga-.
+ *
+ *     zoned.zcap=<zone capacity in bytes, default: zone size>
+ *         The value 0 (default) forces zone capacity to be the same as zone
+ *         size. The value of this property may not exceed zone size.
+ *
+ *     zoned.descr_ext_size=<zone descriptor extension size, default 0>
+ *         This value needs to be specified in 64B units. If it is zero,
+ *         namespace(s) will not support zone descriptor extensions.
+ *
+ *     zoned.max_active=<Maximum Active Resources (zones), default: 0>
+ *         The default value means there is no limit to the number of
+ *         concurrently active zones.
+ *
+ *     zoned.max_open=<Maximum Open Resources (zones), default: 0>
+ *         The default value means there is no limit to the number of
+ *         concurrently open zones.
+ *
+ *     zoned.offline_zones=<the number of offline zones to inject, default: 0>
+ *
+ *     zoned.rdonly_zones=<the number of read-only zones to inject, default: 0>
+ *
+ *     zoned.cross_zone_read=<enable RAZB, default: false>
+ *         Setting this property to true enables Read Across Zone Boundaries.
  */
 
 #include "qemu/osdep.h"
-- 
2.28.0


