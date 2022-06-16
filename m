Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE2D54E841
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:01:20 +0200 (CEST)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1srv-0007Sh-DR
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soM-0004Zo-MA
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soK-0001w3-Kv
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655398655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vhm0O9J2YGdFhjYbVQM8ZGQJH/dki5k9RJJ3YHAOZBA=;
 b=gB/X8WLHKnpVUiNof9TFGeyRMActRvIBv8WuHS6/0xvTImeKFIQnDRI1UluZPmReb9zGU9
 Mvfr+Jmly3pB5CCGQDRbqCOFA3QnlUwegJfFbNyjAZ1p4/l7vzaxCOcisy/hFGmgirAiSJ
 ZhHtk10SNvr/WEPio6y9OlnVkWSQGBY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-GaK4sPPaMJmIHLMELsOBFw-1; Thu, 16 Jun 2022 12:57:34 -0400
X-MC-Unique: GaK4sPPaMJmIHLMELsOBFw-1
Received: by mail-wm1-f70.google.com with SMTP id
 p22-20020a05600c359600b0039c7b23a1c7so1400967wmq.2
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vhm0O9J2YGdFhjYbVQM8ZGQJH/dki5k9RJJ3YHAOZBA=;
 b=qIYqnk0n1EwrgqvvsSRTe9L/kYMC0AvKY/Quq8Gxyg1A84WW5251VVvjNyV7iYR5c5
 ctqNMI6XMGJ6VVYDLj3+KbtmXEpoKL7xIP6auLUgcnD9xTxVj8OcW+q0qVKhmiyREdCN
 vi4FQh8gs91oUCrx/6BQPqGaDzfi+ibTO1CyzpyvK1UFmAj+JRz2PaZG3RRmDqnHCCRW
 GQFvsd63Ly46R3qF57p0PXpkqoYzlKwbGp/7pgWgb0PmtzzgEa9jaq+8wNf3gtBE1Zgr
 ppCmUPkXGBFY/hzlUPqRX+AmWyJO86WYUaC6GzzDom75A5AWi80FV1JwHi2xTGB/C/m6
 yz0g==
X-Gm-Message-State: AJIora+e2Ly3VV10R4gagvSPfRCVnYStXfszuBasCiwQuskq+hEoOHYV
 u+Q22UW9C2/f2Gio9xE/Zh4fHchqaVnRiPsbdA/OnX4iQa0n82LUmf3n/thEKGCX7tobk39huiG
 q7pGhLWaRXNf224dUY+bRdPvohCiNKGYUfHMc9QBBk7wPbpVxtKggUCyJJ/F7
X-Received: by 2002:a5d:4046:0:b0:21a:3a12:239e with SMTP id
 w6-20020a5d4046000000b0021a3a12239emr2233045wrp.138.1655398653102; 
 Thu, 16 Jun 2022 09:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uHSXeX3w9cpk9yXdGzbgTbDjirVQa96CcD2YqW912UfQAJufdEBjHRzmbBB6yZDe7afbLXiQ==
X-Received: by 2002:a5d:4046:0:b0:21a:3a12:239e with SMTP id
 w6-20020a5d4046000000b0021a3a12239emr2233022wrp.138.1655398652726; 
 Thu, 16 Jun 2022 09:57:32 -0700 (PDT)
Received: from redhat.com ([2.53.13.204]) by smtp.gmail.com with ESMTPSA id
 t10-20020a05600001ca00b00210326c4a90sm2298293wrx.49.2022.06.16.09.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 09:57:32 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:57:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Ben Widawsky <ben@bwidawsk.net>
Subject: [PULL 03/10] docs/cxl: Add switch documentation
Message-ID: <20220616165703.42226-4-mst@redhat.com>
References: <20220616165703.42226-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616165703.42226-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Switches were already introduced, but now we support them update
the documentation to provide an example in diagram and
qemu command line parameter forms.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220616145126.8002-4-Jonathan.Cameron@huawei.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/system/devices/cxl.rst | 88 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 2 deletions(-)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index bcbfe8c490..a57e4c4e5c 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -118,8 +118,6 @@ and associated component register access via PCI bars.
 
 CXL Switch
 ~~~~~~~~~~
-Not yet implemented in QEMU.
-
 Here we consider a simple CXL switch with only a single
 virtual hierarchy. Whilst more complex devices exist, their
 visibility to a particular host is generally the same as for
@@ -137,6 +135,10 @@ BARs.  The Upstream Port has the configuration interfaces for
 the HDM decoders which route incoming memory accesses to the
 appropriate downstream port.
 
+A CXL switch is created in a similar fashion to PCI switches
+by creating an upstream port (cxl-upstream) and a number of
+downstream ports on the internal switch bus (cxl-downstream).
+
 CXL Memory Devices - Type 3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 CXL type 3 devices use a PCI class code and are intended to be supported
