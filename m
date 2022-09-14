Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA88E5B8DD2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 19:06:50 +0200 (CEST)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVqb-0008FU-Ec
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 13:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUu0-0001Qm-2q
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:16 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUty-0003r7-Ek
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:15 -0400
Received: by mail-wr1-x434.google.com with SMTP id z12so8147361wrp.9
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=QTQr9TtcMW+CLdYuqmZS0eZEFv1TYRf+0Q4Vht/BZfk=;
 b=Vn/onk6+J4j0X27Fgz2iYgN5LSNypw6UWZ+8Ebq6LgU9fp27xi+8fDaKlloxEqWuEg
 DXzNiKVZbFCCzs9BY3ueO08AKnynDgMWoUcFit78uPQYyiUaKAebVW+bxyWRPV9gQwSI
 7I/TL70LoF/e+cVQGA88tvUenSazwZyLjIoQ9rMXnfBI3NLVDtA074cKbnvdag+3QIdY
 KDg0PGpMAI9Twzb51Q/by3/1qqNqoZRRdXU6B54crDOqRD2BI2u23buQhb7GIBSB/coS
 pg8YLVks4XqTYHTUhwV7PmloT3lcOT9DOth63Y6fSbf6Kp6oDbYRZsoqrhOvCcDq/GuQ
 uaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QTQr9TtcMW+CLdYuqmZS0eZEFv1TYRf+0Q4Vht/BZfk=;
 b=zMOJ7ZgqwM01ORdFT72F1B+fh51xU712YEjbafSAv494oPEkCWg/yjakfdkuLWaFnj
 Sxksz7Hnt1GXO2ymFgOr7M+WMnOgZkzLcvxP0yGTDJtsXQm/m+SQzHAnCIaf/au+uXJj
 y4pI0NhPsDhxbK/fn87FZocKdylCyfwwfUUdM5GAp10DlM6k9Fjuw5yCDX1VfjYVwuqJ
 8UjmcwUnAE8w61/luueBo6vRKA/vOOSyOYDVQUBHD1weQJ38+18KWak8hEbj14cWW2x5
 OY8Nt0sU9znrx5Q4iC3RGvXu1Sxd2fwpfZzTPZfN1cC+4cgwEuYNWMRezxn+bnbS3egb
 I4gA==
X-Gm-Message-State: ACgBeo2M53Cp/Ts5Ze6fsrs0lEAEcuHqxEIU8JyWUnhaIa7AfxjYm3Da
 x1A83H3LfkQSw0XiwY/T4oP+wg==
X-Google-Smtp-Source: AA6agR5JOQJMROHxyttdtf8iHPAOCi7t10RfSvQdLDJbUg2HfuJiXzAx3TPd6f60kCdMnb0LppFFNQ==
X-Received: by 2002:a05:6000:1d9d:b0:22a:745b:9f00 with SMTP id
 bk29-20020a0560001d9d00b0022a745b9f00mr10579090wrb.280.1663171572977; 
 Wed, 14 Sep 2022 09:06:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a5d684e000000b002287d99b455sm13638515wrw.15.2022.09.14.09.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:06:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EEFFB1FFCA;
 Wed, 14 Sep 2022 16:59:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 18/30] configure: explicitly set cflags for --disable-pie
Date: Wed, 14 Sep 2022 16:59:38 +0100
Message-Id: <20220914155950.804707-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This is working around current limitation of Meson's handling of
--disable-pie.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configure b/configure
index 575dde1c1f..6c169b23b5 100755
--- a/configure
+++ b/configure
@@ -1394,6 +1394,12 @@ else
   pie="no"
 fi
 
+# Meson currently only handles pie as a boolean for now so if we have
+# explicitly disabled PIE we need to extend our cflags because it wont.
+if test "$pie" = "no"; then
+    QEMU_CFLAGS="-fno-pie -no-pie $QEMU_CFLAGS"
+fi
+
 # Detect support for PT_GNU_RELRO + DT_BIND_NOW.
 # The combination is known as "full relro", because .got.plt is read-only too.
 if compile_prog "" "-Wl,-z,relro -Wl,-z,now" ; then
-- 
2.34.1


