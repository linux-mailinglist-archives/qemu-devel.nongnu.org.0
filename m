Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F03BE7B7
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 14:18:43 +0200 (CEST)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m16Vm-0005Dh-Sv
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 08:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m16T0-000379-CN
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:15:51 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m16Sz-0003B1-3L
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:15:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id d12so2195136wre.13
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 05:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cX/p5QZayUyVM6iw0QJ/hvlvX9vOjVL9MLMkfkzXkrY=;
 b=u5s8NtVYWktzXGBWf9zulRm+ci0Q/0eJGiBClmLw2iBHRR3Hfs1Cna55u0opC/K0sx
 aztkHHl/vrimVMqKBbSf11AyHThDOVCdKxF9zD60Ljq0cH0Nj0pVJi/I/kX519sXN86E
 L9rvBGIIsmcO8k3t+Ym27J7gq601GBUg6jdyyIgcot6kIY5oTKBj3nMvq5ec5CO1AAYO
 jHoP916muBsRhU8uQPahTGg6xrnlOHJoXd6PZYL5AK2Vn/jAcWjrf2WVyaGdUuNg7n1N
 E/Jg2BQHugKvw1I2pplk/ahQ4VZHvanhJEIZ6CxB6tBfZUtsQbB3lRMDHpIENnpkYSji
 F0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cX/p5QZayUyVM6iw0QJ/hvlvX9vOjVL9MLMkfkzXkrY=;
 b=CYkwARR0mD9v6W33kf9Zr51gF0+qeH8RfZzvbPLEJLOy97I/+46RF6a1DCmqJk5tnA
 28yLal7jzYmt01unRar/qV/4jFfhOICYQ05ctyFN+Z4Fxyaxcg3CAHbthSlTBt7zp82h
 xiIH2Q1e4z2fqqUQQjm5QCs0Z0WDVCtVCUC99ClZ8cpoEPYdEqylESWMRisTwyP4AclR
 hahQBbH4wchTGfzjEFSIDP4DW0wlIVtXolofYihncfkDa200yU8WpuJ1RWprIlX3Ive2
 Pi9Id0BcB3waVS0X8XVodZUqgVmT4v9f/SufftXPiYRgdAnIlB8RTtAdT66RurMonG9Y
 YHAw==
X-Gm-Message-State: AOAM5319eWWHo8gVIzkeOpUs78fwHZtfzNBHitxCXIqwQDHFKsNA/jHV
 VjLzH7ppquyUFDV32RreFkIcX0AVd1U=
X-Google-Smtp-Source: ABdhPJz17wahX6hSBwhgjxy5B9sOYNwJn0f4hQLktK4OzTsZ8TRT3KTkbEJm2CSzkvq0WEP8ZP7pBQ==
X-Received: by 2002:adf:d1e6:: with SMTP id g6mr16161120wrd.140.1625660147430; 
 Wed, 07 Jul 2021 05:15:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l7sm19987558wry.0.2021.07.07.05.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 05:15:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-config: never call the callback after an error, fix leak
Date: Wed,  7 Jul 2021 14:15:45 +0200
Message-Id: <20210707121545.361829-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ensure that the callback to qemu_config_foreach is never called upon
an error, by moving the invocation before the "out" label and ensuring
all error cases jump to the label.  The qobject_unref however needs
to be done in all cases (which Coverity is already complaining about).

The leak is basically impossible to reach, since the only common way
to get ferror(fp) is by passing a directory to -readconfig.  In that
case, the error occurs before qdict is set to anything non-NULL.
However, it's theoretically possible to get there after an EIO.

Cc: armbru@redhat.com
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-config.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/util/qemu-config.c b/util/qemu-config.c
index 84ee6dc4ea..6c4373e8fb 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -412,16 +412,15 @@ static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
         goto out;
     }
     if (ferror(fp)) {
-        loc_pop(&loc);
         error_setg_errno(errp, errno, "Cannot read config file");
-        return res;
+        goto out;
     }
     res = count;
-out:
     if (qdict) {
         cb(group, qdict, opaque, errp);
-        qobject_unref(qdict);
     }
+out:
+    qobject_unref(qdict);
     loc_pop(&loc);
     return res;
 }
-- 
2.31.1


