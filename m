Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F263C684
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 18:38:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p04YF-0004Df-0g; Tue, 29 Nov 2022 12:37:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1p04YD-0004DF-Cl
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 12:37:45 -0500
Received: from relay.virtuozzo.com ([130.117.225.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1p04YA-0007aj-Lc
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 12:37:44 -0500
Received: from [192.168.16.240] (helo=roughy.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <andrey.drobyshev@virtuozzo.com>) id 1p04Xs-001KbY-Mg;
 Tue, 29 Nov 2022 18:37:24 +0100
To: qemu-devel@nongnu.org
Cc: andrey.drobyshev@virtuozzo.com, den@virtuozzo.com, yur@openvz.org,
 marcandre.lureau@gmail.com, mike.maslenkin@gmail.com
Subject: [PATCH v2 0/2] qga: improve "syslog" domain logging
Date: Tue, 29 Nov 2022 19:38:07 +0200
Message-Id: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111;
 envelope-from=andrey.drobyshev@virtuozzo.com; helo=relay.virtuozzo.com
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
Reply-to:  Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
From:  Andrey Drobyshev via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These patches extend QGA logging interface, primarily under Windows
guests.  They enable QGA to write to Windows event log, much like
syslog() on *nix.  In addition we get rid of hardcoded log level used by
ga_log().

v2:
* Close event_log handle when doing cleanup_agent()
* Fix switch cases indentation as reported by scripts/checkpatch.pl

Andrey Drobyshev (2):
  qga-win: add logging to Windows event log
  qga: map GLib log levels to system levels

 configure                 |  3 +++
 qga/installer/qemu-ga.wxs |  5 ++++
 qga/main.c                | 50 +++++++++++++++++++++++++++++++++++----
 qga/meson.build           | 19 ++++++++++++++-
 qga/messages-win32.mc     |  9 +++++++
 5 files changed, 81 insertions(+), 5 deletions(-)
 create mode 100644 qga/messages-win32.mc

-- 
2.38.1


