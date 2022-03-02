Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93CD4C99DC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 01:29:11 +0100 (CET)
Received: from localhost ([::1]:49190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPCre-0005Ak-IH
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 19:29:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ArkeYgYKCgc0p01zynvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--titusr.bounces.google.com>)
 id 1nPCmF-0008KD-Hf
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:23:35 -0500
Received: from [2607:f8b0:4864:20::b49] (port=35806
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ArkeYgYKCgc0p01zynvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--titusr.bounces.google.com>)
 id 1nPCmC-0003EG-UJ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:23:35 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 o133-20020a25738b000000b0062872621d0eso58502ybc.2
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 16:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=LrEHKcKjE05/g4rjMk0dI58DYJGhZg8t/SLiblxBtcc=;
 b=M6BaK1VpN83SJom8rZcUTvur1jMW6EEZUrI9XWZfBy6BzmpohmhhdghrQyF5wYKDdO
 3OH7gld6CxLtG3wiVc4Jlo3kivMD2Tfqz/qWxOrfv1ojVKk+KW6oFoZub3gL6u4p/NO/
 2i50U9jqajb14wYBVAzd6X1JCKw4O1GR9tZyR9yG7a4rXYjLSHcx8O5I/m3nyrTaCMQ5
 BQNhLb2VXpeUNIUtTJONALTF6RZ4NLnLM51RlP+ZLTU/Ou8tT6M+HGDceKEvCeQCHxA/
 9WGqiNGmuDMIJM9ZKqKSAYPCUqsftHU/lrGdZZhJgAq5vr3nLsWWlnkjtSwOaxhqBIeZ
 3oJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=LrEHKcKjE05/g4rjMk0dI58DYJGhZg8t/SLiblxBtcc=;
 b=EtqcOx6mTQ61Jl1aKz+NnHfWpD0Gt9YqkoIQfkJU4dc2AEFCdH+slSwq7wj/ePoZsE
 0D62NeoMnnL7yB8ic4XzxzY04zYL2CMBEKkeVgcNQgBfvpQR2eIdBgmAw00D3KYfRaNb
 vfPEozDG+T2MqN+pBNbI0BxCFsCGYJdOXGygO4R5Oca6PSrsJDGkILPzn3NAauBSMEMd
 VIX3wphOATEfuRtgfZnjfJ4MaZqKeO0XsL5z2Iwag/hx7J1rGAPc0PS4Fc6cFJbizkot
 dfn3kS2uA1wGB2pVdKlfN1KC7J73L1zdN/n+tpYn4N2eURHdTRYxNYxSKLZZT394nOoN
 tQbQ==
X-Gm-Message-State: AOAM532XpATbcbSyL0H+5hNVPapgEi4NKuJ2WfmScHmll39kBoXid102
 X0On9z+JgWyr6FviqFio77uDfYkRTFo=
X-Google-Smtp-Source: ABdhPJy6FXr/256rw2344nE+l5zkTQRY8j/die2Cvll8sh09Wqs+1ddIZM9h05HV3Kw8bM7BjeunkhZTL94=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:d341:0:b0:624:3ec2:b7bf with SMTP id
 e62-20020a25d341000000b006243ec2b7bfmr26168254ybf.518.1646180610616; Tue, 01
 Mar 2022 16:23:30 -0800 (PST)
Date: Tue,  1 Mar 2022 16:23:02 -0800
In-Reply-To: <20220302002307.1895616-1-titusr@google.com>
Message-Id: <20220302002307.1895616-5-titusr@google.com>
Mime-Version: 1.0
References: <20220302002307.1895616-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 4/9] hw/i2c: pmbus: refactor uint handling and update
 MAINTAINERS
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ArkeYgYKCgc0p01zynvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 MAINTAINERS           | 10 ++++++++++
 hw/i2c/pmbus_device.c | 18 +++++++++---------
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa8adc2618..3601984b5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3135,6 +3135,16 @@ F: include/hw/i2c/smbus_master.h
 F: include/hw/i2c/smbus_slave.h
 F: include/hw/i2c/smbus_eeprom.h
=20
+PMBus
+M: Titus Rwantare <titusr@google.com>
+S: Maintained
+F: hw/i2c/pmbus_device.c
+F: hw/sensor/adm1272.c
+F: hw/sensor/max34451.c
+F: include/hw/i2c/pmbus_device.h
+F: tests/qtest/adm1272-test.c
+F: tests/qtest/max34451-test.c
+
 Firmware schema specifications
 M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 R: Daniel P. Berrange <berrange@redhat.com>
diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 6eeb0731d7..3beb02afad 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -89,16 +89,16 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *=
data)
 }
=20
=20
-static uint64_t pmbus_receive_uint(const uint8_t *buf, uint8_t len)
+static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)
 {
     uint64_t ret =3D 0;
=20
     /* Exclude command code from return value */
-    buf++;
-    len--;
+    pmdev->in_buf++;
+    pmdev->in_buf_len--;
=20
-    for (int i =3D len - 1; i >=3D 0; i--) {
-        ret =3D ret << 8 | buf[i];
+    for (int i =3D pmdev->in_buf_len - 1; i >=3D 0; i--) {
+        ret =3D ret << 8 | pmdev->in_buf[i];
     }
     return ret;
 }
@@ -110,7 +110,7 @@ uint8_t pmbus_receive8(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 1 byte, got %d bytes\=
n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 uint16_t pmbus_receive16(PMBusDevice *pmdev)
@@ -120,7 +120,7 @@ uint16_t pmbus_receive16(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 2 bytes, got %d bytes=
\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 uint32_t pmbus_receive32(PMBusDevice *pmdev)
@@ -130,7 +130,7 @@ uint32_t pmbus_receive32(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 4 bytes, got %d bytes=
\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 uint64_t pmbus_receive64(PMBusDevice *pmdev)
@@ -140,7 +140,7 @@ uint64_t pmbus_receive64(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 8 bytes, got %d bytes=
\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 static uint8_t pmbus_out_buf_pop(PMBusDevice *pmdev)
--=20
2.35.1.616.g0bdcbb4464-goog


