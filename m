Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB26D4ECE8B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:06:59 +0200 (CEST)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZfWs-0006JA-Fd
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:06:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZfUt-0003Fc-Il; Wed, 30 Mar 2022 17:04:55 -0400
Received: from [2607:f8b0:4864:20::32e] (port=41625
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZfUs-0003Ia-0r; Wed, 30 Mar 2022 17:04:55 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 x8-20020a9d6288000000b005b22c373759so15787432otk.8; 
 Wed, 30 Mar 2022 14:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Ap+GzRD+YHlA7+e4QOaMVgH5ALUt8AREkcJe7ml/ew=;
 b=fP3JmA0xS4ZLz6GASfLs3QZSMDyNMAMsqL6wAH9xtEKi7EtFkDoW2wonVtiL+NV96d
 79nA00CpMlhLGd7SXs9uXFtv9/vjD8hYEw0N3vkNCf0HkR2p50n4gVJFTiy03Qo+qL/j
 CsPIwpnsjhh079dpo/lggThW520tcVZM7QEAYxZCJtOYKSZieSQ9jYtOa6QEhjpNsawd
 kULkZIDWuQF1QIzyBzKocJvz7eJqDLl3v5tG9fHzQve7NtVYpnofXxC+FNgoP9Ly/eEw
 aqRj6OKPJtfn8ioPqYxYKBUhW6POGGmDIDVnIm1iVOtYMlKLlLFLOKWA/Xq7Dwnu+GcM
 Of3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Ap+GzRD+YHlA7+e4QOaMVgH5ALUt8AREkcJe7ml/ew=;
 b=RGz4X+aIkgtS4MUd8SvkxJOt0i6x5OICyuSexkyR2GaOkv/3a15aNYqXM5nafAeR/0
 jn4VQMIDd2p7pfWRvsGhEC7LEMSjmlq00ypt1bQeEqdGuzs1+/4VJwKzsOLGXhDddc0r
 tnnws4Tt10/SNae9LQhrznj7fLURMH4ZDE/9AS9EhiJQsCHI6zVWwmoTkPekC2goUr/R
 0kQbZ9eKMCBdtE97ysuLuYyAzf9ZntS8pOfSMsIjCDyS6zgq7t1uq2cL9E0OpAbHTMbf
 w40ctP3w8ki+PsQo4jCHB2WkhIvAi+bQBeXmc7edoJV5rOhqzNQhe++ZbTKOcKpDTDC1
 vP7Q==
X-Gm-Message-State: AOAM533Lv5lpcj/UTbH7Ob6SvvOBZf22fZO5ivWd9TSGP7Ul6lXP8bLP
 XXzjqHiSKc6GTSpRgdQ8QqJgHrhLycc=
X-Google-Smtp-Source: ABdhPJwGITms8cb+o0yNpgeBum56e8xJYCylDV8t/D/u30ntUsS9FhUJZaw+nBsqZit1C1GOo+JYUw==
X-Received: by 2002:a9d:720d:0:b0:5cb:6545:57 with SMTP id
 u13-20020a9d720d000000b005cb65450057mr4177022otj.202.1648674291962; 
 Wed, 30 Mar 2022 14:04:51 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a05687044d300b000de4e33171csm9988617oai.34.2022.03.30.14.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:04:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] ppc: valgrind "uninitialized values" fixes
Date: Wed, 30 Mar 2022 18:04:39 -0300
Message-Id: <20220330210443.597500-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

These are a handful of trivial fixes to make Valgrind happier when
profiling the boot of a pSeries guest. All the patches are handling a
similar case where we have something similar to this:

---
uint64_t val;

(...)

kvm_vcpu_ioctl(...., &val);
---

Valgrind does not consider that 'val' was initialized and then it keeps
complaining about every future use of 'val', or anything that got
assigned as 'val', as being an uninitialized value/data. The fix is
simple and without any side effects:: just initialize 'val'.

After this series, together with the memory leak fix sent in [1], we
don't see any more ppc/spapr related Valgrind memcheck complaints when
booting a pSeries guest.

No functional changes were made.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg06804.html

Daniel Henrique Barboza (4):
  target/ppc: initialize 'reg_val' in kvm_get_one_spr()
  target/ppc: init 'lpcr' in kvmppc_enable_cap_large_decr()
  target/ppc: init 'sregs' in kvmppc_put_books_sregs()
  target/ppc: init 'rmmu_info' in kvm_get_radix_page_info()

 target/ppc/kvm.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.35.1


