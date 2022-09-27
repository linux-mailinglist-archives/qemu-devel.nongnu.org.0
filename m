Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2595EC75F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:15:27 +0200 (CEST)
Received: from localhost ([::1]:52422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCIw-0000GX-G7
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1odAnH-0001A7-Kj
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:38:39 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:55090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1odAnG-00088l-0g
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:38:39 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DCBC11FCF0;
 Tue, 27 Sep 2022 13:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664285916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmGTfY44v68oWEDWIgGzIBfmabjki9ALqeTNQFkqiu4=;
 b=URJ+0pyl6gIBtVZowAqk1n7p2JSElH7R9OdLWuIRV3PiQJIpUk5F7JIP9gIAPWGoCdRyNj
 mwhsC1CUQS2sX4c78Qfvs0zLxlC2IXVEN5jSXDgvl6vt2qL7E7TVkpa+xlWvFGRY3foq4v
 0DCgdzRCWrJd8GR4CuBtm70rj083jpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664285916;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmGTfY44v68oWEDWIgGzIBfmabjki9ALqeTNQFkqiu4=;
 b=XQu7nGYgkVqbbCrJ4TOwRT43F/MEXuAuE/9IH2mpcylMBszbjIO+mB6ia3I41wAvhgZ2YE
 I3Jc47dF4REs0RDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 84515139BE;
 Tue, 27 Sep 2022 13:38:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IHfRHtz8MmNsKgAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 27 Sep 2022 13:38:36 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>
Subject: [PATCH v7 4/5] dmg: warn when opening dmg images containing blocks of
 unknown type
Date: Tue, 27 Sep 2022 15:38:24 +0200
Message-Id: <20220927133825.32631-5-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220927133825.32631-1-cfontana@suse.de>
References: <20220927133825.32631-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

From: Kevin Wolf <kwolf@redhat.com>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 block/dmg.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/block/dmg.c b/block/dmg.c
index 837f18aa20..96f8c2d14f 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -254,6 +254,25 @@ static int dmg_read_mish_block(BDRVDMGState *s, DmgHeaderState *ds,
     for (i = s->n_chunks; i < s->n_chunks + chunk_count; i++) {
         s->types[i] = buff_read_uint32(buffer, offset);
         if (!dmg_is_known_block_type(s->types[i])) {
+            switch (s->types[i]) {
+            case UDBZ:
+                warn_report_once("dmg-bzip2 module is missing, accessing bzip2 "
+                                 "compressed blocks will result in I/O errors");
+                break;
+            case ULFO:
+                warn_report_once("dmg-lzfse module is missing, accessing lzfse "
+                                 "compressed blocks will result in I/O errors");
+                break;
+            case UDCM:
+            case UDLE:
+                /* Comments and last entry can be ignored without problems */
+                break;
+            default:
+                warn_report_once("Image contains chunks of unknown type %x, "
+                                 "accessing them will result in I/O errors",
+                                 s->types[i]);
+                break;
+            }
             chunk_count--;
             i--;
             offset += 40;
-- 
2.26.2


