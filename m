Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12365B86F6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 13:05:06 +0200 (CEST)
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYQCW-00027V-Pb
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 07:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oYQ3v-0004OX-PU
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 06:56:11 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:38722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oYQ3q-0005VF-Na
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 06:56:10 -0400
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 134BB2E125C;
 Wed, 14 Sep 2022 13:55:57 +0300 (MSK)
Received: from davydov-max-nux.yandex.net (unknown
 [2a02:6b8:0:107:fa75:a4ff:fe7d:8480])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 BUZ4sh4mWm-tuOqPXCE; Wed, 14 Sep 2022 13:55:56 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663152956; bh=spuVsr75/aSXJapHv/0+FlAYTaBjuTw1Wj7p7m6NHpg=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=kXjdySuatL1+nk6+P/up5HXLLyo2oqrO/MvZJ2fUrGo7pZVKNijSQzBFp5LQX4kgh
 5s2xlemtdogHmbgPOdVE/Fth7zwNGcG+6mWHfkjapA6u4SW450rXvBlRaOdR3BVMDf
 la4rSaSSJFmnbpHbszLJADck4AN0yMKH/ol+EfPI=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Maksim Davydov <davydov-max@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: davydov-max@yandex-team.ru, yc-core@yandex-team.ru, pbonzini@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, armbru@redhat.com, alxndr@bu.edu,
 bsd@redhat.com, stefanha@redhat.com, thuth@redhat.com,
 darren.kenny@oracle.com, Qiuhao.Li@outlook.com, lvivier@redhat.com,
 jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Subject: [PATCH v2 0/4] compare machine type compat_props
Date: Wed, 14 Sep 2022 13:55:35 +0300
Message-Id: <20220914105539.18461-1-davydov-max@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

v2 -> v1:
* fix script code style and descriptions
* reorder patches

v1 -> previous iteration:
* new default value print concept
* QEMU python library is used to collect qmp data
* remove auxiliary patches (that was used to fix ->get sematics)
* print compat_props in the correct order
* delete `absract` field to reduce output JSON size

Maksim Davydov (4):
  qom: add devault value
  python/qmp: increase read buffer size
  qmp: add dump machine type compatible properties
  scripts: add script to compare compatible properties

 hw/core/machine-qmp-cmds.c    |  22 +-
 python/qemu/qmp/qmp_client.py |   4 +-
 qapi/machine.json             |  54 ++++-
 qom/qom-qmp-cmds.c            |   2 +
 scripts/compare_mt.py         | 374 ++++++++++++++++++++++++++++++++++
 tests/qtest/fuzz/qos_fuzz.c   |   2 +-
 6 files changed, 452 insertions(+), 6 deletions(-)
 create mode 100755 scripts/compare_mt.py

-- 
2.25.1


