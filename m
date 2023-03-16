Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433D26BDA05
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 21:21:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcu4Y-0000zK-Un; Thu, 16 Mar 2023 16:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pcu4S-0000ye-AA
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 16:19:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pcu4Q-0003Jd-J1
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 16:19:31 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so2776592pjt.5
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 13:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678997968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VBmt17FzJBkGOsoE6jT9m+lLM5V80VLvu7Mazev7Pbs=;
 b=CaQQ67DHgs11P5cVlHLt4RbytOk/d+CWw27lgZWjvAdpC/jz25q+Rb54jG+zWVRH8c
 g2UUveXqQJW3qPxNOX7nO5i134n3k2ggXCGsYZuJ2CBFoOisRYlUhiy+hJ5Wgkp0vKHz
 DpLD7sc21J+VjGulrBaSuJC6sMp5OYMzTzSNUU34Fq2NQ2/gweh/aHPxS8HGVcCKcRNE
 1Gc/hfLF35XMoYOOFUkFLFB9WilHwYezYr83T63A4KNrbwkqIdVfEaWUPGo2IVg86Pi5
 N4odEgix7QqpEJJDy+msR7uyIBW8xo9/1i1+l9kJ8uO9w72n9hjbDgIqjZsqv1Vzn5Vo
 p/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678997968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VBmt17FzJBkGOsoE6jT9m+lLM5V80VLvu7Mazev7Pbs=;
 b=1mXVBzR05aO1TCxecliH3cMZkwbc47UTfNBXuzqksBiq4eno3ByHOxx3t9L3/okU1U
 TSa8yz9g1RQxWzziFa2gff8O/WjyRyfObmGbOjrgaqRqs1CS0Z2ZDvK0WrBKXLT/n8Hb
 DK3iTvuoE8edpVn06ARA7zc7EI693YlD5ImlxlZKSUJHkCKd8OwbsJ6qLtPqzFma4Bak
 K8yFpo7Wx09/dAxFxS85niJwle0u+doujkP42hsqOU5/W/yf1g3jMsjB8lINwfbYLxio
 kg393rY0U7nsCfQWdFNLI+UdW0OfO7r6aVl3TgSO6CWUNPISTFwNy7yfeo6m0qwVbZS6
 M4vw==
X-Gm-Message-State: AO0yUKXg9O2r94VApUvbwY/Za2F7xFPcgtxfIkATDoVEcMGiBT4mQQ7u
 +kNodjylNMFKuxjhCg+7ES3XOgprIIg=
X-Google-Smtp-Source: AK7set94CPURaQ8I7MIJ5lneAKUNXA8aLuEXxeuSV6KwoEtU9UymGVV8XlZ+MmRXVqypC0T1WYcLnA==
X-Received: by 2002:a17:90b:1d11:b0:23e:f855:79ee with SMTP id
 on17-20020a17090b1d1100b0023ef85579eemr5344080pjb.38.1678997968271; 
 Thu, 16 Mar 2023 13:19:28 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:4ae:f94c:559c:68f4])
 by smtp.gmail.com with ESMTPSA id
 x61-20020a17090a38c300b0023d01900d7bsm149765pjb.0.2023.03.16.13.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 13:19:27 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 0/2] target/xtensa TCG test updates
Date: Thu, 16 Mar 2023 13:19:04 -0700
Message-Id: <20230316201904.2284949-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Peter,

please pull the following updates for the target/xtensa TCG tests.

The following changes since commit 27a03171d02ee0de8de4e2d3bed241795d672859:

  Merge tag 'pull-tcg-20230313' of https://gitlab.com/rth7680/qemu into staging (2023-03-14 10:09:15 +0000)

are available in the Git repository at:

  https://github.com/OSLL/qemu-xtensa.git tags/20230316-xtensa

for you to fetch changes up to 51139fb3e7b05dd7daeca8f00748678ce9e087e5:

  tests/tcg/xtensa: allow testing big-endian cores (2023-03-15 05:08:04 -0700)

----------------------------------------------------------------
target/xtensa updates for v8.0:

- enable testing big-endian xtensa cores

----------------------------------------------------------------
Max Filippov (2):
      tests/tcg/xtensa: add linker.ld to CLEANFILES
      tests/tcg/xtensa: allow testing big-endian cores

 MAINTAINERS                                | 1 +
 tests/tcg/xtensa/Makefile.softmmu-target   | 5 +++--
 tests/tcg/xtensaeb/Makefile.softmmu-target | 5 +++++
 3 files changed, 9 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/xtensaeb/Makefile.softmmu-target

-- 
Thanks.
-- Max

