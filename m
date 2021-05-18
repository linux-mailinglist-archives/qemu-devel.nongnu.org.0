Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BE13876D7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:45:12 +0200 (CEST)
Received: from localhost ([::1]:47514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixDr-0000Kf-CB
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lix4b-00012W-99; Tue, 18 May 2021 06:35:40 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:45996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lix4Z-0006ro-Jz; Tue, 18 May 2021 06:35:37 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so1179184wmh.4; 
 Tue, 18 May 2021 03:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NURTTjYEkN5qlT+hGLhGVfDulriBn9GBwNW8du6ptW0=;
 b=FnuiP9bv899y11M31kvskFa+n/+fTA4YMEkEsoYL4/nVVfOeBfygiELxl6lgDjycjf
 tOpvZGa4WW+VSm0OvcnrZ9uT9FkPFcMWMQOZ4U6/wjUqXiNSEmTKNw85npd6X7etJPma
 8gUZ+MzESEHGJaXYWc9jtMt8fgoO5xFmjWGXbSg6yDRg+IK3dZkfmegH6MHCDoTIb9Xm
 Gz+cWpzaZBtpo9XHE0VsMrfw2xcxBf2zIOHGlf0EH+p/d8G7StANmbuH/YqSmKX2+XvM
 V1RIN4mPQRI68ASy6Q+uTbnog+u+6xZ8he4rDemCNCBrfVWcY5XzrXQJVmUWF9VaxjvK
 7QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NURTTjYEkN5qlT+hGLhGVfDulriBn9GBwNW8du6ptW0=;
 b=j8uvNbs/6exmH8IMTO+bT7+u8UKd1gRmkl3GxXRbZcoSmztfPQW6GBZzs7L4AW82a9
 prTNRO6PdqDPUpdzLHntNNl4wp9bFGOEcHPTopfWwOkgxjsQ8Jb0HSDmTwpxGM/Rzi+1
 k4hYS83XKCKzoSsqyWDOrk8S7wQgsY00qcp5wJEYshL9sTA1SS53iAc+0IIGG3CKHKtG
 6CVi6qPJd3y1V4yS3LvNfyj6E+7EAUJTX9amupJMtmwolnXksBbNlzWZ3TDqAFETyl4W
 /OJKHsxw43faYI7C8M2X3kj0FMVytNgHFMZC3gJaxwq+0TxzhI0peUlIs13dSOgGFuHJ
 hQfQ==
X-Gm-Message-State: AOAM531C3bitiYUD666o0mCuNVzuPvNHMy1ITClYiUR1K9+arMJz33/9
 3QDaJrwHPAmyhTaoc3gRjKDO03WaRmlccQ==
X-Google-Smtp-Source: ABdhPJxVhF/W4ahKO+8uOUt9ijoasMDN+OCja3iTIetwg8yOIosLJDc8SVVax7mc2Wb82pV6Axt//w==
X-Received: by 2002:a7b:c012:: with SMTP id c18mr4245814wmb.94.1621334133175; 
 Tue, 18 May 2021 03:35:33 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v21sm2148763wml.5.2021.05.18.03.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 03:35:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vl: allow not specifying size in -m when using -M
 memory-backend
Date: Tue, 18 May 2021 12:35:31 +0200
Message-Id: <20210518103531.104162-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: imammedo@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Starting in QEMU 6.0's commit f5c9fcb82d ("vl: separate
qemu_create_machine", 2020-12-10), a function have_custom_ram_size()
replaced the return value of set_memory_options().

The purpose of the return value was to record the presence of
"-m size", and if it was not there, change the default RAM
size to the size of the memory backend passed with "-M
memory-backend".

With that commit, however, have_custom_ram_size() is now queried only
after set_memory_options has stored the fixed-up RAM size in QemuOpts for
"future use".  This was actually the only future use of the fixed-up RAM
size, so remove that code and fix the bug.

Cc: qemu-stable@nongnu.org
Fixes: f5c9fcb82d ("vl: separate qemu_create_machine", 2020-12-10)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index ac0ff6e160..21e55718a6 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2039,8 +2039,6 @@ static void set_memory_options(MachineClass *mc)
         exit(EXIT_FAILURE);
     }
 
-    /* store value for the future use */
-    qemu_opt_set_number(opts, "size", ram_size, &error_abort);
     maxram_size = ram_size;
 
     if (qemu_opt_get(opts, "maxmem")) {
-- 
2.31.1


