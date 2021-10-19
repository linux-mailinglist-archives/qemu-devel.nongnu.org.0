Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAF14334FB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:46:40 +0200 (CEST)
Received: from localhost ([::1]:36988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnZn-0002hI-C3
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnB4-0000k0-I1
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:21:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAz-0002dY-Jr
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MJsmD3QRv8SGmtAedpltN89f3tDK3M7g7adwY4lsG8s=;
 b=aex6FmnYso9lXU72Qsi2XrrJVeVPluSS6dI3BOYE5pOiC94yD8MwynFEiMCZHKFRxeIyYJ
 KqVXfuNIvvWRlPImAb3/pfik/UejvrSm6tI33GThBSMILKtvndnFOHgaWSUfgRgPN+tc8Z
 tcr8UKdmJO3uxBDtjZbmKQyZGDmePPE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-Y2N7kzKqNcaIcdwph9nDVw-1; Tue, 19 Oct 2021 07:20:58 -0400
X-MC-Unique: Y2N7kzKqNcaIcdwph9nDVw-1
Received: by mail-ed1-f69.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so17279763edv.10
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MJsmD3QRv8SGmtAedpltN89f3tDK3M7g7adwY4lsG8s=;
 b=4CyA5M3EpoJbPg8gB0tCQGsC7i4K5tD2LohBcAlc7ALXQ6IL+zq8XNwzgrR571dLuO
 DNrqmaBHSlAGuFA8NW3MGbqDktwDkcmdWxlj2YzQaDlubIXftJ8VjNHFl+/ojQyxC8Ts
 KFQDnV3HdeOXCBPxkUD75Z9IGANG9IE4qh40ZhibptEb3kSmn54F/nvLWlI6RgbjVLn3
 t136cvmet2pRsjh2aq1qm3jR7A+PYpE+AOgcnuNuvFzlNr9pve3a5LYh5j3RZQLYob3a
 q6ln0R/0PDyaCcPgFWlN6D2YcVn7gtWv0VrvN2R+gCG/dY/u8x/9oQGlMDoHFc63J0Uk
 GYaQ==
X-Gm-Message-State: AOAM533kR1vWE+0ZLf3iFopaML4MBAVcfN16xpfp9tlLRmAW8mKFNO6N
 M/rTH2Mo6SoxcSbCalNoZ10Rx/YtVm1xioc8NP1l7MAKsDdFDrI6+5amheT1GmyXBks8J10jWxH
 DGsFH9lBQn76kekKwF7QpEJ2yZEh10hTjg2KpMbq88kTayAtnSTgFx9QINxby
X-Received: by 2002:a05:6402:51cf:: with SMTP id
 r15mr53206918edd.60.1634642457396; 
 Tue, 19 Oct 2021 04:20:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqlkIqAq6GDv1qipgX2y6zlOYCAoVlxxDBwwkKg933H9hoYiBUlw6nY3fVQsjrdtzdfnPC+g==
X-Received: by 2002:a05:6402:51cf:: with SMTP id
 r15mr53206884edd.60.1634642457126; 
 Tue, 19 Oct 2021 04:20:57 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id z16sm12587693edb.16.2021.10.19.04.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:56 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/29] tests/acpi/bios-tables-test: add and allow changes to a
 new q35 DSDT table blob
Message-ID: <20211019111923.679826-27-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

We are adding a new unit test to cover the acpi hotplug support in q35 for
multi-function bridges. This test uses a new table DSDT.multi-bridge.
We need to allow changes in DSDT acpi table for addition of this new
unit test.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20211007135750.1277213-2-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/q35/DSDT.multi-bridge       | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..dabc024f53 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.multi-bridge",
diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


