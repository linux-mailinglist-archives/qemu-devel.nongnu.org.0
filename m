Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02340374A02
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:17:43 +0200 (CEST)
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOtq-0006bO-1A
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnc-0008JW-E4
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnZ-0004Ee-M4
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jsw0hjQgHEh8fe+V8icgihsn1Zo56TzjPc95CU2mxS0=;
 b=XO2dNvh+rbIHzNtMLodTOzUf+D8BYazbfStbsIFp4+8WjSXj8Y7Q6Hd7AmELrKd6EbDAyn
 SQgh8dYsnx0lAHJD8vowAjjt1CwsFgAqxLOPJ3qfXPsyd1Dgt48HfCNyIisDcneeZtIQH8
 +JiNJ6kjFhoYdAlD+Ky6iwSscNxBKlc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-b2x9IoaEOg-enVhnxLh-qQ-1; Wed, 05 May 2021 17:11:11 -0400
X-MC-Unique: b2x9IoaEOg-enVhnxLh-qQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so1190505wre.22
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jsw0hjQgHEh8fe+V8icgihsn1Zo56TzjPc95CU2mxS0=;
 b=FhhCzZgcnypZu5rIEIC83TUZoyeZO89RgOcUAUNSxgY7L5WuWfAOYIbBrE8sO/i5FL
 grtrJ+gNp8naOtrjm9LvJd5DdS5+Z9QQ7lM+Z2gRs35qTP1Y8dGv382cObYNQVED7zOl
 0vgsw/3v+As9fEVpCmdW8OWOaXvtBtaadMhHrWnPKkLehLjZqIQWVi6SR73mP6U0Lhqd
 AMMci1I2C+jGTV0LT98Op6cPydx5J6oTegWCVhfsCaq/MKI+Q5voMPxnajX7dG7g9+Lr
 6ITdG22ZiC4YLkfZepjJ4RIS05/m1Z49JBItZweh7UZS+0ig61orZs8yhD425emRUOBi
 DIQw==
X-Gm-Message-State: AOAM53206c4kuylkBXOky+8iSRkWEiaVLrDUlBGpwprzyk2/rwZktIX1
 S/zSu6GkzGcM0gf5gQeGZ933Z6M6xxNeIxrJ/p+fE2o4LoMrGS3a4EAWbTdcd/a0uQOEadhWew4
 4erOh5lW2+JUlJEB1dTCT2imJk+2YY+SKGyz7oNy4FmjMSQeFGVpU+jZhnW9x1Fcw
X-Received: by 2002:a05:600c:2d42:: with SMTP id
 a2mr11900719wmg.99.1620249069641; 
 Wed, 05 May 2021 14:11:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFx12/Cfj5SAGn1R6ueiw6IPzEuQQsz5cieDZOJJF77UKfykeNTFXuTfy86XJg4oIqT3Aung==
X-Received: by 2002:a05:600c:2d42:: with SMTP id
 a2mr11900694wmg.99.1620249069425; 
 Wed, 05 May 2021 14:11:09 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id m6sm761402wrp.29.2021.05.05.14.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:11:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/23] chardev/baum: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:28 +0200
Message-Id: <20210505211047.1496765-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 chardev/baum.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index 0822e9ed5f3..bc09cda3471 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -299,7 +299,8 @@ static void baum_chr_accept_input(struct Chardev *chr)
 static void baum_write_packet(BaumChardev *baum, const uint8_t *buf, int len)
 {
     Chardev *chr = CHARDEV(baum);
-    uint8_t io_buf[1 + 2 * len], *cur = io_buf;
+    g_autofree uint8_t *io_buf = g_malloc(1 + 2 * len);
+    uint8_t *cur = io_buf;
     int room;
     *cur++ = ESC;
     while (len--)
-- 
2.26.3


