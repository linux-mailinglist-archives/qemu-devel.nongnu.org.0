Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48219BF09
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 12:04:25 +0200 (CEST)
Received: from localhost ([::1]:36348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJwi0-0002JA-6z
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 06:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lvivier@redhat.com>) id 1jJwgu-0001G4-44
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 06:03:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1jJwgs-0000He-FH
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 06:03:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52857
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1jJwgs-0000HO-AE
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 06:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585821792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=906pWHE6Lxu9rnLPhXDKLbnEmPzzwjBIf6OKQiLT/HM=;
 b=gvdE0vlTWbJ7ye4lhEKpHnCqvwywu9uJaBBROslzF9VnM9BX73hSASsgshQMcpbcTbE2AQ
 aRfNc601NzaYKCGwSCZ4ZLQS7Tk34SdcLB3X7dnPPJytm9WceAYcFFVJGIAvo1vqOL76rK
 ScvsX5aU00DiEnbyu0aS1lTUX3iuanw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-5Ce-Gy3iP7WOogXb0DVqwg-1; Thu, 02 Apr 2020 06:03:09 -0400
X-MC-Unique: 5Ce-Gy3iP7WOogXb0DVqwg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A33DF18A5511;
 Thu,  2 Apr 2020 10:03:08 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-198.ams2.redhat.com
 [10.36.113.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E609B5D9CD;
 Thu,  2 Apr 2020 10:03:03 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/5] hmp,qmp: Add some commands to introspect virtio devices
Date: Thu,  2 Apr 2020 12:02:57 +0200
Message-Id: <20200402100302.833267-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces new QMP/HMP commands to dump the status
of a a virtio device at different levels.

1. Main command

 HMP Only:

     virtio [subcommand]

   Example:

    List all sub-commands:

    (qemu) virtio
    virtio query  -- List all available virtio devices
    virtio status path -- Display status of a given virtio device
    virtio queue-status path queue -- Display status of a given virtio queu=
e
    virtio queue-element path queue [index] -- Display element of a given v=
irtio queue

2. List available virtio devices in the machine

  HMP Form:

    virtio query

  Example:

    (qemu) virtio query
    /machine/peripheral-anon/device[3]/virtio-backend [virtio-net]
    /machine/peripheral-anon/device[1]/virtio-backend [virtio-serial]
    /machine/peripheral-anon/device[0]/virtio-backend [virtio-blk]

  QMP Form:

    { 'command': 'query-virtio', 'returns': ['VirtioInfo'] }

  Example:

  -> { "execute": "query-virtio" }
  <- { "return": [
         {
             "path": "/machine/peripheral-anon/device[3]/virtio-backend",
             "type": "virtio-net"
         },
         {
             "path": "/machine/peripheral-anon/device[1]/virtio-backend",
             "type": "virtio-serial"
         },
         {
             "path": "/machine/peripheral-anon/device[0]/virtio-backend",
             "type": "virtio-blk"
         }
       ]
     }

3. Display status of a given virtio device

  HMP Form:

    virtio status <path>

  Example:

    (qemu) virtio status /machine/peripheral-anon/device[3]/virtio-backend
    /machine/peripheral-anon/device[3]/virtio-backend:
      Device Id:        1
      Guest features:   0x0000000130afffa7
      Host features:    0x0000000179bfffe7
      Backend features: 0x0000000000000000
      Endianness:       little
      VirtQueues:       3

  QMP Form:

    { 'command': 'virtio-status',
      'data': { 'path': 'str' },
      'returns': 'VirtioStatus'
    }

  Example:

  -> { "execute": "virtio-status",
       "arguments": {
           "path": "/machine/peripheral-anon/device[3]/virtio-backend"
       }
    }
  <- { "return": {
           "backend_features": 0,
           "guest_features": 5111807911,
           "num_vqs": 3,
           "host_features": 6337593319,
           "device_endian": "little",
           "device_id": 1
       }
     }

4. Display status of a given virtio queue

  HMP Form:

    virtio queue-status <path> <queue>

  Example:

    (qemu) virtio queue-status /machine/peripheral-anon/device[3]/virtio-ba=
