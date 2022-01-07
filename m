Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D7487795
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:26:21 +0100 (CET)
Received: from localhost ([::1]:35184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5oK4-0002IY-EG
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:26:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n43-0001ZA-3r
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3z-0002QD-Bq
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HCH8M2xzOuTzVRMTHu52Ea//JZbOjY+v7CpKskn1oCw=;
 b=aXPZel8Z6OyvhxB+d1ZbEgwTZgdDMu4ysuZrlqRYQ+Z3MAJzA/rkNJuuaYhXOvlA8Q8EpC
 HaEyRYt+zuWgmu3F7/yPPJ2P3ufd0+n0ixNkXdzYTulY09sTBG/AcFvDUqcqDhd+YxYasI
 HHbKaRF5fBxTSjZeVNt0/konBs8AWlE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-QoxjgFrLOySu42a5OIeBaQ-1; Fri, 07 Jan 2022 06:05:27 -0500
X-MC-Unique: QoxjgFrLOySu42a5OIeBaQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m19-20020a05600c4f5300b00345cb6e8dd4so699958wmq.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HCH8M2xzOuTzVRMTHu52Ea//JZbOjY+v7CpKskn1oCw=;
 b=mlRqbB9JSEePnu3xItqTkmVCMGv83yRDksFarCURX825m4QoTNde+lOizfH41BpmpT
 N4BiEmM/uczIn9szR4pJHzi+wKc30OLT8IU0HIhrPzR8RjZpBEyNNbA4Z/1BViHYjZS/
 nYLgiu3aNum6DBCOjB6eTDCXYjZaU3EO8MZm+4Mm2H0MAYB61d2pBeLP7J1ukTbq9L/L
 ooIM24pmFhJFrQypiZHeTCxe88WnOAyXmgHqr65wi0gj+2w3hB0tD1Mdbuvb/sNgQePg
 +wSeU1DsxsmeW7MfRhsZzd/6WCKbjJNFQjwJkfB7FMq5jETRNaEvgy60ilscqTPsztgN
 kzBA==
X-Gm-Message-State: AOAM530tQrI/F2SEAHRlg/qk29iks73IVyAauNi+ISozhbi6UIME4nnl
 3va3dj9DvtIvKDJmgZPtgzOgYzOcAIx4V7fNF3tcNkn+Z7AsfUJe8+oNBfNSt4i6bq2swVo+nzS
 AD6emcYwyLVwLEfayCC7pHlrm4VVcPAxj8pQLg+uemUxR9mwzELP+Q/qn1WTB
X-Received: by 2002:a5d:588f:: with SMTP id n15mr55085177wrf.159.1641553525871; 
 Fri, 07 Jan 2022 03:05:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjuCEpIvAbcJRfFZuIIJij0GeVrZ+vecVZ75ciUdM5ZQkOn/ZruC7f63J0AfmWis2kkNrJEg==
X-Received: by 2002:a5d:588f:: with SMTP id n15mr55085161wrf.159.1641553525718; 
 Fri, 07 Jan 2022 03:05:25 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id l8sm4510810wrv.25.2022.01.07.03.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:25 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 46/55] tests: acpi: SLIC: update expected blobs
Message-ID: <20220107102526.39238-47-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211227193120.1084176-5-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/FACP.slic               | Bin 244 -> 244 bytes
 tests/data/acpi/q35/SLIC.slic               | Bin 0 -> 36 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 49dbf8fa3e..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/FACP.slic",
-"tests/data/acpi/q35/SLIC.slic",
diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
index f6a864cc863c7763f6c09d3814ad184a658fa0a0..891fd4b784b7b6b3ea303976db7ecd5b669bc84b 100644
GIT binary patch
delta 28
jcmeyu_=Qo#&CxmF3j+fKvygL;W3Y#Uud9N>M3Dyoc<=}c

delta 28
jcmeyu_=Qo#&CxmF3j+fK^G+v!XOCb7r-%UOi6RdGgN+Fa

diff --git a/tests/data/acpi/q35/SLIC.slic b/tests/data/acpi/q35/SLIC.slic
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..fd26592e2480c5d02a018e0d855a04106661a7b5 100644
GIT binary patch
literal 36
mcmWIc@pM*UU|?YMbPjS1_E7M31#*C(gN1>iFg3Rn#0CI%)&>Cp

literal 0
HcmV?d00001

-- 
MST


