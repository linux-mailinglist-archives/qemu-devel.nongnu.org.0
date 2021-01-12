Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2832F370D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:27:33 +0100 (CET)
Received: from localhost ([::1]:47218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNS8-0000nx-3J
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG8-0003gp-Nt
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:08 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG6-0004ur-0x
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:08 -0500
Received: by mail-ej1-x62a.google.com with SMTP id e18so3129692ejt.12
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yU3DWehqSKIeVr/KsiVg9solrgmhBRL/G+zOPd0pjuU=;
 b=mw4RwrH+o2U9FSieWzvt79uGPHS+L4k5B7RQExAEMSIqfLXDarczhPjie59kSUEKwH
 kzC/ahp61RF0CKrUmyHWTJBJ281J8NXpKhSTpNmkKdtTlxGXA3wn8lqDjRnHwEXbH5cf
 Rlt/gJSHGJ/HKl8ITKKcHe6ZOdkCnUYtXtSF0VqAWomjNVfVno6440ZTAPnHw74jGXJG
 J3WQ4vvcnqlwSMsAi8kOiDwI55cG71cZv7q4NXt68iTIX80sH+3kngD8Bwk1tKzoUyV7
 BQqjkyNFRDPVZBzrKDkG3YP/pdT87ak1QulyGrQNZf/yaZfHMCZfzz+tsQFOV1wCrIxC
 EW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yU3DWehqSKIeVr/KsiVg9solrgmhBRL/G+zOPd0pjuU=;
 b=QFKlxeSnUiDXNj5FtKhSEKYZMbPUizVcw/6VxIDNWXTunkvYYbomZr3/m6RvRvplsu
 coKOpqlJJLDhKAUQemAojsI3i/lP7+mAI8Gtss3UWDOOYGzRK0YAXmJMDPG1yw3kHSYR
 Mwh5W8SjDTD62/4b+kyXFP2R8sKkaZHqQo6LmQN4VmjuooLOFX7E8Ix3KZq21QhogHwI
 YyG6k3cSDoDch99hQRRibMOjDlijpuPGbWFoOqK5EwdR2pVIv4JanLI1OfwPpb5De5NQ
 WcfL/DCf9z8nplP394nMopKoOHk8DmWRr8QU9GUsw8MIbocKP0ISX2AXU7p+pgtehj8V
 q+BQ==
X-Gm-Message-State: AOAM531LoUHNM5OTLT3nSTkTjguxir/ARzOB4v8xodsKwHw/qt82eP2h
 E209cfL6/Ovc4j9CNDGWEP69bU0yiMXIGg==
X-Google-Smtp-Source: ABdhPJxgyPrEbDkmegZldmkbJGB7xOs+5QUSkSObyzKNkLEcJE9NDoCQ33Ou+fMt7EQhovuHIzVJhw==
X-Received: by 2002:a17:906:d81:: with SMTP id
 m1mr3986125eji.550.1610471704771; 
 Tue, 12 Jan 2021 09:15:04 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.15.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:15:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/20] cocoa: do not enable coreaudio automatically
Date: Tue, 12 Jan 2021 18:14:44 +0100
Message-Id: <20210112171450.791427-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the automagic connection between --enable-cocoa
and enabling coreaudio in audio_drv_list.  It can be
overridden anyway just by placing --enable-cocoa before
--audio-drv-list.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index 5860bdb77b..10f43d59fe 100755
--- a/configure
+++ b/configure
@@ -1149,9 +1149,7 @@ for opt do
   ;;
   --disable-cocoa) cocoa="disabled"
   ;;
-  --enable-cocoa)
-      cocoa="enabled" ;
-      audio_drv_list="coreaudio $(echo $audio_drv_list | sed s,coreaudio,,g)"
+  --enable-cocoa) cocoa="enabled"
   ;;
   --disable-system) softmmu="no"
   ;;
-- 
2.29.2



