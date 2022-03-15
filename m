Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5047E4D9AF0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:16:36 +0100 (CET)
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU66N-0000Ia-CE
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:16:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62s-0005rq-IR
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:12:58 -0400
Received: from [2a00:1450:4864:20::52f] (port=35602
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62q-0000ZG-5z
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:12:58 -0400
Received: by mail-ed1-x52f.google.com with SMTP id y22so23934089eds.2
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ciVW08QLU6Jb9sykNdkO6lGdjgP3gTQdRpJ3NgnQFY=;
 b=Z4oE72hf5JNJ4HErlPeR4M6TS6jDNzttg6tntTcdN7nvegbBcMOvaG/09RQvwFG8Z1
 acxvLVqhvNOqMrQagVlA5JFu2uWS6YZntGc0uEEWM9tY4JT/krDbgG54VC2zmoUTVkUZ
 Y4NRAMhdBlduYm47sYZRXy1ZALnXAiMLl5KnZB8geqDH3Il5zB4Wkqnpf/7SrVgVfzHg
 uzJtl01aDjHL9JJl25vaHjx7U524NqzQlLMfM/UcI3/0Qjrlzo1NRpT2gwQM4PbDgPgL
 nXjc6ho+EAAd3w3JRnGi2pmjOea5AuCIqQ3AnUkPDwgXDyXcKVxJeOaaqHjg8RoNKtAv
 QD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ciVW08QLU6Jb9sykNdkO6lGdjgP3gTQdRpJ3NgnQFY=;
 b=OXt0DsRs+QAc+FXH94zab83rtiwpFz5/3T8TQhAZfCqTSi0lHJmFKZ96wXm2uvWKAV
 mp9mGYAnzqoTyjelYa3XcPUIi2U8xRFQa9Fqx+BfqCFwMxjNuzxRAYydv1Maxkx1NT5n
 zZApdBwN1RbckqdJXcjk+0LzMUCitneBwgPQZ/SPc9D6a2YFsBpWzrs6AV5Jms4D2MXb
 AU3Jd84AHFP5XZvW+j1AdKLJJKZ1P7j1atvgSwM/thCLoGFzYAftf7wJHMMHb8AnCgXy
 v3LGGXMgw+GZfmW0EUFEfnuRXMiAsFYd/iemtvYYbak8qC3m0JkQLfXzI+cAKEA8FRzt
 G8HA==
X-Gm-Message-State: AOAM531Uz5Y2EiA68tIUopc+aTU2ryCe1Pf/W00MJJeFDuBtoKaNnqSN
 ceLyfw6/HvyzZ9yH6nFHlqBdKw==
X-Google-Smtp-Source: ABdhPJz0zSP+HrQI+As49v85I5h0F+uWVigLXklodpbXl4Gnx3YTckRNEM+4vvYfCsuxEBEmzmxOpA==
X-Received: by 2002:a05:6402:5304:b0:413:8a0c:c54a with SMTP id
 eo4-20020a056402530400b004138a0cc54amr24673453edb.172.1647346374543; 
 Tue, 15 Mar 2022 05:12:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a170906165300b006a625c583b9sm8137120ejd.155.2022.03.15.05.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 05:12:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC4BE1FFB7;
 Tue, 15 Mar 2022 12:12:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 7.0 v1 0/8] misc testing, i386, docs, gitdm, gitlab
Date: Tue, 15 Mar 2022 12:12:43 +0000
Message-Id: <20220315121251.2280317-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, berrange@redhat.com, sw@weilnetz.de,
 richard.henderson@linaro.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

As per usual here are the collection of random fixes and tweaks as we
go through the release process. Most of these patches have been posted
individually before although the semihosting and gitlab patches are
new.

The following need review:

 - gitlab: include new aarch32 job in custom-runners
 - semihosting: clean up handling of expanded argv
 - tests/avocado: update aarch64_virt test to exercise -cpu max
 
Alex Bennée (7):
  tests/avocado: update aarch64_virt test to exercise -cpu max
  target/i386: force maximum rounding precision for fildl[l]
  tests/tcg: drop -cpu max from s390x sha512-mvx invocation
  mailmap/gitdm: more fixes for bad tags and authors
  docs/devel: try and impose some organisation
  semihosting: clean up handling of expanded argv
  gitlab: include new aarch32 job in custom-runners

Thomas Huth (1):
  tests/Makefile.include: Let "make clean" remove the TCG tests, too

 docs/devel/index-api.rst            | 15 ++++++++++
 docs/devel/index-build.rst          | 19 ++++++++++++
 docs/devel/index-internals.rst      | 21 +++++++++++++
 docs/devel/index-process.rst        | 17 +++++++++++
 docs/devel/index-tcg.rst            | 16 ++++++++++
 docs/devel/index.rst                | 46 +++++------------------------
 semihosting/config.c                |  6 ++--
 target/i386/tcg/fpu_helper.c        | 13 ++++++++
 .gitlab-ci.d/custom-runners.yml     |  1 +
 .mailmap                            |  6 ++++
 contrib/gitdm/aliases               |  4 ++-
 tests/Makefile.include              |  2 +-
 tests/avocado/boot_linux_console.py | 22 +++++++++-----
 tests/tcg/s390x/Makefile.target     |  2 --
 14 files changed, 136 insertions(+), 54 deletions(-)
 create mode 100644 docs/devel/index-api.rst
 create mode 100644 docs/devel/index-build.rst
 create mode 100644 docs/devel/index-internals.rst
 create mode 100644 docs/devel/index-process.rst
 create mode 100644 docs/devel/index-tcg.rst

-- 
2.30.2


