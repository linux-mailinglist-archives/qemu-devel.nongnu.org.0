Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FDA3D26F3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:42:45 +0200 (CEST)
Received: from localhost ([::1]:40442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aqS-0006bK-9p
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akK-0000bZ-81
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:24 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akG-0002iv-O8
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:23 -0400
Received: by mail-ed1-x532.google.com with SMTP id l26so7309533eda.10
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=buCvLsLhrPlmFHD4WI3Z8/oFic9Gn2g+XnUDkOMJ8uM=;
 b=AIp3jv9XQMmjzbAV6bhBrntd+Hgh8LbrzDMFGCKD/03gzkAgP9hfHG0EbvyO97i2LP
 N6TqMDi2idqKrPJjs51UVQyPL51bhLePVIxLnICnA1c7CHohgjKBVHFcZPid33k74fAL
 aHgr1gQ3ny5NagCEyh+Yl2t1rxYq8kE6akNf7ogu7cnYzulDXus5+zeI5uXzYEpFfbqa
 kVtfymIPFd5MOJNCdoSWR9QTmJAua7FAqDi147PNTbYXmNEuyQAEK788QlRhlq95PfpP
 n/9M6Aynmyqe/YSFRdjRQAqxQ65vXU7r8tzY60gHhFDcxOUcsJOAeoztmR6/3zL0P0rD
 eKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=buCvLsLhrPlmFHD4WI3Z8/oFic9Gn2g+XnUDkOMJ8uM=;
 b=DOpfilAO8u+hbPe9tkTXBJYqykubSDeynbcNKPNAwgXIYYhzDzA8o/jXW+jzm0tABq
 rdGnxdaBCNSrKjGmxRK+sDd+1Rb4Bip9h3dxut6wywm137NBCi+vh+IGQLESVkeEu9+d
 s3/ka2EAQPtWe/Dp41sPrsbpWQqfyO8mRnLbW0uckePxcX35WZvM22bwOgKelIeutHjF
 6ul6g/tSBFhGdQLuCLyIdeLPeYy+8zwE8qkAWbYBiaeWvrdoLY7pEkQ1RTWhH2v31GC9
 VOesA/YX0Q5EbT4HzySoECWKm+3MnGCQZO3AaNudWwydJIrom6ge+izw5cMLEw8XYHTQ
 amRg==
X-Gm-Message-State: AOAM530nZ/rQ0zalYxyraMnkz1JsKeT0Gw9Jj5KmQtYszcNHC+uRsaqN
 JzDPOGVNS43gVt+nwVnIPvOGQ3D0lnG8HQ==
X-Google-Smtp-Source: ABdhPJzw7HH+ef87M6AmmkYHznEu/xuRthhBgvwmVT4SG9esGjW3f5by0hUbx0yL9GIx3d5jo2bu7Q==
X-Received: by 2002:a05:6402:1a57:: with SMTP id
 bf23mr258403edb.312.1626968177579; 
 Thu, 22 Jul 2021 08:36:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] usb: fix usb-host dependency check
Date: Thu, 22 Jul 2021 17:36:02 +0200
Message-Id: <20210722153612.955537-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Fixes: 90540f3289 ("configure, meson: convert libusb detection to meson", 2021-06-25)
Reported-by: Programmingkid <programmingkidx@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210721081718.301343-1-kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/usb/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 3ca6127937..de853d780d 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -72,7 +72,7 @@ if usbredir.found()
 endif
 
 # usb pass-through
-if config_host.has_key('CONFIG_USB_LIBUSB')
+if libusb.found()
   usbhost_ss = ss.source_set()
   usbhost_ss.add(when: ['CONFIG_USB', libusb],
                  if_true: files('host-libusb.c'))
-- 
2.31.1



