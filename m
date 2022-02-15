Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF814B73FA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:11:47 +0100 (CET)
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1Mg-0000Mo-8D
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:11:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1Di-0005IZ-U6
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:02:30 -0500
Received: from [2607:f8b0:4864:20::42c] (port=45772
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1Df-0007dk-Ee
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:02:30 -0500
Received: by mail-pf1-x42c.google.com with SMTP id u16so1841548pfg.12
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UaffjyQzW8BQImKvqf4HcLMN4oFMJh8sNvsUJPU7qMA=;
 b=Acisb5EpBPn3L4Iu840o/J9A+04gGYsNt3ueQz4k1SU88EhTu4UTLnhCxIHRdjX3Qc
 arr3QZeOH2mSIlmbWSUSpAiCuWyHJuL0/NHOIfy+APT8fWJb+XQtuIvy7PGELtiv/usy
 7GLC9MNVo9origH3sHfjRYAGNGQWw+/s+XuIQdCcCDsaKRYdlbeI7vGIenvxyK4D62ig
 hnTVQOArwvp8LKVtp+0pEQc+GvU5/c0hR75AI3nJB+CrPTer4Ai/+zDxNSXNhF+V8iE0
 2g0i+MfJ7VHe/L6FTGtRE5760iPtGC+k4Y3F4FNza2EAyYTz+MKz2Vnx1N9bNZhcxCAK
 oodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UaffjyQzW8BQImKvqf4HcLMN4oFMJh8sNvsUJPU7qMA=;
 b=2BK9Bl9HenUyHFofvDfAR0F/LvYJhO60oWekPNGlTQsRadkWhoUtDlIm53fKT6Nk/c
 5Hmbx9hQ/98dgpbBicbQfu5LnDE/YHyzoS5JHxi64PfADFZEZkvSMySGoTItb2/ze9S/
 WzcMM+J3qj5RDLZYxBbpof7fOttrbYHECc9TM58Z8YVu/0ZymzamWcxlLe9TDQG1Bco+
 4TVsY2ikpPkqc0IYH2IvQZPPq5ZrrYDWWiw/XlFaO1sHKCGjXdUhcz25/fnoK92fLj3U
 hRQVZBdZbrq6S/NFl3u57n5iYFTAuRbw5WA+MRlKVQB57DPQdfyySpbdTUnWHgUfnX9e
 NDkw==
X-Gm-Message-State: AOAM533fvqrI9V3Sp/WySjQSeQLNreJqgI5x8lxJ6nr1l7q+r60hJmn0
 byhInnYIlyK9IJeg4EDw0bIEgVJQT7o=
X-Google-Smtp-Source: ABdhPJzDIbrzQt4CGm03xU7qOxL/ugE6dgfX4o+TGpLq8shnpI7E1Nyp7cXboDi8yLYqivLOUnXqSQ==
X-Received: by 2002:a63:9553:: with SMTP id t19mr4206080pgn.495.1644944539206; 
 Tue, 15 Feb 2022 09:02:19 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id lb18sm15680758pjb.42.2022.02.15.09.02.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 09:02:18 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 8/8] ui/cocoa: Constify qkeycode translation arrays
Date: Tue, 15 Feb 2022 18:01:06 +0100
Message-Id: <20220215170106.95848-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215170106.95848-1-f4bug@amsat.org>
References: <20220215170106.95848-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 30702d31a5..7a3a610212 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -651,7 +651,7 @@ QemuCocoaView *cocoaView;
 
     /* translates Macintosh keycodes to QEMU's keysym */
 
-    int without_control_translation[] = {
+    static const int without_control_translation[] = {
         [0 ... 0xff] = 0,   // invalid key
 
         [kVK_UpArrow]       = QEMU_KEY_UP,
@@ -666,7 +666,7 @@ QemuCocoaView *cocoaView;
         [kVK_Delete]        = QEMU_KEY_BACKSPACE,
     };
 
-    int with_control_translation[] = {
+    static const int with_control_translation[] = {
         [0 ... 0xff] = 0,   // invalid key
 
         [kVK_UpArrow]       = QEMU_KEY_CTRL_UP,
-- 
2.34.1


