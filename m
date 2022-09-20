Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BC85BF18C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:53:48 +0200 (CEST)
Received: from localhost ([::1]:42226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oan3j-0006gt-Nv
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam5E-0003oc-Kh
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:51:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam5D-0001Qn-5o
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663714274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJN8+CcKlnYyD18fUmuo4UQ+WkRykLBYx3hA/wBQj6o=;
 b=HkjL4md2CvMiXi6zrmEidP8CLX8+vL9rxYXyOjjYk7u/R+4R084HRDZeXRSWWDCmctmUKx
 OeB6C/4+966KZ6bUwrftizDHyzVVJ7Bw+PHHwlACAEBXjNlfk0Ne9zGnJyuFDdqis3a3tl
 bLzZrvMb+KzO0ZabOBtusmq5wamMcJo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657--I12DEW8MJWuVXHl-I1T0g-1; Tue, 20 Sep 2022 18:51:13 -0400
X-MC-Unique: -I12DEW8MJWuVXHl-I1T0g-1
Received: by mail-qt1-f200.google.com with SMTP id
 ew15-20020a05622a514f00b0035cb76e35e5so2877696qtb.7
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qJN8+CcKlnYyD18fUmuo4UQ+WkRykLBYx3hA/wBQj6o=;
 b=5F1RbhUsoBKzzV3evlRM6gpUkSHghVLEmsCywzDX3t3TwszTswj/Qd702LY9UgFNxW
 kWKiDe8yK1KhEvMJQpHURrHbPF1SEj9lQfNd48DarR1QRxkmWVmBSmcleeZkeZr5VzIW
 J3096yS/ey8oy/6EVLlLoJ2dkaGn2M4CRiIgWXfc/0ZE2DbwfnVjTMN4lTIw5tSFjBlS
 9NXQo/QbV0w/Dt9xREhNo2+Zqil4SZNtFf7aSYRwgL+gxcW9jnnk9T04PvVKmW570vnB
 IiyG4DRbqhmmPGPa7qmqdg3M6/fAYGyb+kY852Xj02Rswav6pQLpDaMpIpdBlVhGIrCx
 cC+A==
X-Gm-Message-State: ACrzQf06qpUXTut5VW/kvbF3gX2TARQjEL8pcI5WZmLvg9/6ceR75Hug
 lcBp1tBBoxz4fw62bON95Xr+Tnp0Tk58COPIf50BYSqyt4/D1yHWcUlYLexuthCghAHNIV1+Axp
 dKG0GoTv95V86j2q6Uj9bIcETaA88XdvSOKwk/uZ/gRmGTc8IpUEKvCHZMxfIr6w7
X-Received: by 2002:a05:6214:1d2e:b0:4ad:df6:96e5 with SMTP id
 f14-20020a0562141d2e00b004ad0df696e5mr20307948qvd.100.1663714272889; 
 Tue, 20 Sep 2022 15:51:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6vvCG3bJRFR64pKItfApziN9fhgqI30bCH/Yo98MT/HvnvaFLEttS0OS6Vh2ucGB9FeLgpWQ==
X-Received: by 2002:a05:6214:1d2e:b0:4ad:df6:96e5 with SMTP id
 f14-20020a0562141d2e00b004ad0df696e5mr20307928qvd.100.1663714272680; 
 Tue, 20 Sep 2022 15:51:12 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 j12-20020ac8440c000000b0035d0655b079sm275470qtn.30.2022.09.20.15.51.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:51:12 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, ani@anisinha.ca,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 03/14] migration: Trivial cleanup save_page_header() on same
 block check
Date: Tue, 20 Sep 2022 18:50:55 -0400
Message-Id: <20220920225106.48451-4-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920225106.48451-1-peterx@redhat.com>
References: <20220920225106.48451-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

The 2nd check on RAM_SAVE_FLAG_CONTINUE is a bit redundant.  Use a boolean
to be clearer.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index fc59c052cf..62ff2c1469 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -661,14 +661,15 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
                                ram_addr_t offset)
 {
     size_t size, len;
+    bool same_block = (block == rs->last_sent_block);
 
-    if (block == rs->last_sent_block) {
+    if (same_block) {
         offset |= RAM_SAVE_FLAG_CONTINUE;
     }
     qemu_put_be64(f, offset);
     size = 8;
 
-    if (!(offset & RAM_SAVE_FLAG_CONTINUE)) {
+    if (!same_block) {
         len = strlen(block->idstr);
         qemu_put_byte(f, len);
         qemu_put_buffer(f, (uint8_t *)block->idstr, len);
-- 
2.32.0


