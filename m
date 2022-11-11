Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82946257A1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:08:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otQwR-0004wH-75; Fri, 11 Nov 2022 05:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1otQwK-0004qW-4P; Fri, 11 Nov 2022 05:07:12 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1otQwI-0008G0-BN; Fri, 11 Nov 2022 05:07:11 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 p8-20020a056830130800b0066bb73cf3bcso2539118otq.11; 
 Fri, 11 Nov 2022 02:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NXB1YH3JgzIfHIT7LFrEJsZQg4JFF4mH9uZmTdK5E3s=;
 b=X9S9UfdjyM1C4GISbBmH4X2RAAFABIwtd6vVhldphmEWBiEG1/p0Sa4IvoHxDvjGlK
 B8CdIBI6YXAO/mzr/puGHSRzmeHtWVl6Ev4mh2IDaCz5lSQtW/5cW2FkQt/09laNxyIq
 eVNFbEV8Q46aq9L+v/8+Gkfwanom/cazWA3JNvCo0lAGkQ8pws7wWQPBKGqwc1/KwjvZ
 lA6QUiQuR8fH4NZc0epynbcHc1VQl6xPAXWrxc4XjeJe0cknUwZEPc7D4YW/4mZmmPDn
 R+cUjH5aT1FBcvjokDeDP4in0Inl9Ghou53ZwjchZTAezH6gsKBdrqb1QFV2mquXyhVC
 SFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NXB1YH3JgzIfHIT7LFrEJsZQg4JFF4mH9uZmTdK5E3s=;
 b=qXfdWA7CaJ7jdkLQYCBPK5HPqxb38ypWZ9Jki6OKxoms9T3vLnBG0cnJaJhxg328AN
 Vm9l2PHoZxqAUK79oouKu9kx1KIj/8iEuLOpSH3SshV0AXbDKDa+2t0Nz9swVbofIP0E
 DIAZOiMKdRYtCCJFopDPlhU/cT5sMNPB7Wqo6S9cNL/ksw/puynFZHR9NMtzTYBjpMs6
 AS7HCp+ulh70Csjgi7uamdjhxSW2+TvSTcP8vNhVDohE0rCI3HcGivXiSdSstsV4eWMp
 PBEnT8CWEqD7guAMMMTn0s8QHTYboxSht1ZpKX16EUUTSlXVVUaqmFHdW8fRrfQ+EcLa
 UI2A==
X-Gm-Message-State: ANoB5pmdl38YHzEuVbhrLLbjCncHiyXDsgl/Bfxne4h3b7oP9LgogoRM
 kQhO18oHnn+tltclXlsc2ZSqOmbsa4c=
X-Google-Smtp-Source: AA0mqf4NPqwtbuGFZ5jBEn1HwOC9hY5Gm806/OrWiOfn9uqyqiKDvydjKQxpOHuw9ri4sPQuyk+Vog==
X-Received: by 2002:a9d:6c02:0:b0:66c:42d7:7d70 with SMTP id
 f2-20020a9d6c02000000b0066c42d77d70mr841605otq.98.1668161228542; 
 Fri, 11 Nov 2022 02:07:08 -0800 (PST)
Received: from balboa.redhat.com ([187.34.29.120])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056870898400b0012d130c2fdasm994862oaq.48.2022.11.11.02.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 02:07:08 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 1/1] hw/pci-host/pnv_phb: Avoid quitting QEMU if hotplug of
 pnv-phb-root-port fails
Date: Fri, 11 Nov 2022 07:05:51 -0300
Message-Id: <20221111100551.1076171-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221111100551.1076171-1-danielhb413@gmail.com>
References: <20221111100551.1076171-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Thomas Huth <thuth@redhat.com>

Currently QEMU terminates if you try to hotplug pnv-phb-root-port in
an environment where it is not supported, e.g. if doing this:

 echo "device_add pnv-phb-root-port" | \
 ./qemu-system-ppc64 -monitor stdio -M powernv9

To avoid this problem, the pnv_phb_root_port_realize() function should
not use error_fatal when trying to set the properties which might not
be available.

Fixes: c2f3f78af5 ("ppc/pnv: set root port chassis and slot using Bus properties")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221109122210.115667-1-thuth@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 7b11f1e8dd..0b26b43736 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -241,8 +241,16 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
      * QOM id. 'chip_id' is going to be used as PCIE chassis for the
      * root port.
      */
-    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
-    index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
+    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+    index = object_property_get_int(OBJECT(bus), "phb-id", &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     /* Set unique chassis/slot values for the root port */
     qdev_prop_set_uint8(dev, "chassis", chip_id);
-- 
2.37.3


