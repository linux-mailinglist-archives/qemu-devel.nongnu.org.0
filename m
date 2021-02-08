Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274E43142B8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:19:13 +0100 (CET)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EsC-0008T0-5v
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCX-0003T1-FA
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:57 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCW-0006EA-0t
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id r21so2150114wrr.9
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n0oc9vUhZzR8ZVs9lZClM6fTo+wKdeM1A7PGawhfO4U=;
 b=Sgx+8DSkrUtCqrP8HpGTVbdZORVLS5FdQy/Hj/fuGRF1ENhtPbVPghSgOMQEji+nmd
 N8ZzSV76FCIpEQjzsQztO5iUIyfRwEODz0mMdC7kvdmaq5uq9kQZ0clgMG4/X+vK/3+7
 CGUCYF1z6bdHF8VcnxRgrKoOlgtNJ+9y389zT1E2wNhgVGJABC0kzvS7ykM8LL1t9AMC
 JX1+9fAK8Nan+OJkEvtQ0RQRqV9C9YTmIEvjZzJ4i0XqpjjUpeCuv88k77fLhoWktkkW
 qIBO/QXvrZKO9tsBw6r0vscd2OuiNPPj6N71HByqoDPdTEkio0oLwj2cI7/vyvGQ+a7d
 COtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n0oc9vUhZzR8ZVs9lZClM6fTo+wKdeM1A7PGawhfO4U=;
 b=hb/DwkbtMimH5lX+BAu6Cpv+CYWB+1FmgAUdOYVGF4I7Jlomn5D3aa9HkkM1H8cgcN
 ye3dG85S7BVgbLl7mjHHu8NFpm6Qd0FYar/D5hv3x2Lb7cvqAnvtG1doJ8wMIorjJdJc
 lWUyaprwv8jLK6MWMLWDnrMNI7n8tlQAppUYgCQtU+RI3S7aC6ZSV+a/xFFjQAqpJ1iv
 Z/SLuUsbavnGrgFbIutUFvteoKsqDPI/8DAhsHzgEEWKakA5FVySJdDdH/38bT2U9LhY
 hiScMaxP8n2Hlyg5h4IzeYZxD8tczTcLY/LxY8CQX/ymz8Mx743PcmM+PV+x9nrP5y0x
 jvog==
X-Gm-Message-State: AOAM533I4/Qd2H/2bF5O34n94dKLhqevZOIgvM1FybVP+N/KbLkInzZm
 H1irrSObz34CXq9nfFjDpOnFyS6+As+WTw==
X-Google-Smtp-Source: ABdhPJxY/VIOCMS7SsNfIqSNPsbx45MZCPcMRg7JAY+O1wi0NdH7iWGcRksfGv176/sK0UL1GI+qsg==
X-Received: by 2002:a05:6000:1806:: with SMTP id
 m6mr12810213wrh.320.1612808634857; 
 Mon, 08 Feb 2021 10:23:54 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/46] pc-bios/meson: Only install EDK2 blob firmwares with
 system emulation
Date: Mon,  8 Feb 2021 19:23:08 +0100
Message-Id: <20210208182331.58897-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-4-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index af95c5d1f1..f2b32598af 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -12,6 +12,7 @@ if install_edk2_blobs
 
   foreach f : fds
     custom_target(f,
+                  build_by_default: have_system,
                   output: f,
                   input: '@0@.bz2'.format(f),
                   capture: true,
-- 
2.29.2



