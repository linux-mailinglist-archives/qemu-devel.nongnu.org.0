Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C0366D9AA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 10:17:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHi5J-0004jD-4b; Tue, 17 Jan 2023 04:16:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHi5H-0004gR-UI
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:16:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHi5G-0005f6-ER
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:16:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673947005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0nPIxge9VAV8+Lb4s7NDa+nmmH+Cyiqzn/4/7OyoCi8=;
 b=Jny+1S6QTQJvjJdr9yV2ct0EFJn65L2yIrkYC9t4afcN9dRQybs+P93FWjji3nTUm0jVuc
 5MoXJyHkAwSGcAx5MPmR3JIzIXpwN0vbsEVcl7ZUOZnN6F3CyDJE/6uyjE7y+Autrsq9GE
 BFkm71dDaWvp4pRmRVLmMjxWO5CJViw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-MJD2E8kmNxKQxAB1-_n75Q-1; Tue, 17 Jan 2023 04:16:44 -0500
X-MC-Unique: MJD2E8kmNxKQxAB1-_n75Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 sa32-20020a1709076d2000b0084d4593797eso17860631ejc.16
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 01:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0nPIxge9VAV8+Lb4s7NDa+nmmH+Cyiqzn/4/7OyoCi8=;
 b=1gjziWwxWqPzskfyXKWeYSPIRsUitc65mfRnqhbEhIF9OvxKRIX2eC5/fYNMIq/Jt2
 hfBJMZY+pu58h9YTdf+caoAiNjgYb5Z7hw47rx5zPb52a7+rXmofNqAoGkaNRJh8dRMi
 cHMFtLoXn5vz3T+OUv2VKmCCuyjTGHX8XdIfnTtvvkDEXZhoiPJK68ysP81yW2ye5ntE
 W7wR/McQQ0GCubMaZmByjvt7WnQcRbvPDidXKsjx2C8uBKYOc62aKdlFFgE87mVsFO1f
 LHhBRqn//LG7Pwssniuh1HQObeYERbYdplEiArkrmEoIPkglToaBWPMda6M8XX4HxOsz
 GU1Q==
X-Gm-Message-State: AFqh2kr5xp/zlXxV+Ks4fSCZX/97tF/pMqDMjbyDFBWlemz4ZiCAKhxs
 hYrequcpRk/dF00V6MtE8dRJ1Wlq+x5ckkK8ZrxPR3iYirYqboSZ+uYXEYjJB3D5OaKPSSWgpC/
 SPQMWDtVEQO4WOxyueLZCPq9KjRXmPPlWYB+2wIOv0crFEImkXu3zp/fKuAS1/eddonM=
X-Received: by 2002:a17:906:6844:b0:86e:f478:f598 with SMTP id
 a4-20020a170906684400b0086ef478f598mr1980027ejs.44.1673947002708; 
 Tue, 17 Jan 2023 01:16:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsbqdu2u8SFYOWsWfVu81VX4KQyuiZMTsa5YdB6EzjasQRnFX/D+oQwHY5uAZF2QqzwI8OAhQ==
X-Received: by 2002:a17:906:6844:b0:86e:f478:f598 with SMTP id
 a4-20020a170906684400b0086ef478f598mr1980008ejs.44.1673947002481; 
 Tue, 17 Jan 2023 01:16:42 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170906314600b00781be3e7badsm12925654eje.53.2023.01.17.01.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 01:16:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	berrange@redhat.com
Subject: [RFC PATCH 1/4] lcitool: update submodule
Date: Tue, 17 Jan 2023 10:16:35 +0100
Message-Id: <20230117091638.50523-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117091638.50523-1-pbonzini@redhat.com>
References: <20230117091638.50523-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Update lcitool to the latest submodule, which has improvements that
allow usage as a library.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/lcitool/libvirt-ci | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index a29b1c9925ed..d1456dd96183 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit a29b1c9925ed8549b2a9e83374a8aa5ebe16bc71
+Subproject commit 40589eed1c56f040d0f07fc354c242a0e0d83185
-- 
2.38.1


