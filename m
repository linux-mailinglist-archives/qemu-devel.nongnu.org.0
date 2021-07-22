Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CAC3D26E8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:41:20 +0200 (CEST)
Received: from localhost ([::1]:60518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aoq-0001Ah-07
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akI-0000ZY-MO
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:23 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akG-0002io-Ne
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:22 -0400
Received: by mail-ed1-x532.google.com with SMTP id ee25so7314132edb.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSHBt5TLWSH//IhnNECzgHbG4HJzFRz1fhGpkz8H4T0=;
 b=b6IfZb5DZNQWg3PqUIyO5NOeJdweLdXlHhsBxFfdhVlqwTW7E/56w/LGERUq88O8+g
 Bbnc8ERKssjTnm7MrYVMp67ohuC+Znt7NGe+K1wM58lJG++a4GD6hxRRXRToTDmF7uUO
 UOGF7k3/2hxgDEdi85iQDefqbGVMQk/vkE1JOqF2iMXtWZXTk2lhWX3Uk3KcbsyxRayX
 i5QTHr0EQGss5g8KgiWpmhWZPNhcs/XoCkFC0gzzbntpnQIz3eyQqNrzwWsEnFe5ITnn
 5h6hQmP9P/40FonsQSXYoqwAwsLPXcrpF5RBQ+QVm2B3AwN9XFYB8d9voTEt6L2iCy0T
 yilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YSHBt5TLWSH//IhnNECzgHbG4HJzFRz1fhGpkz8H4T0=;
 b=m+/jClNBU1+oFoXHe2aM9NSyfHIylwY8Zh5MaNnAeDl23VgEwkfDv5e48U/RdO3BuX
 RZ+F4a4KrStmMcZzKFWti2UyPmXFWAfVeNYjg1uHjqWu1U7UqTxtj3b+oX8555W/JxTr
 ozjgmyWokDMxIdaXfuoFJq9a/3qb2zudfCAhy8jyCL+NUnAQW2ujp3LbHQfZyBs1O1DF
 uG8pnbqDgQnTBP+Jy2Z0VLfIaIrpEVWIenoU8LlufdcxfdNUpFdCLQA6Nk7xeU+XvFOL
 U8Jy/udGW+GxS1MsNBVv8IZz8xm+D+vHj7p5jHkGHQoP3JhbC0mIwZmun67Wm7vkxHkE
 OFXA==
X-Gm-Message-State: AOAM530w36pg7fTHT1DVF90JI+dBd+EX27kkqnBKziUKsDKvM0iLnqhj
 SJIX5xYfRIUbZXl+JBSXS2GA7y33QGepLg==
X-Google-Smtp-Source: ABdhPJz/1v/nOGT6XTZHRINoxRmahJ6wlq4GtzD82i6jadrYfajy9akQ7hMVrgMTTA66I8Z7mVG9IQ==
X-Received: by 2002:aa7:d604:: with SMTP id c4mr244858edr.39.1626968176819;
 Thu, 22 Jul 2021 08:36:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] chardev-spice: add missing module_obj directive
Date: Thu, 22 Jul 2021 17:36:01 +0200
Message-Id: <20210722153612.955537-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Frederic Bezies <fredbezies@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The chardev-spicevmc class was not listed in chardev/spice.c, causing
"-chardev spicevmc" to fail when modules are enabled.

Reported-by: Frederic Bezies <fredbezies@gmail.com>
Fixes: 9f4a0f0978 ("modules: use modinfo for qom load", 2021-07-09)
Resolves: //gitlab.com/qemu-project/qemu/-/issues/488
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210719164435.1227794-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/spice.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/chardev/spice.c b/chardev/spice.c
index 3ffb3fdc0d..bbffef4913 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -382,6 +382,7 @@ static const TypeInfo char_spicevmc_type_info = {
     .parent = TYPE_CHARDEV_SPICE,
     .class_init = char_spicevmc_class_init,
 };
+module_obj(TYPE_CHARDEV_SPICEVMC);
 
 static void char_spiceport_class_init(ObjectClass *oc, void *data)
 {
-- 
2.31.1



