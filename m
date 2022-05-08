Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BBF51EC85
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 11:36:11 +0200 (CEST)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nndKk-0004HL-J8
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 05:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nndGK-0001S5-4W
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:31:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nndGI-0008P6-3y
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652002293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KDxZIIy0ZVQ63u+8+EkQx6/vezGGY5jxyJVtnMk3BE=;
 b=QdtIPp3TeP0a9lVjc3S+Hp8SwFhh5hT42d20TezE9Wmr7zkMLMdHuMuwuoMMyW8TgBa5xo
 bCDJLbnGkeFGpnwEkKIL9+s+5nIY/2KAM3sPjx88RvuwjsN1NII6JIvJqLuOWrU4vnIYIF
 AtA66NW7Mcfcjy/+IDtXC5n/pw9ArFs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-efmAK3f1O-yyhENuMzFPiw-1; Sun, 08 May 2022 05:31:32 -0400
X-MC-Unique: efmAK3f1O-yyhENuMzFPiw-1
Received: by mail-ej1-f69.google.com with SMTP id
 t4-20020a170906608400b006f8687b8884so498853ejj.0
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 02:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0KDxZIIy0ZVQ63u+8+EkQx6/vezGGY5jxyJVtnMk3BE=;
 b=KYcIbHmFI+wr1Z127DOgQ0lpjeackPaZrJQwnjIIw8Dtkr9mNfhSVZs2XRn2YyGxUn
 ofzkohrgxOJIPAfyo6VFydOCndcb/ihJZIjSrv6ejvXVXARoOuAFf8GX5SCSc1heE7PP
 MIRU2Tpqm0SDljmbjklGQ2KdaMy1f0qRIo2yRF+xcE8d3zwhfjyTZqoW8yzBlJHKSD+Q
 6SdZW9bXwirojc0M6MKHa1swyHizwyyMZkbsUsG0S4QXuD9YX4PyRLnkq7/WcXuPpc5y
 rVcQNnj7ZRuA7u4RV/p4CiEH+q6HhZPS+/umCOeI4yeoSV4u2RMKZ9n+TXB50k+5Exd8
 2AZQ==
X-Gm-Message-State: AOAM531THIAEhilyf+rPrziB99S7JXulUheEvoqM+0BSdwe4QUDCQvkB
 MflMMXBr2/vmAMFQjszNt4Srcp+VMVciCV9lxa1LvPscI62CVGoN+q/XToPBONjM0xuuDic4vIW
 1BWIycA4wRSKKMN39aaC6mg7Xv0o71jtg0UnCnUEREkOTp+1uQLNhLOJGrF+wkGs0NL4=
X-Received: by 2002:a05:6402:50d2:b0:428:b39:5c08 with SMTP id
 h18-20020a05640250d200b004280b395c08mr11988469edb.146.1652002290583; 
 Sun, 08 May 2022 02:31:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeuTXzmAeuKbfFjaq7E5DVWuRazBBRM2zJ7QgmvjNQp60vUNdK9QVmZw+ZdNcKhYLFLmGQDg==
X-Received: by 2002:a05:6402:50d2:b0:428:b39:5c08 with SMTP id
 h18-20020a05640250d200b004280b395c08mr11988454edb.146.1652002290336; 
 Sun, 08 May 2022 02:31:30 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1709064a8d00b006f3ef214db3sm3898271eju.25.2022.05.08.02.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 02:31:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
	malureau@redhat.com
Subject: [PATCH v2 1/5] slirp: bump submodule past 4.7 release
Date: Sun,  8 May 2022 11:31:16 +0200
Message-Id: <20220508093120.173131-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220508093120.173131-1-pbonzini@redhat.com>
References: <20220508093120.173131-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 4.7 of slirp provides a new timer API that works better with CFI,
together with several other improvements:

* Allow disabling the internal DHCP server !22
* Support Unix sockets in hostfwd !103
* IPv6 DNS proxying support !110
* bootp: add support for UEFI HTTP boot !111

and bugfixes.

The submodule update also includes 2 commits to fix warnings in the
Win32 build.

Reviewed-by: Marc-André Lureau <malureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index a88d9ace23..9d59bb775d 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
+Subproject commit 9d59bb775d6294c8b447a88512f7bb43f12a25a8
-- 
2.35.1


