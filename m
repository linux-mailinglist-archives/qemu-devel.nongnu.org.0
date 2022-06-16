Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D12654DF92
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:55:23 +0200 (CEST)
Received: from localhost ([::1]:35006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1n9m-0004Kn-IO
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjo-0001p0-BC
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:33 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:33749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjl-0001uw-QD
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:31 -0400
Received: by mail-lf1-x130.google.com with SMTP id c2so1578973lfk.0
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k/hGN5VojSTuOV/b5lvNLOT0NN3UmseiinK0nUtnYSI=;
 b=RqdFyHIOImshae9f91jFeJrTxr/yiUMF1MEuCjHBWuCGyzDjBQQf01HXwbAcl7t08s
 sGY2ZP448lHqotWFbcrXicK5qENUO7jzfMGSxOQMPeYTWHEvQgMXIWG9OTrmjlVbVofJ
 MMbNGT7IBm1eKbHqbUGQgIr/h18mv2NyMd6+DxUpu3YNKjyM38ibp6d2n+HAE2jX/pom
 iuMrcbb5lCSVBlMWNKHurTd667Kdvw5MZe2UJardj4nd9BwOqeMiZ029VcA0g+p172th
 7bNfrPHdRdveghwnzrTG2F2EnrWbI0tnJ4yGfhKuJ/Xpay1+hFEpT146E4qMXz7pc60j
 6xWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k/hGN5VojSTuOV/b5lvNLOT0NN3UmseiinK0nUtnYSI=;
 b=64heXtyuPml8d9OJjaW0OU+v4W7PHsNQGDxlTR7WCSV2osn9Gkdu2YpgukH8TmzejV
 ejSRWYodzFhopE4ZPLkho4NsQbH03V2mUh/Sr6qG8Da+jUgHXmAOoEURBze51/t3uT2I
 p+iykifuOxd4P8/AreaeAtauQc0SUUmJvaDeGYRdrV/Bb8q4wpS4d1tKevkkS/5OmiAV
 av9QLFf5e2+fx6ZzAskI+5gt3ROTpig42oelulECf/PBzA06KrrCPlll0iIhmlJp4W8X
 ws5d0lirUoqGV0w03RScZpi+ZtdM6KQEK73bBzgJiFZ228Ct5fbMyO4tEU1yJR0z9iqo
 FI8A==
X-Gm-Message-State: AJIora+Hn+fbo1qjp0AxkXK0ZtLPaS9Jrd4mzfn7z+QqF71+2EgFZ1u7
 k7H6Z7sV70I+sAbRhpccviSTuidm6zET1Y3y
X-Google-Smtp-Source: AGRyM1vmIp3aXeGW7aYlAeS83h8H5l7Kdw5Sm5h87A1tjP96KIZxdsJDOfYwAHGR5ZVELZpN0ClDqg==
X-Received: by 2002:a05:6512:3130:b0:479:385f:e2ac with SMTP id
 p16-20020a056512313000b00479385fe2acmr2268847lfd.575.1655375307841; 
 Thu, 16 Jun 2022 03:28:27 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:27 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 11/17] migration/qemu-file: Fix qemu_ftell() for
 non-writable file
Date: Thu, 16 Jun 2022 13:28:05 +0300
Message-Id: <20220616102811.219007-12-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nikita Lapshin <nikita.lapshin@openvz.org>

qemu_ftell() will return wrong value for non-writable QEMUFile.
This happens due to call qemu_fflush() inside qemu_ftell(), this
function won't flush if file is readable.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 migration/qemu-file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 1479cddad9..53ccef80ac 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -663,7 +663,8 @@ int64_t qemu_ftell_fast(QEMUFile *f)
 int64_t qemu_ftell(QEMUFile *f)
 {
     qemu_fflush(f);
-    return f->pos;
+    /* Consider that qemu_fflush() won't work if file is non-writable */
+    return f->pos + f->buf_index;
 }
 
 int qemu_file_rate_limit(QEMUFile *f)
-- 
2.31.1


