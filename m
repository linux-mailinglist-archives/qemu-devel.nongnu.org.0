Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C78374A15
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:24:23 +0200 (CEST)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leP0I-0005Z8-Up
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOp1-0001sj-1K
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOos-000518-NW
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2rQqCwa2CI67ec0xDXbK6Ggh5ghN1UL3hcSFXFlsJk=;
 b=Pr5udrgg9TS1uJAKCi2lq3mFIwJDE2jHHp3IrDGNik3dqpGBZyvt+g292yUiuS3WlgxwLd
 pAPVZn/HIU+5XdDR4IYMjC+SZqcvg3LuHFlnxWOCmPObT7mANbpZojA3Ofjx9YvSNwHV7e
 ygRPxMX4d8+wfC63YMCZABOBVX+yHhM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-AIdE_iyoPCS_kQaevwGNVQ-1; Wed, 05 May 2021 17:12:32 -0400
X-MC-Unique: AIdE_iyoPCS_kQaevwGNVQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 65-20020adf82c70000b0290107593a42c3so1219075wrc.5
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X2rQqCwa2CI67ec0xDXbK6Ggh5ghN1UL3hcSFXFlsJk=;
 b=hOiGHs5EHE1GTPBi7tpOhC6W3OWo3yNrjv05gF7d+7v9N8DNuGIa0Qhd/+kfbOTSIq
 tze6TSIS+FXYfw3ZCBXMGLDhsceNL0jb9W4XDEnruDmjTQHKbA8Rl+b699A+kj/OdFBW
 KlhjLDnnIG9kpbpIzCAYAOLy/NvscrlPpIBSnDPF1q9raQubFVt1wGHCe3+ClFo43f7Q
 YuFMmGzluJ64Kwkxn4jXQtsyYLGENwOrCvK+LFJE25/I5o8Y73OQki940dPF944j0LEs
 7i5FyIjogGn4XlzD2GVc/1cVR18RcPZUSGYkVr/nxhcgwsoPFf6zT8HhSYYiCjtupMfP
 c9bA==
X-Gm-Message-State: AOAM533vyiSuHoAtld1XRHSGT3QA8n54F1HhJhI+BahRwfQb7qp0oRba
 cYT63Dc1wMXC/wmEBUt1goW3oG/8vf1GWqfho8wtCl/Njl8zhLjYWC0skK1Qwc+K6hMvXZai+6C
 BDskDwccUhr1cdqc4I/OLTOABRrLJdQ/qKCV+oAeU9cc+pgVHlSnh2bheFSWWWrsb
X-Received: by 2002:adf:e48f:: with SMTP id i15mr1079380wrm.266.1620249150714; 
 Wed, 05 May 2021 14:12:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs8cqrFZGnHSpVMS8gH9Bhhk3os49FfcAKDoTxp7au5qsa5UU88MA7gB+W9tdKfVtG2iUBug==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr1079360wrm.266.1620249150497; 
 Wed, 05 May 2021 14:12:30 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id o17sm678489wrs.48.2021.05.05.14.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:12:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/23] util/iov: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:44 +0200
Message-Id: <20210505211047.1496765-21-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
 util/iov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/iov.c b/util/iov.c
index 58c7b3eeee5..fc76d717e14 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -623,7 +623,7 @@ static int sortelem_cmp_src_index(const void *a, const void *b)
  */
 void qemu_iovec_clone(QEMUIOVector *dest, const QEMUIOVector *src, void *buf)
 {
-    IOVectorSortElem sortelems[src->niov];
+    g_autofree IOVectorSortElem *sortelems = g_new(IOVectorSortElem, src->niov);
     void *last_end;
     int i;
 
-- 
2.26.3


