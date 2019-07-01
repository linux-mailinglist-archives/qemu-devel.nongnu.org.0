Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2EA1C367
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 08:48:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40520 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQREO-0003W2-Dp
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 02:48:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hQRDB-000398-0y
	for qemu-devel@nongnu.org; Tue, 14 May 2019 02:46:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hQRD8-0003O5-HW
	for qemu-devel@nongnu.org; Tue, 14 May 2019 02:46:52 -0400
Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]:38367)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hQRD7-0003I9-RX
	for qemu-devel@nongnu.org; Tue, 14 May 2019 02:46:50 -0400
Received: from player772.ha.ovh.net (unknown [10.109.159.154])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id E3241199F2E
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 08:46:40 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id C7BE65B19163;
	Tue, 14 May 2019 06:46:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 14 May 2019 08:46:27 +0200
Message-Id: <20190514064627.3838-1-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7228277403731594214
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrleehgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.63.121
Subject: [Qemu-devel] [PATCH] docs: provide documentation on the POWER9 XIVE
 interrupt controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Greg Kurz <groug@kaod.org>,
	Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This documents the overall XIVE architecture and gives an overview of
the QEMU models. It also provides documentation on the 'info pic'
command.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/index.rst     |   1 +
 docs/ppc/index.rst |  13 ++
 docs/ppc/xive.rst  | 344 +++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS        |   1 +
 4 files changed, 359 insertions(+)
 create mode 100644 docs/ppc/index.rst
 create mode 100644 docs/ppc/xive.rst

diff --git a/docs/index.rst b/docs/index.rst
index 3690955dd1f5..557fe86233e3 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -12,4 +12,5 @@ Welcome to QEMU's documentation!
=20
    interop/index
    devel/index
+   ppc/index
=20
diff --git a/docs/ppc/index.rst b/docs/ppc/index.rst
new file mode 100644
index 000000000000..146f416ea3a0
--- /dev/null
+++ b/docs/ppc/index.rst
@@ -0,0 +1,13 @@
+.. This is the top level page for the 'ppc' manual
+
+
+QEMU PowerPC Machine and Controller Guide
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+
+Contents:
+
+.. toctree::
+   :maxdepth: 2
+
+   xive
diff --git a/docs/ppc/xive.rst b/docs/ppc/xive.rst
new file mode 100644
index 000000000000..90ddde6bf39f
--- /dev/null
+++ b/docs/ppc/xive.rst
@@ -0,0 +1,344 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+POWER9 XIVE interrupt controller
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+
+The POWER9 processor comes with a new interrupt controller
+architecture, called XIVE as "eXternal Interrupt Virtualization
+Engine".
+
+Compared to the previous architecture, the main characteristics of
+XIVE are to support a larger number of interrupt sources and to
+deliver interrupts directly to virtual processors without hypervisor
+assistance. This removes the context switches required for the
+delivery process.
+
+
+Overall architecture
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The XIVE IC is composed of three sub-engines, each taking care of a
+processing layer of external interrupts:
+
+- Interrupt Virtualization Source Engine (IVSE), or Source Controller
+  (SC). These are found in PCI PHBs, in the PSI host bridge
+  controller, but also inside the main controller for the core IPIs
+  and other sub-chips (NX, CAP, NPU) of the chip/processor. They are
+  configured to feed the IVRE with events.
+- Interrupt Virtualization Routing Engine (IVRE) or Virtualization
+  Controller (VC). It handles event coalescing and perform interrupt
+  routing by matching an event source number with an Event
+  Notification Descriptor (END).
+- Interrupt Virtualization Presentation Engine (IVPE) or Presentation
+  Controller (PC). It maintains the interrupt context state of each
+  thread and handles the delivery of the external interrupt to the
+  thread.
+
+::
+
+                XIVE Interrupt Controller
+                +------------------------------------+      IPIs
+                | +---------+ +---------+ +--------+ |    +-------+
+                | |IVRE     | |Common Q | |IVPE    |----> | CORES |
+                | |     esb | |         | |        |----> |       |
+                | |     eas | |  Bridge | |   tctx |----> |       |
+                | |SC   end | |         | |    nvt | |    |       |
+    +------+    | +---------+ +----+----+ +--------+ |    +-+-+-+-+
+    | RAM  |    +------------------|-----------------+      | | |
+    |      |                       |                        | | |
+    |      |                       |                        | | |
+    |      |  +--------------------v------------------------v-v-v--+    =
other
+    |      <--+                     Power Bus                      +--> =
chips
+    |  esb |  +---------+-----------------------+------------------+
+    |  eas |            |                       |
+    |  end |         +--|------+                |
+    |  nvt |       +----+----+ |           +----+----+
+    +------+       |IVSE     | |           |IVSE     |
+                   |         | |           |         |
+                   | PQ-bits | |           | PQ-bits |
+                   | local   |-+           |  in VC  |
+                   +---------+             +---------+
+                      PCIe                 NX,NPU,CAPI
+
+
+    PQ-bits: 2 bits source state machine (P:pending Q:queued)
+    esb: Event State Buffer (Array of PQ bits in an IVSE)
+    eas: Event Assignment Structure
+    end: Event Notification Descriptor
+    nvt: Notification Virtual Target
+    tctx: Thread interrupt Context registers
+
+
+
+XIVE internal tables
+--------------------
+
+Each of the sub-engines uses a set of tables to redirect interrupts
+from event sources to CPU threads.
+
+::
+
+                                            +-------+
+    User or O/S                             |  EQ   |
+        or                          +------>|entries|
+    Hypervisor                      |       |  ..   |
+      Memory                        |       +-------+
+                                    |           ^
+                                    |           |
+               +-------------------------------------------------+
+                                    |           |
+    Hypervisor      +------+    +---+--+    +---+--+   +------+
+      Memory        | ESB  |    | EAT  |    | ENDT |   | NVTT |
+     (skiboot)      +----+-+    +----+-+    +----+-+   +------+
+                      ^  |        ^  |        ^  |       ^
+                      |  |        |  |        |  |       |
+               +-------------------------------------------------+
+                      |  |        |  |        |  |       |
+                      |  |        |  |        |  |       |
+                 +----|--|--------|--|--------|--|-+   +-|-----+    +---=
---+
+                 |    |  |        |  |        |  | |   | | tctx|    |Thr=
ead|
+     IPI or   ---+    +  v        +  v        +  v |---| +  .. |----->  =
   |
