Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11814B7C5B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 02:27:50 +0100 (CET)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK96i-00029o-18
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 20:27:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nK4Pc-00084q-8B; Tue, 15 Feb 2022 15:27:00 -0500
Received: from [2607:f8b0:4864:20::d36] (port=41744
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nK4Pa-0007Zg-QS; Tue, 15 Feb 2022 15:26:59 -0500
Received: by mail-io1-xd36.google.com with SMTP id r8so3026810ioc.8;
 Tue, 15 Feb 2022 12:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject
 :content-language:to:cc:content-transfer-encoding;
 bh=9qeyrsbPTwF/wD3PyooHIVbPCYPzpPxGatFxuu9t8O0=;
 b=MUeSCrqkQIZyBDoLK1J3duNvyRqXlumBnECqNVvfmfryF++RtDusCfun30o+NTFdQS
 MhKpTrpvnYuzTRCsIuOhMPR2v5sOL288zAgTf3mcLfeF+EWj+SFspGF3PM0KZMSbXmlY
 bi1Uf77mmG3/ANM5SW02cw3t07ANi4uMNRIKR9Y0QFIsUXWH4YQlH2/0FKWsL5vJsicu
 zvxwtlg1tcwlOqVDT6i/NLuf/xm7BTSL9bntq6QfENcceAQ68mAdxa1ez/kf34pJGv1E
 ZLm8muvjgquEHdSaG0Y78UxP/DL2DzUa4ZG3VCTMqI5hrKfsW6fBgdKRgweaG13qeP9Y
 uNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:content-language:to:cc:content-transfer-encoding;
 bh=9qeyrsbPTwF/wD3PyooHIVbPCYPzpPxGatFxuu9t8O0=;
 b=BhVI1zZtvB3VqWmHbXsnW8cwu9rzCaUjboHVtePmThC65FgqcblWsfRh6fZeTBDxLQ
 er+ubBiBJ04iREKlXz8OY67d2imTBya45/flaQj7a59BTwx3+Gnk33Afjc5Fm+PtsxCv
 KARm8B9/eqMLKY71H180/QXsxzJbvQthVujXktPQfwx+6rvUO5AKsNisLI7ZpMWrRJ/F
 cSZmCuwgK4pfcaBNeYH9hViomASth29puUPiUfBi4HselMiVog5IhtHLK9OdyJjZ+3GI
 c5WnwvLuy+mDfPSkOl4v1r5xJkYdii57lNgte9F0kXgtYc3kqv+802o7RUR02tPwGSwq
 SP0w==
X-Gm-Message-State: AOAM533FDG106jW1kMmcX2zbGt79f7cS54vz060H9yrqkot5XJyboLHJ
 3IHLFy7L5vqAjeAMuUuwXSXj51ECfe5H+LssI30=
X-Google-Smtp-Source: ABdhPJywfLGS9dDu/lg5Ok+ncwQZLWYjdPiOsnxtOXXoDQECEPgMmHOJ3eeqjew6c6oeooAiIyfqNA==
X-Received: by 2002:a05:6602:27c5:: with SMTP id
 l5mr393563ios.40.1644956817301; 
 Tue, 15 Feb 2022 12:26:57 -0800 (PST)
Received: from [10.10.0.23] (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id a6sm5621804iow.22.2022.02.15.12.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 12:26:56 -0800 (PST)
Message-ID: <f220f34b-0973-6a63-7f4a-5fe90ecd4750@gmail.com>
Date: Tue, 15 Feb 2022 15:26:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: David Miller <dmiller423@gmail.com>
Subject: [PATCH v3 0/3] s390x: Add partial z15 support and tests
Content-Language: en-US
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=dmiller423@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 15 Feb 2022 20:21:09 -0500
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add partial support for s390x z15 ga1 and specific tests for minste3

v2 -> v3:
* Moved tests to separate patch.
* Combined patches into series.

David Miller (3):
   s390x/tcg: Implement Miscellaneous-Instruction-Extensions Facility 3
     for the s390x
   s390x/cpumodel: Bump up QEMU model to a stripped-down IBM z15 GA1
   s390x/tcg/tests: Tests for Miscellaneous-Instruction-Extensions
     Facility 3

  hw/s390x/s390-virtio-ccw.c      |  3 ++
  target/s390x/cpu_models.c       |  6 ++--
  target/s390x/gen-features.c     |  6 +++-
  target/s390x/helper.h           |  1 +
  target/s390x/tcg/insn-data.def  | 30 ++++++++++++++++--
  target/s390x/tcg/mem_helper.c   | 20 ++++++++++++
  target/s390x/tcg/translate.c    | 56 ++++++++++++++++++++++++++++++++-
  tests/tcg/s390x/Makefile.target |  2 +-
  tests/tcg/s390x/mie3-compl.c    | 56 +++++++++++++++++++++++++++++++++
  tests/tcg/s390x/mie3-mvcrl.c    | 31 ++++++++++++++++++
  tests/tcg/s390x/mie3-sel.c      | 42 +++++++++++++++++++++++++
  11 files changed, 244 insertions(+), 9 deletions(-)
  create mode 100644 tests/tcg/s390x/mie3-compl.c
  create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
  create mode 100644 tests/tcg/s390x/mie3-sel.c

-- 
2.32.0


