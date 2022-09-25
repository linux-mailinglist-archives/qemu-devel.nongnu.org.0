Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25E95E91BD
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:01:46 +0200 (CEST)
Received: from localhost ([::1]:48412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNWD-0001VR-O5
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1ocNRf-0006B0-Ay
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 04:57:03 -0400
Received: from relay.yourmailgateway.de ([188.68.61.101]:48206
 helo=mors-relay-8403.netcup.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1ocNRd-0001Jy-9D
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 04:57:02 -0400
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4Mb0BL0rV2z7xdT;
 Sun, 25 Sep 2022 10:56:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4Mb0BK40KGz8sWV;
 Sun, 25 Sep 2022 10:56:57 +0200 (CEST)
Received: from [192.168.54.9] (ip-095-223-070-238.um35.pools.vodafone-ip.de
 [95.223.70.238])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id D4B4660610;
 Sun, 25 Sep 2022 10:56:56 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.70.238) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Message-ID: <40de48d2-6acc-6525-34d4-cb2eec9977e8@zapateado.de>
Date: Sun, 25 Sep 2022 10:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
From: Helge Konetzka <hk@zapateado.de>
To: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/2] audio: fix in.voices test
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <166409621722.21281.495822087760092470@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-Rspamd-Server: rspamd-worker-8404
X-Spamd-Result: default: False [-5.60 / 15.00]; BAYES_HAM(-5.50)[100.00%];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:3209, ipnet:95.223.0.0/16, country:DE];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 MID_RHS_MATCH_FROM(0.00)[]; NEURAL_HAM(-0.00)[-0.978];
 TO_DN_ALL(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]
X-Rspamd-Queue-Id: D4B4660610
X-NC-CID: 0EfgsCzDWpgb+boBqDQXEKP4QT6WECWWACVCfOypWyIH
X-MORS-DOMAIN: zapateado.de
X-MORS-HOSTING: hosting115932
X-MORS-USER: hk
X-MORS-HopCount: 2
X-MORS-RelayClass: r2
X-MORS-RelayGroup: default
X-MORS-DKIM: hk@zapateado.de
X-MORS-Verdict: from=hk@zapateado.de dkim=0 spf=0
Received-SPF: pass client-ip=188.68.61.101; envelope-from=hk@zapateado.de;
 helo=mors-relay-8403.netcup.net
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


Calling qemu with valid -audiodev ...,in.voices=0 results in an obsolete
warning:
   audio: Bogus number of capture voices 0, setting to 0
This patch fixes the in.voices test.

Signed-off-by: Helge Konetzka <hk@zapateado.de>
---
  audio/audio.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index cfa4119c05..8a0ade4052 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1756,7 +1756,7 @@ static AudioState *audio_init(Audiodev *dev, const 
char *name)
          s->nb_hw_voices_out = 1;
      }

-    if (s->nb_hw_voices_in <= 0) {
+    if (s->nb_hw_voices_in < 0) {
          dolog ("Bogus number of capture voices %d, setting to 0\n",
                 s->nb_hw_voices_in);
          s->nb_hw_voices_in = 0;
-- 
2.37.3

