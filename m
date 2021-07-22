Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2233D26E7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:41:18 +0200 (CEST)
Received: from localhost ([::1]:60466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aoo-00018l-Lx
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akJ-0000aV-Pr
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:23 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akC-0002hX-MX
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:23 -0400
Received: by mail-ed1-x52a.google.com with SMTP id k27so7306256edk.9
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAn6zfw6aMrYcPgefnzHwccYHf72WoOmDtwMwiOdWOU=;
 b=fNVvaMASkWFNYnLKBzUS+/syZWHlYikQGrEudz2JfonLoQ1HcHtwJmLC4VqHjfs+gy
 zAUd6LGUBTcq07vVufcBXsxX5/N70uirWmXh7xxpGu6bG+raDldS/LXKJtBOuWAR9iSE
 //vELqTyTnUw8TnyW/161hKs6sY28XjEd/8ugAMr2wZrUdj5Sng3QQZV/sBc1F1sb7Jm
 2rByMRBuxa78of6kdbAVpvnjjy0dxyfZ+3wQj22UHAhncCxvPlKrfTJZ710DbFhFYLKw
 Txd8aTbMbUSH58c4AS9xKdukxm9LIohHtzWfC2MPR9/p+0YjmLhWFa4gIWT277WKc6e9
 n6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iAn6zfw6aMrYcPgefnzHwccYHf72WoOmDtwMwiOdWOU=;
 b=sbcadgjry8ev11fSca0OAVpdPU5+w6nUMhQVxm9BkfKSAliz11PDaAWQIAx58BiWMX
 XjHZ+tlHHZEVGiuSLWDXHMz9XGhcKpRvm6izo/MAEkEYQ9IAv6qIIgVGqL77v0UwhvL+
 MOE90i9YFWRRJzM98VooXE/sLeK1agR6fuU7IaMnSTp/fzUQA51xgfA1OqpJAa5bJi0M
 lXd+6wSdxQrX6CA3y6wuPMYKRsyGuC/b3vAJcjYX2S0zg4d9yekIenaOm5+rrllSu96N
 sVZHk5RHo3GAt0DrGdfnzimrurYqO5yArNL34RddvZfNq8nKDCGkrG9KLK9YL3l2Uyo/
 9l9w==
X-Gm-Message-State: AOAM5320NLtjn74Xw6mVOqTFYtcg2VseRcayoiuqdHSUabg0mypboUoT
 lQZYtuosFoI9w91IA5CDBsER40yp6SNr+w==
X-Google-Smtp-Source: ABdhPJz43A7rXJbcTIyY4UfqPvzVadhVWrD4V/vg5C7HXHt+tXzgZ2CF5PMUt0CWeOZP9sSZopZkoQ==
X-Received: by 2002:aa7:d857:: with SMTP id f23mr223222eds.249.1626968175555; 
 Thu, 22 Jul 2021 08:36:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] qemu-config: fix memory leak on ferror()
Date: Thu, 22 Jul 2021 17:35:59 +0200
Message-Id: <20210722153612.955537-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The leak is basically impossible to reach, since the only common way
to get ferror(fp) is by passing a directory to -readconfig.  In that
case, the error occurs before qdict is set to anything non-NULL.
However, it's theoretically possible to get there after an EIO.

Cc: armbru@redhat.com
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: f7544edcd3 ("qemu-config: add error propagation to qemu_config_parse", 2021-03-06)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/qemu-config.c b/util/qemu-config.c
index 7db810f1e0..fdf6cd69fc 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -414,7 +414,7 @@ static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
     if (ferror(fp)) {
         loc_pop(&loc);
         error_setg_errno(errp, errno, "Cannot read config file");
-        return res;
+        goto out_no_loc;
     }
     res = count;
     if (qdict) {
@@ -422,6 +422,7 @@ static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
     }
 out:
     loc_pop(&loc);
+out_no_loc:
     qobject_unref(qdict);
     return res;
 }
-- 
2.31.1



