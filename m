Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271456A6B3C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:00:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKBW-0004fM-4s; Wed, 01 Mar 2023 05:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKBT-0004dy-H1
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:43 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKBR-0006Ny-UC
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:43 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso11558220pjs.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677668380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CoSIyarAIU04vw264hmDOARNwoMR9ygoAxd2VOTLPP4=;
 b=WP+ZuDEmde5nd0ro5VVwIDofIfmfbrSqEARgHTwAX5Sm3DzXUBwNrjClf+dsd1u+CS
 tOusQKn3IBKRW6v2kuubWK9kECBZEsHWZPUsUqxmhdcilzRI1JUnT6hZNGdd3Q0fG3Xe
 SW0yAPA2sxgvyjpLclKIcbq5zwoXibn0CyNcO3p7nKU7/o8+lFP5Spp72keRnd5+rlIG
 k17v519w5t+tWC2/5hQzMxokkN8xFXsQ6TefZV0LoK4dJNN4H9RfsFEO7aUeyhuE2xNh
 MPIecdKSHbyuNcn6ojg5eyyMWm7opvEcAEzpfDt0KqhuG0K3v0CB3kyvqBQD59sYPSFc
 Iy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677668380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CoSIyarAIU04vw264hmDOARNwoMR9ygoAxd2VOTLPP4=;
 b=eVmVQCy7hrVFHTkNtfSQwMstthO8qiW09BEEN12wnA4bRmKVMFZ2iABjV8Eva2Yh5t
 kJkbihaglwq6RZ31rArkr7i1D9lpQfanKjAJmTnXzds4vL+6JdJtBU3cTQW5Ue2UacBg
 fQB/yo9AumxRkO3yPKXxvNThgohr+boZ916dpp1mLvzPytIS1wT2RaO9uVkGApwviVXs
 1trjm/ljKNhXfMiohIKnjus5mjs6nCW6c4oijBjt+8mYJuvotsNmktUe0teVvXJR0rtU
 TRTP28gZeCo8MKiQ4vEGSrJKxVXCvrJNiQGBEp6YaF7h1UzZtY/ZH6xn9JgjYNmiuK2w
 gvcw==
X-Gm-Message-State: AO0yUKXicnbkQIswhuMGWLCK4PVdkWtwuqXx+EIzFmUDl76mm7ElYqYn
 wQkBhmCQ49ibCvXpXi4Y+5gQxw==
X-Google-Smtp-Source: AK7set/hJ8IkN/HIhtBDwq5GP3JGLjg+bk2+HFECCD8EQGfxnPR5otFM91uFp/3EIFWkPJvNvVXGWg==
X-Received: by 2002:a17:90b:3912:b0:234:e3f:f53b with SMTP id
 ob18-20020a17090b391200b002340e3ff53bmr6938588pjb.21.1677668380656; 
 Wed, 01 Mar 2023 02:59:40 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 mj9-20020a17090b368900b002342ccc8280sm7829149pjb.6.2023.03.01.02.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:59:40 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v6 12/12] MAINTAINERS: add myself as the maintainer for
 cryptodev
Date: Wed,  1 Mar 2023 18:58:47 +0800
Message-Id: <20230301105847.253084-13-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301105847.253084-1-pizhenwei@bytedance.com>
References: <20230301105847.253084-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I developed the akcipher service, QoS setting, QMP/HMP commands and
statistics accounting for crypto device. Making myself as the
maintainer for QEMU's cryptodev.

Cc: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7651cb0ace..0bac2e8bcf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2867,6 +2867,7 @@ T: git https://gitlab.com/ehabkost/qemu.git machine-next
 
 Cryptodev Backends
 M: Gonglei <arei.gonglei@huawei.com>
+M: zhenwei pi <pizhenwei@bytedance.com>
 S: Maintained
 F: include/sysemu/cryptodev*.h
 F: backends/cryptodev*.c
-- 
2.34.1


