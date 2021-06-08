Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323A539F792
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:19:26 +0200 (CEST)
Received: from localhost ([::1]:52776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbdc-0002nV-0L
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbay-000834-9G; Tue, 08 Jun 2021 09:16:40 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqbaw-0001v3-Kj; Tue, 08 Jun 2021 09:16:40 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso1936491wmg.2; 
 Tue, 08 Jun 2021 06:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/T+WzI/t8Mf28zcKRtnur9X7J1V8blJ53LC+b/8bDvE=;
 b=Hf1JpuK1kJ0tHbj8JHe6Bn/jOS4zXjqFBzMbA7djWDYDJwIVuYWNDONUoL7QrnqBkM
 7zsKOeo/B255UfSefv7hEQ1FbO3vxHj1V35B8yOLEtJGcms/1Etgp7oX0JI64XwF4vxR
 JO5LH4osEs2bzEx2sR6Hd99+SyGzkUi5k+OpAY/IkKFm1EjuxrCThd82KTKEoJ0hi/2l
 o0aE5rb8TvHM15I18uJR3qGV0Wzi7r1Jlat6F0CfBuw1UhsVQ8VlJmVPQVqAq8RaEy6R
 yg4StLYcYPE1crSQlteLSwx9kZFPyyI5Bh2dj7to4F34SkXM3drRsR7N6aZ+uzAHP+nN
 mPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/T+WzI/t8Mf28zcKRtnur9X7J1V8blJ53LC+b/8bDvE=;
 b=mubOOGfkjKbxLYtm+5l4132zN6pZbaMRLgzbcxHAa6OUkYpBpEE1smloyCMqODfpDQ
 OBJYtjX3RraddSjyjr8T9WNZzocnDgUMXYdcYKV9ZhFuqSHLpzmp2mExDSmMCjSiOMW+
 0msc7jU2BO6A0B3kwP24A3irwdpAjx5hvmd+kF9h4QpIH8ZLcAReZg6CL7K7V2fw1QBk
 h6m0prg5tl2GRQh42iq6RaD1XjLkswr1zdrfK46Rujcl1Ofvz9aJL+L4wKOagObBoWDA
 eQw5r8tUVteQghx2FBm0cnl0NX7yJJSzXKeYfU49EUijQUyjN+F7QeL0EQdd6ZKfmEXp
 WE2w==
X-Gm-Message-State: AOAM531KIZtyY6PHMzYiNDWFqaOgOeGjUtfN5WhYn/b+n5vBKzwvRpL9
 vJf90fx8P39/BdkjZWBsS75zH2SrlizpIA==
X-Google-Smtp-Source: ABdhPJw3H8ZZnw8C4vlHle6I0OPh2Wu1dy0j4PodjhgVjGF1LQ9ophu/FJF0ScIeAj7xnPrNWhwPRQ==
X-Received: by 2002:a05:600c:1c1b:: with SMTP id
 j27mr22509351wms.133.1623158196984; 
 Tue, 08 Jun 2021 06:16:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i9sm15855686wrn.54.2021.06.08.06.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 06:16:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] file-posix: fix max_iov for /dev/sg devices
Date: Tue,  8 Jun 2021 15:16:28 +0200
Message-Id: <20210608131634.423904-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608131634.423904-1-pbonzini@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though it was only called for devices that have bs->sg set (which
must be character devices), sg_get_max_segments looked at /sys/dev/block
which only works for block devices.

On Linux the sg driver has its own way to provide the maximum number of
iovecs in a scatter/gather list, so add support for it.  The block device
path is kept because it will be reinstated in the next patches.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index f37dfc10b3..536998a1d6 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1180,6 +1180,17 @@ static int sg_get_max_segments(int fd)
         goto out;
     }
 
+    if (S_ISCHR(st.st_mode)) {
+        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
+            return ret;
+        }
+        return -ENOTSUP;
+    }
+
+    if (!S_ISBLK(st.st_mode)) {
+        return -ENOTSUP;
+    }
+
     sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
                                 major(st.st_rdev), minor(st.st_rdev));
     sysfd = open(sysfspath, O_RDONLY);
-- 
2.31.1



