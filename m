Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A343C15F9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:29:54 +0200 (CEST)
Received: from localhost ([::1]:55176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VyL-0005Hf-SB
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmw-0000LY-Ez
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:06 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmt-0008Bx-Be
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:06 -0400
Received: by mail-ej1-x631.google.com with SMTP id v20so10263383eji.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ja4hEhmn+z7DQfTKNSGKtSbarI/IZNhX8y7OLjcwLnc=;
 b=Jjs2NQb7A9KtkxUKJMlYAeQj4CI0YvCH9VzBjiYMrQcg3QKQlMezR+MP+1B6j2WndB
 NY2ddWYxAs8fBs/+Bv4MowNohK61WzvsACqUwqeffdAo3+mLM7X8k8vcCAlxJSW/0jVo
 FfByxQLrP5530eW3gl7B10vX+ZeRJfzzoDjnnR+cKVC31IlV1lnTViBHbE/4Lxpyf60J
 X5L400fYFBOnj1IHVog7z14YckWHwnOYJ5AS98fYEGDthlfzfbwA5B7Bn8PZGGsCjpyu
 4vxor7FML4BBcLw+dW3a+3py6D8dZI1EuGkLhBYyO/sKTccBaJwdpJoKxcGE5BOozNJT
 HWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ja4hEhmn+z7DQfTKNSGKtSbarI/IZNhX8y7OLjcwLnc=;
 b=As8kz3FNf1/0hL2KyctRJ9nG38WiGw/KGh72uNaGsRVxZH9ItpGbTBBSUwDDXExLKG
 cDNOLiBG+3VX/l3VhfTcGG+4nTVJLxd4I8YdPcaK8fjvWfodQxJeD3T0MNSDO2ydbT22
 K2K6SZSzyfdDqSIsGYRr7Gqdl6WqB+6mUQCOdlMoyn3f0W92lsB/4rZyNHLLESRgKtHP
 oopXdMzBqwIOQMTD05gzfApz++NEatxh68iCQuThhA9xYz8oXSaS3b/DVGtEnhHTZ/+t
 SqElM1CzL7NfkPBbqz4vYXeMNoXld/24EFpb0edx7KI0Tl9bUyeNxjP/pFMNxDdkxxvt
 gyfA==
X-Gm-Message-State: AOAM531EZl697aLLhzX8zmDDEPRsWBsPt3Ll9QNku7cFkXDUSm/8R1Qn
 9HztjK8TzReVfaI9fffcZLr2v8ZUwyg=
X-Google-Smtp-Source: ABdhPJxsdmZioV44QKDlDdItHLfwudV1vkyJIkkZnkk/2H9xVo2VgMjFaqTggMcIfP16DszSkkoN0g==
X-Received: by 2002:a17:906:c14a:: with SMTP id
 dp10mr32273441ejc.426.1625757481827; 
 Thu, 08 Jul 2021 08:18:01 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/48] modules: add block module annotations
Date: Thu,  8 Jul 2021 17:17:17 +0200
Message-Id: <20210708151748.408754-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-14-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/iscsi-opts.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/iscsi-opts.c b/block/iscsi-opts.c
index afaf8837d6..4f2da405e6 100644
--- a/block/iscsi-opts.c
+++ b/block/iscsi-opts.c
@@ -68,3 +68,4 @@ static void iscsi_block_opts_init(void)
 }
 
 block_init(iscsi_block_opts_init);
+module_opts("iscsi");
-- 
2.31.1



