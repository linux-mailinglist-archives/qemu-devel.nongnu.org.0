Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EC92DC1D6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:09:02 +0100 (CET)
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXUD-0007qx-Et
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpXHK-000550-CA
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:55:42 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:32927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpXHE-0000tV-Vd
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:55:42 -0500
Received: by mail-ej1-x62b.google.com with SMTP id b9so7889756ejy.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TOvyryI/ojr/jC4/X02aXVcr3f4plnWTz+dxfZUgd1c=;
 b=DY0YYo+LhQju5hh0mfiDBE7Li/esELWPO4DgirH+/oQm8zyTIqiadBHyLajHwhN3NQ
 HVWcGejkUZ6T3byOiHeTtGTEzR8Yy+HQaiY0hNDc4+c3Cr7n1hsH9NOl2RnDXo5JlYb+
 s0YEzcK/zG3IRzcTxKJ9qebjtqyE6J9w+waIKJUhw77DJghNz5F96Zhe88PinkfH6AUn
 Kf9apl7acBM3YoxAEZkNWPfwXcQ812OQQzCvG0U1doHnYAS4tKfvhuL1cwrFo3ojk9L3
 BLUemgkai90rswJR53cAa47Bq3vghezGjE/IFaxOXsDmQCZ3hUwwCpSFc+6Mi2hyAxp3
 EatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TOvyryI/ojr/jC4/X02aXVcr3f4plnWTz+dxfZUgd1c=;
 b=RJkrzfZwysBNxkxWqC36TdHy4piONudDpy27zb8lNRZFRvLhVyhbUAWWrE1vnyrSCH
 xlP8gra6sDUWZkofU2GS8FjzMRV4HHii66EfLwPxLrmTDnjMVPzcKu/3ZxaPqTaaCN/a
 jh5XPM5K8CbEuuLkYkKakH1oR9DKYPGMMTe0wrfG4Eg7LuGUJ8CLamzpsaCTBAvKyzE1
 pTlfczui1+js20eL3jX9+OnSZm5kFVxE7YKs21SWAgsNaTmXyr4JS+r36ohVfEzYhc5Y
 qWuSDazEpqzRsqxFjzwL7L8mwnx5mp14lZ6+YBXDwgNFRgMQjxytEvqBcAKnGB8WyUwN
 VynQ==
X-Gm-Message-State: AOAM532r/9rKDuYx/DXeabm3U3xgsLKidhZzMruadiEDwZ56+K1VtLr/
 /Cl+xQ8gjbPPeBINQYQUaMD1ZVjl68w=
X-Google-Smtp-Source: ABdhPJw8Nk8in4B+f/8SgzkXjhIpehRuSpR6jLzUZ/HDHCFHc+V5Wb2b6tKjeT5fZgknFNX9BS36DQ==
X-Received: by 2002:a17:906:895:: with SMTP id
 n21mr30664554eje.52.1608126935577; 
 Wed, 16 Dec 2020 05:55:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id k16sm1423216ejd.78.2020.12.16.05.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:55:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] trace: do not include TCG helper tracepoints in no-TCG
 builds
Date: Wed, 16 Dec 2020 14:55:29 +0100
Message-Id: <20201216135529.265165-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201216135529.265165-1-pbonzini@redhat.com>
References: <20201216135529.265165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: philmd@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 trace/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/trace/meson.build b/trace/meson.build
index 3fa760f568..012d0dbceb 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -71,7 +71,7 @@ foreach d : [
                 input: meson.project_source_root() / 'trace-events',
                 command: [ tracetool, '--group=root', '--format=@0@'.format(d[1]), '@INPUT@' ],
                 capture: true)
-  specific_ss.add(gen)
+  specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
 endforeach
 
 if 'CONFIG_TRACE_UST' in config_host
-- 
2.28.0


