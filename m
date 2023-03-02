Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141C6A827C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:42:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi6G-0000uy-Kf; Thu, 02 Mar 2023 07:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5q-0000SA-9i
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5m-000301-Q2
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgf+uMU2b9ZGpqtYhVOqgBkf7+x3yyyGYI5pzjSgyMI=;
 b=PnFoa/fkgAQ4/AmlVecx+3/edrv/z7QqVh7nFHMnbkM9bHl8w9NfITAe2k54vifamXB72P
 djj3oTNi1O57ffE9fo9VtpUJFeXPQ9kmKPVBq+imptcQ/4WBbP/POBEg0VyX3h9b34oKdf
 DSjYa6RmB1Oi947T1Ih5k5ATTS4tGrk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-VJ75y--HOlScKcFfAWLFEA-1; Thu, 02 Mar 2023 07:31:17 -0500
X-MC-Unique: VJ75y--HOlScKcFfAWLFEA-1
Received: by mail-wr1-f70.google.com with SMTP id
 u5-20020a5d6da5000000b002cd82373455so2075545wrs.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tgf+uMU2b9ZGpqtYhVOqgBkf7+x3yyyGYI5pzjSgyMI=;
 b=xtRouBqlOHwR8eGbp4S2Vu7E6ddGHHAKRf9it57YNUOKK+GTnz0CFcaKRePGM9yfqf
 h5jRlvSSE89dQrSewMxAUZplXm+8RppT8kFVlEHzpoOrMYgaZgQr3EAFR7tidRZg7g+J
 1x86MG8gISYAXemDZzRDP2l8WqvTmJK3IrNVjO3ECNDBOkE2kZfP3qTuZaTzv1jALhfH
 JuMBZdgSlcN2GNz0xIEoRKFfK0eJOzNBIZejfnZKUijTOoImLQjXVbXyb+/k77G+P2Hy
 YLvy9esEMu6/JjYtCox4NpZYnlACtjJihmUICavc9XdNcRXA15aZLpjUQCSojqmBi5AW
 3ZsA==
X-Gm-Message-State: AO0yUKX9Gwe9cxzRWZFPBNkEGT7wLj/Al+vwqniSyHHlqmHovGsS8Ct/
 rivSQ1zjqPBS+gdqU9+hbjPny3Cb7vn7LQCfCrYsXqlDx8S3yzqoN97Hfv8R1M1SnjH6JnE07g7
 kznyZ0dWHxiOPLs98VX+5C+Lgh4rAJ8+oRDAUvdAVziOGy1cfLY9KUhXzQiQei85dc/JOx6frLA
 w=
X-Received: by 2002:a05:600c:1c9b:b0:3df:e6bb:768 with SMTP id
 k27-20020a05600c1c9b00b003dfe6bb0768mr7782948wms.24.1677760275666; 
 Thu, 02 Mar 2023 04:31:15 -0800 (PST)
X-Google-Smtp-Source: AK7set+reE0MOKsjRX8UECtmv1v4z0+PphJ+coFO+5Kep4sjxNBd6gGXJnuLwy0uy4B4Le3zDj7wBw==
X-Received: by 2002:a05:600c:1c9b:b0:3df:e6bb:768 with SMTP id
 k27-20020a05600c1c9b00b003dfe6bb0768mr7782938wms.24.1677760275446; 
 Thu, 02 Mar 2023 04:31:15 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 k10-20020adfd84a000000b002c55551e6e9sm15385334wrl.108.2023.03.02.04.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	David Wooodhouse <dwmw@amazon.co.uk>
Subject: [PULL 14/62] xen: Permit --xen-domid argument when accel is KVM
Date: Thu,  2 Mar 2023 13:29:41 +0100
Message-Id: <20230302123029.153265-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
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

From: Paul Durrant <pdurrant@amazon.com>

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: David Wooodhouse <dwmw@amazon.co.uk>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index cebe8d9452d6..3340f63c3764 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3360,7 +3360,7 @@ void qemu_init(int argc, char **argv)
                 has_defaults = 0;
                 break;
             case QEMU_OPTION_xen_domid:
-                if (!(accel_find("xen"))) {
+                if (!(accel_find("xen")) && !(accel_find("kvm"))) {
                     error_report("Option not supported for this target");
                     exit(1);
                 }
-- 
2.39.1


