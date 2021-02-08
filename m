Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF0431433F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:53:57 +0100 (CET)
Received: from localhost ([::1]:52262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FPo-0004F4-JX
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCj-0003ep-S5; Mon, 08 Feb 2021 13:24:10 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCi-0006KD-3I; Mon, 08 Feb 2021 13:24:09 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v15so18374129wrx.4;
 Mon, 08 Feb 2021 10:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vmTUdRsIp15lM+Myl5to/SGJeQnIreHQ3aMV8OYa0uU=;
 b=K3nnvrapD2u5QnP9aOIDCODsW/wAGkjPD9+NsRO/KM9NtOENuM2HT9qr/JwLruULP5
 707DvRrabBcgk1KnB+s5mSv9LXeXBnrWlLfXX/CdIL7P+r9zsAnOHhsRn2UPnYOdoNt9
 2rhBsMaNFpCEGeUxb2eTs+urH1Gpl7y40H3r3p+dfKQ8h+l4ihz5xQAJhjaPLFz/XE/W
 eZXwmY8f1U7lEEoOaH5B/fvw1tMJ5YKGqZx6T51Ry0JoRZ8VpIKo5PQQKccrntQ0opuJ
 o+hqSNrZ6HvtjlEXxWlJSqRL/L1xsMqJ5RcSZCsoNi/hqLJjJMgtbP+G/pVD0ZEoLXD7
 DSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vmTUdRsIp15lM+Myl5to/SGJeQnIreHQ3aMV8OYa0uU=;
 b=WMRArMbT1pvmwo9Gd7oY70SNhrN6a6CZYii7lGqGhh19dMaa597uQvBPpiHLUWeZcR
 BcDrNeppVHPhRH6KGaWSj9XNNggd1peqSx+hND0rkQ1ivrd08jYfdDrFx64vG+RnJLvi
 LgZK9MVG8F70WwuF/XXLfQAloPaqHlRXpjz8cSkrz9OMns/S5DNLhab/6dTWRai+SEfs
 nogO97m5JN0fp4C009F5XwxbwcGPi1srKRaWJkqDyWHxMTm+fOZT63aLB8WmIhTViCbj
 K+SsvJoww55qeKWf0BQkcmqEHN+nmt5bgZs591CXXfw4bhF4Iv0ISq5OnBsECsvRHiJx
 s9Iw==
X-Gm-Message-State: AOAM533rdNib9F9XDjKtmL3cUotnQblswvsIxlDE2ijFxbhEW8bTBNRX
 XXTmKg4l+snHF4IdRqLKNfvaf/OFVbNBvA==
X-Google-Smtp-Source: ABdhPJx1o8lUysCrrNlgmSlR3ig3ng7Y9Ehaodaab+1E7/KZSW+lI+TBb9oDYDJC8vgS13a3oC21Yw==
X-Received: by 2002:adf:ab10:: with SMTP id q16mr3368287wrc.376.1612808645128; 
 Mon, 08 Feb 2021 10:24:05 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/46] pc-bios/descriptors: fix paths in json files
Date: Mon,  8 Feb 2021 19:23:19 +0100
Message-Id: <20210208182331.58897-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Jannik=20Gl=C3=BCckert?= <jannik.glueckert@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-stable@nongnu.org, Sergei Trofimovich <slyfox@gentoo.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergei Trofimovich <slyfox@gentoo.org>

Before the change /usr/share/qemu/firmware/50-edk2-x86_64-secure.json
contained the relative path:
            "filename": "share/qemu/edk2-x86_64-secure-code.fd",
            "filename": "share/qemu/edk2-i386-vars.fd",

After then change the paths are absolute:
            "filename": "/usr/share/qemu/edk2-x86_64-secure-code.fd",
            "filename": "/usr/share/qemu/edk2-i386-vars.fd",

The regression appeared in qemu-5.2.0 (seems to be related
to meson port).

CC: Paolo Bonzini <pbonzini@redhat.com>
CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
CC: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Bug: https://bugs.gentoo.org/766743
Bug: https://bugs.launchpad.net/qemu/+bug/1913012
Signed-off-by: Jannik Glückert <jannik.glueckert@gmail.com>
Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
Message-Id: <20210131143434.2513363-1-slyfox@gentoo.org>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/descriptors/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
index ac6ec66b00..29efa16d99 100644
--- a/pc-bios/descriptors/meson.build
+++ b/pc-bios/descriptors/meson.build
@@ -9,7 +9,7 @@ if install_edk2_blobs
   ]
     configure_file(input: files(f),
                    output: f,
-                   configuration: {'DATADIR': qemu_datadir},
+                   configuration: {'DATADIR': get_option('prefix') / qemu_datadir},
                    install: get_option('install_blobs'),
                    install_dir: qemu_datadir / 'firmware')
   endforeach
-- 
2.29.2



