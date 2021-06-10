Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B45D3A24C7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:52:03 +0200 (CEST)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEXq-0007cu-4a
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESM-0007d2-PJ
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESK-0005GB-50
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abMGkqHNLRSz2XVMNM96qbiYgCQOOhe/IPGd2ZkcJAU=;
 b=Tayq8trtdn8S4tn4MhLXWkW6yBZUknzG+1qwW/+VZKec5xejMZZPJZ8NdaOjDNStnR1yRJ
 A6knC7RqrqDZjNtOSDfsi5sY26Mne+m0hs4SDUiL+cKtWTUSSwK8tGRx1TiIIDRNred+gv
 0JXGC1jyg8dZymzegMditBnF9pcS1J4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-rv4dqHPdM_O-btu4E64kuw-1; Thu, 10 Jun 2021 02:46:18 -0400
X-MC-Unique: rv4dqHPdM_O-btu4E64kuw-1
Received: by mail-wr1-f70.google.com with SMTP id
 s8-20020adff8080000b0290114e1eeb8c6so404265wrp.23
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=abMGkqHNLRSz2XVMNM96qbiYgCQOOhe/IPGd2ZkcJAU=;
 b=TSLSJ8U1kJMfd3plKJ1HJv9EciyN1uQ07kjuqpfjdMzSqtXXFAiifPfzWOZgoeBdyu
 Ly9ZfUYp6rYVZpktUYBsvwtF/ZdEXP2/YUYyPwAgY4niPk6Q87BojxXaFFTD9csT01zD
 MlVRRgN+04/vn2FhUkUX1Q53J6+8zL65NRRtS7djfbTjwR7zpJSxcrPs8wzkDMXB7PKE
 0YH9fhogcYRh1PSaVJR0EMY9ZIoRRmZ8cXyoyBPCvJRFxXhNLF8lhtZDlvE2ZjtzNPMj
 9SQU9j4MiARC8AaoUoLHI6CEvbnk+GkQXdZBgRIxvXMoC2c5fZC4XAqZGq0E2gO02/En
 coqQ==
X-Gm-Message-State: AOAM531tgxdCKoHzOLF3hDlAjEDrWijKBH/TUV0FisqWw4BWnFgjRk/l
 eqF+7MK7Hp3Wa0t2X3kEJGuJMV572b3x5LKlhd/jkN6yAEoI21x0i5aozvsvD4ZzYy0CXJAiWb5
 abhkqm5DzrGyiItSqUMmhNdwpDZow58dQdmV/0l0lyDXMxRe7R33hLect3GAL5mcG
X-Received: by 2002:a5d:58d3:: with SMTP id o19mr3638238wrf.404.1623307576068; 
 Wed, 09 Jun 2021 23:46:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcqxK7Oz2MwnKpnAK9Ck+rvLsYuPvTTzt8ICafCOw5dzmwviihiUQ7TWP+uv/n/WN660+Kdg==
X-Received: by 2002:a5d:58d3:: with SMTP id o19mr3638224wrf.404.1623307575938; 
 Wed, 09 Jun 2021 23:46:15 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id s62sm8948465wms.13.2021.06.09.23.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 23:46:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] target/i386/cpu: Add missing 'qapi/error.h' header
Date: Thu, 10 Jun 2021 08:45:49 +0200
Message-Id: <20210610064556.1421620-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610064556.1421620-1-philmd@redhat.com>
References: <20210610064556.1421620-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 00b81053244 ("target-i386: Remove assert_no_error usage")
forgot to add the "qapi/error.h", add it now.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a9fe1662d39..694031e4aec 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -27,6 +27,7 @@
 #include "sysemu/hvf.h"
 #include "kvm/kvm_i386.h"
 #include "sev_i386.h"
+#include "qapi/error.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-commands-machine-target.h"
-- 
2.31.1


