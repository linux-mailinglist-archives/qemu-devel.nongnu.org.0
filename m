Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE32459F6EE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:55:48 +0200 (CEST)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQn6y-0007FL-0d
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtj-0002xG-RP
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:09 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmth-0001Wm-71
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:07 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso944536pjo.5
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=okL54vu8KfmBMW82fUAkEZfCTjhZQ+qL9qNrcu24ZKE=;
 b=FULijv6JOJ5jD36MfgHbXDe1LFAZbDtmXhukncB6/emRjx4LoHOoscfoM47iKCm5p8
 Zjjcyy8uaCSXcjMAPaphEAj2GrE5FLdouimrEu2Yjcb7cn/pDBUY1d7zo1/RSY8zmiam
 Ps/bfDefgd3YkjIycCwNhCyTREj+ltvLu9x8gttR8aG+AXhj5oEbqQqTwqCSnWQIHebx
 kDr2ycNn4H0C1UlGuhJghBicBRMtneiPfZmqC3GekAVCMPx3uqfOkwIZyPlxh5PCdg/0
 xVuePhq/2GYfTuolfg9WiIVrWxouy8cx9N63s58PY4aUXWd6gK9mTWjPs7m8nO1vAgrD
 emvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=okL54vu8KfmBMW82fUAkEZfCTjhZQ+qL9qNrcu24ZKE=;
 b=xMVOTa0BfscjQ25fRqxTNqi4e3D/erbI8UNy8Q064bB/wyZhi8/V9jZ5go4ivdVKeT
 7jQyouGGSAcgNbD9ihBXVtJbXnFK/mqLgB6cjBbpwJuaNPBfArhvswFpiIVVlIgt2pOr
 Iu+Gug+GGS8exHiqgcqv0Nf4eFVEJHavIw/c8sTYfaSucpg1gn7lxo8yEtZkBBBE05lk
 96KoorvAkhYwH3cnnyWnofpaXxw3NO8bmsVQt5Plsa3NEvqZEnn0sOfuWWM6Dqhw/nEu
 YruuJVoZ9JDqPJ0dzvi2KKnLSJfVeLBR4f0Tp8lq5YeKgYdhej4ipJF4b2hawwCR6+TE
 FbiA==
X-Gm-Message-State: ACgBeo0hebUeGZEbsfoDoo439+6UuqqeQ6FAb8ZHjKKkfxqRavbAe8FJ
 11bQuEXFyrzUGuy1eyE0XNs/k5FxtNE=
X-Google-Smtp-Source: AA6agR78K0zd6IKnw/srvkSGYqPCa3h6gsk1dDJ8TQSAdKdFECekouX+FjYs0eaKDvn+JaJvj7r1JA==
X-Received: by 2002:a17:90a:640c:b0:1f7:6ecf:33b6 with SMTP id
 g12-20020a17090a640c00b001f76ecf33b6mr7430107pjj.3.1661334122960; 
 Wed, 24 Aug 2022 02:42:02 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:02 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 10/51] hw/usb: dev-mtp: Use g_mkdir_with_parents()
Date: Wed, 24 Aug 2022 17:39:48 +0800
Message-Id: <20220824094029.1634519-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Use the same g_mkdir_with_parents() call to create a directory on
all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/usb/dev-mtp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 5831395cef..97c894f231 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -1622,7 +1622,7 @@ static void usb_mtp_write_data(MTPState *s, uint32_t handle)
         if (s->dataset.filename) {
             path = g_strdup_printf("%s/%s", parent->path, s->dataset.filename);
             if (s->dataset.format == FMT_ASSOCIATION) {
-                ret = mkdir(path, mask);
+                ret = g_mkdir_with_parents(path, mask);
                 if (!ret) {
                     usb_mtp_queue_result(s, RES_OK, d->trans, 3,
                                          QEMU_STORAGE_ID,
-- 
2.34.1


