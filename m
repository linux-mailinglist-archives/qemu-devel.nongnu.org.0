Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B6529322
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:47:56 +0200 (CEST)
Received: from localhost ([::1]:54690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiZH-0000vw-5j
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiK-0007Sc-5E
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiH-0006at-H8
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SYV3Gh0FPI2SuiQwn9I4PIE0FPq8LZyZH08OFbu/OCM=;
 b=SvIbwcE6qK1g/IMSi9R2HHDQzdh1QqzxoJgF5NIgLzIRZr7qn61JQR97caMTIO7Bej6QL7
 sZhZkIZnfTzfZqsH9GZtfWokMn8ckPllJAVrRDgFhoFJix0bLEcbwlR6r/h8R9EGTFt7KO
 L1PXyGs6LXBz7v+ewejlzP4QqHOFPgw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-xEdp5SYkNS2Lqrwarb8LrA-1; Mon, 16 May 2022 16:53:06 -0400
X-MC-Unique: xEdp5SYkNS2Lqrwarb8LrA-1
Received: by mail-ed1-f72.google.com with SMTP id
 b14-20020a05640202ce00b0042aa312ff51so3990869edx.18
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SYV3Gh0FPI2SuiQwn9I4PIE0FPq8LZyZH08OFbu/OCM=;
 b=RQPCopIvwmiWRqyNOUUtO0Cw7acr+YZWg6j4AEtMr4WklSlhfSFxh07yzAFuh1QfNE
 VArijW+JPXsjN1t4U1s7GNMZAyMBPVKmGKxRxq4RpAp2Q9HSbwPbu0YDT2+V8GrFP0g1
 kLDI0eZkH+Jv5ZGfw9xLtbhjZOUplhBTcUVum6hqWDSxPvCo7svUhcY5ES8EtmHfwbyu
 QPva/mQovYvAzoSNQl17oGARJO6mGPjsHcaPrM1+Xs2LS8NbbsoiJI/7owdguspN5LV5
 5yoe0/tZBI3DdGOcrm7tVL9NO7a2RymzRn9JhCx7woVa6Si43pm5Bxb1Ppro22uepE9y
 7aSA==
X-Gm-Message-State: AOAM5337LP6WDfSU3h10/n1Qa6uvR/Irdao/6jza+YilAN70L/21AFtt
 NnZKqBl7H6GaAtSgXRMPQXeNupLKXgO/NXFXYVt4C1L4K8MkY66XDRHyF5GQk8vu556hKaGJajt
 zEMSwY+XDQ0AsOnkBhw8kml6KyTzEXQhiBk6rNGMoMHKADjdTy07AgUZijVW8
X-Received: by 2002:a17:906:6a26:b0:6f4:6bf8:1efe with SMTP id
 qw38-20020a1709066a2600b006f46bf81efemr16540234ejc.208.1652734384774; 
 Mon, 16 May 2022 13:53:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU1m0VxQ2veQvM+fbxMQbU20h2w/RQMmgD8lkiZeij+xzp0OTIr0CgtkjWw5ZXdzesD/Ry0A==
X-Received: by 2002:a17:906:6a26:b0:6f4:6bf8:1efe with SMTP id
 qw38-20020a1709066a2600b006f46bf81efemr16540192ejc.208.1652734384126; 
 Mon, 16 May 2022 13:53:04 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 u6-20020a50d506000000b00426cae11e63sm5847545edi.43.2022.05.16.13.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:03 -0700 (PDT)
Date: Mon, 16 May 2022 16:52:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Lucas Ramage <lucas.ramage@infinite-omicron.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 42/86] docs/cxl: Add initial Compute eXpress Link (CXL)
 documentation.
Message-ID: <20220516204913.542894-43-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
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

Provide an introduction to the main components of a CXL system,
with detailed explanation of memory interleaving, example command
lines and kernel configuration.

This was a challenging document to write due to the need to extract
only that subset of CXL information which is relevant to either
users of QEMU emulation of CXL or to those interested in the
implementation.  Much of CXL is concerned with specific elements of
the protocol, management of memory pooling etc which is simply
not relevant to what is currently planned for CXL emulation
in QEMU.  All comments welcome

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-43-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/cxl.rst      | 302 +++++++++++++++++++++++++++++++
 2 files changed, 303 insertions(+)
 create mode 100644 docs/system/devices/cxl.rst

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index ae8dd233e8..3b729b920d 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -84,6 +84,7 @@ Emulated Devices
 
    devices/can.rst
    devices/ccid.rst
+   devices/cxl.rst
    devices/ivshmem.rst
    devices/net.rst
    devices/nvme.rst
diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
new file mode 100644
index 0000000000..9293cbf01a
--- /dev/null
+++ b/docs/system/devices/cxl.rst
@@ -0,0 +1,302 @@
+Compute Express Link (CXL)
+==========================
+From the view of a single host, CXL is an interconnect standard that
+targets accelerators and memory devices attached to a CXL host.
+This description will focus on those aspects visible either to
+software running on a QEMU emulated host or to the internals of
+functional emulation. As such, it will skip over many of the
+electrical and protocol elements that would be more of interest
+for real hardware and will dominate more general introductions to CXL.
+It will also completely ignore the fabric management aspects of CXL
+by considering only a single host and a static configuration.
+
+CXL shares many concepts and much of the infrastructure of PCI Express,
+with CXL Host Bridges, which have CXL Root Ports which may be directly
+attached to CXL or PCI End Points. Alternatively there may be CXL Switches
+with CXL and PCI Endpoints attached below them.  In many cases additional
+control and capabilities are exposed via PCI Express interfaces.
+This sharing of interfaces and hence emulation code is is reflected
+in how the devices are emulated in QEMU. In most cases the various
+CXL elements are built upon an equivalent PCIe devices.
+
+CXL devices support the following interfaces:
+
+* Most conventional PCIe interfaces
+
+  - Configuration space access
+  - BAR mapped memory accesses used for registers and mailboxes.
+  - MSI/MSI-X
+  - AER
+  - DOE mailboxes
+  - IDE
+  - Many other PCI express defined interfaces..
+
+* Memory operations
+
+  - Equivalent of accessing DRAM / NVDIMMs. Any access / feature
+    supported by the host for normal memory should also work for
+    CXL attached memory devices.
+
+* Cache operations. The are mostly irrelevant to QEMU emulation as
+  QEMU is not emulating a coherency protocol. Any emulation related
+  to these will be device specific and is out of the scope of this
+  document.
+
+CXL 2.0 Device Types
+--------------------
+CXL 2.0 End Points are often categorized into three types.
+
+**Type 1:** These support coherent caching of host memory.  Example might
+be a crypto accelerators.  May also have device private memory accessible
+via means such as PCI memory reads and writes to BARs.
+
+**Type 2:** These support coherent caching of host memory and host
+managed device memory (HDM) for which the coherency protocol is managed
+by the host. This is a complex topic, so for more information on CXL
+coherency see the CXL 2.0 specification.
+
+**Type 3 Memory devices:**  These devices act as a means of attaching
+additional memory (HDM) to a CXL host including both volatile and
+persistent memory. The CXL topology may support interleaving across a
+number of Type 3 memory devices using HDM Decoders in the host, host
+bridge, switch upstream port and endpoints.
+
+Scope of CXL emulation in QEMU
+------------------------------
+The focus of CXL emulation is CXL revision 2.0 and later. Earlier CXL
+revisions defined a smaller set of features, leaving much of the control
+interface as implementation defined or device specific, making generic
+emulation challenging with host specific firmware being responsible
+for setup and the Endpoints being presented to operating systems
+as Root Complex Integrated End Points. CXL rev 2.0 looks a lot
+more like PCI Express, with fully specified discoverability
+of the CXL topology.
+
+CXL System components
+----------------------
+A CXL system is made up a Host with a number of 'standard components'
+the control and capabilities of which are discoverable by system software
+using means described in the CXL 2.0 specification.
+
+CXL Fixed Memory Windows (CFMW)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+A CFMW consists of a particular range of Host Physical Address space
+which is routed to particular CXL Host Bridges.  At time of generic
+software initialization it will have a particularly interleaving
+configuration and associated Quality of Serice Throtling Group (QTG).
+This information is available to system software, when making
+decisions about how to configure interleave across available CXL
+memory devices.  It is provide as CFMW Structures (CFMWS) in
+the CXL Early Discovery Table, an ACPI table.
+
+Note: QTG 0 is the only one currently supported in QEMU.
+
+CXL Host Bridge (CXL HB)
+~~~~~~~~~~~~~~~~~~~~~~~~
+A CXL host bridge is similar to the PCIe equivalent, but with a
+specification defined register interface called CXL Host Bridge
+Component Registers (CHBCR). The location of this CHBCR MMIO
+space is described to system software via a CXL Host Bridge
+Structure (CHBS) in the CEDT ACPI table.  The actual interfaces
+are identical to those used for other parts of the CXL heirarchy
+as CXL Component Registers in PCI BARs.
+
+Interfaces provided include:
+
+* Configuration of HDM Decoders to route CXL Memory accesses with
+  a particularly Host Physical Address range to the target port
+  below which the CXL device servicing that address lies.  This
+  may be a mapping to a single Root Port (RP) or across a set of
+  target RPs.
+
+CXL Root Ports (CXL RP)
+~~~~~~~~~~~~~~~~~~~~~~~
+A CXL Root Port servers te same purpose as a PCIe Root Port.
+There are a number of CXL specific Designated Vendor Specific
+Extended Capabilities (DVSEC) in PCIe Configuration Space
+and associated component register access via PCI bars.
+
+CXL Switch
+~~~~~~~~~~
+Not yet implemented in QEMU.
+
+Here we consider a simple CXL switch with only a single
+virtual hierarchy. Whilst more complex devices exist, their
+visibility to a particular host is generally the same as for
+a simple switch design. Hosts often have no awareness
+of complex rerouting and device pooling, they simply see
+devices being hot added or hot removed.
+
+A CXL switch has a similar architecture to those in PCIe,
+with a single upstream port, internal PCI bus and multiple
+downstream ports.
+
+Both the CXL upstream and downstream ports have CXL specific
+DVSECs in configuration space, and component registers in PCI
+BARs.  The Upstream Port has the configuration interfaces for
+the HDM decoders which route incoming memory accesses to the
+appropriate downstream port.
+
+CXL Memory Devices - Type 3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+CXL type 3 devices use a PCI class code and are intended to be supported
+by a generic operating system driver. They have HDM decoders
+though in these EP devices, the decoder is reponsible not for
+routing but for translation of the incoming host physical address (HPA)
+into a Device Physical Address (DPA).
+
+CXL Memory Interleave
+---------------------
+To understand the interaction of different CXL hardware components which
+are emulated in QEMU, let us consider a memory read in a fully configured
+CXL topology.  Note that system software is responsible for configuration
+of all components with the exception of the CFMWs. System software is
+responsible for allocating appropriate ranges from within the CFMWs
+and exposing those via normal memory configurations as would be done
+for system RAM.
+
+Example system Topology. x marks the match in each decoder level::
+
+  |<------------------SYSTEM PHYSICAL ADDRESS MAP (1)----------------->|
+  |    __________   __________________________________   __________    |
+  |   |          | |                                  | |          |   |
+  |   | CFMW 0   | |  CXL Fixed Memory Window 1       | | CFMW 1   |   |
+  |   | HB0 only | |  Configured to interleave memory | | HB1 only |   |
+  |   |          | |  memory accesses across HB0/HB1  | |          |   |
+  |   |__________| |_____x____________________________| |__________|   |
+           |             |                     |             |
+           |             |                     |             |
+           |             |                     |             |
+           |       Interleave Decoder          |             |
+           |       Matches this HB             |             |
+           \_____________|                     |_____________/
+               __________|__________      _____|_______________
+              |                     |    |                     |
+       (2)    | CXL HB 0            |    | CXL HB 1            |
+              | HB IntLv Decoders   |    | HB IntLv Decoders   |
+              | PCI/CXL Root Bus 0c |    | PCI/CXL Root Bus 0d |
+              |                     |    |                     |
+              |___x_________________|    |_____________________|
+                  |                |       |               |
+                  |                |       |               |
+       A HB 0 HDM Decoder          |       |               |
+       matches this Port           |       |               |
+                  |                |       |               |
+       ___________|___   __________|__   __|_________   ___|_________
+   (3)|  Root Port 0  | | Root Port 1 | | Root Port 2| | Root Port 3 |
+      |  Appears in   | | Appears in  | | Appears in | | Appear in   |
+      |  PCI topology | | PCI Topology| | PCI Topo   | | PCI Topo    |
+      |  As 0c:00.0   | | as 0c:01.0  | | as de:00.0 | | as de:01.0  |
+      |_______________| |_____________| |____________| |_____________|
+            |                  |               |              |
+            |                  |               |              |
+       _____|_________   ______|______   ______|_____   ______|_______
+   (4)|     x         | |             | |            | |              |
+      | CXL Type3 0   | | CXL Type3 1 | | CXL type3 2| | CLX Type 3 3 |
+      |               | |             | |            | |              |
+      | PMEM0(Vol LSA)| | PMEM1 (...) | | PMEM2 (...)| | PMEM3 (...)  |
+      | Decoder to go | |             | |            | |              |
+      | from host PA  | | PCI 0e:00.0 | | PCI df:00.0| | PCI e0:00.0  |
+      | to device PA  | |             | |            | |              |
+      | PCI as 0d:00.0| |             | |            | |              |
+      |_______________| |_____________| |____________| |______________|
+
+Notes:
+
+(1) **3 CXL Fixed Memory Windows (CFMW)** corresponding to different
+    ranges of the system physical address map.  Each CFMW has
+    particular interleave setup across the CXL Host Bridges (HB)
+    CFMW0 provides uninterleaved access to HB0, CFW2 provides
+    uninterleaved acess to HB1. CFW1 provides interleaved memory access
+    across HB0 and HB1.
+
+(2) **Two CXL Host Bridges**. Each of these has 2 CXL Root Ports and
+    programmable HDM decoders to route memory accesses either to
+    a single port or interleave them across multiple ports.
+    A complex configuration here, might be to use the following HDM
+    decoders in HB0. HDM0 routes CFMW0 requests to RP0 and hence
+    part of CXL Type3 0. HDM1 routes CFMW0 requests from a
+    different region of the CFMW0 PA range to RP2 and hence part
+    of CXL Type 3 1.  HDM2 routes yet another PA range from within
+    CFMW0 to be interleaved across RP0 and RP1, providing 2 way
+    interleave of part of the memory provided by CXL Type3 0 and
+    CXL Type 3 1. HDM3 routes those interleaved accesses from
+    CFMW1 that target HB0 to RP 0 and another part of the memory of
+    CXL Type 3 0 (as part of a 2 way interleave at the system level
+    across for example CXL Type3 0 and CXL Type3 2.
+    HDM4 is used to enable system wide 4 way interleave across all
+    the present CXL type3 devices, by interleaving those (interleaved)
+    requests that HB0 receives from from CFMW1 across RP 0 and
+    RP 1 and hence to yet more regions of the memory of the
+    attached Type3 devices.  Note this is a representative subset
+    of the full range of possible HDM decoder configurations in this
+    topology.
+
+(3) **Four CXL Root Ports.** In this case the CXL Type 3 devices are
+    directly attached to these ports.
+
+(4) **Four CXL Type3 memory expansion devices.**  These will each have
+    HDM decoders, but in this case rather than performing interleave
+    they will take the Host Physical Addresses of accesses and map
+    them to their own local Device Physical Address Space (DPA).
+
+Example command lines
+---------------------
+A very simple setup with just one directly attached CXL Type 3 device::
+
+  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  ...
+  -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=256M \
+  -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
+  -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
+  -device cxl-type3,bus=root_port13,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \
+  -cxl-fixed-memory-window targets.0=cxl.1,size=4G
+
+A setup suitable for 4 way interleave. Only one fixed window provided, to enable 2 way
+interleave across 2 CXL host bridges.  Each host bridge has 2 CXL Root Ports, with
+the CXL Type3 device directly attached (no switches).::
+
+  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  ...
+  -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M \
+  -object memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M \
+  -object memory-backend-file,id=cxl-mem3,share=on,mem-path=/tmp/cxltest3.raw,size=256M \
+  -object memory-backend-file,id=cxl-mem4,share=on,mem-path=/tmp/cxltest4.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa2,share=on,mem-path=/tmp/lsa2.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa3,share=on,mem-path=/tmp/lsa3.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa4,share=on,mem-path=/tmp/lsa4.raw,size=256M \
+  -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
+  -device pxb-cxl,bus_nr=222,bus=pcie.0,id=cxl.2 \
+  -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
+  -device cxl-type3,bus=root_port13,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \
+  -device cxl-rp,port=1,bus=cxl.1,id=root_port14,chassis=0,slot=3 \
+  -device cxl-type3,bus=root_port14,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem1 \
+  -device cxl-rp,port=0,bus=cxl.2,id=root_port15,chassis=0,slot=5 \
+  -device cxl-type3,bus=root_port15,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem2 \
+  -device cxl-rp,port=1,bus=cxl.2,id=root_port16,chassis=0,slot=6 \
+  -device cxl-type3,bus=root_port16,memdev=cxl-mem4,lsa=cxl-lsa4,id=cxl-pmem3 \
+  -cxl-fixed-memory-window targets.0=cxl.1,targets.1=cxl.2,size=4G,interleave-granularity=8k
+
+Kernel Configuration Options
+----------------------------
+
+In Linux 5.18 the followings options are necessary to make use of
+OS management of CXL memory devices as described here.
+
+* CONFIG_CXL_BUS
+* CONFIG_CXL_PCI
+* CONFIG_CXL_ACPI
+* CONFIG_CXL_PMEM
+* CONFIG_CXL_MEM
+* CONFIG_CXL_PORT
+* CONFIG_CXL_REGION
+
+References
+----------
+
+ - Consortium website for specifications etc:
+   http://www.computeexpresslink.org
+ - Compute Express link Revision 2 specification, October 2020
+ - CEDT CFMWS & QTG _DSM ECN May 2021
-- 
MST


