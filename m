Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABEC4AA8E4
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 13:58:10 +0100 (CET)
Received: from localhost ([::1]:49564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGKdl-00049v-CA
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 07:58:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGKSB-0000PB-V9
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:46:12 -0500
Received: from [2a00:1450:4864:20::431] (port=44002
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGKRY-0006Fj-O8
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:46:08 -0500
Received: by mail-wr1-x431.google.com with SMTP id c19so1498941wrb.10
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 04:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iOCKN23p2/VAzdNsbddB0y1D5gZCoJzHItZXmumAeY4=;
 b=NowYB44LKeMfyCn86Y/c36NdzLHxyquEgaiqvFQ2QhwVUI9tTh9jI2U3geK5kCNsSe
 AD4vpWJwJvAxSmSRR6UG350SWqEVL0MiLZ7t7OCnHX4LVjmnqVpuI3gjNIIKBCRv6TKq
 ms4e8QRUMRCtKMhsndJ5DK9b3SqpIZSyJTYaW5WeynbRQA984iH0wlKgCsJUMGxQr5IA
 CEUPumdQCxyoeOBLqrP/NnMo/VDGqcBLKfXHz0ut0A56tclLQslvW2Lg2YIM75E49h88
 lNZM9mDALLKD+LOQlhmyydhU+Mkw7O2HZvEASr4p77kJY/jErJ8cf94ZJYXdpxrTvbeE
 izgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iOCKN23p2/VAzdNsbddB0y1D5gZCoJzHItZXmumAeY4=;
 b=Kjvj5xJSs9rdh8AxVVd2UKDh83rE1rP7bfl/KGUipfuM0c2mXhqt9oFBGUbIm8d4L2
 shSc4hoaJXnTHODTsdeeyF5bs4j80AOxBCT4Id5NFSOf6Rd3Jnj+2oVl5G4qm7OpAM5S
 yKqqfEOK8IHIBilpI00xHOmc6GpEipEYzPGq/U3Tzcr84vjPEDku/I6smstVYPCu5A1p
 90q6YDLIKzq8EBM33NfhUv0KKVNqrKWFuFMPtpcN7jWlnOiPXXvlKARoc2xmXBTkVXaZ
 uJkDrxIMggaHFw2srKiqmpy6RRxOQ0ZHO3G+n7ce+C0gUxHrr1RCrXa5v8mwKJT2CPQC
 1x7g==
X-Gm-Message-State: AOAM532SFJ766DZlMKjaVMoUAepsd3pV/uQNERl4zKcPH+QlZC+lpeYu
 ySZaKS41gugNnEAXrLiElIVIFp0MOaU=
X-Google-Smtp-Source: ABdhPJzlaq+7laB+XlnGggl7M1y7gispKuOZIxa2mDyc7ov1OMbxfi7BYeIot1nGtZJ/ezwE/rNKoA==
X-Received: by 2002:adf:e350:: with SMTP id n16mr2869606wrj.160.1644065128712; 
 Sat, 05 Feb 2022 04:45:28 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 j13sm4600985wrw.116.2022.02.05.04.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 04:45:28 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 0/4] hw/i386: QOM-attach CPUs/SGX-EPC objects to their
 parents
Date: Sat,  5 Feb 2022 13:45:22 +0100
Message-Id: <20220205124526.500158-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Trying to fix the issue reported here:=0D
https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg05670.html=0D
=0D
First attach the CPUs and SGX-EPC objects to the machine.=0D
=0D
Since v3:=0D
- update VIOT ACPI table (Paolo)=0D
=0D
Since v2:=0D
- added missing QOM property auto-enum: [*] (Yang Zhong)=0D
=0D
Since v1:=0D
- addressed Paolo & Daniel review feedbacks=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  tests/qtest/acpi: Temporary allow VIOT table changes=0D
  hw/i386: Attach CPUs to machine=0D
  tests/qtest/acpi: Update VIOT table blob=0D
  hw/i386/sgx: Attach SGX-EPC objects to machine=0D
=0D
 hw/i386/sgx.c                 |   2 ++=0D
 hw/i386/x86.c                 |   1 +=0D
 tests/data/acpi/q35/VIOT.viot | Bin 112 -> 112 bytes=0D
 3 files changed, 3 insertions(+)=0D
=0D
-- =0D
2.34.1=0D
=0D

