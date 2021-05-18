Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D543387440
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:44:39 +0200 (CEST)
Received: from localhost ([::1]:59004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livLC-0003ko-7K
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livFv-0003YA-2P; Tue, 18 May 2021 04:39:11 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livFp-00047e-3r; Tue, 18 May 2021 04:39:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id n2so9306887wrm.0;
 Tue, 18 May 2021 01:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K5qPvgjroW4HFZ0QOxtJbrxU7fNNc6UbjjlweCupMYc=;
 b=kqnw26a5iqDSb7hT+L7wOoBaXhKxzsGqK8GVNRWOjZLD4IZCXzCfMbc7T4RVZq+iWs
 wcAX7FM1i2jHao4iANkfuoVhfaVLoQpXoQVQFkeKZ16FatPRXcyISR2ujqmQk5JrvOEs
 be5kyw8MYtUn5hOn/7buJsV71Pq2Wu4IIPfdz3lYoRZNaFMPBcY3vjFHSwa5HmKGmHL7
 G8kptMLwYJUCnJCldI0H+2UfiUlHn1SlNDI+WMgihSjdIIJuF8/IV2OL5zByY74y4vTd
 sYmQWba1MRPzIaKcQgRI3Jpfi0+QwsxPLS485u1k/YLMBFgtw9uaoAoW1zOjEGA83r3J
 eXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K5qPvgjroW4HFZ0QOxtJbrxU7fNNc6UbjjlweCupMYc=;
 b=dVYHS1yiRNRC5fhix6E0tZ5QTWiynPKuEhVkT4bmAH7PANlSpimOq9Ps/sB1eF1Jya
 Hy4gt1QZ2/AUwk+mCR11CpwinNlhMU/5SV7fBKQajgPr/1Hjoi4VamyqGVMyKbM+1Ghf
 d3g4FNK195HzLCt/jCi2Msw86JN3G6fNNYvF5JKzCAsIUNxelvFteR0q0ZLl63D+mjer
 BPDfFKG73xfjGGQeSGrpIVGQBxphY5Sylw/6cEKx6acAE+GYJ36pj6swGuWdzGRK+EUx
 DIdakgHXZ4yaW3Qu0Dn5POZJ8o2NclGNy9hNCsU7okT3bsF2VntL57LzVEzlcECtiAys
 Qp1Q==
X-Gm-Message-State: AOAM532V2ZK/9oE3ujz3l+mkHioSJ2A1/VeVop9uAYU+xs1KLqiXC3W3
 w3epEVwO9tp8Z5Uj3s5g2+gbK4VhfeoHXg==
X-Google-Smtp-Source: ABdhPJyTBDuXFmijGtKl6oX052ClG1jXC81Z+o/sT2+flVgZedN6Bxkj5vfFILB6xdPAwFPf+Qe0IQ==
X-Received: by 2002:a5d:4805:: with SMTP id l5mr5350095wrq.142.1621327143462; 
 Tue, 18 May 2021 01:39:03 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y6sm70959wmy.23.2021.05.18.01.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 01:39:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] file-posix: fix max_iov for /dev/sg devices
Date: Tue, 18 May 2021 10:38:58 +0200
Message-Id: <20210518083901.97369-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518083901.97369-1-pbonzini@redhat.com>
References: <20210518083901.97369-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though it was only called for devices that have bs->sg set (which
must be character devices),
sg_get_max_segments looked at /sys/dev/block which only works for
block devices.

On Linux the sg driver has its own way to provide the maximum number of
iovecs in a scatter/gather list.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index e5ef006aee..77a45083a6 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1179,6 +1179,17 @@ static int sg_get_max_segments(int fd, struct stat *st)
     int sysfd = -1;
     long max_segments;
 
+    if (S_ISCHR(st->st_mode)) {
+        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
+            return ret;
+        }
+        return -EIO;
+    }
+
+    if (!S_ISBLK(st->st_mode)) {
+        return -ENOTSUP;
+    }
+
     sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
                                 major(st->st_rdev), minor(st->st_rdev));
     sysfd = open(sysfspath, O_RDONLY);
-- 
2.31.1



