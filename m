Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBD06AFC09
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:17:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiM5-0003ad-4r; Tue, 07 Mar 2023 20:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLt-00039W-Qp
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLs-0001eH-0h
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ya5Cro5wypV5ailmtJu7KeS2J+LYt2/Y2DT4fIUNEAc=;
 b=Gz/B6lN5SuJndpXsuT/sTWcEzEeggTpqaN6LIiIKsGbPcWZf6VmXbV9PAJgUbAfloIhfz9
 aGn9p8He9oS0bbMvfSBKOug4B6ZSK3l8z1VFsDfNBjxXBgqgvCjRfH0VClBLT8fmX6svJ2
 e5hIMmDUPZeFv2ZvZNRCS9oEl9yCNXI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-vlRVFqt3MkiHgVItoA6X0A-1; Tue, 07 Mar 2023 20:12:18 -0500
X-MC-Unique: vlRVFqt3MkiHgVItoA6X0A-1
Received: by mail-ed1-f70.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso21407065edb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237936;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ya5Cro5wypV5ailmtJu7KeS2J+LYt2/Y2DT4fIUNEAc=;
 b=ow54jFdhe3Zz1ESY5npFByehKinh4yJ+E0KR2ooShnnO7xkhNjTQZHvJl9Yd8GvXOK
 Faqi7UBGJkR7HPIYXWjuKJdJ143L88ghfHmNS21G6mo0qP4460AVmwLfit0AVtBeGRu6
 kaCKgKlmCLx6r0PZWG39wBP7UxX8MOFzZTwvc2sBPub4jS8eXQzCz9aYvVMHrLedQRWj
 5oBThIxUQitFZdI8CFO8szoiKFfGnXYzeNAAcp321jI8rsKjtdG0vricT8kDii3gvCyN
 Sp22hmPVRLY92sNRTz1JDmIkcjrCtvXnIdZYchQbBnWCpV5+Vlp3OXwIriDcIofKPO86
 dLuw==
X-Gm-Message-State: AO0yUKVSesCvCquJZbHBFvvtJ+PvS5wv6z2siTWEenYSJV9FNJOT0mTF
 R+kznETgeFp80U6GwpbF1xAPQfi9olJv0udGb92kM6x/nfp/9YO/wP2ViDuRI1GD+WhiABv/7oU
 IrQyuXB7Jr1BQUsDxD7QDopwF6863BDxeCf0VnhL3TUs9Mw55zwauOanfAp/7OMppj6Vu
X-Received: by 2002:a17:907:1051:b0:8b1:c5aa:4c8b with SMTP id
 oy17-20020a170907105100b008b1c5aa4c8bmr15019344ejb.77.1678237936623; 
 Tue, 07 Mar 2023 17:12:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/wcEWpE1w0Z1ix3qNF2iRfqNR31q5YrSwVleoUIa0I/JvVMzSQ8i6MAE7qDJKAIqXhjippmw==
X-Received: by 2002:a17:907:1051:b0:8b1:c5aa:4c8b with SMTP id
 oy17-20020a170907105100b008b1c5aa4c8bmr15019332ejb.77.1678237936389; 
 Tue, 07 Mar 2023 17:12:16 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 j22-20020a1709066dd600b008e6bd130b14sm6828952ejt.64.2023.03.07.17.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:15 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 28/73] tests: acpi: whitelist new q35.noacpihp test and
 pc.hpbrroot
Message-ID: <d3860a57c7b8f36ff262a3482d544a9cff592bfd.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 LOTS_OF_MONEY=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

for q35.noacpihp use plain default Q35 DSDT table as a starting point.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 ++
 tests/data/acpi/q35/DSDT.noacpihp           | Bin 0 -> 8252 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.noacpihp

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..b2c5312871 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/q35/DSDT.noacpihp",
diff --git a/tests/data/acpi/q35/DSDT.noacpihp b/tests/data/acpi/q35/DSDT.noacpihp
new file mode 100644
index 0000000000000000000000000000000000000000..d68c472b460e4609a64ea67de3c4cebfca76164d
GIT binary patch
literal 8252
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

literal 0
HcmV?d00001

-- 
MST


