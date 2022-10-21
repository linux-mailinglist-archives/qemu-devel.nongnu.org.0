Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5468606C99
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 02:46:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olgBP-0001Ai-UW
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 20:46:43 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olg55-0004eD-Cj
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 20:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1olg4y-0004Vh-SR
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 20:40:04 -0400
Received: from usmailhost21.kioxia.com ([12.0.68.226]
 helo=SJSMAIL01.us.kioxia.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1olg4w-0005qh-7M
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 20:40:04 -0400
Received: from localhost.localdomain (10.93.83.20) by SJSMAIL01.us.kioxia.com
 (10.90.133.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 20 Oct
 2022 17:18:52 -0700
From: <clay.mayers@kioxia.com>
To: <qemu-devel@nongnu.org>
CC: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Fam
 Zheng <fam@euphon.net>, =?UTF-8?q?Phlippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: [PATCH 0/4] hw/block/nvme: Implement ZNS finish-zone ZDC AEN
Date: Thu, 20 Oct 2022 17:18:31 -0700
Message-ID: <20221021001835.942642-1-clay.mayers@kioxia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.93.83.20]
X-ClientProxiedBy: SJSMAIL01.us.kioxia.com (10.90.133.90) To
 SJSMAIL01.us.kioxia.com (10.90.133.90)
Received-SPF: pass client-ip=12.0.68.226; envelope-from=Clay.Mayers@kioxia.com;
 helo=SJSMAIL01.us.kioxia.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Clay Mayers <clay.mayers@kioxia.com>

ZNS controllers have the option to limit the time a zone can remain in
the active state.  It begins with a background process in the controller
setting the finish-zone-recommended FZR attribute for a zone.  As part of
setting this attribute, the zone's id is added to the namespace's
zone-descriptor-changed (ZDC) log page. If enabled, items added to the
ZDC log page generate a ZDC "asynchronous event notification" AEN. Optionally,
the control can induce a "zone excursion" forcing the zone into the finished
state that also generates a ZDC event.

Zone enabled applications need to properly handle ZDC events. In a real device,
the timeout is many hours making testing an application difficult.
Implemented is the generation of FZR ZDC events to speed up O/S and application
testing.

Added to the zoned NVMe command set is an optional, per-namespace timer
(zoned.finish_time) to set the FZR attr for long-lived active zones; A per
namespace ZDC log page; AEN results to including CQE.DW1 (the NSID of the ZDC
AEN) and generating a ZDC AEN if it's been enabled. Zone excursions are not
modeled.

See section 5.5 of the NVMe Zoned Namespace Command Set Specification v1.1
for more details.

Clay Mayers (4):
  hw/block/nvme: add ZONE_FINISH_RECOMMENDED functionality
  hw/block/nvme: add zone descriptor changed log page
  hw/block/nvme: supply dw1 for aen result
  hw/block/nvme: add zone descriptor changed AEN

 docs/system/devices/nvme.rst |   5 ++
 hw/nvme/ctrl.c               | 166 +++++++++++++++++++++++++++++++++--
 hw/nvme/ns.c                 |  15 ++++
 hw/nvme/nvme.h               |  37 +++++++-
 hw/nvme/trace-events         |   3 +-
 include/block/nvme.h         |  14 ++-
 6 files changed, 225 insertions(+), 15 deletions(-)

-- 
2.27.0


