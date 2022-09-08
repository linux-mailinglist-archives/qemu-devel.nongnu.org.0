Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8627D5B1F59
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:37:34 +0200 (CEST)
Received: from localhost ([::1]:44752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHin-0007Pv-LP
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHa1-0004SV-2Q
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:30 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHZz-0002aQ-Ki
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:28 -0400
Received: by mail-pl1-x62a.google.com with SMTP id b21so4948695plz.7
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 06:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4V2kh8bh8Emc/PHebNZxEp7jm1fTt064prqxwjUL4ng=;
 b=OLTES4X+L/nI7e+wPkiJVjElwgPiQKWLLJ5b7IhSG418zKqpxeV2EQ9AiDuEXzvhu1
 CeRl8VMdc4EzPr9eDeYd3w23SPUzWR29vcPsyma9C8q9HuFbNaOI2krMkOmXvVC4MCtY
 /AZzPGwT39UFaAOWsGQDx55BxPu+aSUeDOx1LMxGJKoKpbzy/ERBDzD45P+ZJatiG7AE
 /0Gh1Pq0E/w7HsOkkmOLkICZI3L3Ugaz1YQMuZuDcYY8+YjS8qb+nydiJNBIpNrM1Km5
 rWThqL8/2F3Kh9sHoeJrNhqFe4xI+OquwM6KAyzK6TiuVqvrhcp7qmaQczLFBqccWXTD
 Duxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4V2kh8bh8Emc/PHebNZxEp7jm1fTt064prqxwjUL4ng=;
 b=Ty+vwCZF0UPy+12o7hwAhVBx1Keby8Wy9LBl6ZOmOLlRohq8JYo69JRDjRJ1FZa930
 sw9IkZsFPhcL4cQK5UFy89MVn18Va/QuZZvvq3zIXFra/B2DHxBKViwuN9LORjmpw/NW
 IzBmlP+bncRxNJN34RLbvhjgN0K2h3DbxPjv3CyX4IXh1vsejl72//ot0IyHlHHuWfaO
 j3UFFY83OxV+lQN/jtgiqZelT0tG4MHbF3wm7Ja8hapUThREkk4V744704rH+a/UhDVE
 LJOXlhOXzhPq9RD9gFgzNzIOadM/rr0phEtuK/jd1y49zyUnbSwywJdPOzIbYY4553YU
 oXIw==
X-Gm-Message-State: ACgBeo0xpIGZ6anyG1RvnAfTsEPenAF0y6kZpVFt/fD6TyUMqXU3meR/
 CHVOsiNf2kpIR+Dt90rblsPcRb3jpec=
X-Google-Smtp-Source: AA6agR6uN/sImln8/cR+55cEDVU8A0qyVNKsC48oX4Fp/XJUoI19trhPq66ZJXqHWolux15l/jwffA==
X-Received: by 2002:a17:90a:1b6e:b0:1f5:1902:af92 with SMTP id
 q101-20020a17090a1b6e00b001f51902af92mr4357269pjq.238.1662643705774; 
 Thu, 08 Sep 2022 06:28:25 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a170902be0800b001755ac7dd0asm1731693pls.290.2022.09.08.06.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 06:28:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 1/7] scripts/nsis.py: Drop the unnecessary path separator
Date: Thu,  8 Sep 2022 21:28:11 +0800
Message-Id: <20220908132817.1831008-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908132817.1831008-1-bmeng.cn@gmail.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

There is no need to append a path separator to the destination
directory that is passed to "make install".

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 scripts/nsis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/nsis.py b/scripts/nsis.py
index 462d6cac3b..bbb41d9386 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -30,7 +30,7 @@ def main():
 
     destdir = tempfile.mkdtemp()
     try:
-        subprocess.run(["make", "install", "DESTDIR=" + destdir + os.path.sep])
+        subprocess.run(["make", "install", "DESTDIR=" + destdir])
         with open(
             os.path.join(destdir + args.prefix, "system-emulations.nsh"), "w"
         ) as nsh, open(
-- 
2.34.1


