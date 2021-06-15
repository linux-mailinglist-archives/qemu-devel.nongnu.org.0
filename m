Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F233A86E4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:53:01 +0200 (CEST)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCJA-0004oA-NT
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEk-00053k-9i
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEi-0003ZA-RR
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rBGmlWWdNqhJONAA1i8jAn+bT/MVszHhvaHYRQx6bnU=;
 b=HA2Cd3PLZm1jUnZtLz20cGToJv4YQkiNfRCm2OVWZ5HlAXbSlezAeTY0NTtHz2tGkRB2XX
 49B+sweqpHC05gkZQZ1uh+Bo0umaJme8H+aY9oEiWT/rd0mx+1MO9//dJClDXhRPWeROLI
 4NqIDdq0zB+ad2QDULczIZ2nJG3mfaw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-C-1esjMAOa-kmG_MNkp7hg-1; Tue, 15 Jun 2021 12:48:19 -0400
X-MC-Unique: C-1esjMAOa-kmG_MNkp7hg-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a05600c1c85b02901ac8b854c50so1753529wms.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rBGmlWWdNqhJONAA1i8jAn+bT/MVszHhvaHYRQx6bnU=;
 b=PDBEcAHxMFwwXIEqh3n+O4aHlZf4pp75q5akViPrUdcqxQ6HNsvmCK5l9jTNG568QS
 ZJ7rb2XKEnSz/dkdT2s2Brx4RFdAcdn8PDfQGmWpiMup/MszUkVfAT3hPpfwDDbkF+ts
 +DTRPHhuyNnf7yZZnwklCykaOeQSpBEetEXZpaU8XFUkvmudSHsftV/glhx/mOycy/qW
 BXEUOky/w1227zR80vTVfooPsA/3J3A8Zv/H2sHvpkAKNySEFETjUelIDCtUdwMwWuVS
 qtrreMghEjAXJhtv1sQxWqNH5Dv7hb7u/GzI000SkNASbHqBC4HyS4HM2zz3DMh2scN5
 CaVg==
X-Gm-Message-State: AOAM533rCZC4FXyVcbpjfVCX5Ohi0jY+kVjwXTXFraUjLNcIBlJUPOLh
 RmP8znfGdEVAHbiv/poFlx+u19I9c1WxnXvdz/zIWPWsJDXj/X1Tevea9VHeB7zr0MCOwYVt5ly
 c2KnDUkMKFnK1xf3Q2RWKaftIsjLnjlSEI/srZDuQX+VOEsXjsJuxFyPKJF4F66Xh
X-Received: by 2002:a5d:538c:: with SMTP id d12mr49279wrv.116.1623775698591;
 Tue, 15 Jun 2021 09:48:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3fYDqB5MDpICipwQfOhKPhpClDR68jW5F0WKbZk10AQuFIng7zwCpSskVFgW//sQ+U1ov3g==
X-Received: by 2002:a5d:538c:: with SMTP id d12mr49253wrv.116.1623775698451;
 Tue, 15 Jun 2021 09:48:18 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o3sm2880918wrj.94.2021.06.15.09.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:48:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] ui/vnc: Use qcrypto_tls_session_check_role()
Date: Tue, 15 Jun 2021 18:47:50 +0200
Message-Id: <20210615164751.2192807-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615164751.2192807-1-philmd@redhat.com>
References: <20210615164751.2192807-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_session_check_role() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/vnc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index b3d4d7b9a5f..ad68f9b639f 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -4080,7 +4080,8 @@ void vnc_display_open(const char *id, Error **errp)
         }
         object_ref(OBJECT(vd->tlscreds));
 
-        if (vd->tlscreds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
+        if (!qcrypto_tls_session_check_role(vd->tlscreds,
+                                            QCRYPTO_TLS_CREDS_ENDPOINT_SERVER)) {
             error_setg(errp,
                        "Expecting TLS credentials with a server endpoint");
             goto fail;
-- 
2.31.1


