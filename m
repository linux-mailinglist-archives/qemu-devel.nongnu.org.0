Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7144CD3D4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:55:11 +0100 (CET)
Received: from localhost ([::1]:40304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6Wc-0008RC-TD
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:55:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ6Uk-0006VF-ST
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:53:14 -0500
Received: from [2607:f8b0:4864:20::436] (port=38742
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ6Uj-0005M5-1u
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:53:14 -0500
Received: by mail-pf1-x436.google.com with SMTP id j1so3459304pfj.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fhvAa96OS1SENO8Qck8qKsd0tXAekWix89Wf/9XkNOs=;
 b=KfVkphJqz/kFM2Lb51YupFkhbiQaZxKpLCIF9Eg+UZhSp+r5B2B5AcNnhjgTQheQWM
 cUedK2irQskosQxM8xUb9Oh4ofxQj/RHNjChwS9PSaq+lj8ocAsOP78kI5erRDuYMp1C
 I+jzTGCCfInOkaOuI5zzWs8OjkLS5hKR2/1vzvEICLaODW0zaK5ZL+gPNtIUfcpF3rQD
 XXhM2pJNtw24W43brEOq8a3GHt32XnJ6Z5jZwVELz/9RKYnSpQaJ4uVSdiXvOdkNiLR7
 LQQsfxbXbiggPQ+X+rEyPMsIjAhnl+k5NoG7nE/G163Pag/PymIMqFjnttbUK2O/AxIw
 cfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fhvAa96OS1SENO8Qck8qKsd0tXAekWix89Wf/9XkNOs=;
 b=dm4H0nmt0cFXFyzLk3V4KGxAgY+n1nu82nVcXdquIwhuOeGPT+UP0Tc82e6c58W1BZ
 Oz0E1SCEIVNGxBpeV7XwOWjcsJePIO49JxxYzsu4N1CykxJ0a6VwGuWKx+zZ/cWS4X4v
 UT3DSH/DPPuzRGF4R1jnyoCMLt9T16XEGApYUl7GZ7x+o2KkCodL96fNkpyiuIY2T90T
 8YY8d5q2zlt2FS4TTtbWjBUSN2UxYXuzAF5sHKhBnfsu57g6pHKa40rMIX+ww2Ya5/jZ
 4sXfHK60/I/OLy8SUI2dGZMu4fAZvsDuufIia15Y8oh/S/aOfgGplT2rKr0yX5sWCKyJ
 uvTg==
X-Gm-Message-State: AOAM5323x837pSholXHPT8K0DVoAKOes6oYdSXG32/WWAqGxxiFEdLVv
 B1VeoRXcpz112p5aFRwHKckGjinWAWeKAQ==
X-Google-Smtp-Source: ABdhPJy56bZGZPBCsmsdICrpioJZ5PUNkDlcVVZuQGRapbtYGmWLUY7LlTRp+IXsMI96emWdxyuQbg==
X-Received: by 2002:a05:6a00:1307:b0:4b0:b1c:6fd9 with SMTP id
 j7-20020a056a00130700b004b00b1c6fd9mr43056598pfu.27.1646394791256; 
 Fri, 04 Mar 2022 03:53:11 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.152.50])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a056a00178700b004e1a15e7928sm6334878pfg.145.2022.03.04.03.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 03:53:10 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/3] hw/acpi: add indication for i8042 in IA-PC boot flags
 of the FADT table
Date: Fri,  4 Mar 2022 17:22:54 +0530
Message-Id: <20220304115257.1816983-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x436.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, liavalb@gmail.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can allow the guest OS to determine more easily if i8042 controller
is present in the system or not, so it doesn't need to do probing of the
controller, but just initialize it immediately, before enumerating the
ACPI AML namespace.

To allow "flexible" indication, I don't hardcode the bit at location 1
as on in the IA-PC boot flags, but try to search for i8042 on the ISA
bus to verify it exists in the system.

Why this is useful you might ask - this patch allows the guest OS to
probe and use the i8042 controller without decoding the ACPI AML blob
at all. For example, as a developer of the SerenityOS kernel, I might
want to allow people to not try to decode the ACPI AML namespace (for
now, we still don't support ACPI AML as it's a work in progress), but
still to not probe for the i8042 but just use it after looking in the
IA-PC boot flags in the ACPI FADT table.

Changelog:
v5:
Addressed review comments from v4. Also got rid of microvm changes. Will send
them in a separate patch.

Liav Albani (3):
  tests/acpi: i386: allow FACP acpi table changes
  hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT
    table
  tests/acpi: i386: update FACP table differences

 hw/acpi/aml-build.c            |   8 +++++++-
 hw/i386/acpi-build.c           |   8 ++++++++
 include/hw/acpi/acpi-defs.h    |   1 +
 include/hw/input/i8042.h       |   6 ++++++
 tests/data/acpi/q35/FACP       | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.nosmm | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.slic  | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.xapic | Bin 244 -> 244 bytes
 8 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.25.1


