Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7381335146D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:25:07 +0200 (CEST)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvRh-0002Q0-Na
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPE-0000jU-3q
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:32 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvP8-0006f7-Pi
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:28 -0400
Received: by mail-ej1-x62f.google.com with SMTP id kt15so2290969ejb.12
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1IcJHZyWpO/pWzAWPdVNwmrH82JES7JifZR+yxZDkO4=;
 b=Mx7pugEdrtG+Vwkxd754jIWT9HUuoeR/Beh4jwjzcPuIRtBLyaf2Rfzin9vD8HgBeB
 pOE3dYjj5bs3Tw5ICyyKu1kGmmUcnucdGfTIzP15BAaEQc/i3ML09HeZHOq8dbkBxmbd
 VT7rDENcD0YJrfxIp3v60en4fozV++Lr1wlkBaZ6HWKqEpD6gaMwlb8SXgTIWV9siGwa
 rtoU6NlkbPsAXLfbzmaZwlj/X+sfHoslwRn+pNkO1kFZaEkT+6f116Vdg0aI5zq3OxJE
 s5toSj7wThsjQUX2bAhUim2/RYO2fowQY+4qhy5Q9wcUQhTT07Ld2zqRLAHqtubrJsc3
 tFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1IcJHZyWpO/pWzAWPdVNwmrH82JES7JifZR+yxZDkO4=;
 b=d9OW0dPQwJTE9z/nC6XsSWv7XWHZaVCvhXKpilimznnlTKn4VzYjGZdivSbXShHF7p
 QqapDZDDWa/cACKpzg9hMM+l115IH+ol+dTsSbND9ohtBrCg/WWn8WdUBiLdNHIxk2iI
 AGAyHT0Z9p9TzKpl5a89ksq9mAvxaaDPgpKCW/P4WNOQx7TLS5LEj+gsZzOrjGh/k7vV
 hHbLSLPglTRBurtr1Qk1l0uunnHGQgzljgQ9Nszlsjd/Veg5xNfDS1674afa3oVkfmHe
 vOFi6EWXGAt7UDYsYjXQXlGhfey/mW1qBTxx0/iPcipJlX/DtO3qOUxd6sWyGaami5ZW
 P/ng==
X-Gm-Message-State: AOAM531CvBLHaawaw5WBUfqDsYph6Q64rlbuZrfOO9b0HlrOGYpP8pIH
 hPQvLh1gT17/gHE+YYWkaqArTAHCQFU=
X-Google-Smtp-Source: ABdhPJx86jexRrzV6LPGagGURyZ6V+ipLYVAc4qR5Psnck/LP1cS+UmTADfxQA/H/4942Vg8aUFoVg==
X-Received: by 2002:a17:906:4705:: with SMTP id
 y5mr8645653ejq.119.1617276145690; 
 Thu, 01 Apr 2021 04:22:25 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] meson: Propagate gnutls dependency to migration
Date: Thu,  1 Apr 2021 13:22:12 +0200
Message-Id: <20210401112223.55711-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
References: <20210401112223.55711-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jessica Clarke <jrtc27@jrtc27.com>

Commit 3eacf70bb5a83e4775ad8003cbca63a40f70c8c2 neglected to fix this
for softmmu configs, which pull in migration's use of gnutls.

This fixes the following compilation failure on Arm-based Macs:

  In file included from migration/multifd.c:23:
  In file included from migration/tls.h:25:
  In file included from include/io/channel-tls.h:26:
  In file included from include/crypto/tlssession.h:24:
  include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
  #include <gnutls/gnutls.h>
           ^~~~~~~~~~~~~~~~~
  1 error generated.

(as well as for channel.c and tls.c)

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20210320171221.37437-1-jrtc27@jrtc27.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/meson.build b/migration/meson.build
index 9645f44005..6fa2f8745d 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -24,7 +24,7 @@ softmmu_ss.add(files(
   'savevm.c',
   'socket.c',
   'tls.c',
-))
+), gnutls)
 
 softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
 softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
-- 
2.30.1



