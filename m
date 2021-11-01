Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CC3442153
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:04:57 +0100 (CET)
Received: from localhost ([::1]:48716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdY8-0007qh-N9
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcH5-00081V-Dd
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcH3-0008Oj-RO
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5VbMOmYh/1NBtZLn877qT4k9nsfbY/WlKvNxb1iUJ0s=;
 b=hrx6rZPg9hSx7pwBoJPBl2qzS7FEtr4RVDFF9PwEqMXDB77RHKrmtXELeQVTwia5mezd5W
 4e8eT2ym0rZWJ+sH3KMgdQ0x6ZOx4o0ihOqfbmE6wF+AlfWhjUJyhujmc0UIjIMN20PYcp
 y52PleAAVqczGLDR0leEhmcsYedvTgc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-tycFzJFGO4OsyPzp8-Be5w-1; Mon, 01 Nov 2021 14:43:12 -0400
X-MC-Unique: tycFzJFGO4OsyPzp8-Be5w-1
Received: by mail-wm1-f70.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso42596wml.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5VbMOmYh/1NBtZLn877qT4k9nsfbY/WlKvNxb1iUJ0s=;
 b=FFchoNP+2cSS7A59oDF1+uUAr07+9lQk/K4Ax0C9BclWzZi4kF8Uqt7awDj+3p7g78
 hppym+405nwJ/Lq3plmR5QLj8EUVcGqeTRa8qWLxa1goJWNBd3Ln9kNuxAZW6oWXv+y9
 ++HZVKkOri5tUCocSKzX32qpQm3AbjGbv5Rh6qCbydOfuGAKQuRGs5h1VGBNhUb52LwR
 210AKXpJZzuWKqXk3ASg/MI0FHdQdzc0F8r4Gw+FUqJ0W8Cjfe1I6aczDURmdPRY3X11
 rWEtVyse7wxN+BNotbZrAk7CwnUkLTzhfmB6rUTsTsYcvUOIG58y1Cy4SDFVkNbQKdBK
 eeIg==
X-Gm-Message-State: AOAM53311uXUsDLaNYRlaDvecNRFi+lseBCJWvE4rAFmvlGuJASHOqe2
 oxAVrDSD02c/KhRclv/sWrwnv8jAAEVPTowE3rCEkY16zz6HXPp8GjPPKZkOPalYRer9TqtH6Qm
 gwqHbhZ9EkScIXcke/PK5KrmZuaY0vaEYiBJNtEXcA5BtiplX0D9WNgGJOymrHhdT
X-Received: by 2002:a05:600c:3b0d:: with SMTP id
 m13mr797458wms.100.1635792190942; 
 Mon, 01 Nov 2021 11:43:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxNJ6ipODIMr/C3zQvWlQZFuNSVPzituzyug8uOvpGydQDViExmEM75BseAm9ArkxcaCRd+g==
X-Received: by 2002:a05:600c:3b0d:: with SMTP id
 m13mr797426wms.100.1635792190707; 
 Mon, 01 Nov 2021 11:43:10 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 h16sm8743605wrm.27.2021.11.01.11.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:43:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] hw/core: Restrict sysemu specific files
Date: Mon,  1 Nov 2021 19:42:51 +0100
Message-Id: <20211101184259.2859090-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101184259.2859090-1-philmd@redhat.com>
References: <20211101184259.2859090-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All these files don't make sense for tools and user emulation,
restrict them to system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211028150521.1973821-2-philmd@redhat.com>
---
 hw/core/meson.build | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/core/meson.build b/hw/core/meson.build
index 86f26f0a60f..6af4c5c5cbc 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -14,15 +14,15 @@
 )
 
 common_ss.add(files('cpu-common.c'))
-common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
-common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
-common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
-common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
-common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
-common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
-common_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
-common_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
-common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
+softmmu_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
+softmmu_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
+softmmu_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
+softmmu_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
+softmmu_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
+softmmu_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
+softmmu_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
+softmmu_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
+softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
 
 softmmu_ss.add(files(
   'cpu-sysemu.c',
-- 
2.31.1


