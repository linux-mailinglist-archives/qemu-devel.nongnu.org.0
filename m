Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD742ADB53
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:10:32 +0100 (CET)
Received: from localhost ([::1]:36662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWE3-0007cv-AE
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6N-0007nu-Kk
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6L-0003cG-P6
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZvBlC86u+yflUoEDDwjwBDYpXKvsqgU3ulE6tVASm4=;
 b=VgrjqfCHaBSYDrFGVWvtxem35Hq9iPkqcT90BbYZeNmIWqO/7le30Nxhya8E7yclpzWoAo
 wXd/gcl3ffR6n6xf6jB8qeNCOU2DDHT/1VyjCiSfpHFIF2E7t1Audc7AeSoaKkag9y5JaM
 950lF1FzSBel9LxPQgQc908wOb4l3ss=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-IHRA79wFPx-wvfd2C8ciSA-1; Tue, 10 Nov 2020 11:02:31 -0500
X-MC-Unique: IHRA79wFPx-wvfd2C8ciSA-1
Received: by mail-wr1-f69.google.com with SMTP id 67so5909600wra.2
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ZvBlC86u+yflUoEDDwjwBDYpXKvsqgU3ulE6tVASm4=;
 b=WaQpI/5oj8E9lahlXndrCwvIOYmNCg+VGXWwA4bs2w0UXIMgysPlL/+UtxTciaZeHc
 G5VPQgkQKEl/bOCyp9itduWtbO/Gb/rsqiqrQXXDMClN2MYfGk51gJl5576pessRCUh1
 ZGjaUjnZOLRYgrB8mBxT79i2Rhn9K17NCDLHwjpCyyZNG1wtB+Mb3+S3ifAqt7pg+Dz5
 CZlt/QCKzSWp6CLwL7ZcBMvGl/XrWBABV3gPZZlKI+C3QkKNN/YdLXOSlUE+0FrlwdKE
 FaOhBLIQl6hUyYjmCTZGQczyuImgpLsqcC+SCHjEWup5KIHmZ5NiVZ425FL4ZZVfDjmO
 BL4g==
X-Gm-Message-State: AOAM531cBx9qZ2xDEKomySBcmr3UdH+AZgcB94w5PZlcQf3av+HX7P0Z
 4sMWY2233G4wBs6voDMJCi0EbTxfdCzOEKHjQ1eezcy/WkkQ+3kDZzsv5qemXpOq8BCmzCrMUVu
 rdveARncTxVbeyZKnmOmn02xjZFfLSxDLMuh+NPgbX+hlPZBX7PYZPovGzL5tmtlc
X-Received: by 2002:adf:f181:: with SMTP id h1mr24053277wro.267.1605024150166; 
 Tue, 10 Nov 2020 08:02:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHssJwroES16/YzzvypYwNh2J0BKWYgskXf9jo9L+Ap+uM014AbbKTufgZhKsNuURTJflfUw==
X-Received: by 2002:adf:f181:: with SMTP id h1mr24053242wro.267.1605024149901; 
 Tue, 10 Nov 2020 08:02:29 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id i33sm17985318wri.79.2020.11.10.08.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:02:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/16] gitlab-ci: Set default workflow rule
Date: Tue, 10 Nov 2020 17:01:33 +0100
Message-Id: <20201110160140.2859904-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110160140.2859904-1-philmd@redhat.com>
References: <20201110160140.2859904-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Bin Meng <bin.meng@windriver.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to to be able to change job rules. To not
forgot anything, start defining the default rule.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7404f95bebf..2e631d4f160 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -7,6 +7,10 @@ stages:
   - build
   - test
 
+workflow:
+  rules:
+    - when: always
+
 include:
   - local: '/.gitlab-ci.d/edk2.yml'
   - local: '/.gitlab-ci.d/opensbi.yml'
-- 
2.26.2


