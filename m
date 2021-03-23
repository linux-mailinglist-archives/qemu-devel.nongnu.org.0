Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C7A345D9E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:06:29 +0100 (CET)
Received: from localhost ([::1]:54568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOfno-00034i-RG
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lOfmP-0001xQ-UR
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:05:01 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:64783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lOfmO-0001sG-6c
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1616501100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KuQPw6F+xqG73m8XTxaXL/LTNGMUBj+pjwi+99q8ME0=;
 b=RGfJyYWRJpJ0hpQ7UAAIdr+LG1kH0/Nh7dWxDr5VSMQcpjgKy1f6WKvd
 +BMR43wCDzDK0dRkLy9N5QJhYE3SBY0R4PTa63kZRrG7ygTMksPfBmSyS
 hDnKl2oIsMnX9XRizMoWnczdKFMu9R743R0xc5NzKoFEydJrsa5OVBgye 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: np3kepIf5+qKdnWysahK4mMXDIIXh9kY+5RNTQ8aI8PVu+deAKGr0p8mBhwJBW2DSh79fN0Qaw
 QjA/oJuWDGR2gkQMo3zrLiKZB61gGUTOCrVXODPuCQikx2cVcjcfoQRAzXZvrCrn+P/CiGOAFa
 XI4KvSGpspavi7epXsyOTT0hjINX1O+fRQ+K3+/Vjchzv1p6R/9EogkBKkuPfoGOKo5v5HwlkD
 LBIKrO+TqraPdhe2VyhjuEXlkFPbeT5DDUeJf0BZlH20r8P4vXAsSqWBq9yQjivq2Li62aUH3f
 PGc=
X-SBRS: 5.1
X-MesageID: 39891529
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:W/KqdKsKavuNzDGN6AFKn/sM7skD89V00zAX/kB9WHVpW+az/v
 rBoN0w0xjohDENHEw6kdebN6WaBV/a/5h54Y4eVI3SOjXOkm2uMY1k8M/e0yTtcheOjtJ1+K
 98f8FFaOHYIkN9ia/BjDWQM9Fl+9Wf9bDtuOG29QYJcShPS4VNqzh0ERyaFEoefnggObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPCnRqOzcd5AaDlj+u4rLheiLouis2aD9T3awktV
 HMjg2R3NTbj9iA1hTe22XPhq42pPLdzLJ4a/Cku4wwIjXohh3AXvUCZ4G/
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; d="scan'208";a="39891529"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PULL 1/1] xen-block: Fix removal of backend instance via xenstore
Date: Tue, 23 Mar 2021 12:04:39 +0000
Message-ID: <20210323120439.563855-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323120439.563855-1-anthony.perard@citrix.com>
References: <20210323120439.563855-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=anthony.perard@citrix.com; helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

Whenever a Xen block device is detach via xenstore, the image
associated with it remained open by the backend QEMU and an error is
logged:
    qemu-system-i386: failed to destroy drive: Node xvdz-qcow2 is in use

This happened since object_unparent() doesn't immediately frees the
object and thus keep a reference to the node we are trying to free.
The reference is hold by the "drive" property and the call
xen_block_drive_destroy() fails.

In order to fix that, we call drain_call_rcu() to run the callback
setup by bus_remove_child() via object_unparent().

Fixes: 2d24a6466154 ("device-core: use RCU for list of children of a bus")

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Message-Id: <20210308143232.83388-1-anthony.perard@citrix.com>
---
 hw/block/xen-block.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index ac82d5406337..83754a434481 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -972,6 +972,15 @@ static void xen_block_device_destroy(XenBackendInstance *backend,
 
     object_unparent(OBJECT(xendev));
 
+    /*
+     * Drain all pending RCU callbacks as object_unparent() frees `xendev'
+     * in a RCU callback.
+     * And due to the property "drive" still existing in `xendev', we
+     * can't destroy the XenBlockDrive associated with `xendev' with
+     * xen_block_drive_destroy() below.
+     */
+    drain_call_rcu();
+
     if (iothread) {
         xen_block_iothread_destroy(iothread, errp);
         if (*errp) {
-- 
Anthony PERARD


