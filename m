Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04456381A35
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:42:17 +0200 (CEST)
Received: from localhost ([::1]:39098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhyIq-00079c-1g
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyF2-0001uW-JF
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyF0-0006ai-Ht
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGHwK2BS4Tjt7sYTruLWMJBHTB2i72gwei4DqcaqGkk=;
 b=KLMlI859MsrgmBfuYjpLR6pv5fr5W7VFXKOyNrw8Y45ZTkjfVxsDVeJER+Uh5zo+1Slzr7
 19PLegE24Qyf/VhNcLVuDzZ8uoG5nxi8x1iTQ8d0R34c39sAZ295uAVRYjdAm1288wkx8D
 Rs3WWQGSToigszQozohs1hf5lMulhNs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-JR2k9XJgP_i5W_X4GRjKfA-1; Sat, 15 May 2021 13:38:16 -0400
X-MC-Unique: JR2k9XJgP_i5W_X4GRjKfA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n127-20020a1c27850000b02901717a27c785so1649048wmn.9
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hGHwK2BS4Tjt7sYTruLWMJBHTB2i72gwei4DqcaqGkk=;
 b=Van6jsRkuudGJEyvRXwc7v1yiqaZOLhq1rSZOpngN71yt4Fqd5UJCdZqFwzIc5JnzA
 B9zZZVCO6B6v2OBs/i9WVLHsKi/l64sF8b4WTMx2skXVYE0PfWb9Co85s12bXOaC8d8s
 RK/IQWFK6FxCa4g3VaUZGwj3xNiN5nlcfYeNPSG9yyyjZoNwVqwMP7vNlvyl9QTLNg76
 XU14uFNmriKwJ/lxqLqqn5w4gFm9jiduLe/4C0SvJj9YXFcmfS8JF08VXLe3nXh/hLNH
 zFc/CAbWhzq0AZX90KrGUb1xAqijEKV/RgGnGRXQrj/nOantcNgH3rCo0Ep+DPSEuLS/
 l7ag==
X-Gm-Message-State: AOAM5314Odi/KFrQ8D8J+TOWELLDCYCX4hEK1PbZqCbnlQGrvWy/Bjbh
 +dj4ywsjWXUAWE6APUy3NGEhtB7UkuoSkdvpLXzm5LeMQPvW9/962bZipKPWbSLQhDvd23J0K9G
 uD86IoSTRs2mS9FdixMzRfptB9ehDODLTBcoW9iW2ZyOBWfM+Zb0EeKT40rkccZw/
X-Received: by 2002:a5d:6291:: with SMTP id k17mr67310872wru.247.1621100295203; 
 Sat, 15 May 2021 10:38:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziUdH0gQaG56xw1W0ltobq2jlmlmrXQ0vKqRadi5wNLYD7c6p1gpn9keAKYuORV89RZuLUbA==
X-Received: by 2002:a5d:6291:: with SMTP id k17mr67310848wru.247.1621100294991; 
 Sat, 15 May 2021 10:38:14 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c65sm1856551wme.47.2021.05.15.10.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:38:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/12] hw/ppc/Kconfig: Add dependency PEGASOS2 -> ATI_VGA
Date: Sat, 15 May 2021 19:37:16 +0200
Message-Id: <20210515173716.358295-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

While the ATI VGA device isn't a requisite (no crash without it):

  $ qemu-system-ppc -M pegasos2
  qemu-system-ppc: standard VGA not available

it is useful to have it with the Pegasos2 machine:

  $ qemu-system-ppc -M pegasos2 -vga none -bios pegasos2.rom -device ati-vga,romfile=
  qemu-system-ppc: -device ati-vga,romfile=: 'ati-vga' is not a valid device model name

Add it as an implicit Kconfig dependency.

Fixes: ba7e5ac18e7 ("hw/ppc: Add emulation of Genesi/bPlan Pegasos II")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 2e4c56eb770..e36db08665a 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -77,6 +77,7 @@ config PEGASOS2
     select SMBUS_EEPROM
 # This should come with VT82C686
     select ACPI_X86
+    imply ATI_VGA
 
 config PREP
     bool
-- 
2.26.3


