Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A134A4E2E6A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:45:09 +0100 (CET)
Received: from localhost ([::1]:51062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWL9Y-0000r8-EE
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:45:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL7K-00079k-65
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:42:50 -0400
Received: from [2a00:1450:4864:20::630] (port=42936
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL7I-0007ci-G7
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:42:49 -0400
Received: by mail-ej1-x630.google.com with SMTP id j15so16947029eje.9
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DcvwiOqc2vYTSdOf3rGmIEf65P07F9aYYVWomNBm6Lg=;
 b=S5wKKu3GQvFD8xTBIGr3Efw6k+EQI777rPGHViArVzuc7v/C5Lqji2uYKPfUE5FmlF
 F8SyQEJS8zFU5srYHYhsOGGli5EXJJcg24Jlvl4+GePPjOkNGcFbdvwGv4aX5fhWHEx/
 iEPdNl/LeMpXYHfuyC+DPNvlSFBqKuomd01ZBsnxC6iyWvZnDPO0YP8ARxlDq7ERSyeU
 mKbvr0CwaFuxoNu6bQBL32Yw45pPkrQDw0t+xbKV95D5IpBxaBritqd5hXGW6zOQvidO
 RRcfY7oMd8WoJHeAEPScYf0yN40TqlTrCK3Enjj1NqSIQ/Y1RU7zfiQ9cX8U8U+d4OEk
 iPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DcvwiOqc2vYTSdOf3rGmIEf65P07F9aYYVWomNBm6Lg=;
 b=sK2oG5+UZfuVDCbbnIQ4IDQZ/6rGFFM+ZP73CZtAYDJQQj+CSeNVOEWt6sgIrQ07xi
 s4ktsQnBCXivNqPBr6XlgMCDuxIK1yh8KpFC7BYaN9hfFRsDHYSo36nW80m+c7HBLyJe
 Lxa9LsD+BzT/7xELVp0yD8gx0kKbpIYfysL03h+h+yUZhXNC0udgQ8NQkjy4VhLdgThl
 vPIwWMd0gvPfEkaZG3/HU8fWv/h/WDYAATlrIs7vFYxtICGxRP+iAKIZblnC9KpKPe4J
 HCHF5XKUovZx9cZsV1LATaVQ+E54RduAOKEfXSMX8WjXpFDlK1dmGQMfYqIpUtxFjH+V
 mV9A==
X-Gm-Message-State: AOAM533ATtLuy2GyYRlFjrEHyzfwogxD8WJls6vZi1Gw9WkfClwN/b0J
 tjUVw8swUfqMYzcNUIx4oNk+cMGcDpE=
X-Google-Smtp-Source: ABdhPJxey7u5ENZ24FHZBGKFl3w7vhU+R0ASCNuvdBZ4Had5HdCnPMxn8NUc1QhaGZs+f6XRbQSAVg==
X-Received: by 2002:a17:907:1c0a:b0:6da:7ac4:5349 with SMTP id
 nc10-20020a1709071c0a00b006da7ac45349mr21490570ejc.596.1647880966468; 
 Mon, 21 Mar 2022 09:42:46 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a50d802000000b00410d7f0c52csm8289385edj.8.2022.03.21.09.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 09:42:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] qapi-schema: support alternates with array type
Date: Mon, 21 Mar 2022 17:42:40 +0100
Message-Id: <20220321164243.200569-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As suggested in the review of the statistics subsystem.

Paolo Bonzini (3):
  qapi-schema: support alternates with array type
  qapi-schema: test: add a qapi-schema-test for array alternates
  qapi-schema: test: add a unit test for parsing array alternates

 scripts/qapi/expr.py                          |  2 +-
 scripts/qapi/schema.py                        |  4 ++
 tests/qapi-schema/alternate-array.err         |  2 -
 tests/qapi-schema/alternate-array.json        |  2 -
 tests/qapi-schema/alternate-array.out         | 18 ++++++++
 .../qapi-schema/alternate-conflict-lists.err  |  2 +
 .../qapi-schema/alternate-conflict-lists.json |  6 +++
 .../qapi-schema/alternate-conflict-lists.out  |  0
 tests/qapi-schema/meson.build                 |  1 +
 tests/qapi-schema/qapi-schema-test.json       |  1 +
 tests/qapi-schema/qapi-schema-test.out        |  4 ++
 tests/unit/test-qobject-input-visitor.c       | 43 +++++++++++++++++++
 12 files changed, 79 insertions(+), 5 deletions(-)
 create mode 100644 tests/qapi-schema/alternate-conflict-lists.err
 create mode 100644 tests/qapi-schema/alternate-conflict-lists.json
 create mode 100644 tests/qapi-schema/alternate-conflict-lists.out

-- 
2.35.1


