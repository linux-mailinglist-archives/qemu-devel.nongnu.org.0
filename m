Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF0B4880C7
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 03:01:11 +0100 (CET)
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n612c-0004qo-Lj
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 21:01:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bo-0006jS-3d
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bm-0002vG-Ma
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=whKn0pctPclugSGgiuj/6VncPkuXJJFQ5IPPduaKEoY=;
 b=VKnnzFZnLTmDeirZN7osZPbB/pW9bhyGSyMEFm1fl2iza5MNcprGpPobQl7XY1kTYznpC6
 BbXYnHo/d7zbrfMxhXxoOHU1YQcxFHJEGRVlRjjDDG1x5fn3gSKkw/uJQGOeM9CR2Fe+/z
 UdPHHCFtC/X8krhNxURIk6FLv9nU+VY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-Joamngb2OZyM-EsnqftntA-1; Fri, 07 Jan 2022 20:06:33 -0500
X-MC-Unique: Joamngb2OZyM-EsnqftntA-1
Received: by mail-wm1-f69.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso1459020wme.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=whKn0pctPclugSGgiuj/6VncPkuXJJFQ5IPPduaKEoY=;
 b=PP7tuSgf4fH7VNA0CMyPJ/l7XcQUQSVvUZvZFnd6vGU0STYCUXyo4jQ9665jZKo/xr
 hajSBVpAEiubELOQTq/7cIFRfReYo8NM5Zj3jOQnvxj7b0H7mmJGuWsuWOX2gV0NLzZB
 /yM5cYCjkCvl711DBoxBUDpiWaEoT4dpEgNCbqNJL1kIxubKfn8EsJ3zZx2JqAum3OAo
 MwESIKn7MwWgsiQmOt/4HcEDqUYEBLDSU2kjWOkfczlgknfwc4pXMIIju+xbD1Nui9dz
 XMLFH5bpNCc0NeY3FUkQHzcafghzIP9SssavPfUsOEG0W/XQ/1wzG2vAKFdKRULi0HZt
 zoTw==
X-Gm-Message-State: AOAM532cx7CUzgwYWiVEPU4dcNylZCdMuHa+vqKBEs24nlUrmhz7MuBm
 YMBiag42W4TwboNRp3iVABUdwJGzsRyTFpFGPVsCnkr287AQNl3wFt1Rxml6Et57Todr+i+mTzg
 PBCEOp4IgR6rbTL/HvoOWl4ttzzDR4GcMS7ClYjlnfQGI63WuQrS8JthceLuv
X-Received: by 2002:a5d:698c:: with SMTP id g12mr7460303wru.69.1641603991782; 
 Fri, 07 Jan 2022 17:06:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxf3ru2KbanISBA/tqpJSYCveRo81Kbyi4mL4pmD1b9mKQ5xHBVZ84ApAtlUqltArJEJZNdew==
X-Received: by 2002:a5d:698c:: with SMTP id g12mr7460293wru.69.1641603991613; 
 Fri, 07 Jan 2022 17:06:31 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id u16sm226107wrn.24.2022.01.07.17.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:06:31 -0800 (PST)
Date: Fri, 7 Jan 2022 20:06:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 53/55] tests: acpi: prepare for updated TPM related tables
Message-ID: <20220108003423.15830-54-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.ibm.com>

Replace existing TPM related tables, that are about to change, with
empty files.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
Message-id: 20211223022310.575496-2-stefanb@linux.ibm.com
Message-Id: <20220104175806.872996-2-stefanb@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..5d80e408d4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
-- 
MST


