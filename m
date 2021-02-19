Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13331FE60
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:52:41 +0100 (CET)
Received: from localhost ([::1]:37032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9xI-00085R-IS
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kr-00030Q-Pt
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9ko-0005hX-My
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m89dmrSplgkgoyBA9XFoMMYsKZX69TbxEanq9oDkcW0=;
 b=JEKKxhMc4fPJKMm8IN1nbv2+K5pOJGMwCJpYZ3by1SgsbEYLRuEpDK//Q2ZmcQHmTlZe5h
 0pVMeyHrg6cpiUfX90g3lutN3L4jh+VYpMbz12nyaUoBkiAs7aw68Qdhu8VkoWFUJYhe0+
 Cc7PtECKSByiWWyKTW/d6gqn9e9Nxqo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-u8Gt22P0OaC9GMMfnzOgdw-1; Fri, 19 Feb 2021 12:39:43 -0500
X-MC-Unique: u8Gt22P0OaC9GMMfnzOgdw-1
Received: by mail-wm1-f69.google.com with SMTP id o18so1443053wmq.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:39:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m89dmrSplgkgoyBA9XFoMMYsKZX69TbxEanq9oDkcW0=;
 b=FsQ/qJwCmJtUpIq81Kz739noFhMOivi0h/oizOOmKy0Wom0whLHRHsvsKbCe8mmHJ4
 nqs5XwNlK2OBTGMce0WV/OH0oS7+PJwz65ROrSCMRPS0HJpUNm8ZMJRoDAk3LKZX1mNq
 5N1us2tgXDfsdZvOxPoI5LR5oS2WV4ogZ4A0b1PqXmHcIPAwS8vOgG2xzx2aZosjoNkJ
 5AjKbFYDja9MV5VD4lqXEMEWbRUtsM74c1OTcX3L/QzOI9pZ2KuMJBaVp6teeN0NcaND
 Ualmb+LAniXNeVgnH+yi3otPvPbCNGHpu0+rNsDgPcL+G3MpMhyGH8kMIZ9/cAQrzK4K
 dXZQ==
X-Gm-Message-State: AOAM530whxnTFn4TK2EDDJdCRMcDwZWOTB6/Y7/6s1BaZIZeAL0OgUEU
 RgZvYEQvii5noZ7GPJPStpm8oLpvgEwwbIMF/z9k4VP9A9bgMoHX1aKtIZt42I4C3bm2lWYN93Z
 EDw/Zq5aegiB6yb8J4D8QRED8Metje4JTbhBoqGSKVrTzVjcQ5bGhe7tvyU5fOdY9
X-Received: by 2002:a1c:c6:: with SMTP id 189mr9272338wma.128.1613756382399;
 Fri, 19 Feb 2021 09:39:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfL/zeX1Twd/41yRwfBzbYwswnUhtDRMBecaJ3a8NHeinaw0+wzScyZWOOrq01liX3KOGGMQ==
X-Received: by 2002:a1c:c6:: with SMTP id 189mr9272291wma.128.1613756382214;
 Fri, 19 Feb 2021 09:39:42 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b72sm13082236wmd.4.2021.02.19.09.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/11] hw/xenpv: Restrict Xen Para-virtualized machine to
 Xen accelerator
Date: Fri, 19 Feb 2021 18:38:45 +0100
Message-Id: <20210219173847.2054123-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When started with other accelerator than Xen, the XenPV machine
fails with a criptic message:

  $ qemu-system-x86_64 -M xenpv,accel=kvm
  xen be core: can't connect to xenstored
  qemu-system-x86_64: xen_init_pv: xen backend core setup failed

By restricting it to Xen, we display a clearer error message:

  $ qemu-system-x86_64 -M xenpv,accel=kvm
  qemu-system-x86_64: invalid accelerator 'kvm' for machine xenpv

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/xenpv/xen_machine_pv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 8df575a457c..d7747bcec98 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -86,12 +86,17 @@ static void xen_init_pv(MachineState *machine)
     atexit(xen_config_cleanup);
 }
 
+static const char *valid_accels[] = {
+    "xen", NULL
+};
+
 static void xenpv_machine_init(MachineClass *mc)
 {
     mc->desc = "Xen Para-virtualized PC";
     mc->init = xen_init_pv;
     mc->max_cpus = 1;
     mc->default_machine_opts = "accel=xen";
+    mc->valid_accelerators = valid_accels;
 }
 
 DEFINE_MACHINE("xenpv", xenpv_machine_init)
-- 
2.26.2


