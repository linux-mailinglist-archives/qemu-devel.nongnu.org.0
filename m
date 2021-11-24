Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED345B796
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:37:26 +0100 (CET)
Received: from localhost ([::1]:59094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoiT-0007Np-So
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:37:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpobM-0000F8-RJ; Wed, 24 Nov 2021 04:30:04 -0500
Received: from [2607:f8b0:4864:20::a32] (port=42503
 helo=mail-vk1-xa32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpobJ-0006hk-Ie; Wed, 24 Nov 2021 04:30:04 -0500
Received: by mail-vk1-xa32.google.com with SMTP id b125so1063472vkb.9;
 Wed, 24 Nov 2021 01:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=INU73d/uF2ivB+x0H+8RzqTTu5ZxmTrDWSWRgnsrDZ8=;
 b=pC7eNY14KmCFvYlVefZsflmXdIsSTetzO11hgRgp5xwTL7+czIgeRoMyVFgg/lK1EL
 w05OgqIxgs2RhnBYjZ54/lZ7ZMyUm1qfeubPgu05L5G/0R87pWaqCjW8Zz/AbFseJ3eI
 D2pJALY4Om7Q8Bbd+I4gi/3DCC6vtEjC/2ZBF64y4aCcvL52Te3OoZcVKGpFiCflnfXi
 z0UYYyYWdsAdP0U167hqW/FrGpX7L1aHS/MUPrU20Z2/sRtlq+Np1PDb6WsUhR7EttFl
 xRJd3D8z2jjjfcFf7VMrQF0jSLqFC+Fiqj2FdjcXi/wml+USUEjDXMjlMDgP9b2cwHIk
 AxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=INU73d/uF2ivB+x0H+8RzqTTu5ZxmTrDWSWRgnsrDZ8=;
 b=2DPwjoL26WD7O2bYQWFKWxmyu7kuAKFJ2SCAsHOz4cTBhOgV4Cvra5tlVDcDsn7LuF
 fwqGIopHlKGX+PN1ESmUlCDBUDBu4Q7tTwhprAWYR1D2MeJ6oZvY9ii4w4qJCq/4doac
 WoH+wHqny/m8mEM97No3Y0KosKGuCcRYR9HhOwC1tXzui0TtQ9lAoQk8aenS0fmLb9dn
 J/TJ/V/cvIP3Kz0xadodYTHDj+PjnK125GT3yYrztrZfAcfodbMjW7zMQtHHjqJVHYkl
 teuIa5R+W83bCaioOhB1d6hEZLBe/wfeo6vZo0qcYZn619oFUlk+2JXTPjXvu8olN4At
 tf2Q==
X-Gm-Message-State: AOAM531eX3CrUFKA8LnjyRaaNu4NC3AtPoFxDj0edic7ZnoHyu1NfLxw
 YwciP9BlyqQ8obdXUpGSPVCbxaQDGe4=
X-Google-Smtp-Source: ABdhPJzYYVi+9koubxZ0cjUCwOHOf5akj7rRGIisn7zh92bydH7DJ1Kl8nwG5fBHr7URvthKxwHacA==
X-Received: by 2002:a05:6122:114c:: with SMTP id
 p12mr24105499vko.21.1637746199618; 
 Wed, 24 Nov 2021 01:29:59 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id m15sm7682583vkl.40.2021.11.24.01.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:29:59 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v2 1/2] ivshmem.c: change endianness to LITTLE_ENDIAN
Date: Wed, 24 Nov 2021 06:29:47 -0300
Message-Id: <20211124092948.335389-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124092948.335389-1-danielhb413@gmail.com>
References: <20211124092948.335389-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ivshmem device, as with most PCI devices, uses little endian byte
order. However, the endianness of its mmio_ops is marked as
DEVICE_NATIVE_ENDIAN. This presents not only the usual problems with big
endian hosts but also with PowerPC little endian hosts as well, since
the Power architecture in QEMU uses big endian hardware (XIVE controller,
PCI Host Bridges, etc) even if the host is in little endian byte order.

As it is today, the IVPosition of the device will be byte swapped when
running in Power BE and LE. This can be seen by changing the existing
qtest 'ivshmem-test' to run in ppc64 hosts and printing the IVPOSITION
regs in test_ivshmem_server() right after the VM ids assert. For x86_64
the VM id values read are '0' and '1', for ppc64 (tested in a Power8
RHEL 7.9 BE server) and ppc64le (tested in a Power9 RHEL 8.6 LE server)
the ids will be '0' and '0x1000000'.

Change this device to LITTLE_ENDIAN fixes the issue for Power hosts of
both endianness, and every other big-endian architecture that might use
this device, without impacting x86 users.

Fixes: cb06608e17f8 ("ivshmem: convert to memory API")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/168
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/misc/ivshmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 1ba4a98377..299837e5c1 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -243,7 +243,7 @@ static uint64_t ivshmem_io_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps ivshmem_mmio_ops = {
     .read = ivshmem_io_read,
     .write = ivshmem_io_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
-- 
2.31.1


