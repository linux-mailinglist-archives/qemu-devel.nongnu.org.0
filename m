Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7473410F9F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:49:58 +0200 (CEST)
Received: from localhost ([::1]:58182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSD7l-0003jx-So
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSD58-0000xx-Ru
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:47:16 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mSD55-00011z-Px
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:47:14 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 il14-20020a17090b164e00b0019c7a7c362dso6783849pjb.0
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 23:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h5G+rs7Kg2oL4PSJ3LTQuRfswcGuwytxEclgvyQtKDA=;
 b=LlxHQEIpyhECj+5iE5D5zkNWK/QqyMnaOhHKRaZRH0zRzuF17n0pPSFIUXyNKGL44I
 lHxnXK2TvpaPSFoWs8p/zBjIF8yTy0qFkC7e59SBFLHBsn+sbXc5/hfPaOIFd0vm/rSl
 WpMrT8qoSh6cdnjgG3jl6G+zEsIiODg83I1p7wXy0z+FcVTjP50jgn2f0cA9AmhHSW28
 XvzaC7SCOMIgIQGWLEDUYZhz9JA+J64FyJzjhm0Og7vnwzN6LvHLJFqcPpUhjQgvBKJG
 aye30P7aCakdgbHugZ+AfvPPpAU1/mCWgVIuUAdiHIOkOQMiwnOSgBuk2rh0I9fYsOQ/
 bvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h5G+rs7Kg2oL4PSJ3LTQuRfswcGuwytxEclgvyQtKDA=;
 b=AtWb3lPSWeKnINlv10LnJnjkv9IlfYLDi7yCy/LDdTJZdbH8NVmLj8l69Gv1Nrp3ns
 2SZwFI87CqUGVvI6HQKEm2Dikx4KMUykTXKcgD/XZNjgGYMpl83D8bEwi8gJLhGSJ0QL
 xXRamjjt26Qt9UbJL3x2lF36HB988aSqHX+wymvvy15qZ8anQh+1Lkk7tOTxcSfOQNLu
 Hg874c97SLFIxRkKBMKfI0oed4g9EWg+eaqa/gY95r+MHLbzZWLAXZAQM9Lz9U7NxsQa
 AtpCLiwGyJnAvtg+J+1F0WdXYKKWVDuuVZHvHR952JFJP3lXyd7y431j4QiPb6ShDML3
 U5ag==
X-Gm-Message-State: AOAM531hKyOjC9VPqrbLfxAD0G1gly+9BZ0bB9wn0IZF52PY/iFBXk6F
 bX3WV0QKqi9vRYIIShKVWjBc2C3dtfJmcw==
X-Google-Smtp-Source: ABdhPJytMZ5hnlAziPZWkwpyg2lzHlWfmuvlmHQKa1TIt4f7XDQ/kjwKWvOdO1GTIUoH+hSzTYDPMQ==
X-Received: by 2002:a17:90a:29a4:: with SMTP id
 h33mr27564410pjd.88.1632120429111; 
 Sun, 19 Sep 2021 23:47:09 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.109.20])
 by smtp.googlemail.com with ESMTPSA id u24sm13400752pfm.85.2021.09.19.23.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:47:08 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
Date: Mon, 20 Sep 2021 12:16:30 +0530
Message-Id: <20210920064633.3936409-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds a unit test to exercize acpi hotplug support for multifunction
bridges on q35 machines. This support was added with the commit:

d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")

changelist:
v1 : initial RFC patch.
v2: incorporated some of the feedbacks from Igor.

Ani Sinha (3):
  tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT
    table blob
  tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges
    for q35
  tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge
    test

 tests/data/acpi/q35/DSDT.multi-bridge | Bin 0 -> 8435 bytes
 tests/qtest/bios-tables-test.c        |  18 ++++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge

-- 
2.25.1