+    HW events    |                                 |   |       |    |   =
   |
+                 |             IVRE                |   | IVPE  |    +---=
---+
+                 +---------------------------------+   +-------+
+
+
+The IVSE have a 2-bits state machine, P for pending and Q for queued,
+for each source that allows events to be triggered. They are stored in
+an Event State Buffer (ESB) array and can be controlled by MMIOs.
+
+If the event is let through, the IVRE looks up in the Event Assignment
+Structure (EAS) table for an Event Notification Descriptor (END)
+configured for the source. Each Event Notification Descriptor defines
+a notification path to a CPU and an in-memory Event Queue, in which
+will be enqueued an EQ data for the O/S to pull.
+
+The IVPE determines if a Notification Virtual Target (NVT) can handle
+the event by scanning the thread contexts of the VCPUs dispatched on
+the processor HW threads. It maintains the interrupt context state of
+each thread in a NVT table.
+
+XIVE thread interrupt context
+-----------------------------
+
+The XIVE presenter can generate four different exceptions to its
+HW threads:
+
+- hypervisor exception
+- O/S exception
+- Event-Based Branch (user level)
+- msgsnd (doorbell)
+
+Each exception has a state independent from the others called a Thread
+Interrupt Management context. This context is a set of registers which
+lets the thread handle priority management and interrupt
+acknowledgment among other things. The most important ones being :
+
+- Interrupt Priority Register  (PIPR)
+- Interrupt Pending Buffer     (IPB)
+- Current Processor Priority   (CPPR)
+- Notification Source Register (NSR)
+
+TIMA
+~~~~
+
+The Thread Interrupt Management registers are accessible through a
+specific MMIO region, called the Thread Interrupt Management Area
+(TIMA), four aligned pages, each exposing a different view of the
+registers. First page (page address ending in ``0b00``) gives access
+to the entire context and is reserved for the ring 0 view for the
+physical thread context. The second (page address ending in ``0b01``)
+is for the hypervisor, ring 1 view. The third (page address ending in
+``0b10``) is for the operating system, ring 2 view. The fourth (page
+address ending in ``0b11``) is for user level, ring 3 view.
+
+Interrupt flow from an O/S perspective
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+After an event data has been enqueued in the O/S Event Queue, the IVPE
+raises the bit corresponding to the priority of the pending interrupt
+in the register IBP (Interrupt Pending Buffer) to indicate that an
+event is pending in one of the 8 priority queues. The Pending
+Interrupt Priority Register (PIPR) is also updated using the IPB. This
+register represent the priority of the most favored pending
+notification.
+
+The PIPR is then compared to the the Current Processor Priority
+Register (CPPR). If it is more favored (numerically less than), the
+CPU interrupt line is raised and the EO bit of the Notification Source
+Register (NSR) is updated to notify the presence of an exception for
+the O/S. The O/S acknowledges the interrupt with a special load in the
+Thread Interrupt Management Area.
+
+The O/S handles the interrupt and when done, performs an EOI using a
+MMIO operation on the ESB management page of the associate source.
+
+
+Overview of the QEMU models for XIVE
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The XiveSource models the IVSE in general, internal and external. It
+handles the source ESBs and the MMIO interface to control them.
+
+The XiveNotifier is a small helper interface interconnecting the
+XiveSource to the XiveRouter.
+
+The XiveRouter is an abstract model acting as a combined IVRE and
+IVPE. It routes event notifications using the EAS and END tables to
+the IVPE sub-engine which does a CAM scan to find a CPU to deliver the
+exception. Storage should be provided by the inheriting classes.
+
+XiveEnDSource is a special source object. It exposes the END ESB MMIOs
+of the Event Queues which are used for coalescing event notifications
+and for escalation. Not used on the field, only to sync the EQ cache
+in OPAL.
+
+Finally, the XiveTCTX contains the interrupt state context of a thread,
+four sets of registers, one for each exception that can be delivered
+to a CPU. These contexts are scanned by the IVPE to find a matching VP
+when a notification is triggered. It also models the Thread Interrupt
+Management Area (TIMA), which exposes the thread context registers to
+the CPU for interrupt management.
+
+
+XIVE for sPAPR (pseries machines)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+SpaprXive models the XIVE interrupt controller of a ``pseries``
+machine. It inherits from the XiveRouter and provisions storage for
+the EAS and END tables. The NVT table does not need a backend in
+sPAPR. It owns a XiveSource object for the IPIs and the virtual device
+interrupts, a memory region for the TIMA and a XiveENDSource object to
+manage the END ESBs (not used by Linux).
+
+These choices were made to have a sPAPR interrupt controller consistent
+with the one found on baremetal and to facilitate KVM support, the
+main difficulty being the host memory regions exposed to the guest.
+
+CAS Negotiation
+---------------
+
+The interrupt mode advertised by the ``pseries`` machine in the CAS
+negotiation process depends on the CPU type (XIVE requires POWER9) but
+also on the machine property ``ic-mode`` which can take the following
+values: ``xics``, ``xive`` and ``dual``. ``xics`` is currently the
+default mode but it should change in the future.
+
+The choosen interrupt mode is activated after a reconfiguration done
+in a machine reset.
+
+KVM support
+-----------
+
+Two host memory regions are exposed to the guest and require special
+attention at initialization :
+
+- ESB MMIOs
+- Thread Interrupt Management Area (TIMA)
+
+When using the KVM device, these are `ram device` memory mappings,
+similarly to VFIO, exposed to the guest and the associated VMAs on the
+host are populated dynamically with the appropriate pages using a
+fault handler.
+
+The models uses KVM accessors to synchronize the QEMU state with KVM :
+
+- the source configuration (EAT)
+- the END configuration (ENDT)
+- the O/S EQ state (toggle bit and index)
+- the thread interrupt context registers.
+
+Hybrid guest using KVM and an emulated irqchip ``kernel_irqchip=3Doff``
+is supported.
+
+Monitoring XIVE
+---------------
+
+The state of the XIVE interrupt controller can be queried through the
+monitor commands ``info pic``. The output comes in two parts.
+
+First, the state of the thread interrupt context registers is dumped
+for each CPU :
+
+::
+
+   (qemu) info pic
+   CPU[0000]:   QW   NSR CPPR IPB LSMFB ACK# INC AGE PIPR  W2
+   CPU[0000]: USER    00   00  00    00   00  00  00   00  00000000
+   CPU[0000]:   OS    00   ff  00    00   ff  00  ff   ff  80000400
+   CPU[0000]: POOL    00   00  00    00   00  00  00   00  00000000
+   CPU[0000]: PHYS    00   00  00    00   00  00  00   ff  00000000
+   ...
+
+In the case of a ``pseries`` machine, QEMU acts as the hypervisor and on=
ly
+the O/S and USER register rings make sense. ``W2`` contains the vCPU CAM
+line which is set to the VP identifier.
+
+Then comes the routing information which aggregates the EAS and the
+END configuration:
+
+::
+
+   ...
+   LISN         PQ    EISN     CPU/PRIO EQ
+   00000000 MSI --    00000010   0/6    380/16384 @1fe3e0000 ^1 [ 800000=
10 ... ]
+   00000001 MSI --    00000010   1/6    305/16384 @1fc230000 ^1 [ 800000=
10 ... ]
+   00000002 MSI --    00000010   2/6    220/16384 @1fc2f0000 ^1 [ 800000=
10 ... ]
+   00000003 MSI --    00000010   3/6    201/16384 @1fc390000 ^1 [ 800000=
10 ... ]
+   00000004 MSI -Q  M 00000000
+   00000005 MSI -Q  M 00000000
+   00000006 MSI -Q  M 00000000
+   00000007 MSI -Q  M 00000000
+   00001000 MSI --    00000012   0/6    380/16384 @1fe3e0000 ^1 [ 800000=
10 ... ]
+   00001001 MSI --    00000013   0/6    380/16384 @1fe3e0000 ^1 [ 800000=
10 ... ]
+   00001100 MSI --    00000100   1/6    305/16384 @1fc230000 ^1 [ 800000=
10 ... ]
+   00001101 MSI -Q  M 00000000
+   00001200 LSI -Q  M 00000000
+   00001201 LSI -Q  M 00000000
+   00001202 LSI -Q  M 00000000
+   00001203 LSI -Q  M 00000000
+   00001300 MSI --    00000102   1/6    305/16384 @1fc230000 ^1 [ 800000=
10 ... ]
+   00001301 MSI --    00000103   2/6    220/16384 @1fc2f0000 ^1 [ 800000=
10 ... ]
+   00001302 MSI --    00000104   3/6    201/16384 @1fc390000 ^1 [ 800000=
10 ... ]
+
+The source information and configuration:
+
+- The ``LISN`` column outputs the interrupt number of the source in
+  range ``[ 0x0 ... 0x1FFF ]`` and its type : ``MSI`` or ``LSI``
+- The ``PQ`` column reflects the state of the PQ bits of the source :
+
+  - ``--`` source is ready to take events
+  - ``P-`` an event was sent and an EOI is PENDING
+  - ``PQ`` an event was QUEUED
+  - ``-Q`` source is OFF
+
+  a ``M`` indicates that source is *MASKED* at the EAS level,
+
+The targeting configuration :
+
+- The ``EISN`` column is the event data what will be queued in the event
+  queue of the O/S.
+- The ``CPU/PRIO`` column is the tuple defining the CPU number and
+  priority queue serving the source.
+- The ``EQ`` column outputs :
+
+  - the current index of the event queue/ the max number of entries
+  - the O/S event queue address
+  - the toggle bit
+  - the last entries that were pushed in the event queue.
+
+
+
+XIVE for PowerNV
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The PnvXIVE model uses the XiveRouter abstract model just like
+sPAPRXive. It provides accessors to the EAS, END and NVT tables which
+are stored in the QEMU PowerNV machine and not in QEMU anymore. It
+owns a set of memory regions for the IC registers, the ESBs, the END
+ESBs, the TIMA, the notification MMIO.
+
+Multichip is supported and the available IVSEs are the internal one
+for the IPIS, the PSI host bridge controller and PHB4.
+
+The next interesting step would be to add escalation events and model
+the VCPU dispatching to support emulated KVM guests.
diff --git a/MAINTAINERS b/MAINTAINERS
index 66ddbda9c958..a896c7407294 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1697,6 +1697,7 @@ L: qemu-ppc@nongnu.org
 S: Supported
 F: hw/*/*xive*
 F: include/hw/*/*xive*
+F: docs/ppc/xive.rst
=20
 Subsystems
 ----------
--=20
2.20.1


