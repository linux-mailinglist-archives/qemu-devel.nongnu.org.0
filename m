Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555D137F72E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:51:22 +0200 (CEST)
Received: from localhost ([::1]:32926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9s9-0001oC-Cj
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lh9qO-0000vq-SJ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:49:32 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lh9qM-00085H-B7
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:49:32 -0400
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FgqQv0yxrz70gLY;
 Thu, 13 May 2021 19:37:59 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 13 May 2021 13:49:20 +0200
Received: from localhost (10.52.125.147) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 13 May
 2021 12:49:20 +0100
Date: Thu, 13 May 2021 12:47:37 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: RFC: Memory region accesses where .valid.min_access_size <
 .impl.min_access_size
Message-ID: <20210513124737.00002b2d@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.147]
X-ClientProxiedBy: lhreml753-chm.china.huawei.com (10.201.108.203) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, david@redhat.com, mst@redhat.com,
 Chris Browy <cbrowy@avery-design.com>, linuxarm@huawei.com, Peter
 Xu <peterx@redhat.com>, f4bug@amsat.org, imammedo@redhat.com,
 dan.j.williams@intel.com,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All,

Cc list is a bit of guess, so please add anyone else who might be interested
in this topic.

This came up in discussion of the CXL emulation series a while back
and I've finally gotten around to looking more closely at it
(having carried a local hack in the meantime).

https://lore.kernel.org/qemu-devel/20210218165010.00004bce@Huawei.com/#t

The code in question is:

+static uint64_t mailbox_reg_read(void *opaque, hwaddr offset, unsigned size)
+{
+    CXLDeviceState *cxl_dstate = opaque;
+
+    switch (size) {
+    case 8:
+        return cxl_dstate->mbox_reg_state64[offset / 8];
+    case 4:
+        return cxl_dstate->mbox_reg_state32[offset / 4];
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void mailbox_reg_write(void *opaque, hwaddr offset, uint64_t value,
+                              unsigned size)
+{
+    CXLDeviceState *cxl_dstate = opaque;
+
+    if (offset >= A_CXL_DEV_CMD_PAYLOAD) {
+        memcpy(cxl_dstate->mbox_reg_state + offset, &value, size);
+        return;
+    }
+
+    /*
+     * Lock is needed to prevent concurrent writes as well as to prevent writes
+     * coming in while the firmware is processing. Without background commands
+     * or the second mailbox implemented, this serves no purpose since the
+     * memory access is synchronized at a higher level (per memory region).
+     */
+    RCU_READ_LOCK_GUARD();
+
+    switch (size) {
+    case 4:
+        mailbox_mem_writel(cxl_dstate->mbox_reg_state32, offset, value);
+        break;
+    case 8:
+        mailbox_mem_writeq(cxl_dstate->mbox_reg_state64, offset, value);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (ARRAY_FIELD_EX32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CTRL,
+                         DOORBELL))
+        cxl_process_mailbox(cxl_dstate);
+}
...

+static const MemoryRegionOps mailbox_ops = {
+    .read = mailbox_reg_read,
+    .write = mailbox_reg_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = false,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+};
+

And when run against the Linux driver, a particular memcpy_fromio() on ARM64
will result in byte reads when not 8 byte aligned whereas on x86 it will
result in 4 byte alignment. Byte reads under these circumstances today will
return whatever is in the lowest byte of the a 4 byte unaligned read (which
ends up being forced aligned by the simple implementation of the callback).

My initial suggestion was to fix this by adding the relatively
simple code needed in the driver to implement byte read / write,
but Ben pointed at the QEMU docs - docs/devel/memory.rst which
says
"
.impl.min_access_size, .impl.max_access_size define the access sizes
   (in bytes) supported by the *implementation*; other access sizes will be
   emulated using the ones available. For example a 4-byte write will be
   emulated using four 1-byte writes, if .impl.max_access_size = 1.
"

This isn't true when we have the situation where
.valid.min_access_size < .imp.min_access_size

So change the docs or try to make this work?

Assuming no side effects (if there are any then the emulated device
should not use this) it is reasonably easy to augment
access_with_adjusted_size() for the read case, but the write
case would require a read modify / write cycle.

You could argue that any driver doing this really needs to be sure
that reads and writes are side effect free, but it is pretty nasty.

So in conclusion, Docs wrong or implementation of this corner case 
wrong? (or are we misreading the docs or code?)

Thanks,

Jonathan



