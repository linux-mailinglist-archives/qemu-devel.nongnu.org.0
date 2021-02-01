Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78EA30AA5A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:03:00 +0100 (CET)
Received: from localhost ([::1]:53992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ajD-0004wu-Un
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l6agw-0002yW-1Z; Mon, 01 Feb 2021 10:00:39 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l6agn-0002ge-K9; Mon, 01 Feb 2021 10:00:31 -0500
Received: by mail-wr1-x436.google.com with SMTP id p15so16863109wrq.8;
 Mon, 01 Feb 2021 07:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vmTUdRsIp15lM+Myl5to/SGJeQnIreHQ3aMV8OYa0uU=;
 b=Pm0obmVfPDDb+jBUKJg4MssCrTlzrMrMkGv7NC/umWeVbM3THQVbBsd2EpMqXPHNw2
 xp0xO2+M4pvF/NblcspJpPuFS7Ju4WxyowGrVU0xBJt9XGbuQE70xIwzlj/H1/aMDhZh
 HPjVZx52OqQidkxSoz/f1gfgNhdcZI1POvkBCw5M8lb3qggDzmtdG6KHyIM3E3IxpjtG
 dT99Ry3LTgGX2m0sqAip9kvaxv9gNJaSCnPcwqwaklh7RGeVqEr1Di7Jiq5hNF0VIQ6A
 cPYsDZxVYUr7zF79zwJHJ9zzG9OTponC0OlGDB2KhVsijYA4XbXjUXbZYe5VNURARq5r
 vsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vmTUdRsIp15lM+Myl5to/SGJeQnIreHQ3aMV8OYa0uU=;
 b=WD6MUrhoxqbdHyth+bsNLhk6Nwygs+UAwQXCrWu/+B3wqmpunxDaUZt6WqLqEtR+E3
 h2ePGuCw4/5sRRACG2yJ4fAZPXMQySzmr+141msf/pUIN4r3qyP543ujjhgEMVQjRYdg
 cgmJhYFd/FdmS9K3gml3VjkagLNevQW+xswR4nrQ1FzbzGBIsMR60BOGK/DMzAXXibLD
 77V31NP1ZZFeDxbRwjTH9en5VLS5gDftXEiIx4kseJ72fwbJMDMCr6hjuAJCUyOssbcc
 0QbhWt5mEPL26E6W7vusXz8F717uqDt8NRyJ2An48xKC4216uMHvUS+7OlTH4bl65ZMv
 EN0Q==
X-Gm-Message-State: AOAM533fdY2eYhg291AU7QXgT4q2WTdS99TimTlDKbCTFhJOtNwvVEGt
 FWCxRdF+f5Ktuv046VI/7bw6hHp+r7a/6Q==
X-Google-Smtp-Source: ABdhPJwtTuTb/venf0rfza43NRbYdwd5LUIBaHJTzSsBFKLWs5Wd86vQSzXIZe10WIZmoEile1om3g==
X-Received: by 2002:a5d:6206:: with SMTP id y6mr18996579wru.413.1612191626466; 
 Mon, 01 Feb 2021 07:00:26 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 q6sm25879813wrw.43.2021.02.01.07.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 07:00:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/38] pc-bios/descriptors: fix paths in json files
Date: Mon,  1 Feb 2021 16:00:21 +0100
Message-Id: <20210201150021.53398-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201150021.53398-1-pbonzini@redhat.com>
References: <20210201150021.53398-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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


