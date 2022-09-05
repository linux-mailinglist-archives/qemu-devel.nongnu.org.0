Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AB95AD138
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:13:38 +0200 (CEST)
Received: from localhost ([::1]:35394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVA2r-0000SO-1P
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV9Si-0003Gt-6V
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:36:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV9Sd-00083s-7o
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662374170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x4d1Bc8wuuC3keHK2C4D2p4wqXTqE5Og1MLJaawCHmg=;
 b=KbEArBQ0I17X9hXvtWFJcSUt4DlBJKvx2gFocefC2O638KsTo1WD8ZV9aZC4ZAHHMRmnu2
 c3+Aa60sowHuhPyGct0Ly7X7AGwAd+i5WEutvMXVlleKJRRN4r7rrLnrc30lgomgo2dxli
 K2mXFMS/9o6I4Ryb5qoPFnvBtdVNhlk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-VFQpraucMdqvA33YQglPog-1; Mon, 05 Sep 2022 06:36:08 -0400
X-MC-Unique: VFQpraucMdqvA33YQglPog-1
Received: by mail-ej1-f70.google.com with SMTP id
 qw34-20020a1709066a2200b00730ca5a94bfso2167081ejc.3
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 03:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=x4d1Bc8wuuC3keHK2C4D2p4wqXTqE5Og1MLJaawCHmg=;
 b=ty8ggB2LxphuRODu0zt6QvC+f42Q3I+MXeM2DymZaAJnTbaDxdvKNwY2LOvY/rUixa
 IsHjqg2qjs7MkgU0QMxkFfzib/6JS36/pYG0Mdi/Y66sqAGVwXPoaFUmnY8zSWqaFhn0
 RdhV19XHTcA4K/4U7ZEiPT9g1/AimufKGMQgCUE/vxmWnuY83M/KfiaVQEDvfvbwQDif
 80YE6o8e33iHqrZaOrKD64FYw6Jx7z9zY/5J9kUsnigyGSOXqnpxJtyOdeuyFktQprfM
 N1mfI6thQrWcWjmJKY2g99J75RSzOF/x/SgrIdbI0Mi2LUOrFjo+MCbdjKN3ahQ3gZfX
 9aFw==
X-Gm-Message-State: ACgBeo1Z6uger6uLva3FXCEx/d7ml/eSrrYpBqvm73XlgzhFTLGSqKVy
 bbIEdYOKxdhctJsIE4lxl4TqhIJq5wLFQiWx2A5aK2PpDlieB3zhHfcdYbEdwKC66/8NgeuBKk/
 Pxei7hTpt/kDF7vbGtNDyBVLGBXwABbxp9WCTirF/ntpZJkZahPwgzjlkh4RAp0zZ+LQ=
X-Received: by 2002:a17:906:4789:b0:74f:f771:4b3 with SMTP id
 cw9-20020a170906478900b0074ff77104b3mr10605739ejc.621.1662374167688; 
 Mon, 05 Sep 2022 03:36:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7BEpUV6Sr2iQdNgcUUFcM8pSzf5AMoNUzVo3Bum5xk76uXFTfR4piO3EYE0E4xrNtyRxgmLw==
X-Received: by 2002:a17:906:4789:b0:74f:f771:4b3 with SMTP id
 cw9-20020a170906478900b0074ff77104b3mr10605725ejc.621.1662374167327; 
 Mon, 05 Sep 2022 03:36:07 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 q9-20020aa7da89000000b004480ab43673sm6311912eds.55.2022.09.05.03.36.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 03:36:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] smbios: sanitize type from external type before checking
 have_fields_bitmap
Date: Mon,  5 Sep 2022 12:36:06 +0200
Message-Id: <20220905103606.27978-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

test_bit uses header->type as an offset; if the file incorrectly specifies a
type greater than 127, smbios_entry_add will read garbage.

To fix this, just pass the smbios data through, assuming the user knows what
to do.  Reported by Coverity as CID 1487255.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/smbios/smbios.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 60349ee402..485fa15202 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1205,7 +1205,8 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             return;
         }
 
-        if (test_bit(header->type, have_fields_bitmap)) {
+        if (header->type <= SMBIOS_MAX_TYPE &&
+            test_bit(header->type, have_fields_bitmap)) {
             error_setg(errp,
                        "can't load type %d struct, fields already specified!",
                        header->type);
-- 
2.37.2


