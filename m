Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79FA4257CC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:22:20 +0200 (CEST)
Received: from localhost ([::1]:46284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYW9z-0002g4-QC
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5m-00047B-TE
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5l-0004uB-1E
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFJahcuQnHhP8I03izotVBJeAm6M7KThunSrXMbgTQ0=;
 b=E9e6qrQEAl+p4NaBAP6a28G3iwD0AEeATYYiNuawL6knec1Z4wf1ukF9/1gPSKcFqDPaRg
 lqucypBGZ80/JSOINEu6z+6bc5bVcqALJdEKEtrsKNwWp4tmC3RoC4KxBEDv1wKXLfk/zt
 7Nosz4FPBQX9EaEcU4H7DXEaQgSjXeA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-WwrI2evqN7akb_cuVYLUiA-1; Thu, 07 Oct 2021 12:17:54 -0400
X-MC-Unique: WwrI2evqN7akb_cuVYLUiA-1
Received: by mail-wr1-f71.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so4356359wrc.22
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nFJahcuQnHhP8I03izotVBJeAm6M7KThunSrXMbgTQ0=;
 b=vGFdM62eCY51vkdGMzKuX5nGXrSDYUbDXbNgVoXRGlzZjGivq73vKuv5zqTTkU34Vp
 /IHwW8UMWZqHq8x/Cpn4DUvEm4UZ4g9f86631MErdKEwz3Pv8XSKzljgbtZa+cXYH196
 m+nQUsVrrxtvKy/Zr3oBD/elk4J8ErH1MVj1b9a0qenVJsa53Q82YFsdVUeZEyPe80ns
 7QkEJRY8QvAEVwTW4oRX9IGPTxtMS+DB0FI+Hv5H1ZP5dqHLvqM8Tobih60uYrjQVlR0
 COrcgTN5K7nLelxWLj8m/5v7ymhZ4kK6XrLxhYtkSUJeaBfzD33jkhz9IMmMZU2iawtb
 ILAg==
X-Gm-Message-State: AOAM530CO5fXn494kS+VlfGHuqcwWhjlqmDz84puyxTFxpCGDwc1AZN3
 e36nxB3bRImgwkhceOL1czM3ncSeDdHj8/uqi85VEn1v60czJz9JAZ56MVtm7w58c6jVDNjRZPn
 FGuYbv+ZaTzVSsXp/YwrGV8V/2oYkDcXvw9lwrzQgaxDXc52XZM8K8mhpu4AJOOpm
X-Received: by 2002:a05:600c:1552:: with SMTP id
 f18mr16953024wmg.184.1633623470855; 
 Thu, 07 Oct 2021 09:17:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPwOfgjE5w95h/skhL3N9RbbkKUO9R/p4rTX9ZmdO5wFGvZ/OZfqfGMboNdzGu5nRI4AFFTA==
X-Received: by 2002:a05:600c:1552:: with SMTP id
 f18mr16952983wmg.184.1633623470613; 
 Thu, 07 Oct 2021 09:17:50 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id g188sm3421wmg.46.2021.10.07.09.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:17:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/23] target/i386/cpu: Add missing 'qapi/error.h' header
Date: Thu,  7 Oct 2021 18:17:00 +0200
Message-Id: <20211007161716.453984-8-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Connor Kuehl <ckuehl@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 00b81053244 ("target-i386: Remove assert_no_error usage")
forgot to add the "qapi/error.h" for &error_abort, add it now.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a7b1b6aa93a..b54b98551e9 100644
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


