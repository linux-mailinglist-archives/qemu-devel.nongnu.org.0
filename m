Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2065D1F86C2
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 06:45:45 +0200 (CEST)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkKWd-0000cn-VL
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 00:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@moya.office.hostfission.com>)
 id 1jkKTd-0004jM-PU
 for qemu-devel@nongnu.org; Sun, 14 Jun 2020 00:42:37 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:57378)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <root@moya.office.hostfission.com>)
 id 1jkKTa-0005Au-OZ
 for qemu-devel@nongnu.org; Sun, 14 Jun 2020 00:42:37 -0400
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id 27335445EF;
 Sat, 13 Jun 2020 14:06:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1592021163;
 bh=6tPvqap7tT2aocp2OkZ9oQ/4cf6bTw2xy8Xzm+gjYkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f4DOmMYExs6g7qBsDLdi/6ucmbXUWi+K8v+TlYbMKcOMkDbPjQUEJdd6Lk6/o2JQu
 d7b6fXZLwLWJSWPFxGJqNE5y7gLv/V3JD4J64F4Z3QK1b528hBb3izbiIP49oZeeb/
 NjNoQJYoavxXJ5Z4QUCeeK0g+1RP95qH4n8nc8TA=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id 123763A0A09; Sat, 13 Jun 2020 14:06:03 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	geoff@hostfission.com
Subject: [PATCH 4/6] audio/jack: do not remove ports when finishing
Date: Sat, 13 Jun 2020 14:05:16 +1000
Message-Id: <20200613040518.38172-5-geoff@hostfission.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200613040518.38172-1-geoff@hostfission.com>
References: <20200613040518.38172-1-geoff@hostfission.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=139.99.139.48;
 envelope-from=root@moya.office.hostfission.com; helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 00:05:57
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes a hang when there is a communications issue with the JACK
server. Simply closing the connection is enough to completely clean up
and as such we do not need to remove the ports first. As JACK uses a
socket based protocol that relies on the `select` call, if there is a
communication breakdown with the server the client library waits
forever for a response to the unregister request.

Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
---
 audio/jackaudio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 58c7344497..249cbd3265 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -548,9 +548,6 @@ static void qjack_client_fini(QJackClient *c)
 {
     switch (c->state) {
     case QJACK_STATE_RUNNING:
-        for (int i = 0; i < c->nchannels; ++i) {
-            jack_port_unregister(c->client, c->port[i]);
-        }
         jack_deactivate(c->client);
         /* fallthrough */
 
-- 
2.20.1


