Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DAC5F44CB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:51:24 +0200 (CEST)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiKR-00010s-DK
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgS-0007bL-T2
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgQ-0000Aj-Uq
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:04 -0400
Received: by mail-wr1-x434.google.com with SMTP id bu30so1360123wrb.8
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TvimNHgM7Sk2jYD3Qtajf5Xw1mxMYG9IjtE/Y/vVwl4=;
 b=HvNMmuVRgObhO6wCxj4wGuwyKuhb+LbBxmvhu47f1HeWGEszTg29lXy32aFNUAld7o
 v/BEmhutckrE1UQ54ypzvg+A//6QYBVom4YUpjv6p9jzeGyUe44xBe3Z+Rcm/pZ/NIff
 pQMEU5vGV8ZKtlhJ4n+n3E7553ZpSLctXKrMmfpmfT2AkHBUWt7j0locSmFfmYNyNIiQ
 M4PEpOGgL6Qf10kUoifK+3Deo19i0n5vjzmexETgPErOSjiM73DIC63fzvnfoAnABUc1
 g29QjYC3BxZtNyDNKokITI8wh23iAwKul8TDiOuH8mlQF1skvTar4X0V47zvvpqMJ+/x
 36GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TvimNHgM7Sk2jYD3Qtajf5Xw1mxMYG9IjtE/Y/vVwl4=;
 b=y6P+moufgwWGE7QihcLCrBCAqOQr4p4X/TLA27vndbU9lPhz1obdYFPOxteEP3STx3
 vgPYicZkycDiKVQj8hS1xeVkGwVb5HPxboXvC/3fVSb184UT6INwnt6MCyi98lP+zwA2
 FXZl3dDSlhCzOPcNv/UszM9ZmXfC5zSdYeYGiyBXQvbAh8c2IXgkBbgoUGb/n+En5jdV
 H47K8EtOZqmTba17S9fe0gf2ycYG7xMJkHQi64AJ9GC1gRe5+C0l1C64Tpi4AbwAM1Fo
 hMLOqr6WmxmqLCRbMKHsMvF6YEOHPahj9kEkFSnqhqT6EEFM7pSEwuDK8Si1Cbxzu+S4
 gd6Q==
X-Gm-Message-State: ACrzQf3pcm9iL+pO6yjznFDcxcRIy1hUS7rGtZ2cQa14GBi620s/0ECA
 P973rJL26Tia9tXWXzxxL3fl0g==
X-Google-Smtp-Source: AMsMyM61+bt1lwoK6eR1MECFOcYWahVK9ZOlBx7ASOngYo3f+bDUl5SzXW9CnDKQVq1lSuEs+phSAw==
X-Received: by 2002:a5d:65c4:0:b0:22c:dbdd:7177 with SMTP id
 e4-20020a5d65c4000000b0022cdbdd7177mr14273266wrw.470.1664889001540; 
 Tue, 04 Oct 2022 06:10:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b003a5f54e3bbbsm21654184wmq.38.2022.10.04.06.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:10:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 07B701FFC6;
 Tue,  4 Oct 2022 14:01:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org (open list:Virtual Open Firm...)
Subject: [PULL 15/54] vof: add distclean target
Date: Tue,  4 Oct 2022 14:00:59 +0100
Message-Id: <20221004130138.2299307-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[AJB: add clean dep to distclean]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-16-alex.bennee@linaro.org>

diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
index 8809c82768..4e59009e67 100644
--- a/pc-bios/vof/Makefile
+++ b/pc-bios/vof/Makefile
@@ -19,4 +19,6 @@ vof.elf: entry.o main.o ci.o bootmem.o libc.o
 clean:
 	rm -f *.o vof.bin vof.elf *~
 
-.PHONY: all clean
+distclean: clean
+
+.PHONY: all clean distclean
-- 
2.34.1


