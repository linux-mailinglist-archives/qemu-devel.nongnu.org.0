Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590E967562C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:57:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrs4-0007lc-9k; Fri, 20 Jan 2023 08:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pIrs1-0007lD-K1
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:55:53 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pIrrz-0001ms-7B
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:55:53 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 3D8525FD76;
 Fri, 20 Jan 2023 16:48:02 +0300 (MSK)
Received: from d-tatianin-nix.yandex.net (unknown
 [2a02:6b8:0:419:8f3f:2197:162b:4096])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 wlngUQ0WWiE1-VdlrBPBd; Fri, 20 Jan 2023 16:48:01 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674222481; bh=DsVY0G6eNNQGaLhlpDdgPPpaW0awJaEzY0R7Z3TaZKI=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=KfHxhWziFvFNaLpTDoacFPE5wBEJm6yColak4rXqn3X9PM0UJABApgQsr33NLXezi
 g4Qz1iVg7iqbOjoEyEyxlHpqTkTx75CKctW04XjzRvhl6NzJqQaDouoIp/E0Ba1IFU
 5KZEV2+df/MnEDKX27Jw27qw03St1KkB7b7GmD6E=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniil Tatianin <d-tatianin@yandex-team.ru>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, yc-core@yandex-team.ru
Subject: [PATCH v0 0/4] backends/hostmem: add an ability to specify prealloc
 timeout
Date: Fri, 20 Jan 2023 16:47:45 +0300
Message-Id: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series introduces new qemu_prealloc_mem_with_timeout() api,
which allows limiting the maximum amount of time to be spent on memory
preallocation. It also adds prealloc statistics collection that is
exposed via an optional timeout handler.

This new api is then utilized by hostmem for guest RAM preallocation
controlled via new object properties called 'prealloc-timeout' and
'prealloc-timeout-fatal'.

This is useful for limiting VM startup time on systems with
unpredictable page allocation delays due to memory fragmentation or the
backing storage. The timeout can be configured to either simply emit a
warning and continue VM startup without having preallocated the entire
guest RAM or just abort startup entirely if that is not acceptable for
a specific use case.

Daniil Tatianin (4):
  oslib: introduce new qemu_prealloc_mem_with_timeout() api
  backends/hostmem: move memory region preallocation logic into a helper
  backends/hostmem: add an ability to specify prealloc timeout
  backends/hostmem: add an ability to make prealloc timeout fatal

 backends/hostmem.c       | 112 +++++++++++++++++++++++++++++++-------
 include/qemu/osdep.h     |  19 +++++++
 include/sysemu/hostmem.h |   3 ++
 qapi/qom.json            |   8 +++
 util/oslib-posix.c       | 114 +++++++++++++++++++++++++++++++++++----
 util/oslib-win32.c       |   9 ++++
 6 files changed, 238 insertions(+), 27 deletions(-)

-- 
2.25.1


