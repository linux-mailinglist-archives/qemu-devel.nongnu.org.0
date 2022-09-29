Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582CE5EF254
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 11:41:51 +0200 (CEST)
Received: from localhost ([::1]:56860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odq3C-0004vt-Es
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 05:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1odpsU-0006vr-0R
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 05:30:49 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:59994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1odpsS-0001NC-3F
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 05:30:45 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CCDDE21E37;
 Thu, 29 Sep 2022 09:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664443842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6YoHEee2pfrTpGYtw1z4uT+FzqoIVpfKwczmy+I1hU=;
 b=GTWFYiMVSTN4q7JP3SexxzQxg7XpBgT2BTp7flJ5yg/LNUs3SNKaIaTqSclhGGJpEyAhk6
 4YLdA88hGmizIUcTF510C9TZ6TN707pa5YvVffXTZmZiclOnChx3dWJLSogfuBMDrLrnPj
 kOF+vToXXXkHpilL9jnZz/6fJFw4234=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664443842;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6YoHEee2pfrTpGYtw1z4uT+FzqoIVpfKwczmy+I1hU=;
 b=3oJSkyj6uBIsYfnV2PUjwzjIAFoD0AAnZtZidmacCvGH/JBfGWK+DcgiqJHHljFM7T68x8
 1K8sCA4CGkjWUWDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A2F113A7F;
 Thu, 29 Sep 2022 09:30:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mEVlHMJlNWMEOAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 29 Sep 2022 09:30:42 +0000
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
Subject: [PATCH v9 4/5] dmg: warn when opening dmg images containing blocks of
 unknown type
Date: Thu, 29 Sep 2022 11:30:34 +0200
Message-Id: <20220929093035.4231-5-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220929093035.4231-1-cfontana@suse.de>
References: <20220929093035.4231-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
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

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


