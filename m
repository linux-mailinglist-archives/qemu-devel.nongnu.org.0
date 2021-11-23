Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64045AE58
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 22:21:58 +0100 (CET)
Received: from localhost ([::1]:54072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpdEh-0000te-3n
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 16:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpdCk-0007Y2-Ln; Tue, 23 Nov 2021 16:19:54 -0500
Received: from [2607:f8b0:4864:20::932] (port=44791
 helo=mail-ua1-x932.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpdCj-0000sG-0M; Tue, 23 Nov 2021 16:19:54 -0500
Received: by mail-ua1-x932.google.com with SMTP id p2so608857uad.11;
 Tue, 23 Nov 2021 13:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ByxKytRrXcB6uRlXydHjjGKE/pHX8RED61Z26OZQLW8=;
 b=lRa7SjJS0gxF4pntIcMqs3OnnVfqdT4f+up8CKkWIOljeD2fAqvu05EjzZvsUFb9mu
 e1qzcGlXfw2x9KLwNyWZLEPI4IK9+OsO/JFyxbDGoTsP+it4+rDLGfMvesjkHegW/DL5
 min8iWaSWbd9u/pLC0ZjNAmD9E+S2G1BSDILu7kHkBRhGqIkFXOWonQot4Ro1rzBs4yi
 bpg+7A4srpg3UpwmULp4hC77VGpNWhzXu7QyPfbtp/ZMc/LA1bV9LcjGKRT2JQfjMb+/
 WOJgvetybTyXI90C2xsXPh90NikzffVnDZ+I5o4gUtaPN/+hZJax3RCvlo5cPHCUyXiQ
 /1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ByxKytRrXcB6uRlXydHjjGKE/pHX8RED61Z26OZQLW8=;
 b=oTupY3m/WDbJTvQww7ypFg6+uCRtbo2+vOzbJZuyn6/QzCohhkRBiES8FpPnzYGWIT
 7Iz2yOOKQmnxLFKYKuccfj8Xf96l9zjYQYrA8++alfcq61J7wDoBCNGDE4B8jDvax4GG
 K+KaosRHaiaqxdQt+rsUU1GwiIgWYVVhZAspQrmcmB+zs6aQeIrzFfajeEngw/mLyftE
 lwIqf70RziDr/nu4kSl9LP8v7ODv5rq0Qw+WBjYedUtTfDRsbfUErh6lNAG+QGsIG66Q
 KOrNjiY0yqOKSKhCnL59D+TGypGBm/W6H9ZiUbW3doayf0EIf84LMbRDoH0o4BWPSgKc
 pLSw==
X-Gm-Message-State: AOAM532Q3yD9Sn4S6BFDoUWKUKyvYCebAuXMSvbi3O8otq5Wk3FI+FDN
 LfHsnaxpNRMXbaJ147rO+vohkkGI0T0=
X-Google-Smtp-Source: ABdhPJwqNSu3vgM2q7+1UCtG5eTrsHUdx3q8h3WlbFETZNHXz4lC4p7aTPaoP9/jZSfQNwXWHWGpFQ==
X-Received: by 2002:a67:ec8f:: with SMTP id h15mr13831552vsp.42.1637702391661; 
 Tue, 23 Nov 2021 13:19:51 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id h7sm6807958vkk.2.2021.11.23.13.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 13:19:51 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] ivshmem.c: change endianness to LITTLE_ENDIAN
Date: Tue, 23 Nov 2021 18:19:31 -0300
Message-Id: <20211123211932.284043-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211123211932.284043-1-danielhb413@gmail.com>
References: <20211123211932.284043-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::932
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x932.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ivshmem device, as with most PCI devices, uses little endian byte
order. However, the endianess of its mmio_ops is marked as
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
both endianess, and every other big-endian architecture that might use
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


