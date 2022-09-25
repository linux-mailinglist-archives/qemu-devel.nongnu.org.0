Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6164E5E91C3
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:06:15 +0200 (CEST)
Received: from localhost ([::1]:60038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNaY-0004e4-Hr
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1ocNRf-0006B1-Hd
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 04:57:03 -0400
Received: from relay.yourmailgateway.de ([188.68.61.105]:45964
 helo=mors-relay-8405.netcup.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1ocNRe-0001KQ-1T
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 04:57:03 -0400
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4Mb0BM4jGnz6wZr;
 Sun, 25 Sep 2022 10:56:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4Mb0BM1jNmz8sWV;
 Sun, 25 Sep 2022 10:56:59 +0200 (CEST)
Received: from [192.168.54.9] (ip-095-223-070-238.um35.pools.vodafone-ip.de
 [95.223.70.238])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id A79C560610;
 Sun, 25 Sep 2022 10:56:58 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.70.238) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Message-ID: <9b7c4c56-2992-b74d-bae4-c8af412ea2af@zapateado.de>
Date: Sun, 25 Sep 2022 10:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
From: Helge Konetzka <hk@zapateado.de>
Subject: [PATCH 2/2] audio: improve out.voices test
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <166409621898.21287.3661777311805775302@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-Rspamd-Server: rspamd-worker-8404
X-Spamd-Result: default: False [-5.60 / 15.00]; BAYES_HAM(-5.50)[99.99%];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:3209, ipnet:95.223.0.0/16, country:DE];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 MID_RHS_MATCH_FROM(0.00)[]; NEURAL_HAM(-0.00)[-0.978];
 TO_DN_ALL(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]
X-Rspamd-Queue-Id: A79C560610
X-NC-CID: QsoX3fEDog4qNZSElUhLqWcTHDCrt6n+SdW5BIrwl2TX
X-MORS-DOMAIN: zapateado.de
X-MORS-HOSTING: hosting115932
X-MORS-USER: hk
X-MORS-HopCount: 2
X-MORS-RelayClass: r2
X-MORS-RelayGroup: default
X-MORS-DKIM: hk@zapateado.de
X-MORS-Verdict: from=hk@zapateado.de dkim=0 spf=0
Received-SPF: pass client-ip=188.68.61.105; envelope-from=hk@zapateado.de;
 helo=mors-relay-8405.netcup.net
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


Improve readability of audio out.voices test:
If 1 is logged and set after positive test, 1 should be tested.

Signed-off-by: Helge Konetzka <hk@zapateado.de>
---
  audio/audio.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index 8a0ade4052..912b456058 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1750,7 +1750,7 @@ static AudioState *audio_init(Audiodev *dev, const 
char *name)
      s->nb_hw_voices_out = audio_get_pdo_out(dev)->voices;
      s->nb_hw_voices_in = audio_get_pdo_in(dev)->voices;

-    if (s->nb_hw_voices_out <= 0) {
+    if (s->nb_hw_voices_out < 1) {
          dolog ("Bogus number of playback voices %d, setting to 1\n",
                 s->nb_hw_voices_out);
          s->nb_hw_voices_out = 1;
-- 
2.37.3

