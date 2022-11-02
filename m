Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71256161E3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 12:43:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqC8N-0005Cr-1d; Wed, 02 Nov 2022 07:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqC7m-00058B-4b
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:41:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqC7i-000525-Ue
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667389293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhwjMHIjGnSGMT9O2iGklK6hwOae6WjgYLZOF8fZMBo=;
 b=NZakEL/Pxzhw8Sc2JW8iWkyHBAdrTHdINChiVRzCoCHzuwHQn47SK/YlV+sBY76vkQYgyD
 nzdIkL4mse7rKlo4Ylvuxs+qwTZF2o8PUIv3ABks/1stz4MqDd1wQDeQRCJW7BJvUHbpcX
 R+lbvEAs7u3EXNcnmOTtLX4MAgSSxqc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-R3wvkuC2PZW00LE4emKBCA-1; Wed, 02 Nov 2022 07:41:32 -0400
X-MC-Unique: R3wvkuC2PZW00LE4emKBCA-1
Received: by mail-ej1-f70.google.com with SMTP id
 hq18-20020a1709073f1200b007ade8dd3494so3477337ejc.2
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 04:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhwjMHIjGnSGMT9O2iGklK6hwOae6WjgYLZOF8fZMBo=;
 b=744FiPbT3BigfcqFqboCNWD5fwecBYCBW+VU01Qkqvvvi2169ud1QwLkuhnLCYOODN
 UsROJsZ+CI2TbVt7i1im4IdPrtKufS4zGSK4EQHjAf3dwMBr2y9WA6zz0m/Wf0u5ilA8
 8uOLtTLQI2zVwHQXu6qqeooD31kOuuz/5OguTWc8GJqmC/ZifLpyQJPpOquxanfTORMj
 MGMO1Abu5m9AaEUXiMAm/nRZtVEbnAwkJpzX1g0RN4soPHFFJjolB01Oefi+oagRVMxd
 JoawCuJ5ZkOrQmPzgUCrPcFBBLiFgk+5EC2bTtVvLRKHK7A6eh+mnDfwWcpydtIidVSx
 E6OA==
X-Gm-Message-State: ACrzQf1xk1elwIkfntTJtncJr59lUMdCqIV9sdrefrV0vJN5q1VSxWFo
 kivEiJZ/8m/Nn3NFbUXtRWO6I/9j/HTMyxIg4m1FXYgOLSabu2H5pBTn4fYVVkDhIB1AfpqCzVA
 Kl3uXDV9jN5pE4Zd58g1qVa0b/1HxVXB91QUj/rAwpf/CDdcRNdsWsGUfeV3pILw5jns=
X-Received: by 2002:a05:6402:440c:b0:43a:1124:e56a with SMTP id
 y12-20020a056402440c00b0043a1124e56amr24765074eda.134.1667389290908; 
 Wed, 02 Nov 2022 04:41:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Y36PxzD+7HpoTsbUuuhyfGFq8fZzFWo6cqBhHmc8xcpP/qvl+94+7aXxKoQsVcybCB+O3iQ==
X-Received: by 2002:a05:6402:440c:b0:43a:1124:e56a with SMTP id
 y12-20020a056402440c00b0043a1124e56amr24765046eda.134.1667389290613; 
 Wed, 02 Nov 2022 04:41:30 -0700 (PDT)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 s29-20020a170906779d00b007add28659b0sm3524131ejm.140.2022.11.02.04.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 04:41:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Qi Hu <huqi@loongson.cn>, Jinyang Shen <shenjinyang@loongson.cn>,
 Xuehai Chen <chenxuehai@loongson.cn>
Subject: [PULL 1/5] target/i386: Fix calculation of LOCK NEG eflags
Date: Wed,  2 Nov 2022 12:41:21 +0100
Message-Id: <20221102114125.58902-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102114125.58902-1-pbonzini@redhat.com>
References: <20221102114125.58902-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Qi Hu <huqi@loongson.cn>

After:

        lock negl -0x14(%rbp)
        pushf
        pop    %rax

%rax will contain the wrong value because the "lock neg" calculates the
wrong eflags.  Simple test:

        #include <assert.h>

        int main()
        {
          __volatile__ unsigned test = 0x2363a;
          __volatile__ char cond = 0;
          asm(
              "lock negl %0 \n\t"
              "sets %1"
              : "=m"(test), "=r"(cond));
          assert(cond & 1);
          return 0;
        }

Reported-by: Jinyang Shen <shenjinyang@loongson.cn>
Co-Developed-by: Xuehai Chen <chenxuehai@loongson.cn>
Signed-off-by: Xuehai Chen <chenxuehai@loongson.cn>
Signed-off-by: Qi Hu <huqi@loongson.cn>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 546c427c232f..c477a10f410c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3300,7 +3300,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 
                 tcg_temp_free(t2);
                 tcg_temp_free(a0);
-                tcg_gen_mov_tl(s->T0, t0);
+                tcg_gen_neg_tl(s->T0, t0);
                 tcg_temp_free(t0);
             } else {
                 tcg_gen_neg_tl(s->T0, s->T0);
-- 
2.38.1


