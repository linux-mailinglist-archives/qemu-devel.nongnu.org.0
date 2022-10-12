Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6BE5FC489
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 13:54:25 +0200 (CEST)
Received: from localhost ([::1]:34196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiaJb-0002JU-HY
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 07:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <postmaster@mail115932.mx2f6e.netcup.net>)
 id 1oiaF2-0006VE-P1
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:49:40 -0400
Received: from relay.yourmailgateway.de ([46.38.247.119]:36261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <postmaster@mail115932.mx2f6e.netcup.net>)
 id 1oiaF0-0002E5-MK
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:49:40 -0400
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4MnWCh73ffz7x7k;
 Wed, 12 Oct 2022 13:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1665575377; bh=oiD+jRNE6rmaWyIP1sbCCWrL82LqbfnpSEzHVqCZs2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PMZ+3DBSpwuKwSYU7Rz5TopaqSY+NiwejQygv4La8wINavw0e/gdTQ0qdExHy5zxt
 louiwLEBvBHyXl+qGIPr61QApXSxn3gordwyo0ZmnjJhPmO5MpuWuqrmtCjTL5vp2a
 wcihM/yoDGwARxuplbNgKONjPwzetSCUEF+pOeXlV/jOBId0RiTnob3o4kCNUtalml
 nzjTiYVW8pj+6/N87Loh/VzbpIy9hS+Uk2QFpHM3aQgYgNc+YXvuNY52M8ianE2laI
 59tGfXcMr3GMsx9P6QNxkW8QIXo+h09jvvUcMzk9iQA6jvqlET3sTKiyGngdiA+TQ2
 YkKJRWgoWd48Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4MnWCh6fl6z4y9H;
 Wed, 12 Oct 2022 13:49:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.651
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4MnWCh3JdYz8sZP;
 Wed, 12 Oct 2022 13:49:36 +0200 (CEST)
Received: from localhost.localdomain
 (ip-095-223-070-198.um35.pools.vodafone-ip.de [95.223.70.198])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 54123603C7;
 Wed, 12 Oct 2022 13:49:35 +0200 (CEST)
Authentication-Results: mx2f6e; spf=pass (sender IP is 95.223.70.198)
 smtp.mailfrom=postmaster@mail115932.mx2f6e.netcup.net
 smtp.helo=localhost.localdomain
Received-SPF: pass (mx2f6e: connection is authenticated)
From: Helge Konetzka <hk@zapateado.de>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Helge Konetzka <hk@zapateado.de>
Subject: [PATCH v2 1/2] audio: fix in.voices test
Date: Wed, 12 Oct 2022 13:49:24 +0200
Message-Id: <20221012114925.5084-2-hk@zapateado.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221012114925.5084-1-hk@zapateado.de>
References: <20221012114925.5084-1-hk@zapateado.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <166557537582.2306.8825508761913257405@mx2f6e.netcup.net>
X-PPP-Vhost: mail115932.mx2f6e.netcup.net
X-Rspamd-Queue-Id: 54123603C7
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: wiWe76bg5S7pE7BBxFRGBq8hf/ZOI5BcK9vT4JwuKqnhbLWZzr4WYu1eGBinXKn4h1ouodAhfQ==
Received-SPF: none client-ip=46.38.247.119;
 envelope-from=postmaster@mail115932.mx2f6e.netcup.net;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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


Calling qemu with valid -audiodev ...,in.voices=0 results in an obsolete
warning:
  audio: Bogus number of capture voices 0, setting to 0
This patch fixes the in.voices test.

Signed-off-by: Helge Konetzka <hk@zapateado.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 audio/audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index cfa4119c05..8a0ade4052 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1756,7 +1756,7 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
         s->nb_hw_voices_out = 1;
     }
 
-    if (s->nb_hw_voices_in <= 0) {
+    if (s->nb_hw_voices_in < 0) {
         dolog ("Bogus number of capture voices %d, setting to 0\n",
                s->nb_hw_voices_in);
         s->nb_hw_voices_in = 0;
-- 
2.38.0


