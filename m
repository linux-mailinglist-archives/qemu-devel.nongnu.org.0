Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813B363EBBA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:59:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fLM-0002hg-Fv; Thu, 01 Dec 2022 03:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0fLB-0002dX-LR
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:54:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0fKt-0003eu-Vi
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669884864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+CtXMnNG5V8srMl8d7Jf4XUh0Zfe5icwi88D39F5+EE=;
 b=MXVHUfLqYgdOu28DfI4fitcdL3w444u4usBefhBr/+LIzxtAbopcPM33ntohrxphfJT0le
 EOMifQVY68c+uuM28wj1l0mPXrqhMBD4K0KgGuPe7GAQnCs+udflfgyDOtslfLy/Ze6NdI
 b1EiVKewCltHWW9tDGtBS0bwougOSSg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-R-uZ1sUdMxCntlB_E3FNpg-1; Thu, 01 Dec 2022 03:54:23 -0500
X-MC-Unique: R-uZ1sUdMxCntlB_E3FNpg-1
Received: by mail-ej1-f69.google.com with SMTP id
 gb8-20020a170907960800b007bef177dddeso925048ejc.10
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 00:54:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+CtXMnNG5V8srMl8d7Jf4XUh0Zfe5icwi88D39F5+EE=;
 b=PLfNYwWTdRJ5mDe5R2xcnzHn74mKMaJ9dUq1kgriDaEVdiiuukNVy/ljGE4b7yOJGe
 WqSgwe6u3CAP52NjOqmx98r8ZkSNWz7OTJApqrEoD2ODTWEGFZJb4YjqZZdoxmleRniz
 0f+4PMZ2TpJwJkNXpQdBoDv3pasmTx+9Vdaw+jMAk7/kZ5TLgxvr7xy2ysrDYQzboeq+
 sWUZUwQAFy+kvS2X8HqGBP3tsdnq6hwQdFUvjXUmK4Wd7E9sDzAhFr/N1d4J3uJOTCpQ
 pemwbDZxkvi3ykl663jz3qWEp/cfuaFGhsglyOjgi6UVRhsK0ggEetFDnawc+4WZgEat
 Oe1g==
X-Gm-Message-State: ANoB5pk+XNbqcJVOVpjmwNA3O0WRmS1NpMUsZqwDEHlqUC1oUJ4sBBZP
 /lKXFjfbyI23wNiDSnD/fOP5mYSSqEsiyBbSS10ay1DEHskWKXYJzAeVc4+u6VE4gfxGZucykk9
 +lsaGFLOd72qwBVb0t9I9mPhny4L/mKUKsAnSuC/KRBbowyr2+TOeVTAKMCEuujTXM04=
X-Received: by 2002:a17:906:16d1:b0:7be:893:fea with SMTP id
 t17-20020a17090616d100b007be08930feamr20476609ejd.468.1669884861558; 
 Thu, 01 Dec 2022 00:54:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5+nN/nZiezKbxPA+vyCZDfZPHRHnv/MHciuY+fo2bntxm21uWqP+vat8sCPvvTVmPWVLTzzQ==
X-Received: by 2002:a17:906:16d1:b0:7be:893:fea with SMTP id
 t17-20020a17090616d100b007be08930feamr20476603ejd.468.1669884861242; 
 Thu, 01 Dec 2022 00:54:21 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b0078d9cd0d2d6sm1575457ejo.11.2022.12.01.00.54.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 00:54:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.2 0/2] TCG/i386 fixes for QEMU 7.2-rc4
Date: Thu,  1 Dec 2022 09:54:17 +0100
Message-Id: <20221201085419.146789-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 7c09a7f6ae1770d15535980d15dffdb23f4d9786:

  Update VERSION for v7.2.0-rc2 (2022-11-22 18:59:56 -0500)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 8218c048be1567db9dfd3cf1e19fbff76bce8cfd:

  target/i386: Always completely initialize TranslateFault (2022-12-01 09:53:24 +0100)

----------------------------------------------------------------
* Fix MMX instructions for system emulators
* Fix uninitialized TranslateFault after canonical address checks

----------------------------------------------------------------
Paolo Bonzini (1):
      target/i386: allow MMX instructions with CR4.OSFXSR=0

Richard Henderson (1):
      target/i386: Always completely initialize TranslateFault

 target/i386/tcg/decode-new.c.inc     |  3 ++-
 target/i386/tcg/sysemu/excp_helper.c | 34 +++++++++++++++++++---------------
 2 files changed, 21 insertions(+), 16 deletions(-)
-- 
2.38.1


