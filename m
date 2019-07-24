Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCDB72F58
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 14:59:30 +0200 (CEST)
Received: from localhost ([::1]:51418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqGrh-0006Ai-C9
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 08:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58766)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <M.Cerveny@computer.org>) id 1hqGrR-0005l0-Mt
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 08:59:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <M.Cerveny@computer.org>) id 1hqGrP-000116-VD
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 08:59:13 -0400
Received: from 2001-1ae9-0158-5901-ecc0-4afa-64c0-20f1.ip6.tmcz.cz
 ([2001:1ae9:158:5901:ecc0:4afa:64c0:20f1]:49868 helo=xen3.c-home.cz)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <M.Cerveny@computer.org>)
 id 1hqGrP-0000rx-GP
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 08:59:11 -0400
Received: from xen3.c-home.cz (localhost [127.0.0.1])
 by xen3.c-home.cz (8.15.2/8.15.2) with ESMTP id x6OCx5si014849;
 Wed, 24 Jul 2019 14:59:05 +0200
From: Martin Cerveny <M.Cerveny@computer.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Date: Wed, 24 Jul 2019 14:58:58 +0200
Message-Id: <20190724125859.14624-1-M.Cerveny@computer.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by xen3.c-home.cz id
 x6OCx5si014849
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:1ae9:158:5901:ecc0:4afa:64c0:20f1
Subject: [Qemu-devel] [PATCH 0/1] USB: bugfix on interrupt xfers with
 usb-redir
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
Cc: qemu-devel@nongnu.org, Martin Cerveny <M.Cerveny@computer.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have problem in xen with qemu xhci with usbredir backend.
Windows bluetooth (BCM20703) driver does not work without proposed patch.
Interrupt EP does not work as expected and described in USB spec.

usb_20.pdf/5.7.3 Interrupt Transfer Packet Size Constraint:
----
An endpoint must always transmit data payloads with a data field less tha=
n or equal to the endpoint=E2=80=99s
wMaxPacketSize value. A device can move data via an interrupt pipe that i=
s larger than wMaxPacketSize.
A software client can accept this data via an IRP for the interrupt trans=
fer that requires multiple bus
transactions without requiring an IRP-complete notification per transacti=
on. This can be achieved by
specifying a buffer that can hold the desired data size. The size of the =
buffer is a multiple of
wMaxPacketSize with some remainder. The endpoint must transfer each trans=
action except the last as
wMaxPacketSize and the last transaction is the remainder. The multiple da=
ta transactions are moved over
the bus at the period established for the pipe.
When an interrupt transfer involves more data than can fit in one data pa=
yload of the currently established
maximum size, all data payloads are required to be maximum-sized except f=
or the last data payload, which
will contain the remaining data. An interrupt transfer is complete when t=
he endpoint does one of the
following:
=E2=80=A2 Has transferred exactly the amount of data expected
=E2=80=A2 Transfers a packet with a payload size less than wMaxPacketSize=
 or transfers a zero-length packet
----

Examples of affected device on windows usbpcap decoded with wireshark:

- snip of configuration descriptor:
----
ENDPOINT DESCRIPTOR
    bLength: 7
    bDescriptorType: 0x05 (ENDPOINT)
    bEndpointAddress: 0x81  IN  Endpoint:1
        1... .... =3D Direction: IN Endpoint
        .... 0001 =3D Endpoint Number: 0x1
    bmAttributes: 0x03
        .... ..11 =3D Transfertype: Interrupt-Transfer (0x3)
    wMaxPacketSize: 16
        ...0 0... .... .... =3D Transactions per microframe: 1 (0)
        .... ..00 0001 0000 =3D Maximum Packet Size: 16
    bInterval: 1
----