@@ -240,6 +242,62 @@ Notes:
     they will take the Host Physical Addresses of accesses and map
     them to their own local Device Physical Address Space (DPA).
 
+Example topology involving a switch::
+
+  |<------------------SYSTEM PHYSICAL ADDRESS MAP (1)----------------->|
+  |    __________   __________________________________   __________    |
+  |   |          | |                                  | |          |   |
+  |   | CFMW 0   | |  CXL Fixed Memory Window 1       | | CFMW 1   |   |
+  |   | HB0 only | |  Configured to interleave memory | | HB1 only |   |
+  |   |          | |  memory accesses across HB0/HB1  | |          |   |
+  |   |____x_____| |__________________________________| |__________|   |
+           |             |                     |             |
+           |             |                     |             |
+           |             |                     |
+  Interleave Decoder     |                     |             |
+   Matches this HB       |                     |             |
+           \_____________|                     |_____________/
+               __________|__________      _____|_______________
+              |                     |    |                     |
+              | CXL HB 0            |    | CXL HB 1            |
+              | HB IntLv Decoders   |    | HB IntLv Decoders   |
+              | PCI/CXL Root Bus 0c |    | PCI/CXL Root Bus 0d |
+              |                     |    |                     |
+              |___x_________________|    |_____________________|
+                  |              |          |               |
+                  |
+       A HB 0 HDM Decoder
+       matches this Port
+       ___________|___
+      |  Root Port 0  |
+      |  Appears in   |
+      |  PCI topology |
+      |  As 0c:00.0   |
+      |___________x___|
+                  |
+                  |
+                  \_____________________
+                                        |
+                                        |
+            ---------------------------------------------------
+           |    Switch 0  USP as PCI 0d:00.0                   |
+           |    USP has HDM decoder which direct traffic to    |
+           |    appropiate downstream port                     |
+           |    Switch BUS appears as 0e                       |
+           |x__________________________________________________|
+            |                  |               |              |
+            |                  |               |              |
+       _____|_________   ______|______   ______|_____   ______|_______
+   (4)|     x         | |             | |            | |              |
+      | CXL Type3 0   | | CXL Type3 1 | | CXL type3 2| | CLX Type 3 3 |
+      |               | |             | |            | |              |
+      | PMEM0(Vol LSA)| | PMEM1 (...) | | PMEM2 (...)| | PMEM3 (...)  |
+      | Decoder to go | |             | |            | |              |
+      | from host PA  | | PCI 10:00.0 | | PCI 11:00.0| | PCI 12:00.0  |
+      | to device PA  | |             | |            | |              |
+      | PCI as 0f:00.0| |             | |            | |              |
+      |_______________| |_____________| |____________| |______________|
+
 Example command lines
 ---------------------
 A very simple setup with just one directly attached CXL Type 3 device::
@@ -279,6 +337,32 @@ the CXL Type3 device directly attached (no switches).::
   -device cxl-type3,bus=root_port16,memdev=cxl-mem4,lsa=cxl-lsa4,id=cxl-pmem3 \
   -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.targets.1=cxl.2,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=8k
 
+An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
+
+  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  ...
+  -object memory-backend-file,id=cxl-mem0,share=on,mem-path=/tmp/cxltest.raw,size=256M \
+  -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest1.raw,size=256M \
+  -object memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M \
+  -object memory-backend-file,id=cxl-mem3,share=on,mem-path=/tmp/cxltest3.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa0,share=on,mem-path=/tmp/lsa0.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa1.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa2,share=on,mem-path=/tmp/lsa2.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa3,share=on,mem-path=/tmp/lsa3.raw,size=256M \
+  -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
+  -device cxl-rp,port=0,bus=cxl.1,id=root_port0,chassis=0,slot=0 \
+  -device cxl-rp,port=1,bus=cxl.1,id=root_port1,chassis=0,slot=1 \
+  -device cxl-upstream,bus=root_port0,id=us0 \
+  -device cxl-downstream,port=0,bus=us0,id=swport0,chassis=0,slot=4 \
+  -device cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M \
+  -device cxl-downstream,port=1,bus=us0,id=swport1,chassis=0,slot=5 \
+  -device cxl-type3,bus=swport1,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem1,size=256M \
+  -device cxl-downstream,port=2,bus=us0,id=swport2,chassis=0,slot=6 \
+  -device cxl-type3,bus=swport2,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem2,size=256M \
+  -device cxl-downstream,port=3,bus=us0,id=swport3,chassis=0,slot=7 \
+  -device cxl-type3,bus=swport3,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,size=256M \
+  -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k
+
 Kernel Configuration Options
 ----------------------------
 
-- 
MST


