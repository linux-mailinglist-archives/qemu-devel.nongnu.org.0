Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF8C6535D9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:07:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83QA-0000s7-On; Wed, 21 Dec 2022 13:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Q9-0000qt-5b
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Q7-0004KE-HE
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNbeKtBEPdV4c/ohPUb/KqQoDWRa4JxrKQWIRrnkmoI=;
 b=cgc32ZxDhy/eZUJ24R6g3Ch5hDhmbeU/j7EqOTpCii8x04jbPztn59y2CNkO+zaiGOuMnF
 4YBufiQowZZFTbSMcKpGRBf8BfH7JJ4EP0tV++39Q73QSr7Ykg0uf/3q977KGFcqTEKIgm
 +qX0lHF4c0dTJ3QOMGIC645U8ioG6YA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-FzbLI7jMMUWrVXOkSlLtEA-1; Wed, 21 Dec 2022 13:02:21 -0500
X-MC-Unique: FzbLI7jMMUWrVXOkSlLtEA-1
Received: by mail-ed1-f69.google.com with SMTP id
 s13-20020a056402520d00b0046c78433b54so11847056edd.16
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lNbeKtBEPdV4c/ohPUb/KqQoDWRa4JxrKQWIRrnkmoI=;
 b=hgt9TZytsZP7bFG3vlbDG8a/07mO0dqVBPGDSp8XmHZVxdL1wtsleoosjlfp0hTrzC
 4TqV3wGwMtOlggDMDL3cyVXbMw+Vtc0dfR0xGk1PlAncO7hB98JnIIyj6g+lge5wGA+w
 +xl4XGe1oKOLe/JARXI28C4R9ayFeLKCGvh0GoLyK3G40dTCTDggG9Nob2+D0ZN01TBp
 pWfEkcan34B8ptW18jXB9JtUdXMgkLS/6iw+4fZSNqS5aEE3SVPEYU31aUr8BPWLYpKy
 IIr8E2Dm7pcaqEFDkYkSevdmr2ua34juM3d1CT5DVW3mqR5hP4n5ZOgzj/RyYOVYCpVE
 JJlA==
X-Gm-Message-State: AFqh2koEp0PSCWBYuRD54SLA89jZozr+bWheW8dea3LC8DwDkJsvYkbo
 1c2UnEXAZ35W3umGE7ejxjfa2P6HGuW3Nq3WBAkUg3H6omAc92E30WoeJYK7THbfFaSR5Qu6KbQ
 EEFfaBAYwY7XBhp2LTCzudM2yHkeJ/ldX5nd9WRGEX3u8+tt9kaUSiW4K3hSQKyfiHEQ=
X-Received: by 2002:a17:906:4d58:b0:7c4:fa17:7204 with SMTP id
 b24-20020a1709064d5800b007c4fa177204mr2186988ejv.7.1671645739719; 
 Wed, 21 Dec 2022 10:02:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuzY+7jlo49ab1DviTY3qnEOj1u0iUChTNiUImK9CXAKtdHG9oLIzqYvBhb2k9uFHJA9Uxb9g==
X-Received: by 2002:a17:906:4d58:b0:7c4:fa17:7204 with SMTP id
 b24-20020a1709064d5800b007c4fa177204mr2186970ejv.7.1671645739454; 
 Wed, 21 Dec 2022 10:02:19 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 sy26-20020a1709076f1a00b007c0b530f3cfsm7371256ejc.72.2022.12.21.10.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 13/24] meson: cleanup dummy-cpus.c rules
Date: Wed, 21 Dec 2022 19:01:30 +0100
Message-Id: <20221221180141.839616-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Now that qtest is available on all targets including Windows, dummy-cpus.c
is included unconditionally in the build.  It also does not need to be
compiled per-target.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/meson.build | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/accel/meson.build b/accel/meson.build
index 259c35c4c882..3a480cc2efef 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -11,10 +11,5 @@ if have_system
   subdir('stubs')
 endif
 
-dummy_ss = ss.source_set()
-dummy_ss.add(files(
-  'dummy-cpus.c',
-))
-
-specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: dummy_ss)
-specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
+# qtest
+softmmu_ss.add(files('dummy-cpus.c'))
-- 
2.38.1


