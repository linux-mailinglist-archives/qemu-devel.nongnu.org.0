Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93AA1F7159
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 02:26:32 +0200 (CEST)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjXWh-0004r1-T4
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 20:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@hostfission.com>)
 id 1jjXSw-00073C-W5
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 20:22:39 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:33228)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1jjXSv-0001Jh-Ei
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 20:22:38 -0400
Received: from moya.office.hostfission.com (office.hostfission.com
 [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTP id 01AE7444EF;
 Fri, 12 Jun 2020 10:16:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1591920973;
 bh=pg+SEjYVoc0ewqGzX4xmTtmRex2TRmRRC0Bo/Lc2z+s=;
 h=From:Date:Subject:To:Cc:From;
 b=iqB1QgIEqDkneKtV5X0pDtArCrMA6C4MKyWq/Z6FMdcJT1SdGW2lW3zR8T1rrmErw
 Co8VRrFOxyASJsO/7g2owK2CiUpdhXUxZjgJ9/h4u/fSZrLDsI8ycVKiDdYFRgPxJL
 LOyImtQezU7HQIETFy0GqER/8BIFEw6HOFzFKmEM=
Received: by moya.office.hostfission.com (Postfix, from userid 0)
 id DF41D3A0697; Fri, 12 Jun 2020 10:16:12 +1000 (AEST)
From: Geoffrey McRae <geoff@hostfission.com>
Date: Fri, 12 Jun 2020 01:16:41 +1000
Subject: [PATCH 4/6] audio/jack: do not remove ports when finishing
To: <qemu-devel@nongnu.org>
Cc: <kraxel@redhat.com>
X-Mailer: mail (GNU Mailutils 3.5)
Message-Id: <20200612001612.DF41D3A0697@moya.office.hostfission.com>
Received-SPF: pass client-ip=139.99.139.48; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 20:16:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes a hang when there is a communications issue with the JACK
server. Simply closing the connection is enough to completely clean up
and as such we do not need to remove the ports first.

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


