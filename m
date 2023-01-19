Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5C1673AE4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVQD-0000nx-Ta; Thu, 19 Jan 2023 08:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIVPs-0000ct-Uo; Thu, 19 Jan 2023 08:57:20 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIVPr-0006Ex-CP; Thu, 19 Jan 2023 08:57:20 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 574ED38C3C;
 Thu, 19 Jan 2023 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674136637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ek2plUhT6cYZ08vwAGsINrJigng7r+gmkaUGahZEZ4=;
 b=ih3ztUW1ikhb6FhBu3jtUr1uO3nJluculKz5WXHzU7pRVyM3wzr4dSfLEsZUhHjB6bngcO
 Dq7mPPobB/DUzhBkECQOYzkcBRVC8BeRsSifUCJxnGnf0ExgMtVwb9wDQolSijg+AAH9RF
 nhNo8j+OdZQahZ+ZvhbzkmgW6PUUwxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674136637;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ek2plUhT6cYZ08vwAGsINrJigng7r+gmkaUGahZEZ4=;
 b=zxmSc2sCO18Cx0GcWlXwZdGzXetXooAlNBUZwrkjvE4wcaFwaIPe47c+U4MdoDe2uMR5Dn
 5jVbN8HOElpKkEDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09AAE134F5;
 Thu, 19 Jan 2023 13:57:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4HIiMDlMyWOCFAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:57:13 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH v4 12/15] tests/tcg: Do not build/run TCG tests if TCG is
 disabled
Date: Thu, 19 Jan 2023 10:54:21 -0300
Message-Id: <20230119135424.5417-13-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The tests under tests/tcg depend on the TCG accelerator. Do not build
them if --disable-tcg was given in the configure line.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 configure | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 9e407ce2e3..64960c6000 100755
--- a/configure
+++ b/configure
@@ -2483,7 +2483,11 @@ for target in $target_list; do
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
 done
-echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> config-host.mak)
+
+if test "$tcg" = "enabled"; then
+    echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> config-host.mak
+fi
+)
 
 if test "$skip_meson" = no; then
   cross="config-meson.cross.new"
-- 
2.35.3


