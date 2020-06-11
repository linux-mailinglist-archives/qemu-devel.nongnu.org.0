Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19D91F6CB0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 19:17:28 +0200 (CEST)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjQpT-0005Gi-Vu
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 13:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1jjQoJ-00043H-PE; Thu, 11 Jun 2020 13:16:15 -0400
Received: from relay.sw.ru ([185.231.240.75]:36376 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1jjQoF-0001fz-Po; Thu, 11 Jun 2020 13:16:15 -0400
Received: from [192.168.15.81] (helo=iris.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <den@openvz.org>)
 id 1jjQo9-0000E7-HU; Thu, 11 Jun 2020 20:16:05 +0300
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] block: propagate discard alignment from format drivers to
 the guest
Date: Thu, 11 Jun 2020 20:16:06 +0300
Message-Id: <20200611171608.22052-1-den@openvz.org>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=185.231.240.75; envelope-from=den@openvz.org;
 helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 13:11:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Denis V . Lunev" <den@openvz.org>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nowaday SCSI drivers in guests are able to align UNMAP requests before
sending to the device. Right now QEMU provides an ability to set
this via "discard_granularity" property of the block device which could
be used by management layer.

Though, in particular, from the point of QEMU, there is
pdiscard_granularity on the format driver level, f.e. on QCOW2 or iSCSI.
It would be beneficial to pass this value as a default for this
property.

Technically this should reduce the amount of use less UNMAP requests
from the guest to the host. Basic test confirms this. Fedora 31 guest
during 'fstrim /' on 32 Gb disk has issued 401/415 requests with/without
proper alignment to QEMU.

Changes from v2:
- 172 iotest fixed

Changes from v1:
- fixed typos in description
- added machine type compatibility layer as suggested by Kevin

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
CC: John Snow <jsnow@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Fam Zheng <fam@euphon.net>



