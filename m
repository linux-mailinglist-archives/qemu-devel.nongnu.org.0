Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFE1374A8C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:39:42 +0200 (CEST)
Received: from localhost ([::1]:41094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lePF7-00017T-Dx
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOoZ-0001bP-Ps
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOoY-0004qH-3x
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kwgj8EzIgpZ4gTvY8F1Ym/ZmVleIu75EdNK0fcfU8LU=;
 b=N7CdxA033Oz234OXiApIdT4yFd63dcAa+qk+KsHKeWVYPLI1p5VB10DfOAtftkEWvqGDRJ
 sQmvmEZAXBgdywx9qvg6GCSdHJi54GD94wIBu66yqE7WFNcqqaFdEfAWvW5Dstw03TDeH5
 tS4dYWBQyGlepCXzQUWQbOUSwhLj9r0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-17yLK-k6Nw-jeVwrNmZ-gQ-1; Wed, 05 May 2021 17:12:12 -0400
X-MC-Unique: 17yLK-k6Nw-jeVwrNmZ-gQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n24-20020a7bcbd80000b029014287841063so713691wmi.3
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kwgj8EzIgpZ4gTvY8F1Ym/ZmVleIu75EdNK0fcfU8LU=;
 b=b4sGfJWxj6SzekyCrVO6J1I3pMQaFUhTLWZpAjguJlwh2ms/OI5EPKjeayf38hIWu1
 76Ii8qIFO18eqzETtjbMKZ49ap6IYENhm6eGzMnF0lQAbeZy/GN50Nxg+ubPldIAbDtO
 RAYgMZTe3qzJBaJl104fVPqua/MuM7n4x5J9BidTNvJuZRkMjLexo2FEHI7viaZTuDu0
 3GgCerbeAcdQmOxklrHmlQSSCev4v22FHw7GbBjaXF6wld+4b12J5Id36p9cTU8+3rms
 ZcbqUrhedNps84vKQ7v4Zj1MiWDvNJmionIH0kjvYem5nKVYb12kug7X15ODFZ7nAQui
 SXJA==
X-Gm-Message-State: AOAM5303gjK74OaAyuhhy2dyHon6yQBLPy1JOQSjAkEBq8Cs5LzeojFU
 Wb43ayrAnaYRSl3oPEclNdxc54uKK6xLtNMqsI/3H1P6/tYV+U5ik0oDNyjJ6/Ebkt+UoT6nu2r
 52MvxaIqsQzmt5osD4/wPY9JmrkR+fH+ut8gpZqjzeWt2xEjp91Itwa4qPEg3jHim
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr11922898wmj.157.1620249130764; 
 Wed, 05 May 2021 14:12:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeU/gkKl1/RQrzu7RIpQuniJrPJO+Ml63VXqZKBlg+G/hZ6m1AkHpuxJoOVC5f8lxaHV7+Eg==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr11922883wmj.157.1620249130551; 
 Wed, 05 May 2021 14:12:10 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id j13sm662525wrw.93.2021.05.05.14.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:12:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/23] ui/curses: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:40 +0200
Message-Id: <20210505211047.1496765-17-philmd@redhat.com>
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/curses.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/curses.c b/ui/curses.c
index e4f9588c3e8..f490b2d839d 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -65,7 +65,7 @@ static void curses_update(DisplayChangeListener *dcl,
                           int x, int y, int w, int h)
 {
     console_ch_t *line;
-    cchar_t curses_line[width];
+    g_autofree cchar_t *curses_line = g_new(cchar_t, width);
     wchar_t wch[CCHARW_MAX];
     attr_t attrs;
     short colors;
-- 
2.26.3


