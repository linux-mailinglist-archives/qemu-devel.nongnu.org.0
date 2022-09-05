Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B235AD18F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:30:54 +0200 (CEST)
Received: from localhost ([::1]:60996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAJZ-0007G0-23
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV9rq-00052d-K3
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:02:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV9ra-0003VD-HH
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662375716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/a8Z/fd6v4qVrfdXABaUXuskf6QxOskpZwRQIxIWPYQ=;
 b=flwWmvjSyEXImj7B/dm6nvC/TYZJ1V8mfBwdIraADE7TSyf0HWID9P+0cb0itMNC3nrMzS
 FLUm4MFE+oR63YdOD/1v7zeGPkt5vdjotwcMiXL+kN/ocqi/v0rBWqg7KHejwyJvwSYX5K
 dvCcb/bumZ7ddsOXkwr2ZIr+fgri/2o=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-577-y_C-MWEIMA6XZ7qMigVcdA-1; Mon, 05 Sep 2022 07:01:55 -0400
X-MC-Unique: y_C-MWEIMA6XZ7qMigVcdA-1
Received: by mail-ej1-f72.google.com with SMTP id
 he38-20020a1709073da600b0073d98728570so2205228ejc.11
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=/a8Z/fd6v4qVrfdXABaUXuskf6QxOskpZwRQIxIWPYQ=;
 b=FHyw4d8amkxP6M6ghWC1D3jtosGUTZV2bjEg8zZxQJTugcnCeXoIG2jAD179sjz+I6
 oi9343pcTpZ3kyOwC+RWc1TLJAo9+13IX3pMlZXIoKaDeJHNkcB/P447tckrHEy8YSWB
 ZLnbTT31mJkxOfgX/jn42O9q90FQTd/kCzKmPD5H+a8glg57l8H2hRM9cDgGjZFJICmg
 uyGF8ahxA6LPR/3SBoxnRzpOkgu2zd6tA6h9ThzEg/wkVJj3SVF4ZIaSfBH6fR39tZuj
 AnWC/EPcNiuT8qKsX+3M8j4KTEMSxy82F3/l9YovPIQuMcbQLUUC3dZi92ZZudIY83Fg
 19hw==
X-Gm-Message-State: ACgBeo2dIT9K42EcKA2NjX0+WVvKOl4+d04aa/X37x8n/Om4a/iZYbax
 eVgon+FXmdUb0hh0VaoBehvf6hLyh7br3T5yTPCv6u70ylG9iVyu4cS+ag0gU03hfr6F5V7TNcN
 +jdIQe7DYiz+wv9Qpl/co1FTItfyfLOmluLQQ2XsgBNUBl2fvhT6E84Nf4mTjnHVCQSo=
X-Received: by 2002:a05:6402:2c6:b0:44e:7d0a:c231 with SMTP id
 b6-20020a05640202c600b0044e7d0ac231mr4198904edx.283.1662375713397; 
 Mon, 05 Sep 2022 04:01:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR70eqqoB2aszR8Htno7qDn7M1n+8KsvD5lcG/7Qxoy1PqZ+it/Kd52F718abT3iH8mvuSRL+A==
X-Received: by 2002:a05:6402:2c6:b0:44e:7d0a:c231 with SMTP id
 b6-20020a05640202c600b0044e7d0ac231mr4198889edx.283.1662375713173; 
 Mon, 05 Sep 2022 04:01:53 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a50c04c000000b0044402ac02f7sm6267385edd.67.2022.09.05.04.01.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 04:01:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: test-qga: close socket on failure to connect
Date: Mon,  5 Sep 2022 13:01:51 +0200
Message-Id: <20220905110151.32225-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Reported by Coverity as CID 1432543.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-qga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index a05a4628ed..d27ff94d13 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -32,6 +32,7 @@ static int connect_qga(char *path)
             g_usleep(G_USEC_PER_SEC);
         }
         if (i++ == 10) {
+            close(s);
             return -1;
         }
     } while (ret == -1);
-- 
2.37.2


