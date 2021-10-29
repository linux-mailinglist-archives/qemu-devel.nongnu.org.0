Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0289E4405A4
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:03:49 +0200 (CEST)
Received: from localhost ([::1]:55216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgaua-0007xW-GW
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgasp-0005L4-Rz
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgasn-0006qs-MW
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635548516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJfRYk8AR4coyrrBWAVu9mbwtHAPCSHQTNG8rfhtJcI=;
 b=CaUyEaPJQkM8dAEwML7nTxvyX4XRN5CSH/XElMHQCH1tUIq0ewr9ns4tfoqUMLVUgKy5cF
 1e3uUfW/t8lU6t268PFWyuKa2vUiXydssXSH4xVihRjCXZc2zDVyqgkgTQg7RkWErPl+qV
 H+th/pu6xkB7TZTxEd58ppZr5wqRWhE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-bfNfDXC3MzKZ4qPtgCmBAg-1; Fri, 29 Oct 2021 19:01:55 -0400
X-MC-Unique: bfNfDXC3MzKZ4qPtgCmBAg-1
Received: by mail-wr1-f70.google.com with SMTP id
 a15-20020a056000188f00b00161068d8461so4166244wri.11
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zJfRYk8AR4coyrrBWAVu9mbwtHAPCSHQTNG8rfhtJcI=;
 b=qChRJ0IjnODG3tRqVMBeK6ZpkCz/18GOTnyDFZap6xMIgj5mG7GOTXQbBU1zoaD1z3
 jLnbxnJ5GpC5TwGLc3gHRy8hQ3vVzdM28CsAoeRCtRFeEiR9ULYZxNTBx4x2jxR5dLTs
 CcQj9giCP2RJh0I8lVRE58rBNVDWy8Vz7jD9q72JrzsNN9CXoOxw08quFRq4ahX9xQSf
 bI1m4gikDqXv75tlUl6DfUNRz+qTSBYsKpWzW8KTNgc8aIn1Hv3DLlZXgi/hulPSMP2L
 cwfZCW7VyFTUY9F3wE8+h+ebJZMyB/yygRzEmRmtXSuyScXpVQqqLOrfbU7oGqp6JtGb
 1I/Q==
X-Gm-Message-State: AOAM5310doNolkZzTvKPGHxco2SZVjBKrxrH5lMA4NY3MHgKprwAFZZM
 CkEotvB0f0BmNHP8VKO0+Uk4q6jufKn7T+9m7pU74FoFWpGV9Ckxf+giCGgrBHfKkebFmAxChwE
 3DkNgumiMmFvOsLi5id0CvH6wpcM2Bvy4M9P6H8dg+OyxFtDrFZdo+C7FBcGUNwAq
X-Received: by 2002:adf:f88c:: with SMTP id u12mr7057033wrp.29.1635548514009; 
 Fri, 29 Oct 2021 16:01:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9t9VWGQVR+ZmAw9HSzcDDibiaL4VAowMPM+HHB4IPlqg7doqjSeKYtJu8UWnMVUEcAbITZg==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr7057003wrp.29.1635548513775; 
 Fri, 29 Oct 2021 16:01:53 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d8sm3375297wrm.76.2021.10.29.16.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:01:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/core: Remove use of QERR_UNSUPPORTED
Date: Sat, 30 Oct 2021 01:01:43 +0200
Message-Id: <20211029230147.2465055-2-philmd@redhat.com>
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

QERR_UNSUPPORTED definition is obsolete since 2015 (commit
4629ed1e989, "qerror: Finally unused, clean up"). Replace it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/nmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/nmi.c b/hw/core/nmi.c
index 481c4b3c7e5..b4b4a1ed286 100644
--- a/hw/core/nmi.c
+++ b/hw/core/nmi.c
@@ -70,7 +70,7 @@ void nmi_monitor_handle(int cpu_index, Error **errp)
     if (ns.handled) {
         error_propagate(errp, ns.err);
     } else {
-        error_setg(errp, QERR_UNSUPPORTED);
+        error_setg(errp, "This command is not currently supported");
     }
 }
 
-- 
2.31.1