- snip of two correct URB interrupts (len 70 and len 16) from non-virtual=
ized communication and patched qemu:
----
USB URB
    [Source: 1.6.1]
    [Destination: host]
    USBPcap pseudoheader length: 27
    IRP ID: 0xffffa901ed380050
    IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
    URB Function: URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER (0x0009)
    IRP information: 0x01, Direction: PDO -> FDO
        0000 000. =3D Reserved: 0x00
        .... ...1 =3D Direction: PDO -> FDO (0x1)
    URB bus id: 1
    Device address: 6
    Endpoint: 0x81, Direction: IN
        1... .... =3D Direction: IN (1)
        .... 0001 =3D Endpoint number: 1
    URB transfer type: URB_INTERRUPT (0x01)
    Packet Data Length: 70
    [Request in: 43377]
    [Time from request: 0.006005000 seconds]
    [bInterfaceClass: Vendor Specific (0xff)]
Leftover Capture Data: 0e4401021000ffffff03ccffefffffffec1ff20fe8fe3ff7...
USB URB
    [Source: 1.6.1]
    [Destination: host]
    USBPcap pseudoheader length: 27
    IRP ID: 0xffffa901ed380050
    IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
    URB Function: URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER (0x0009)
    IRP information: 0x01, Direction: PDO -> FDO
        0000 000. =3D Reserved: 0x00
        .... ...1 =3D Direction: PDO -> FDO (0x1)
    URB bus id: 1
    Device address: 6
    Endpoint: 0x81, Direction: IN
        1... .... =3D Direction: IN (1)
        .... 0001 =3D Endpoint number: 1
    URB transfer type: URB_INTERRUPT (0x01)
    Packet Data Length: 16
    [Request in: 43405]
    [Time from request: 0.002952000 seconds]
    [bInterfaceClass: Vendor Specific (0xff)]
Leftover Capture Data: 0e0e0104100001020000000000000000
----


- snip of the same two (more URB 70=3D16+16+16+16+6, 16=3D16+0) in actual=
 qemu:
----
USB URB
    [Source: 1.4.1]
    [Destination: host]
    USBPcap pseudoheader length: 27
    IRP ID: 0xffffc5062ede69f0
    IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
    URB Function: URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER (0x0009)
    IRP information: 0x01, Direction: PDO -> FDO
        0000 000. =3D Reserved: 0x00
        .... ...1 =3D Direction: PDO -> FDO (0x1)
    URB bus id: 1
    Device address: 4
    Endpoint: 0x81, Direction: IN
        1... .... =3D Direction: IN (1)
        .... 0001 =3D Endpoint number: 1
    URB transfer type: URB_INTERRUPT (0x01)
    Packet Data Length: 16
    [Request in: 72930]
    [Time from request: 0.004881000 seconds]
    [bInterfaceClass: Vendor Specific (0xff)]
Leftover Capture Data: 0e4401021000ffffff03ccffefffffff
USB URB
    [Source: 1.4.1]
    [Destination: host]
    USBPcap pseudoheader length: 27
    IRP ID: 0xffffc5062ede69f0
    IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
    URB Function: URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER (0x0009)
    IRP information: 0x01, Direction: PDO -> FDO
        0000 000. =3D Reserved: 0x00
        .... ...1 =3D Direction: PDO -> FDO (0x1)
    URB bus id: 1
    Device address: 4
    Endpoint: 0x81, Direction: IN
        1... .... =3D Direction: IN (1)
        .... 0001 =3D Endpoint number: 1
    URB transfer type: URB_INTERRUPT (0x01)
    Packet Data Length: 16
    [Request in: 72947]
    [Time from request: 0.004244000 seconds]
    [bInterfaceClass: Vendor Specific (0xff)]
Leftover Capture Data: ec1ff20fe8fe3ff78fff1c00040061f7
USB URB
    [Source: 1.4.1]
    [Destination: host]
    USBPcap pseudoheader length: 27
    IRP ID: 0xffffc5062ede69f0
    IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
    URB Function: URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER (0x0009)
    IRP information: 0x01, Direction: PDO -> FDO
        0000 000. =3D Reserved: 0x00
        .... ...1 =3D Direction: PDO -> FDO (0x1)
    URB bus id: 1
    Device address: 4
    Endpoint: 0x81, Direction: IN
        1... .... =3D Direction: IN (1)
        .... 0001 =3D Endpoint number: 1
    URB transfer type: URB_INTERRUPT (0x01)
    Packet Data Length: 16
    [Request in: 72957]
    [Time from request: 0.000073000 seconds]
    [bInterfaceClass: Vendor Specific (0xff)]
