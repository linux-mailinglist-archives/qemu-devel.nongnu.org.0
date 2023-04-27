Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD516F030F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 11:10:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prxcp-00082P-6A; Thu, 27 Apr 2023 05:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1prxci-00081u-9Z
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:09:08 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1prxce-0000c1-KD
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:09:06 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1prxcF-0000ed-Gp; Thu, 27 Apr 2023 11:08:39 +0200
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: =?UTF-8?q?=5BPATCH=20v4=200/3=5D=20Hyper-V=20Dynamic=20Memory=20Protocol=20driver=20=28hv-balloon=20=F0=9F=8E=88=EF=B8=8F=29?=
Date: Thu, 27 Apr 2023 11:08:30 +0200
Message-Id: <cover.1682584770.git.maciej.szmigiero@oracle.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

This is a continuation of v3 patch series located here:
https://lore.kernel.org/qemu-devel/cover.1677274611.git.maciej.szmigiero@oracle.com/

Since v3 was just a rebase a more detailed description of this driver is
available in the cover letter of v2:
https://lore.kernel.org/qemu-devel/cover.1672878904.git.maciej.szmigiero@oracle.com/

Changes from v3:
* Convert the driver to directly take just a single memory backend,

* Remove virtual DIMMs support, make the driver directly implement
TYPE_MEMORY_DEVICE interface,

* Allow hot-adding just parts of that single memory backend instead of
always adding the whole backend,

* Integrate the hot-add functionality transparently into the ballooning
interface instead of having a dedicated QMP hot-add command,

* Additional comments and minor cleanups.


Updated example usage:
* Add "-device vmbus-bridge,id=vmbus-bridge \
  -object memory-backend-ram,id=mem1,size=256G \
  -device hv-balloon,id=hvb,memdev=mem1"
  to the QEMU command line and set "maxmem" value to something large,
  like 1T.

The examples below assume that the guest boot memory size was 4 GiB.

* Use QEMU HMP "balloon" command to resize guest up to 8 GiB:
  balloon 8192
  This will cause the driver to hot-add the first 4 GiB of the memory
  backend.

* Use the ballooning interface to ask the guest to give out as much
  memory as possible:
  balloon 1

* Use the ballooning interface to resize the guest up again to 10 GiB:
  balloon 10240
  This will cause the driver to first return all ballooned out pages
  to the guest and then hot-add next 2 GiB of the memory backend.

* Further ballooning interface monitor commands can be used to resize
  the guest up and down appropriately.

* The current guest size can be queried by issuing the "info balloon" command.
  This is useful to know what is happening, since large ballooning or
  unballooning operations take some time to complete.

 Kconfig.host                     |    3 +
 configure                        |   36 +
 hw/hyperv/Kconfig                |    5 +
 hw/hyperv/hv-balloon.c           | 2040 ++++++++++++++++++++++++++++++
 hw/hyperv/meson.build            |    1 +
 hw/hyperv/trace-events           |   16 +
 include/hw/hyperv/dynmem-proto.h |  423 +++++++
 include/qapi/error.h             |    2 +
 meson.build                      |    4 +-
 qapi/machine.json                |   25 +
 10 files changed, 2554 insertions(+), 1 deletion(-)
 create mode 100644 hw/hyperv/hv-balloon.c
 create mode 100644 include/hw/hyperv/dynmem-proto.h


