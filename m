Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F85337AB3A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:58:45 +0200 (CEST)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUmS-000128-Ff
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUiM-0005KN-Gp
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:54:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUiL-0001cm-4N
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620748467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wcGVaj2VRI26dB0zt7cnvnt8Azb/dyVrsvOU5H4CS0=;
 b=ciO0TLpkT+cquncNWYSs3qLqc21pROlUleAPMO3L80tsGn4LQvIrTN3qF13++P9HyesiWF
 x2ylHTggMHLbLPYNYMfJL/lS2ws0hYsepQHMD1mmCzFmWaFID/8lAcQ6rJPE0tWlukscRX
 7VdqgEhn+FY2i4oQ+QzOPWZtu3E968Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-BCjqHHjzO56Wga02ZtWyAg-1; Tue, 11 May 2021 11:54:24 -0400
X-MC-Unique: BCjqHHjzO56Wga02ZtWyAg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n9-20020a1c40090000b02901401bf40f9dso42769wma.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3wcGVaj2VRI26dB0zt7cnvnt8Azb/dyVrsvOU5H4CS0=;
 b=ke1MfEUVw+dCsmd4/RW4oa6Jjm0t2ePjS749c5gCDLvNqcQGXK9lYG90ZB2HtoPrHG
 mNahuABsDYoYsLTWUDBojOtS/ctrWpSLTVZl470oeMjyT2c11fBXX92ENhIiAFRVdiWs
 R0OWtFhRHio+UaENkc9aGf1RYqrLV7Op6EZqX18M+5pQNhaYNuVK3iySI19Ss/JbZ+cA
 /9athgyV8ayuDAGYiju0kXuSEzXhc4IiSubwll9w4FHrnfM2NEiRIHWMBXfG6YpjTSSC
 6JHGrM/6/J2HhTCWK/J5uxn8ay+PlgBLj/No7fUZpI4dhSuoHd00wamszZlRCh4fa0qR
 B24w==
X-Gm-Message-State: AOAM530ner9aOktDyzfFbG7wX7+zyu/FBwR5pcLSv9i5vgm0lqq4kZK0
 6ik2oCgbIQvyWrwdkGS5wl85thllXiXHEvJWz7CNi3UeWjPehp59MuWnB1CFBX013qePE3S30rv
 Nf0HrnjUF0Z9QCWiJIXxNewo/3b1nuk1L9laTzAUf1jhoEhShnNBg/VoJsrFvv1bp
X-Received: by 2002:adf:eac9:: with SMTP id o9mr2050779wrn.120.1620748462841; 
 Tue, 11 May 2021 08:54:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIQQdIY6OBr5Ev3juHyIBxQ7f+iZighIolc1FmgdpgSR1ZGqnhFyoGESJWNACFVXcBJ3Tg6Q==
X-Received: by 2002:adf:eac9:: with SMTP id o9mr2050757wrn.120.1620748462702; 
 Tue, 11 May 2021 08:54:22 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t206sm22985319wmb.11.2021.05.11.08.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:54:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/5] Kconfig: Declare 'FDT' host symbol
Date: Tue, 11 May 2021 17:53:51 +0200
Message-Id: <20210511155354.3069141-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511155354.3069141-1-philmd@redhat.com>
References: <20210511155354.3069141-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CONFIG_FDT symbol depends on the availability of the
fdt library on the host. To be able to have other symbols
depends on it, declare it symbol in Kconfig.host.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Kconfig.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Kconfig.host b/Kconfig.host
index 24255ef4419..0a512696865 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -41,3 +41,6 @@ config PVRDMA
 config MULTIPROCESS_ALLOWED
     bool
     imply MULTIPROCESS
+
+config FDT
+    bool
-- 
2.26.3


