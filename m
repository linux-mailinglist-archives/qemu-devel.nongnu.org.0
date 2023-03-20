Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A576C1310
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:18:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFOd-0002u4-OJ; Mon, 20 Mar 2023 09:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1peDug-0001sj-Ls
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:42:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1peDue-0003jX-QZ
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679312571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Odhw3mm7MA8ZJ3F11MhA7NeX2k0egTnIEvW4gQYadXI=;
 b=XRgg2+Wr1mKFW0vcc9XJr8msQSO7DaLB2ADuW8olyDP84oAJqxS257HH/NjE4gQIEOJ1vr
 1Rqeac7S9Nr0BXJ8tmgOlTMvKeb2sts4fRIUquIRkUUQ3ReEunq5N2Kxu5asJWXea6lZoB
 JvzIZAriTnjU6QmLQNTP7QUKvEiQkUI=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-7uVD26yTNEq3mdqMW7uDpw-1; Mon, 20 Mar 2023 07:42:50 -0400
X-MC-Unique: 7uVD26yTNEq3mdqMW7uDpw-1
Received: by mail-pj1-f72.google.com with SMTP id
 kx3-20020a17090b228300b0023cfd09ed94so6755202pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 04:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679312569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Odhw3mm7MA8ZJ3F11MhA7NeX2k0egTnIEvW4gQYadXI=;
 b=Wfv4/djs3XSk3tDIjm8jciTREZoEdou27XaN0ix3UU8ksEvqMKH7vZOxxujpsZbpfx
 WPK14clR4v8HTsdgKE+jrwZZ/ulz8aXQd3mKM5EAjtuZRW5lJrfWMWfGsT4+XFlrq6E3
 TW9WF+CLGF9lSycvy0h1w2QTdA9FGKDY9ghl9qFSW3kcu/NR49B7Tc5M2hA7cYI6yxu7
 T/RU/7FQhL8HKgpaA7BUq6kxi/YkQ6FaVb9fA6NoBSSvItwD2REq9tZcfwa8xngFabfW
 ZAY4wC2bc/11gxzIty7KgYWZM+pewf9wFA87HUrtfB9Xy07p7TiRBuyRke8MbLsS4/oz
 ligg==
X-Gm-Message-State: AO0yUKWANel2XcHMwJynahAKip+5JZaNY9BZ/3FNioGqAmJHoBTpHw0X
 kLnMfnyoCq3cnoOKh0vzMTPkAleTG8UnDa1vOGCAFbXKT0DSj/qnxH8iWJZOJfsvbu0d6U1ZhHq
 jgQ4RU5rpA2wtjK0=
X-Received: by 2002:a17:90b:33c8:b0:23f:5fe7:25a1 with SMTP id
 lk8-20020a17090b33c800b0023f5fe725a1mr12076529pjb.13.1679312569143; 
 Mon, 20 Mar 2023 04:42:49 -0700 (PDT)
X-Google-Smtp-Source: AK7set/nihbYvM+tL3x2LG0+pwELkZbaYsgZlU8SeSwVUgsqGX6o3WbiHduBXbTNuNWNKee7x6/4Wg==
X-Received: by 2002:a17:90b:33c8:b0:23f:5fe7:25a1 with SMTP id
 lk8-20020a17090b33c800b0023f5fe725a1mr12076509pjb.13.1679312568825; 
 Mon, 20 Mar 2023 04:42:48 -0700 (PDT)
Received: from localhost.localdomain ([203.163.233.223])
 by smtp.googlemail.com with ESMTPSA id
 jx21-20020a17090b46d500b0020b21019086sm19930386pjb.3.2023.03.20.04.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 04:42:48 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: Ani Sinha <anisinha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
	qemu-devel@nongnu.org
Subject: [PATCH] Add my old and new work email mapping and use work email to
 support biosbits
Date: Mon, 20 Mar 2023 17:12:33 +0530
Message-Id: <20230320114233.90638-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Mar 2023 09:17:43 -0400
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

From: Ani Sinha <ani@anisinha.ca>

Update mailmap to indicate ani@anisinha.ca and anisinha@redhat.com are one and
the same person. Additionally update MAINTAINERS and bits documentation to use
my work (redhat) email.

Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 .mailmap                 | 1 +
 MAINTAINERS              | 2 +-
 docs/devel/acpi-bits.rst | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index fad2aff5aa..460aac992f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -54,6 +54,7 @@ Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <amarkovic@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
 Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
+Ani Sinha <anisinha@redhat.com> <ani@anisinha.ca>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
 Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 011fd85a09..1e31cfad32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1899,7 +1899,7 @@ F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
 ACPI/AVOCADO/BIOSBITS
-M: Ani Sinha <ani@anisinha.ca>
+M: Ani Sinha <anisinha@redhat.com>
 M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
 F: tests/avocado/acpi-bits/*
diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index 9eb4b9e666..22e2580200 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -135,7 +135,7 @@ Under ``tests/avocado/`` as the root we have:
    (c) They need not be loaded by avocado framework when running tests.
 
 
-Author: Ani Sinha <ani@anisinha.ca>
+Author: Ani Sinha <anisinha@redhat.com>
 
 References:
 -----------
-- 
2.39.2


