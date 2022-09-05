Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A41F5AD12E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:08:05 +0200 (CEST)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9xU-0001EM-9k
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV9JT-0004OQ-I3
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:26:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV9JP-0006NA-0S
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662373597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dNgKFC+0LeVv80K7QBVzhgcaEfabY+PLvf1MTEKFduI=;
 b=UAwgmaCYpYt8wHOSjcVlTQsyQ/y/UH6GAzxrYeG4CWXpVH8Snp8Jv1It4cEoLSZOUXQYm6
 HHHFhpoXktU5sBbXKVFrSbupErwhJ2RTFnU8b6chNPbfyEreqbi8LmuSQDPfHMAjt9IcRK
 zOKJatfjamludb+bJviGZ6SCQY+rXI4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-bj6ZeALGOaegFWVt40bmfA-1; Mon, 05 Sep 2022 06:26:35 -0400
X-MC-Unique: bj6ZeALGOaegFWVt40bmfA-1
Received: by mail-ej1-f70.google.com with SMTP id
 ga33-20020a1709070c2100b0074084f48b12so2142473ejc.7
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 03:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=dNgKFC+0LeVv80K7QBVzhgcaEfabY+PLvf1MTEKFduI=;
 b=3hdN5B1IkkOcgtXL/j44VgYx2i81piFsAvIp/NmRdQd55npeYqnnjaRsozBwN3oiuN
 oRNzktsTjSM3cp2hKBlck6Flu253oISSCg+WtvNQ9Y8NSezvEFxguyOuv4dq2R6pXtTv
 ZxNAHIYzlRPCqIebCxurlqAWCbwDaNwpnoFWrvYBk1fFAcV3EuV7My2y0Wh2Zbx8rGlZ
 BcTTFwNZdLa2vssFUejgXjsX/mmzsGTyw+5Te54C2nLXlSbY5seeTrNphTp1A5w5cOJ4
 2wpuf60aXaaPVrESSDbmP4HCX4P+iRx76CDWH39ZI72JjwRSxahnt3sKeuL3bXk2PYv9
 E8Ow==
X-Gm-Message-State: ACgBeo0c62ve1ruFjVQhfTzqYHpqEBouY3g2S5mnowJFfUwtv8r0a+df
 ghmTxcH5W95Z8B4asaY14QW4lX2xDMEA+T764iNUn9xUiVdAF4/BtItXAfRa5sYK299Vkw/u6rH
 7H9zRfbb19NsE3x13mxT178uzlym7vZ+0/Ob/ojcWkFAvhTTRr5CN/1WLsScG9/Z7P/w=
X-Received: by 2002:a17:906:5a42:b0:73d:b160:af0d with SMTP id
 my2-20020a1709065a4200b0073db160af0dmr35362877ejc.164.1662373594638; 
 Mon, 05 Sep 2022 03:26:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7r6KFfIfM6I398na+KrPHfRexL9/Jabs1orSg9jPCOsz2rZjqDr9svfHg0hQXtjnx0Htv8vQ==
X-Received: by 2002:a17:906:5a42:b0:73d:b160:af0d with SMTP id
 my2-20020a1709065a4200b0073db160af0dmr35362853ejc.164.1662373594314; 
 Mon, 05 Sep 2022 03:26:34 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 ay2-20020a056402202200b0044841a78c70sm6148675edb.93.2022.09.05.03.26.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 03:26:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] coverity: put NUBus under m68k component
Date: Mon,  5 Sep 2022 12:26:33 +0200
Message-Id: <20220905102633.20940-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

It is only used by the Q800 emulation, so put it under that architecture.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/COMPONENTS.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index fc1608932e..0e6ab4936e 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -22,7 +22,7 @@ i386
   ~ (/qemu)?((/include)?/hw/i386/.*|/target/i386/.*|/hw/intc/[^/]*apic[^/]*\.c)
 
 m68k
-  ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*)
+  ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*|(/include)?/hw/nubus/.*)
 
 microblaze
   ~ (/qemu)?((/include)?/hw/microblaze/.*|/target/microblaze/.*)
-- 
2.37.2


