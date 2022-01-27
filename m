Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB4D49E0DB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:28:38 +0100 (CET)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2xB-0002c8-IM
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:28:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fu-0006lj-2C
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:47 -0500
Received: from [2a00:1450:4864:20::432] (port=38486
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fp-00066y-Ux
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:44 -0500
Received: by mail-wr1-x432.google.com with SMTP id c23so4080675wrb.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0qQTl1Wmpww8I6zctLdCK7C2s/OXLuCsycoHUgco2G4=;
 b=k8LcvCcbp4NuhWdgtyrMg0U372uJBwi6CpsYnGNTe6YNNElQOIt2gK+HU8O5kNeaCj
 KVT77hZeQ1xM5TO3WoRGnVFv6gKohg/NhEpmxGV0FTcq59+D1fKQzgKT8NLwUqQrO+TH
 Syw1iC8STzf5qJmz01ah4p3o8m3j1uLXQ+xWglsnmB4Qp4xlfgOCnBu4w8cJehcW0X/z
 cm1Hwhciqgv1ZDvyPUEmR/fIW2PQtUtkfb7Jm5K5+fRk68hd+hIN+B+HdNxkxxe6Gl7c
 VR91/bRFBvguzKWOfO3wtPQ11XnZhpaYAiKMz/f1guvrP1G/t6mHE6YbhxoZa6k4UaG+
 XlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0qQTl1Wmpww8I6zctLdCK7C2s/OXLuCsycoHUgco2G4=;
 b=nzhNTB6CG/AyubC1Sky39r2Ftc0PNcZifHe0SCJXSSuuEk629jKTIFMvRjbDFOJOC1
 RQT4I1jBbQvtQdGRiTEo4P3A1OeljRhTxHGpOqPKZC7tganOnEvGWeSB5b2LaLZev1Sp
 sPARpq2SgeIo12ruN/usAtCTI8D3dPC7ssRwmRk9N0NWnp45LU4/dOkmQl7ckqOylR7i
 8k91bmL7/p/4iJZXdHYGqEQTVEPmKk8zSfb74rlafb5Mks5wqg04Ue+Eq1e4DqJzeldo
 619wz1hlS7DquRB61xXkbJhG7DQf+ns3DPKD3RWDC4tiAb6SSaYE87KBRttqQXI8rSuw
 tZeA==
X-Gm-Message-State: AOAM531qVbWZAMynZkQ9sGJ2RspZvboFl2jCZ7doMntYXz2Zd5i6NBi1
 tG/ojd6M5PhS+RC6lUaTY1DzXikW/jE=
X-Google-Smtp-Source: ABdhPJxm2hJm0z67n2i9HUPqf7mvmFUn3XUdPqYg0syIgN1AlUTee0ow3/xZDVV2jAf7qCclAFF29Q==
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr2568553wrd.374.1643281840647; 
 Thu, 27 Jan 2022 03:10:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/14] build-sys: fix undefined ARCH error
Date: Thu, 27 Jan 2022 12:10:25 +0100
Message-Id: <20220127111037.457901-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../qga/meson.build:76:4: ERROR: Key ARCH is not in the dictionary.

Fixes commit 823eb013 ("configure, meson: move ARCH to meson.build")

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220114084312.3725242-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/meson.build b/qga/meson.build
index cfb1fbc085..613ecb9802 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -75,7 +75,7 @@ if targetos == 'windows'
     endif
     qga_msi = custom_target('QGA MSI',
                             input: files('installer/qemu-ga.wxs'),
-                            output: 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
+                            output: 'qemu-ga-@0@.msi'.format(host_arch),
                             depends: deps,
                             command: [
                               find_program('env'),
-- 
2.34.1



