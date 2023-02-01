Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A629685E05
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:39:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3w2-0000tP-7p; Tue, 31 Jan 2023 22:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vx-0000Gz-Ts
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:37:17 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vw-0000b5-9B
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:37:17 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 l4-20020a17090a850400b0023013402671so721113pjn.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJjgj3IIFVAqBly66Z6Xi8AkW/Nl2V0Vhn07Bk+a+M4=;
 b=AijaghDHWViBWEw684xxN83QmxXwWUjwMrb8D6W7Mg26SAR9iCGl/CnqA51LtT9vYa
 OZWtl9Zs2BaH8WuJ2z3KyanRF3MENEPuCSDUzEdUCt+JbsYVqgzxsOAFL38eXKtY+9cD
 IS11BL47D6inu1ngtjbXK0Y7zUqlKORRUSb4DVFt+iCD4F7hZgqFmzZtxhLvgJEcBO2d
 F7fCL/d+97ta3gfRpd5O82l4ryJaHvuUUVme8qAGwfZ8+VMPtsVV8BP5FpyPfbzIzfKD
 ZpTZiL92yEm2NgVvcyPb72CXRBbADnCvVkKhjyAJ3Sbao6tLDq+YVxUABd8g8dFHTYMV
 bBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJjgj3IIFVAqBly66Z6Xi8AkW/Nl2V0Vhn07Bk+a+M4=;
 b=k0vVo22IbhDyksNpv2kkYEmiY94I4lvIFzf8qfkrQT1i4o95GSEsTHIcWpaTnjGsDZ
 th0U+ga/mGsHYm9zzIcon1UDtlNllx4feIBhjpSoOyWR6J9iA8l5oeuUJ0gH7QMnU9h7
 krgw4pmWaBCa877cH6c+Bt8M3AWIwxL2w07XOFM8kx1tXSNVK7x/7IHA0zO0tcZH2ivR
 vAI3imHzIE+1Og0PdDmfdvfoO1+mCT041gFTRVnpzAbBMs+bWLUnL4cM+vpRGOyhUkC/
 uCSj3gq7xHDaxEdF2hAyBabjuVSmr9cwTswJDTb6SqRkykmBUwUj5TIOjPFj6cSLsb8E
 gqAA==
X-Gm-Message-State: AO0yUKVpDXcIfZOoSS0Z46L29dv+mSsRZqg0nD0G9jZ/oOwLhUw0sIqc
 fYHSgkupZHLVdhuR8uYfrDt3Lw==
X-Google-Smtp-Source: AK7set9IpyN8A+jmOdomN5kStyYhPCtRV+v0WNPQNsmKcprrIgs3sftmnEvjnCrSaBsUICDqNO9dCg==
X-Received: by 2002:a17:902:db08:b0:196:6577:5a96 with SMTP id
 m8-20020a170902db0800b0019665775a96mr1695532plx.30.1675222635660; 
 Tue, 31 Jan 2023 19:37:15 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:37:15 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 28/29] MAINTAINERS: Add e1000e test files
Date: Wed,  1 Feb 2023 12:35:38 +0900
Message-Id: <20230201033539.30049-29-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 958915f227..e920d0061e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2218,6 +2218,8 @@ R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/e1000e*
 F: tests/qtest/fuzz-e1000e-test.c
+F: tests/qtest/e1000e-test.c
+F: tests/qtest/libqos/e1000e.*
 
 eepro100
 M: Stefan Weil <sw@weilnetz.de>
-- 
2.39.1


