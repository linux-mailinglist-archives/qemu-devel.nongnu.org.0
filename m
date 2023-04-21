Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAB46EA707
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:34:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn91-0008Cr-C3; Fri, 21 Apr 2023 05:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn8z-0008C9-Lv
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn8y-00031u-CK
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0A1oNUBxSBJvG4Ve5ByHYqFUyNpEsrySK2IqWao6VYY=;
 b=iOLQp8v5eK97vTmNGeGFT00C8hYHoHpyogcBKzgzTu/yGARtU4ThuDVnWEDy8nf8LwMKOD
 z3lVjjUj18f4THd3rhqMLoYJppQFlbjOk1+tp/HtGRoG2A6epFVUjzv+gjtLGVjzQWNxrk
 Ki3GaSENsbtqL6F5NwGT7BNejh7rRtY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-JlQGzZg3PPanFI5esHpEig-1; Fri, 21 Apr 2023 05:33:25 -0400
X-MC-Unique: JlQGzZg3PPanFI5esHpEig-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-953429dac27so122770766b.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069604; x=1684661604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0A1oNUBxSBJvG4Ve5ByHYqFUyNpEsrySK2IqWao6VYY=;
 b=Q9AB16j105to5FN4nQM5ypoYjB1CzJJ6iOAA6WBE80bK/qFt7ooBC116G+MgA1PO3T
 6kUnxT/LIV6m6kqH33nKTf9O1zDCzE26oWhCGVw+It700/9dZ+8G0A6nL1OMTnp8np/T
 05swBKsQpuj5IN8U35va9n6KCB7AVAVaV1/kdVAZHnp6xALBtESzi1NCML/b+VQ09nU2
 HZYsujGZvBITuOpkuCQjRPnE7ND29xaw3k5MbWdMHfA2SD/L3OV3tFA6rascdu/2qfS6
 ClbqVfs9331VZ79f2pdNId6ULc0G2/OFsy7QLi4kpY1hNtscLsWqmYvMfB6fOyHJIH82
 P6zw==
X-Gm-Message-State: AAQBX9eXHuTckeJ+zIaOBxk1yUgAkyJ2CeFVYuXTAFHd6uAescWMDZ2E
 +FrRAVuiILCideAe3QdtlS4xqznWxHMCIQhxNBoELNo0FMo4V3cAiivFuGxL4JLRTOTAsI3yAOt
 JVW4gpdmYVETGDn25AdkJ7Pzutc6HoblZiWF9BIntNYoM+Ut4sRIbDgT+qIhK8hcW6iX+ZhCEAb
 xLKA==
X-Received: by 2002:a17:906:ce37:b0:957:800:912f with SMTP id
 sd23-20020a170906ce3700b009570800912fmr1777133ejb.71.1682069604555; 
 Fri, 21 Apr 2023 02:33:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350bSG/nxI3WUX9Ws4704gdjeKQZ0WK1XC8GR+c4WOCET5QGPHbsQVZcRb1VScnClyh2KoVgfbQ==
X-Received: by 2002:a17:906:ce37:b0:957:800:912f with SMTP id
 sd23-20020a170906ce3700b009570800912fmr1777119ejb.71.1682069604299; 
 Fri, 21 Apr 2023 02:33:24 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a17090614d500b0094b87711c9fsm1823908ejc.99.2023.04.21.02.33.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/25] vnc: avoid underflow when accessing user-provided address
Date: Fri, 21 Apr 2023 11:32:56 +0200
Message-Id: <20230421093316.17941-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

If hostlen is zero, there is a possibility that addrstr[hostlen - 1]
underflows and, if a closing bracked is there, hostlen - 2 is passed
to g_strndup() on the next line.  If websocket==false then
addrstr[0] would be a colon, but if websocket==true this could in
principle happen.

Fix it by checking hostlen.

Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 ui/vnc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index bbd8b6baaeca..9d8a24dd8a69 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3751,7 +3751,7 @@ static int vnc_display_get_address(const char *addrstr,
 
         addr->type = SOCKET_ADDRESS_TYPE_INET;
         inet = &addr->u.inet;
-        if (addrstr[0] == '[' && addrstr[hostlen - 1] == ']') {
+        if (hostlen && addrstr[0] == '[' && addrstr[hostlen - 1] == ']') {
             inet->host = g_strndup(addrstr + 1, hostlen - 2);
         } else {
             inet->host = g_strndup(addrstr, hostlen);
-- 
2.40.0


