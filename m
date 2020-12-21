Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786802DFD46
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:12:24 +0100 (CET)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMrH-0002b6-FZ
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRC-0004r0-Kh
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:31 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR6-0007kn-Iy
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:24 -0500
Received: by mail-wm1-x32d.google.com with SMTP id g25so10375419wmh.1
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=66uOa+emUn//1JHWtuNdfGgMg5Sc0RM3sGBwfJqsotc=;
 b=EJ4AYJjsM39zAhqcDEFej/7IlTsUzL5M0Tnn6IL2n4uuSQI7JPGnXtUvCzhRRhn81+
 yKGPh0M1C4w13gTSBUpqPK1YrTKSLWU6wBluIc0qjAx9oSU39EUSc0RYTVA/8O/H58Nn
 NIUke3Xt+2V3NtL+YQ3PRE9V8FDVUjVfTNPjdbEvXNvPJk9xX9KKDhNjKKbZu6r1pKXV
 F3QZ9X1mt3AyA2hlcP/2y31nMnDxHyoM49VQloUmYiAI5dX1sst09nTEjgCAQQoZujEL
 Hjy6rPGLyO2DeXyWkOH7zOwbCWTMBUhkLBokgza7ouABLY2pu6QdQSXmMXCqrytECOyW
 HORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=66uOa+emUn//1JHWtuNdfGgMg5Sc0RM3sGBwfJqsotc=;
 b=mIthKwAeorm0OqqHqoR+gQCZvTy6cOYToWGAA2ol/m1yslf59YJphOZfBUvNTewopK
 yekGvlNYe8wBvtzWsSDI4ZpCbn7D1siUVaAc9Y8/sUWxK/cBaGLovlQp3EXEVa9+7Zfp
 bJ2ttxB/vufxZqvsH/1RwNPfQBP/TRZxRw3cGGbfot80Rjfd0xi0PQhCZPxzqmNysLbK
 5d9mzH1VbnY8v3S+1pspG2Wo37AW4Fi+G5cTG9VKW0v2j94yt+HMQbI1Zr/DFW9kZ2XI
 zHhoxmYiRLUGZOEmsCoVI74CzY2rLt9uEwAupTt/Mdf3qO2r4mcJRtSWXD8H5HC0wjEn
 Rv0A==
X-Gm-Message-State: AOAM531Ulvypt5HpNZfWjKKkYWAyuzSuwC/eqJJMaHRl0G7tsbsLDF0O
 rHhkWiZHw3NfMu1zD+d0bqCO+jER8M0=
X-Google-Smtp-Source: ABdhPJwr8eWKNvl2ELJqntk37wEcG6BQaWlLWnLYHq98OU9c2mgfbzHMpKmT94jKv3lfBTEvh91hzw==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr17415713wmb.98.1608561910381; 
 Mon, 21 Dec 2020 06:45:10 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/55] trace: do not include TCG helper tracepoints in no-TCG
 builds
Date: Mon, 21 Dec 2020 15:44:16 +0100
Message-Id: <20201221144447.26161-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 trace/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/trace/meson.build b/trace/meson.build
index 843ea14495..b19309b327 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -71,7 +71,7 @@ foreach d : [
                 input: meson.source_root() / 'trace-events',
                 command: [ tracetool, '--group=root', '--format=@0@'.format(d[1]), '@INPUT@' ],
                 capture: true)
-  specific_ss.add(gen)
+  specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
 endforeach
 
 if 'CONFIG_TRACE_UST' in config_host
-- 
2.29.2