Leftover Capture Data: ffff7ff8ffffff3f0000000000000000
USB URB
    [Source: 1.4.1]
    [Destination: host]
    USBPcap pseudoheader length: 27
    IRP ID: 0xffffc5062ede69f0
    IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
    URB Function: URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER (0x0009)
    IRP information: 0x01, Direction: PDO -> FDO
        0000 000. =3D Reserved: 0x00
        .... ...1 =3D Direction: PDO -> FDO (0x1)
    URB bus id: 1
    Device address: 4
    Endpoint: 0x81, Direction: IN
        1... .... =3D Direction: IN (1)
        .... 0001 =3D Endpoint number: 1
    URB transfer type: URB_INTERRUPT (0x01)
    Packet Data Length: 16
    [Request in: 72959]
    [Time from request: 0.001875000 seconds]
    [bInterfaceClass: Vendor Specific (0xff)]
Leftover Capture Data: 00000000000000000000000000000000
USB URB
    [Source: 1.4.1]
    [Destination: host]
    USBPcap pseudoheader length: 27
    IRP ID: 0xffffc5062ede69f0
    IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
    URB Function: URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER (0x0009)
    IRP information: 0x01, Direction: PDO -> FDO
        0000 000. =3D Reserved: 0x00
        .... ...1 =3D Direction: PDO -> FDO (0x1)
    URB bus id: 1
    Device address: 4
    Endpoint: 0x81, Direction: IN
        1... .... =3D Direction: IN (1)
        .... 0001 =3D Endpoint number: 1
    URB transfer type: URB_INTERRUPT (0x01)
    Packet Data Length: 6
    [Request in: 72967]
    [Time from request: 0.000144000 seconds]
    [bInterfaceClass: Vendor Specific (0xff)]
Leftover Capture Data: 000000000000


USB URB
    [Source: 1.4.1]
    [Destination: host]
    USBPcap pseudoheader length: 27
    IRP ID: 0xffffc5062ede69f0
    IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
    URB Function: URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER (0x0009)
    IRP information: 0x01, Direction: PDO -> FDO
        0000 000. =3D Reserved: 0x00
        .... ...1 =3D Direction: PDO -> FDO (0x1)
    URB bus id: 1
    Device address: 4
    Endpoint: 0x81, Direction: IN
        1... .... =3D Direction: IN (1)
        .... 0001 =3D Endpoint number: 1
    URB transfer type: URB_INTERRUPT (0x01)
    Packet Data Length: 16
    [Request in: 73298]
    [Time from request: 0.005657000 seconds]
    [bInterfaceClass: Vendor Specific (0xff)]
Leftover Capture Data: 0e0e0104100001020700000000000000
USB URB
    [Source: 1.4.1]
    [Destination: host]
    USBPcap pseudoheader length: 27
    IRP ID: 0xffffc5062ede69f0
    IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
    URB Function: URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER (0x0009)
    IRP information: 0x01, Direction: PDO -> FDO
        0000 000. =3D Reserved: 0x00
        .... ...1 =3D Direction: PDO -> FDO (0x1)
    URB bus id: 1
    Device address: 4
    Endpoint: 0x81, Direction: IN
        1... .... =3D Direction: IN (1)
        .... 0001 =3D Endpoint number: 1
    URB transfer type: URB_INTERRUPT (0x01)
    Packet Data Length: 0
    [Request in: 73314]
    [Time from request: 0.001614000 seconds]
    [bInterfaceClass: Vendor Specific (0xff)]
----

I am not regular contributor. Maintainers should check and correct code o=
r propose different solution.
Code is tested with qemu-xen (qemu-xen-4.12.0).

Regards,=20

Martin=20

Martin Cerveny (1):
  usb-redir: merge interrupt packets

 hw/usb/redirect.c | 69 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 21 deletions(-)

--=20
2.20.1


