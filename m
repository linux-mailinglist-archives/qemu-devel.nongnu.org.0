Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7774444A1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:25:18 +0100 (CET)
Received: from localhost ([::1]:46362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI8b-0003l8-Sa
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp8-0003UX-Qp
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:12 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp3-0000gQ-AQ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:08 -0400
Received: by mail-wr1-x430.google.com with SMTP id d5so4079793wrc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=615AKc7cJa2Nmp/k3mK1vf+yM3PqWLTGp1nXFg7+mVY=;
 b=oLICi/kJH119FlodCOz55nHw8f/O/cwk6LMHcUL/9I542m93VGt1n4Xm1wLsNmBaBj
 A0v1ZC8AkhynKPikOlOLAK/o3UyDnI7O0WQMuJJeqKOdW7VbMz2pM66qAsgvLvFu207e
 Ouf6QaLVa3aEmrgQ/3MRYpjCYvckXWfXfIACxPj1ECQh6KmfNGpoK+T4ybFonHKnLmrr
 JdKCbFqVA47YK3Fx1Ct+VVxqvTX5JtKy1i8HB6bFTMmWzjH0+tOlfSz44eFYOyeUwPKJ
 HuJEF+hSqKLRpvaxUIBTDIrOuZrW66teJz5Gw+Ky5gfauWdkvIYrrcEH0m29WMqU3pC4
 x0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=615AKc7cJa2Nmp/k3mK1vf+yM3PqWLTGp1nXFg7+mVY=;
 b=7FEUPUOcQNZQRF0KHTxQHU8ZgCLcWCTEeCzvG+3eqns9TOIpHM3krWnfVkZ8uA2RH1
 aFI6iQbx9BMoznWpJLpkmVBgIYM2iMra4yH/8wwkX88XoVyp/dhoIisPnF0LhbzVPG4a
 GEv3o6M66qq20Ik6kq/62J3HyLFjXp2X3c6TzGKF0uWfvu+IFPe6x+QVbrKarxo2wVCC
 qaqdaWvy66iYO/5xXpPPT8VbrrHRPV15aKM9ZrgHFM7xwTvjouIkSMxQV+ARQG3E3fFF
 nwaEWNZUWxHF3TrmQCGBOGcx7km/zVhOoPaQhs0sKXZNfzwRXoiAAI44fWldOqRK5Wv3
 9H1A==
X-Gm-Message-State: AOAM531DSWGn1Qte6yOdqFPigpbB6daJ2WnCVkLJbNTO70Ipn4gM0cIg
 BXWkvAABtKYul5ofgyvhDx5MY9gphDA=
X-Google-Smtp-Source: ABdhPJyU18acUgg0THlx9B8JGi0+kkdMt7AMYRyDg7a/yNk9WjPpUXHYOHV8/QXyQ6W/nJpL1DcWcw==
X-Received: by 2002:a5d:6902:: with SMTP id t2mr15387757wru.317.1635951904004; 
 Wed, 03 Nov 2021 08:05:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/27] hw/i386: fix vmmouse registration
Date: Wed,  3 Nov 2021 16:04:32 +0100
Message-Id: <20211103150442.387121-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

According to the logic of vmmouse_update_handler function,
vmmouse should be registered as an event handler when
it's status is zero.
vmmouse_read_id resets the status but does not register
the handler.
This patch adds vmmouse registration and activation when
status is reset.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <163524204515.1914131.16465061981774791228.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/vmmouse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index df4798f502..3d66368286 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -158,6 +158,7 @@ static void vmmouse_read_id(VMMouseState *s)
 
     s->queue[s->nb_queue++] = VMMOUSE_VERSION;
     s->status = 0;
+    vmmouse_update_handler(s, s->absolute);
 }
 
 static void vmmouse_request_relative(VMMouseState *s)
-- 
2.31.1



