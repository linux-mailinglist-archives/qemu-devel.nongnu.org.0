Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7528E5FC488
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 13:54:24 +0200 (CEST)
Received: from localhost ([::1]:34182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiaJb-0002Hm-0W
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 07:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <postmaster@mail115932.mx2f6e.netcup.net>)
 id 1oiaF3-0006VZ-Kn
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:49:41 -0400
Received: from relay.yourmailgateway.de ([185.244.194.184]:58567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <postmaster@mail115932.mx2f6e.netcup.net>)
 id 1oiaF1-0002EK-S0
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:49:41 -0400
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
 by relay01-mors.netcup.net (Postfix) with ESMTPS id 4MnWCj722Sz8tqQ;
 Wed, 12 Oct 2022 13:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1665575378; bh=2F5C88K9Oo2bnlR6eWtws2v7fDCghY1PJ0LlmM70Bx0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=STEFa/r+MIxvqthF8zxwjgOtAwWpJJXIoPNhXXVYcJ8MJwoNOlBosfy5DuJWW6MwH
 +2fe5ccsjwS6BtgUULaUBLNhylC8VWPSCnIuF8lBuiGqwLbk15Qapwzy+/Bn0XX69U
 hjfXUfIJbhEbFN3Uu4IkMsOy+cuN0nkytifcv/sjZzpb0MszjOjGi92eoGAounZ58e
 P5mpzqsCSTSnbWK3aCJSMUjoJv3nu9kHlISXV/G1oVurH2AQwxgpZimyvknWAFgWhV
 D5kCK8b2xdwCwgCoIXs7wu0OggEG2ckRgM67y0uoNeEGpkqTnRpDhSyuXMl0wxr7/8
 HH544Ex/1gGKw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by relay01-mors.netcup.net (Postfix) with ESMTPS id 4MnWCj6cs5z7xj7;
 Wed, 12 Oct 2022 13:49:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.651
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4MnWCj3vflz8sZP;
 Wed, 12 Oct 2022 13:49:37 +0200 (CEST)
Received: from localhost.localdomain
 (ip-095-223-070-198.um35.pools.vodafone-ip.de [95.223.70.198])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 78E5760510;
 Wed, 12 Oct 2022 13:49:36 +0200 (CEST)
Authentication-Results: mx2f6e; spf=pass (sender IP is 95.223.70.198)
 smtp.mailfrom=postmaster@mail115932.mx2f6e.netcup.net
 smtp.helo=localhost.localdomain
Received-SPF: pass (mx2f6e: connection is authenticated)
From: Helge Konetzka <hk@zapateado.de>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Helge Konetzka <hk@zapateado.de>
Subject: [PATCH v2 2/2] audio: improve out.voices test
Date: Wed, 12 Oct 2022 13:49:25 +0200
Message-Id: <20221012114925.5084-3-hk@zapateado.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221012114925.5084-1-hk@zapateado.de>
References: <20221012114925.5084-1-hk@zapateado.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <166557537693.2314.1055046618725335843@mx2f6e.netcup.net>
X-PPP-Vhost: mail115932.mx2f6e.netcup.net
X-Rspamd-Queue-Id: 78E5760510
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: dEtphXzKzFZ8yT8mm5f4dGyr+N9J9MjyixRIa+aBbBH7jdHYgg2ZOcMlrKZTS4QjipUCTv/rtQ==
Received-SPF: none client-ip=185.244.194.184;
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

Improve readability of audio out.voices test:
If 1 is logged and set after positive test, 1 should be tested.

Signed-off-by: Helge Konetzka <hk@zapateado.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 audio/audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index 8a0ade4052..912b456058 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1750,7 +1750,7 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
     s->nb_hw_voices_out = audio_get_pdo_out(dev)->voices;
     s->nb_hw_voices_in = audio_get_pdo_in(dev)->voices;
 
-    if (s->nb_hw_voices_out <= 0) {
+    if (s->nb_hw_voices_out < 1) {
         dolog ("Bogus number of playback voices %d, setting to 1\n",
                s->nb_hw_voices_out);
         s->nb_hw_voices_out = 1;
-- 
2.38.0


