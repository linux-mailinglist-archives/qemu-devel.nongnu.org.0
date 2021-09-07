Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B03402C4B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:59:44 +0200 (CEST)
Received: from localhost ([::1]:36352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdVf-0005uZ-7m
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNdSo-0000xd-U7
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:56:46 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNdSn-00066u-52
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:56:46 -0400
Received: by mail-ej1-x633.google.com with SMTP id me10so20613854ejb.11
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 08:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j9eqJlfj0Da4R+Wabc9Qo7OKHPnYCk/V3GDkGgvaS3w=;
 b=RDCRnDpXOaTN5BhsDe/H82bjZ0TccSjM/bGT6hNoK75JdIU+KUuRnpdkGej/MCj63i
 dWE5Y1Qz8eINlujZAuDoPCyGnevpQKju1EvEGvR1gIdxkDdjpU+BH0ZRK6dIFtZ19SPm
 2fm/WAJ+KfzOxa8xWF7H3l8H3QUemWDMGYO7G+U++CRVHJKLCVFBUGpUsfR89uY85Ivu
 8a6OHvgI3K7gqQvaFo/LeB2NXAbvYNW9ybyhfreUpo08Yt8XXCRdFCR8vO9gciUDN+X8
 GMJ6OyweAcr850cNwnojJUce60t7Ksx3UL2BXjj9HUTIhkp4DL/ehBIxhbwU5+NFW9E/
 EFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=j9eqJlfj0Da4R+Wabc9Qo7OKHPnYCk/V3GDkGgvaS3w=;
 b=Jvlx6LZB/TYPdtSFHSuaJH4k38J1882IWkJlcTtJhmORE27w3+tbNlbLQk7zwN+ker
 qbOYQ6pw8pvJwb5Ofnukqvpc7oITSel60xB1xsgjEOwnPDfmoqFwlLtCZXvqC1rD6c3R
 jhdpHx/pYE8XZE4FTRo/0FzPXioiHSPDxCzbX5MVL4bsAuqpJ3QWxH5hx+rwCM8L7J29
 vO5rk/yaWK8sAHQKNqmRxWx40iVu7JayiXmu6qovqU2O6DkAzkHnWpkYDExjznpe7xyz
 49wbfsXsBiAktK7Hr+dT3+4fNfPwngaz49BjkeabIFElvEJtfakmkOfy3GBTI+NJlnCO
 OMjw==
X-Gm-Message-State: AOAM533+/XHiQyP57i1qUxl3jUaOsHNERIUJXdTNVYyiWqol4gCDx0iI
 5szciP5ZInEunBwGQu/3S3WI8kMV4nQ=
X-Google-Smtp-Source: ABdhPJylKFJm4DcKaHqwt7xPCI3PzswQZZlL5yba32rAPh2ItFaIF2gPSj9Lm3SykT7WFQNRvn/yQw==
X-Received: by 2002:a17:906:c1c9:: with SMTP id
 bw9mr19401098ejb.3.1631030202748; 
 Tue, 07 Sep 2021 08:56:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h30sm6869669edz.40.2021.09.07.08.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 08:56:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] docs: reorganize target-i386 to make room for SGX
Date: Tue,  7 Sep 2021 17:56:36 +0200
Message-Id: <20210907155641.197844-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The docs/ directory includes the documentation for many x86 features,
but target-i386.rst does not really have a structure that lends itself
to incorporating those documents.  One problem in particular is the
CPU model documentation, which is currently structured to be included
in both target-i386.rst and a man page.  This series changes that
documentation to be included from a subpage of target-i386.rst.

The first three patches use overline headings in standardized places
(book titles, docs/*/index.rst, man pages) to make include directives
easier to use from both manuals and man pages.

Based on this preparation, the fourth patch reorganizes target-i386.rst
so that it can be a place for many features currently documented in
docs/.  The new structure is inspired by the s390 documentation.
The final one converts the .txt file for SGX documentation to
reStructuredText and gives it a new home in docs/system/i386.

Paolo Bonzini (5):
  docs: standardize book titles to === with overline
  docs: standardize directory index to --- with overline
  docs/system: standardize man page section to --- with overline
  docs/system: move x86 CPU configuration to a separate document
  docs/system: move SGX documentation within the system docs

 docs/about/index.rst                        |  3 +-
 docs/devel/index.rst                        |  3 +-
 docs/index.rst                              |  1 +
 docs/interop/index.rst                      |  3 +-
 docs/specs/index.rst                        |  3 +-
 docs/system/cpu-models-x86.rst.inc          |  4 +-
 docs/system/i386/cpu.rst                    |  1 +
 docs/{intel-sgx.txt => system/i386/sgx.rst} | 70 ++++++++++-----------
 docs/system/index.rst                       |  3 +-
 docs/system/qemu-block-drivers.rst          |  4 ++
 docs/system/qemu-cpu-models.rst             | 10 ++-
 docs/system/qemu-manpage.rst                | 10 ++-
 docs/system/target-i386.rst                 |  9 ++-
 docs/tools/index.rst                        |  3 +-
 docs/tools/qemu-img.rst                     |  1 +
 docs/tools/qemu-nbd.rst                     |  1 +
 docs/tools/qemu-pr-helper.rst               |  1 +
 docs/tools/qemu-storage-daemon.rst          |  1 +
 docs/tools/qemu-trace-stap.rst              |  1 +
 docs/user/index.rst                         |  3 +-
 20 files changed, 84 insertions(+), 51 deletions(-)
 create mode 100644 docs/system/i386/cpu.rst
 rename docs/{intel-sgx.txt => system/i386/sgx.rst} (83%)

-- 
2.31.1