ckend 0
    /machine/peripheral-anon/device[3]/virtio-backend:
      index:                0
      inuse:                0
      last_avail_idx:       61
      shadow_avail_idx:     292
      signalled_used:       61
      signalled_used_valid: 1
      VRing:
        num:         256
        num_default: 256
        align:       4096
        desc:        0x000000006c352000
        avail:       0x000000006c353000
        used:        0x000000006c353240

  QMP Form:

    { 'command': 'virtio-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtQueueStatus'
    }

  Example:

  -> { "execute": "virtio-queue-status",
       "arguments": {
           "path": "/machine/peripheral-anon/device[3]/virtio-backend",
           "queue": 0
       }
    }
  <- { "return": {
       "signalled_used": 373,
       "inuse": 0,
       "vring_desc": 864411648,
       "vring_num_default": 256,
       "signalled_used_valid": 1,
       "vring_avail": 864415744,
       "last_avail_idx": 373,
       "queue_index": 0,
       "vring_used": 864416320,
       "shadow_avail_idx": 619,
       "used_idx": 373,
       "vring_num": 256,
       "vring_align": 4096
       }
     }

5. Display element of a given virtio queue

  HMP Form:

    virtio queue-element <path> <queue> [index]

  Example:

    Dump the information of the head element of the first queue of
    the first virtio device::

      (qemu) virtio queue-element/machine/peripheral-anon/device[3]/virtio-=
backend 0
      index:  67
      ndescs: 1
      descs:  addr 0x6fe69800 len 1536 (write-only)

      (qemu) xp/128bx 0x6fe69800
      000000006fe69800: 0x02 0x00 0x00 0x00 0x00 0x00 0x00 0x00
      000000006fe69808: 0x00 0x00 0x01 0x00 0x52 0x54 0x00 0x12
      000000006fe69810: 0x34 0x56 0x52 0x54 0x00 0x09 0x51 0xde
      000000006fe69818: 0x08 0x00 0x45 0x00 0x00 0x4c 0x8f 0x32

    device[3] is a virtio-net device and we can see in the element buffer t=
he
    MAC address of the card::

      [root@localhost ~]# ip link show ens4
      2: ens4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel st=
ate UP m0
          link/ether 52:54:00:12:34:56 brd ff:ff:ff:ff:ff:ff

    and the MAC address of the gateway::

      [root@localhost ~]# arp -a
      _gateway (192.168.122.1) at 52:54:00:09:51:de [ether] on ens4

  QMP Form:

    { 'command': 'virtio-queue-element',
      'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
      'returns': 'VirtioQueueElement'
    }

  Example:

  -> { "execute": "virtio-queue-element",
       "arguments": {
           "path": "/machine/peripheral-anon/device[3]/virtio-backend",
           "queue": 0
       }
    }
  -> { "return": {
          "index": 109,
          "len": 0,
          "ndescs": 1,
          "descs": [
              { "flags": 2, "len": 2048, "addr": 853145600 }
          ]
       }
    }

Laurent Vivier (5):
  qmp: add QMP command query-virtio
  qmp: add QMP command virtio-status
  qmp: add QMP command virtio-queue-status
  qmp: add QMP command virtio-queue-element
  hmp: add virtio commands

 Makefile                   |   2 +-
 Makefile.target            |   7 +-
 docs/system/monitor.rst    |   2 +
 hmp-commands-virtio.hx     | 148 ++++++++++++++++++
 hmp-commands.hx            |  10 ++
 hw/virtio/Makefile.objs    |   2 +
 hw/virtio/virtio-stub.c    |  32 ++++
 hw/virtio/virtio.c         | 313 +++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio.h |   1 +
 include/monitor/hmp.h      |   4 +
 monitor/misc.c             |  17 ++
 qapi/Makefile.objs         |   2 +-
 qapi/qapi-schema.json      |   1 +
 qapi/virtio.json           | 302 +++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |   1 +
 15 files changed, 840 insertions(+), 4 deletions(-)
 create mode 100644 hmp-commands-virtio.hx
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

--=20
2.25.1


