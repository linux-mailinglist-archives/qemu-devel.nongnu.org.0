Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B749B61E114
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:53:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbNP-0007La-RK; Sun, 06 Nov 2022 03:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbNO-0007LI-0S
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:51:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbNM-0002rm-Jr
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxeApNYPYFTUwRBGGxIAeXWrKBxDg7yvMaE9ac8Us4s=;
 b=WX/G++Il1EkApci3XWR2oqtN4OLRsMg/yaABMaw5yk8eW4I1YyH9hXm4csyWl9YlVESCeC
 fFTxlJmQyS/WLrCXRq8wgoCgUqz70ypGWzpZYhLc9ZpXurTxMCCn98LIdUWx79UyRsgInh
 9ED652phaPuLb+cpuTxrwH1VLFOh2OA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-128-Dnj5hx_cOY2nKIwh5pqZAg-1; Sun, 06 Nov 2022 03:51:30 -0500
X-MC-Unique: Dnj5hx_cOY2nKIwh5pqZAg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso4548148wms.5
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UxeApNYPYFTUwRBGGxIAeXWrKBxDg7yvMaE9ac8Us4s=;
 b=3sQbPkgIVlsXE1LsJIBh4KgZ4Twf7kaan5G8z/fNky5wP0ROcGJ3Cctak9ifeqvpf9
 vB3EoEgegT995qPsizIu7SPeulrcQ+esox54z2XwDZDWrT5BUiGOLdiLlIZAfAAaexWw
 XtS2HK02V5zrhWPx8NHzQ8wuwinIuGnU0rErub39R+7tBQ6mmyqPLL0hWurrFrIgR0GI
 acZTGtTslmAOn4lgS7n51eR7Oqau7AsLNPcuODeJU3GGDWSlnifojiZp/68CamYCvV+U
 p3XT5UDEOcaTIzcKzg7twz0b7SPmbpeCJrYwD0XcStfC5Ny3A54WkjpSwX2iRgr8H9Yt
 NhQA==
X-Gm-Message-State: ACrzQf0vjSajBn0x4NFYxn1wbS5nZPm0XnUDJ8seqCcheZaA68w7w4Cg
 84CRUE1v99NvQ4KyRG5GabyEgBcihvmwzk0oGkLJ1b6RlV50ewAThL0Kr7K+atJzF0/qmT6C5gl
 j4VzmEB0vWS6mi1bpv44NPWowGwYJi9++gPQXk7cLy1f9jFS0gwFtedt4GvwZiBklIIU=
X-Received: by 2002:a5d:4484:0:b0:236:574f:2536 with SMTP id
 j4-20020a5d4484000000b00236574f2536mr28630686wrq.7.1667724688875; 
 Sun, 06 Nov 2022 01:51:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5AsNJ4nfjo10uImIK45bkBgvmaMPYbqDTqX2SAPD38HDMAJAeJvGuQX0pm56h1+r6W7hgV+w==
X-Received: by 2002:a5d:4484:0:b0:236:574f:2536 with SMTP id
 j4-20020a5d4484000000b00236574f2536mr28630675wrq.7.1667724688641; 
 Sun, 06 Nov 2022 01:51:28 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a5d6604000000b002366fb99cdasm4099020wru.50.2022.11.06.01.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:51:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: TaiseiIto <taisei1212@outlook.jp>
Subject: [PULL 04/12] gdb-xml: Fix size of EFER register on i386 architecture
 when debugged by GDB
Date: Sun,  6 Nov 2022 09:51:07 +0100
Message-Id: <20221106085115.257018-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: TaiseiIto <taisei1212@outlook.jp>

Before this commit, there were contradictory descriptions about size of EFER
register.
Line 113 says the size is 8 bytes.
Line 129 says the size is 4 bytes.

As a result, when GDB is debugging an OS running on QEMU, the GDB cannot
read 'g' packets correctly. This 'g' packet transmits values of each
registers of machine emulated by QEMU to GDB. QEMU, the packet sender,
assign 4 bytes for EFER in 'g' packet based on the line 113.
GDB, the packet receiver, extract 8 bytes for EFER in 'g' packet based on
the line 129. Therefore, all registers located behind EFER in 'g' packet
has been shifted 4 bytes in GDB.

After this commit, GDB can read 'g' packets correctly.

Signed-off-by: TaiseiIto <taisei1212@outlook.jp>
Message-Id: <TY0PR0101MB4285F637209075C9F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 gdb-xml/i386-32bit.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdb-xml/i386-32bit.xml b/gdb-xml/i386-32bit.xml
index 872fcea9c25a..7a66a02b67e3 100644
--- a/gdb-xml/i386-32bit.xml
+++ b/gdb-xml/i386-32bit.xml
@@ -110,7 +110,7 @@
 	<field name="PKE" start="22" end="22"/>
   </flags>
 
-  <flags id="i386_efer" size="8">
+  <flags id="i386_efer" size="4">
 	<field name="TCE" start="15" end="15"/>
 	<field name="FFXSR" start="14" end="14"/>
 	<field name="LMSLE" start="13" end="13"/>
-- 
2.38.1


