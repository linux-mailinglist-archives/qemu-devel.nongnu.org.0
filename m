Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8286481D5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:37:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bWq-0005Gj-3f; Fri, 09 Dec 2022 06:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bW1-0004cX-Fv
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVr-0001e7-80
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2hMf9alh7YbvmJ7YWt4RfER0BN+85HoMYH6M0caVJk=;
 b=Mw0YUE32vcfnLpd4bYIFtx4QJiO0jGW+5gFAPv3ATbUULNXr8w33jZqJLgurOBIzc78S/O
 4FdMGp3xtO0IB7iPZErHmJ6T+hO+gm4JvugMwzGFPT5bJaPIQhTC2eO3YyroGJT9N444St
 y4n8hngL2NmajQh7Xx/E1UL43ytL9i8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-jzTHEkGcMgme60bhDrhNaQ-1; Fri, 09 Dec 2022 06:25:53 -0500
X-MC-Unique: jzTHEkGcMgme60bhDrhNaQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 dz11-20020a0564021d4b00b0046cc3f565e5so1201409edb.8
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2hMf9alh7YbvmJ7YWt4RfER0BN+85HoMYH6M0caVJk=;
 b=QpoNs80Y+xnKbXaQBsP0cGjqgqovKsIewIVoURcIY/RqgMqMPGQn2hgDGKhjDsumEG
 xv6R1iu+geAHdJzkU5Xp0HleQZ5WRA7OztEDKtQTH5u0rcBxdsYIt1QdR7g53wFPAwCk
 XaoHuHuQ/ygLdIG+x95klXdUxF7xzgEDhHmeiJH6oQkW9Q2yHD+D6toBC6tj2QVY5TJq
 ko+jskcsd0JDOWniPb7MzWuOuCzwwMzuq8kI9VertOSnhI2LB0t9mU0Gqx7ukeXhZRHO
 ANyJ7uC42I+/HCFPtYHV3oVA1cNWKPHH72f9o3ex1vyxt/JylS4XBS5t/cWUc2wrTz85
 9PSg==
X-Gm-Message-State: ANoB5pnFmGcWbjLwDCChV1cALn8/CU0vX6XC8Y9jdvVqKZ+ynBFDPLJD
 eZVthYcXtwhSjghIPi3ahW0qmMu90VJ2jR+A17hN6gc5FufYFKan+no5dF8LM5e2ynrbFDJW3/j
 MfIbPExMrIXa/htNgd9CupeGd3PTUuw5DBczOH8pwEnEkpoarlJgRczMILD84g8lspWM=
X-Received: by 2002:a17:906:647:b0:7ad:d7f9:38b8 with SMTP id
 t7-20020a170906064700b007add7f938b8mr4741808ejb.57.1670585151634; 
 Fri, 09 Dec 2022 03:25:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6PIs9lyIFwXwZkjFd6tiYuTlmndaM+V3NSFul+Ot8kLVlypWPNy3EliWL6mL/m6LhbNaBZHg==
X-Received: by 2002:a17:906:647:b0:7ad:d7f9:38b8 with SMTP id
 t7-20020a170906064700b007add7f938b8mr4741796ejb.57.1670585151397; 
 Fri, 09 Dec 2022 03:25:51 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a17090623e900b0077b523d309asm431517ejg.185.2022.12.09.03.25.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/30] meson: always log qemu-iotests verbosely
Date: Fri,  9 Dec 2022 12:24:09 +0100
Message-Id: <20221209112409.184703-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
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

---
 tests/qemu-iotests/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 583468c5b9b3..3d8637c8f2b6 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -43,5 +43,6 @@ foreach format, speed: qemu_iotests_formats
        protocol: 'tap',
        suite: suites,
        timeout: 0,
+       verbose: true,
        is_parallel: false)
 endforeach
-- 
2.38.1


