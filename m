Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801752BA343
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 08:33:57 +0100 (CET)
Received: from localhost ([::1]:45222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg0vc-0007OY-1u
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 02:33:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kg0te-0006pA-Um
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 02:31:54 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:34449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kg0td-0005DU-9l
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 02:31:54 -0500
Received: by mail-ej1-x644.google.com with SMTP id o9so11560433ejg.1
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 23:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8uvWibyA3043TN9A41ujudv50jCmovbNCEmND4LHyHc=;
 b=jTlC8iIxFpVlGmkixzI4ga7E9USCpOXqUHHP7UZQJKi+SJKvZfhUm38DqP4VVTLuBD
 IY92fC5Cwvm3R8u2kfJz9KIA3l3qCP1TsEpalL4+QKnfWrc5x9DIrNRPxHeVT0pxpb5n
 MA15nDwYFZyD1BMKsApeI8ZqqHpuMj/DPk97bT77AHucgOybqEBvqaYM7rV4x4JSuCx5
 vWKurlUeMMLf5QQplTSDbeQijlln3CpjhjKy/5bcC5QbeajY8Vxukh8W1B/05ViTQ0J6
 3g4AV8Eo1pbU60Iwj40YPvKYc4SyDhxZAbzMGHp3HtOUvxnEiNYI1t5w0G8OlY5NkCWd
 aZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8uvWibyA3043TN9A41ujudv50jCmovbNCEmND4LHyHc=;
 b=FUaZiAwF0gTKsJxr9ppyP+02PZjIv0dxvCKIS0KWiAEOeYQ9uQSe02LmLPBmtNeQlM
 nhuqt/jA/vhUbHOZsUN+t1BeM97QdAWYQLcH3ANLS5D9yT7lNB+EupVD24QTw8k8TlxV
 C/MmG6kTH32kCFRKqkCdLRTmiLRLHkeZVJGd2VG0Q5iwoua+UxPyungnWAvcx8nUbW9t
 LCambq8OHopgKVjaJsna4u+B4GcLYvLFnVl148aJk8OqI2jzrY0u1KZJ98beEzMG7FI2
 SAcimqu1NHfMspoW/kU/uwSDP3lxFeZTPYMcZSr8BdKjCkGxH8Tli3DO3J2yARC7lN1X
 5sUA==
X-Gm-Message-State: AOAM532J02WBbE090iJDCq2mrHNMxU1rd3IXg51X8wZDrxsii7NIyqIo
 uAcj1+y+dhWIUV4FK1+9C6WQJaG/I8k=
X-Google-Smtp-Source: ABdhPJy9KrdGyQTCmgipL3FYCS7bCPZA8KjByZNaTPgHA+VNHysnKrkaAbyhMTVbdCqau6BVPrpbjg==
X-Received: by 2002:a17:906:ec9:: with SMTP id
 u9mr32053954eji.400.1605857511198; 
 Thu, 19 Nov 2020 23:31:51 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x15sm711185edj.91.2020.11.19.23.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 23:31:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qtest: do not return freed argument vector from qtest_rsp
Date: Fri, 20 Nov 2020 08:31:49 +0100
Message-Id: <20201120073149.99079-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Kamil Dudka <kdudka@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If expected_args is 0, qtest frees the argument vector and then returns it
nevertheless.  Coverity complains; in practice this is not an issue because
expected_args == 0 means that the caller is not interested in the argument
vector, but it would be a potential problem if somebody wanted to add
commands with optional arguments to qtest.

Suggested-by: Kamil Dudka <kdudka@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqtest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index be0fb430dd..e49f3a1e45 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -545,6 +545,7 @@ redo:
         }
     } else {
         g_strfreev(words);
+        words = NULL;
     }
 
     return words;
-- 
2.28.0


