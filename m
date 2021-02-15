Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AF631C040
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 18:16:40 +0100 (CET)
Received: from localhost ([::1]:42258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBhUF-0006M2-Fh
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 12:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBhSS-0005Lu-F7
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:14:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBhSQ-0007ue-9f
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613409284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5+R4mFhMsSveEph5jOrDNesxebc4zbmrsIY1tGpqbpE=;
 b=cXIdteRW49TagyvUmHAFMBUFtrvyAp0czgIkUYpTX6ZwT/HacJT53xMBYZ6TxjTY9GAsx/
 ptatyvRo/WoQEnFnbR2g2cQw1rrruumuCr9D/RETYOTeWau2F43RVyNU7CwAd8FqY2Rqy1
 LYy9E1mBg7vKqTTljb7T6eZ5fmJ/dUE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-auTorCi2P7-_RUffujh3Xg-1; Mon, 15 Feb 2021 12:14:42 -0500
X-MC-Unique: auTorCi2P7-_RUffujh3Xg-1
Received: by mail-wr1-f71.google.com with SMTP id s18so10184492wrf.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 09:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5+R4mFhMsSveEph5jOrDNesxebc4zbmrsIY1tGpqbpE=;
 b=qPTFArY+5uGzSGzkaU+gJs3vxEjumTtyVAhnHlBg4MCLRQlFNIiSUA9Weg5tgNVp0W
 +lg22C7N9xVSFxni0gaomGQGU0Nndi3l+QNQ+P/KmTEGs6iC9DK01TBz4/FXeZhPpZAq
 O42Qkn7AuAHJIZ1FEkPXhx2cAGXt9N8JfdYwqdGG8c4RhZV6UmH+UMM8XbGHG1IfkD4+
 blLAKB/1g4v5GGlJe7d8TSc9ett/SKHQLzD3YsanRLOP+Gsg2tclNmLX9Tyaun+5rA2p
 uZYJMxwa+OCXzVzJut78oeDY1LUlXaGoxxh/g+fMgT3n+l4ed7F66E1jVy7+OAgyZZBs
 EZ/w==
X-Gm-Message-State: AOAM532Q3o0NpUYa6wpEyb78zd62ngNPlj5/FkP6WDbNZ+8cT+0tdNVb
 5XpVbDA4WMfM4juLE2WBIopM0sLxxd2mUE+jLtRYrV/8soKBTnahTTR20z1+m/9eVGa5mH6sj+K
 +NsVa0ugbWfxWmUajTOqHKoYteSvq+ipPmgB+zJdbvg+yUM+HSOA+E3m+ZjnIfyv7
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr19758542wrj.209.1613409280583; 
 Mon, 15 Feb 2021 09:14:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsAxabAK/+ogVuC9UJ/dbinMQCeBylkv0VU2pXVhwtxnyWJBRC5EBVfKZeNoysH7Ud76Kj3A==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr19758528wrj.209.1613409280389; 
 Mon, 15 Feb 2021 09:14:40 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v15sm26754651wra.61.2021.02.15.09.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 09:14:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Display Avocado log content when tests timeout
Date: Mon, 15 Feb 2021 18:14:38 +0100
Message-Id: <20210215171438.935665-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit ba2232bae6d ("gitlab-ci: Refactor code that show logs
of failed acceptances") we display the log content of failing tests
(Avocado "FAIL" event).

Since we are also interested in tests timeouting, update our global
Avocado config to display log content for the "INTERRUPT" event,
"possible when the timeout is reached" (See [*]).

[*] https://avocado-framework.readthedocs.io/en/latest/guides/writer/chapters/writing.html#test-statuses

Suggested-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7adb9a4cef0..234cead60c2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -64,7 +64,7 @@ include:
     - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
     - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
            >> ~/.config/avocado/avocado.conf
-    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL"]'
+    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL", "INTERRUPT"]'
            >> ~/.config/avocado/avocado.conf
     - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
         du -chs ${CI_PROJECT_DIR}/avocado-cache ;
-- 
2.26.2


