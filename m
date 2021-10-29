Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED24405A5
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:03:55 +0200 (CEST)
Received: from localhost ([::1]:55414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgaug-00085R-BA
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgasu-0005RA-EO
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgass-0006sE-8d
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635548521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KYz/UdhAmH8P9QWlY1OZZZXezRyAQ5qqSfYZdu5lm4=;
 b=MSK5N5gHWkmMKVBasDc/Ke+ThG6T1QBzQT7stTvmTXXE1TjXSwOcznP5gve45Yz9AQWXXr
 FfxP+JEt4/l3nTGJId2rcAXQU/EO5ypOUV9gOPFBFXcEYFaU7T8gDKL+q7jo8FhP4HLmmK
 1lT01WyRaHzxovpw1q6AR9BV6kI+1B8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-rbUZ2JAoNyCI6qGl0rszFw-1; Fri, 29 Oct 2021 19:02:00 -0400
X-MC-Unique: rbUZ2JAoNyCI6qGl0rszFw-1
Received: by mail-wr1-f72.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so1343764wro.19
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1KYz/UdhAmH8P9QWlY1OZZZXezRyAQ5qqSfYZdu5lm4=;
 b=CSAzP3NVrRTBUmW7JP3AVfsl1h2J0u0CCeIGQvuqLK/+n85WJCo1iDKibgnGU7CNnk
 fHcUOcyprn8kbSNlfPvLLW9JwU5DvGcFfd88olGVdDBAl7dUTaltTmkorr61fGVNodKp
 vJt4+FCD9qZcOCV9h11wiv6dHPDW25x6JoqXkxZobp5FsF33bdwpYmNJv94xou0MYmM6
 F99yfnMEJJHHVvVKcaSGFj3nBP4D3+moarJD88at00P3g9OfWdmtPZr38R3SC3ZxylBI
 eXfmF5VcT5euvBpXCng64ePnhpKEp+xpJkJ8LEGNeN3mK6YNswILDcbCSL5ngMzuwJYO
 dGsA==
X-Gm-Message-State: AOAM531gFrXOr3wsI3y2i5Ck6hbe5xByg35Q9gpFvKvAVeK6iTPvsAgg
 B987GuiNlcRnx7qoo+F+FD7ITmdbfL/LCOYKuZVvWYd0SMnfsTD9d9n7Uc9XqdMzjL1ZKEg+LpD
 tsvz02asjeb67oqA9GSeyRip69K1O5QJytN5Qc6KMELE2iiUG8YGHxZi0yF8GUldj
X-Received: by 2002:adf:d082:: with SMTP id y2mr9309847wrh.214.1635548518489; 
 Fri, 29 Oct 2021 16:01:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqd3jLhb642v19dO3IYaGDIiNE2tHrW5aU1ws2A8YhfwZyL+M3vSzld+QTwXSbKxWAv/pUiQ==
X-Received: by 2002:adf:d082:: with SMTP id y2mr9309828wrh.214.1635548518336; 
 Fri, 29 Oct 2021 16:01:58 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j8sm438981wrh.16.2021.10.29.16.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:01:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/core: Remove use of QERR_FEATURE_DISABLED
Date: Sat, 30 Oct 2021 01:01:44 +0200
Message-Id: <20211029230147.2465055-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029230147.2465055-1-philmd@redhat.com>
References: <20211029230147.2465055-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QERR_FEATURE_DISABLED definition is obsolete since 2015 (commit
4629ed1e989, "qerror: Finally unused, clean up"). Replace it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 216fdfaf3a0..f2eff433bf0 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -138,7 +138,8 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
     if (!mc->has_hotpluggable_cpus) {
-        error_setg(errp, QERR_FEATURE_DISABLED, "query-hotpluggable-cpus");
+        error_setg(errp,
+                   "The feature 'query-hotpluggable-cpus' is not enabled");
         return NULL;
     }
 
-- 
2.31.1


