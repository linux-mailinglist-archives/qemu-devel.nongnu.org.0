Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF50300E3B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:55:32 +0100 (CET)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33St-0006L1-2U
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:55:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33Io-0004xo-TU
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33Im-0002Z0-L5
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kURzPHbdlK3pgCJTiRRaYFTKsXwjZMTK1ZXIH+DPao=;
 b=J/gytzk2KbdlVIIaIht59Vlnqanw64DKSs5uh+PuHo7Yhf6jMw/QCQzqZqGlmrQHoE/oFT
 UWlONKr2iBy0RZkZHAS7klthbnpiq1nKk3nU9FKt3qnJY7Jov64VXlHxo+2tt2tZodB44a
 9glcHT8aEecubAYHCAJPRwRezrPq6Ds=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-cVud7Qa_Ntacn2LS5u92bg-1; Fri, 22 Jan 2021 15:45:02 -0500
X-MC-Unique: cVud7Qa_Ntacn2LS5u92bg-1
Received: by mail-ed1-f72.google.com with SMTP id u19so3009994edr.1
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3kURzPHbdlK3pgCJTiRRaYFTKsXwjZMTK1ZXIH+DPao=;
 b=eUPBI56kFkiHa8Jyw8DOdzK6tnB69k4+AuiEZg4LupHOueeiEj6PVoW8SUTI4FJAuJ
 PfLiKgVxUthG+FckuG7fpfw6LTUgvn9cpo3xNF2lYvH8cI4iAD6M/7NvW45IHeA650gn
 AULv5gXJAdOt6gzv3lTiQjNGRoKufg5VJLN2mWI0u877xoSgMegv4jdvA3k7BAGp9Mnx
 WTddfGZJi7le28YzPzzqLZAwBxMYByPc4Xp9TmSYaqogo5q+6/i4+5/m/P8cB41Vrji3
 OzC9D0Qo6OZ/JfONaSbTDMzcZbHrJgyNL9/AS0R4hUN1dBD+AZQMwj2GrTfSMqcsOh7b
 ocrw==
X-Gm-Message-State: AOAM530XBu84U0Aj1Vk+E0GG35yC0+brdg1aYKxSU5jkLFWveKgj3oTl
 GbA1FkTe16pqpg5dWxLD5pZK9yrXhHRAGudTs2Ph/8JuBxDwlfVk9XZnAytYL9OSt/K6MnmxeGA
 PqDl8M/f5rl3FwVOeaeLCTqNe4LGrVxSxLRElVLKwre6cS35emFsM7drhZnF4yb1j
X-Received: by 2002:a17:906:7948:: with SMTP id
 l8mr4217804ejo.550.1611348300745; 
 Fri, 22 Jan 2021 12:45:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzls3OSuF/1kperLWd+fSlt1DW0u3sCAM6CW9/FGOBc4y7bXj06+znAUR1F9A6OtkAJIe7vkA==
X-Received: by 2002:a17:906:7948:: with SMTP id
 l8mr4217789ejo.550.1611348300582; 
 Fri, 22 Jan 2021 12:45:00 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b26sm6142250edy.57.2021.01.22.12.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:44:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 03/12] pc-bios/meson: Only install EDK2 blob firmwares with
 system emulation
Date: Fri, 22 Jan 2021 21:44:32 +0100
Message-Id: <20210122204441.2145197-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122204441.2145197-1-philmd@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 pc-bios/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index fab323af84e..68705d405ce 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -16,6 +16,7 @@
 
   foreach f : fds
     custom_target(f,
+                  build_by_default: have_system,
                   output: f,
                   input: '@0@.bz2'.format(f),
                   capture: true,
-- 
2.26.2


