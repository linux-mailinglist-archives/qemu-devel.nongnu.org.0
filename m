Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53CB69F6C6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:39:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqGQ-0004kW-64; Wed, 22 Feb 2023 09:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqGO-0004jQ-Hw
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqGN-0001JP-1j
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voGYHUqY1hoGfNH4kKgpNS0fmCCnJR+lfR7MiFf6yoU=;
 b=HOwMd7ktJEzxhd4zPYdSLlU1MbB6iSyOgVkQxdxyTiDxW3KCdUyesumyDhhb6KKYGofhkW
 xUeFHiqwwgeVa265am0AeSLuTciMy//344TRx4PEoiU7ZtkCIkpXNqlhJmekkO/FmuTA5Y
 fX1WcDRtWobl6ukQ7i0Jp9mX/AkkFVA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-rD6Pbie9PtunupFBEf4MiA-1; Wed, 22 Feb 2023 09:38:29 -0500
X-MC-Unique: rD6Pbie9PtunupFBEf4MiA-1
Received: by mail-ed1-f72.google.com with SMTP id
 ec13-20020a0564020d4d00b004a621e993a8so10827399edb.13
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=voGYHUqY1hoGfNH4kKgpNS0fmCCnJR+lfR7MiFf6yoU=;
 b=s57+kUGT1fwRCsZRN2Dih5JeELyUA5832Opzo4BW7EkucPv+gV+ZjtFG2FOg5lBtej
 ETu3t5qDvnA6a9hnZ8CivKArnPKGBbb0ATLcJcrEow1uv0lxPdOUA+Bw0v/Y4jkxF32n
 ssG+gQT+Py/8goww/rX+Zw7EgLRY7t70fmQaWMWGtqsMb2hsX6IZzFvy8ewHK1jQBxv6
 yYqpPh7MPIM6jtnWzuBLcJsHXZBeik4A3qPXgRzIKcElQ0bi+xrogrZeVQvbxtvnBtkI
 25fvjBfYLs9UFGD0bg07A10IoNKHaonBvs/HMoi/9IILae0NVcDtVtu1GjItEgbxSLn8
 UNRg==
X-Gm-Message-State: AO0yUKUXeKpvnbhhRffpq9tXRdcZVCfzE1FCCyEUCarE3LV2G8ESRTjk
 gnoRZWa/tlekl5Lxn9Pwl5jk3Xz9zOCP8yZRTIZUZJYekvabPJrN26ekisf4mEyEBdQP1tXO3Iv
 ILnj0lQtRfNFlFaPCY/4UblXFIjZ4ZGUwzfoVfvy6/7nh8murBrrR60lnkhSInlcMQGAwPn5X
X-Received: by 2002:a05:6402:551b:b0:4ad:738b:6706 with SMTP id
 fi27-20020a056402551b00b004ad738b6706mr7215027edb.2.1677076707599; 
 Wed, 22 Feb 2023 06:38:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+vm+dRXwCgXCY9An9SjeKVLUEwuUDQfXEdbWjdoOPjuR5wc69qcT7OfbTIJwhMb20aRoe1kw==
X-Received: by 2002:a05:6402:551b:b0:4ad:738b:6706 with SMTP id
 fi27-20020a056402551b00b004ad738b6706mr7215010edb.2.1677076707386; 
 Wed, 22 Feb 2023 06:38:27 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 y17-20020aa7ccd1000000b004ab1f97ca2csm4215220edt.60.2023.02.22.06.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:38:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/10] configure: Add courtesy hint to Python version failure
 message
Date: Wed, 22 Feb 2023 15:37:52 +0100
Message-Id: <20230222143752.466090-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222143752.466090-1-pbonzini@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: John Snow <jsnow@redhat.com>

If we begin requiring Python 3.7+, a few platforms are going to need to
install an additional Python interpreter package.

As a courtesy to the user, suggest the optional package they might need
to install. This will hopefully minimize any downtime caused by the
change in Python dependency.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230221012456.2607692-3-jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 476d8a38b900..87d0b3ee817c 100755
--- a/configure
+++ b/configure
@@ -1070,7 +1070,10 @@ fi
 
 if ! check_py_version "$python"; then
   error_exit "Cannot use '$python', Python >= 3.7 is required." \
-      "Use --python=/path/to/python to specify a supported Python."
+             "Use --python=/path/to/python to specify a supported Python." \
+             "Maybe try:" \
+             "  openSUSE Leap 15.3+: zypper install python39" \
+             "  CentOS 8: dnf install python38"
 fi
 
 # Suppress writing compiled files
-- 
2.39.1


