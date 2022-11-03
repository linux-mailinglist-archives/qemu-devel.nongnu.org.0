Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF9E617AF4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 11:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqXcb-0003mR-9p; Thu, 03 Nov 2022 06:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oqXcZ-0003m5-Ja
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:38:51 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oqXcW-0005OG-Mq
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:38:51 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 957BF5FFA9;
 Thu,  3 Nov 2022 13:28:03 +0300 (MSK)
Received: from davydov-max-nux.yandex-team.ru (unknown
 [2a02:6b8:b081:b685::1:2c])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 3zS6WKEiGd-RxNGPi2m; Thu, 03 Nov 2022 13:28:02 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667471282; bh=EmJSiq7boI63GU0fc/SBgS5FAXtvmDZYhW3iT7gmdVU=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=08UO1i/TXeLi0IHyO4EleWviGi5uXAGwRpxhazbe9zMfVUq8Shu7/zVwk8/ogPE1I
 1OU6az6Br5MEKD1Y1xy24PyO4isBv8/WfIRz9hv+PXHgiii1Gvm4JpqNjK5irhw5It
 j7cd66GtfhIKgXbzxYzhi9SCCNlsYyFRu97N1opA=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Maksim Davydov <davydov-max@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: davydov-max@yandex-team.ru, vsementsov@yandex-team.ru, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, eblake@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, berrange@redhat.com, alxndr@bu.edu,
 bsd@redhat.com, stefanha@redhat.com, thuth@redhat.com,
 darren.kenny@oracle.com, Qiuhao.Li@outlook.com, lvivier@redhat.com
Subject: [PATCH v3 0/4] compare machine type compat_props
Date: Thu,  3 Nov 2022 13:27:36 +0300
Message-Id: <20221103102741.11201-1-davydov-max@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This script is necessary to choose the best machine type in the
appropriate cases. Also we have to check compat_props of the old MT
after changes to be sure that they haven't broken old the MT. For
example, pc_compat_3_1 of pc-q35-3.1 has Icelake-Client which was
removed in March.

v3 -> v2:
* simplify adding new methods for getting QEMU default values
* add typing
* change concept from fixed dictionaries to classes

v2 -> v1:
* fix script code style and descriptions
* reorder patches
 
v1 -> previous iteration:
* new default value print concept
* QEMU python library is used to collect qmp data
* remove auxiliary patches (that was used to fix `->get` sematics)
* print compat_props in the correct order
* delete `absract` field to reduce output JSON size

Maksim Davydov (4):
  qom: add default value
  python/qmp: increase read buffer size
  qmp: add dump machine type compatible properties
  scripts: add script to compare compatible properties

 hw/core/machine-qmp-cmds.c    |  22 +-
 python/qemu/qmp/qmp_client.py |   4 +-
 qapi/machine.json             |  54 ++++-
 qom/qom-qmp-cmds.c            |   2 +
 scripts/compare_mt.py         | 440 ++++++++++++++++++++++++++++++++++
 tests/qtest/fuzz/qos_fuzz.c   |   2 +-
 6 files changed, 518 insertions(+), 6 deletions(-)
 create mode 100755 scripts/compare_mt.py

-- 
2.25.1


