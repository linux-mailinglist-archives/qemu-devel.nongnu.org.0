Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56F06D0522
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:44:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrdu-0006Hh-K1; Thu, 30 Mar 2023 08:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phrdq-0006GY-3k
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phrdo-0003Yo-GN
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680180271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gIazBeJ63WjSiXsPhQT21nW30Qf0dH+4hNe+hy29NYg=;
 b=J/NClUSfmObWSvMMrhrZ2dsu6+RJTagSghLyebGc17WKhaO5pokOIJkk/ktY3Nsh5nA8bb
 cMYm7gxrrasBcO41sm+39B5ncbw8bnPXSecOwbyQaMH3YcazCvYNzyrewZ3hypOCfNol8i
 VcHzQv2MOAbAX431AmbwMmxptpcdrjE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-V6jimQpSMXiLodoQCRmULg-1; Thu, 30 Mar 2023 08:44:29 -0400
X-MC-Unique: V6jimQpSMXiLodoQCRmULg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d5-20020adfa345000000b002d716fc080fso1984074wrb.22
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 05:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680180266; x=1682772266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gIazBeJ63WjSiXsPhQT21nW30Qf0dH+4hNe+hy29NYg=;
 b=Q4ofjL+hgTjDedHevEb09OC8rHb7Fc6TW1rFI7oeCPGhqcEudCYSX0ZP3mwQbwztuf
 YcIM4S3rdmguiGoHxCYqqD0v4ff4UY8mh+o19ChvKB966Vo1ZfgXCkIOJ72aE4+zlLv0
 mEA9TSA5y4aawAWUqC7GsrpbtgYWj2ArrGRECmcwzHZCYMTPjIZJUKlDXGq5nViazvYa
 1dBa/BTz8+ZH2Aqx40Q4S2yvCoQreTlObEYtFM9HRDSzKL9JftquBHmtsM+IsSf5yjie
 puCegdXs7CT5zR3nN98MNojrc4bI+sLWwQO1Rwsh9ziaHQHg+A2Tv1HJIlpjaXp/2/bw
 dcmg==
X-Gm-Message-State: AAQBX9cubg8tkbJyRTOv/RR1wkTfV+si5kEbmWN9FEfny71XyA6GOGST
 LNeU3w/IRTnagCLFr5L2kYK7duv/cMAY7PLpmU4tAU8T6WDbCwo0jCUwOD4eRQ3SwAU16NfX92R
 s+za/FrzCjEc3o0KkAVg4eE9BRllb9ZoAeyUE2KizN/91SBn9CuPXcMhXBQkFYS/8gDO4tljI/A
 luig==
X-Received: by 2002:a05:600c:2313:b0:3eb:2e27:2d0c with SMTP id
 19-20020a05600c231300b003eb2e272d0cmr4735633wmo.1.1680180266128; 
 Thu, 30 Mar 2023 05:44:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350bw2+bqPvh5d5ZpsJfX9/QuXK0gbmlLzEPt1RM4KUVwUqlchN4YPOZb7At3GCnS45tzdw6gFw==
X-Received: by 2002:a05:600c:2313:b0:3eb:2e27:2d0c with SMTP id
 19-20020a05600c231300b003eb2e272d0cmr4735619wmo.1.1680180265734; 
 Thu, 30 Mar 2023 05:44:25 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a7bce92000000b003ef71d541cbsm5732958wmj.1.2023.03.30.05.44.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 05:44:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vnc: avoid underflow when accessing user-provided address
Date: Thu, 30 Mar 2023 14:44:24 +0200
Message-Id: <20230330124424.40610-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
2.39.2


