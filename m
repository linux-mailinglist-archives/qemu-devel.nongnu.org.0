Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452906AABDD
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:22:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTQ-0006O4-J2; Sat, 04 Mar 2023 13:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTM-0006NC-04
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:08 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTI-0003Lv-4C
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:06 -0500
Received: by mail-pf1-x441.google.com with SMTP id ay18so3444649pfb.2
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=gYMNkHlK6Q3oYWVhZsYqHWRkvfeblTsDNSsLCqbyo8k=;
 b=b5XZ2Yw2S3exhq5INvUfTZxXnHkY0TeEYhBU15ejH7eRr7iDzh8Y+P9w9MJEhHUxXv
 opq1y7xdKdS95VQCOIfWlMT7daBp75nU4/O3EsZaT0Mh7LG/uzVTtRbFNoAKrqyDiTt6
 Q0ZGpntGsmsV+ADvEhGPVCfIxBJ6L1fiQszXQCjp4+q96Ya5LOqUhxJxlqtwKIj/T7+V
 vXDd72blpRjveqSgB6zgAt9LFeT6T1AzBJ9L8NpzOIxP9fN6qdNMlyjkLkSMgbhTJukh
 1SaGBHy1qpfOR+RN6rPYQT96DbknDf0JIQk17ZzbEo6w0JJj0Esg6je2Qa1hAWXVTXAg
 G6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gYMNkHlK6Q3oYWVhZsYqHWRkvfeblTsDNSsLCqbyo8k=;
 b=mUSR1AFieHkrBd1vGisEfNDJUhAn7LHbYINkfAKaAIiLvWgXkATJ19hGJ0+LyUb0Ym
 TxNuhXXyRguKL7BM3LebQ9xDwpFvkAyLvp07ErRfz/4bbbMNbzaMpYc02444UGfipPAV
 SHHr2lvB0suq6CWy4fEkXtLUEUkeHAbroJCXeKvMEd3SinObz9T6j8JgORir36ou8HHd
 UC1fYuAJACzrdg2bcOmm0DsWUGUQerz8Qaft8++D06uS2UKl5eUCH/OKaXsubqjERJuE
 +bq1PDrBoays8FfBvy9ZyTrOZKpMS5qc9bJ8dt43tF+o++1cd3/wCy47n8qv9DXvi/AU
 Nu3Q==
X-Gm-Message-State: AO0yUKV4CH1Wl/9OhQgWCiSNI+ovvEo5tNO4mnJw8/KwtxmPpAwR0AE/
 uxp/WfhVGKd2HJkXN3aDfTUfAD0b2s7VN1CjPs2zbSWl
X-Google-Smtp-Source: AK7set+Ax38BqcCFFYcq1GDtnwCBrMn6ieUM/UINug8f9pNPDZMTZD0XLh+Hg8ttQ9u+Foy65YKdRQ==
X-Received: by 2002:a62:1709:0:b0:5a8:b6ec:3aac with SMTP id
 9-20020a621709000000b005a8b6ec3aacmr6076503pfx.15.1677953942229; 
 Sat, 04 Mar 2023 10:19:02 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/20] tcg: drop tcg_temp_free from translators
Date: Sat,  4 Mar 2023 10:18:40 -0800
Message-Id: <20230304181900.1097116-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I've queued the reviewed patches from v2 to tcg-next; these are
the ones that remain.  Please review.

Just in case, the tree is
  https://gitlab.com/rth7680/qemu.git tcg-free


r~


Richard Henderson (20):
  target/i386: Drop tcg_temp_free
  target/mips: Drop tcg_temp_free from micromips_translate.c.inc
  target/mips: Drop tcg_temp_free from mips16e_translate.c.inc
  target/mips: Drop tcg_temp_free from msa_translate.c
  target/mips: Drop tcg_temp_free from mxu_translate.c
  target/mips: Drop tcg_temp_free from nanomips_translate.c.inc
  target/mips: Drop tcg_temp_free from octeon_translate.c
  target/mips: Drop tcg_temp_free from translate_addr_const.c
  target/mips: Drop tcg_temp_free from tx79_translate.c
  target/mips: Fix trans_mult_acc return
  target/mips: Drop tcg_temp_free from vr54xx_translate.c
  target/mips: Drop tcg_temp_free from translate.c
  target/s390x: Drop free_compare
  target/s390x: Drop tcg_temp_free from translate_vx.c.inc
  target/s390x: Drop tcg_temp_free from translate.c
  target/s390x: Remove assert vs g_in2
  target/s390x: Remove g_out, g_out2, g_in1, g_in2 from DisasContext
  target/tricore: Drop tcg_temp_free
  tracing: remove transform.py
  tcg: Create tcg/tcg-temp-internal.h

 meson.build                               |   1 -
 include/tcg/tcg-temp-internal.h           |  83 ++++
 include/tcg/tcg.h                         |  54 ---
 accel/tcg/plugin-gen.c                    |   1 +
 target/i386/tcg/translate.c               |  41 --
 target/mips/tcg/msa_translate.c           |   9 -
 target/mips/tcg/mxu_translate.c           |  51 --
 target/mips/tcg/octeon_translate.c        |  23 -
 target/mips/tcg/translate.c               | 537 +--------------------
 target/mips/tcg/translate_addr_const.c    |   7 -
 target/mips/tcg/tx79_translate.c          |  41 --
 target/mips/tcg/vr54xx_translate.c        |   6 +-
 target/s390x/tcg/translate.c              | 188 +-------
 target/tricore/translate.c                | 540 +---------------------
 tcg/tcg-op-gvec.c                         |   1 +
 tcg/tcg-op-vec.c                          |   1 +
 tcg/tcg-op.c                              |   1 +
 tcg/tcg.c                                 |   1 +
 target/i386/tcg/decode-new.c.inc          |  15 -
 target/i386/tcg/emit.c.inc                |   6 -
 target/mips/tcg/micromips_translate.c.inc |   8 -
 target/mips/tcg/mips16e_translate.c.inc   |   6 -
 target/mips/tcg/nanomips_translate.c.inc  | 127 +----
 target/s390x/tcg/translate_vx.c.inc       | 143 ------
 scripts/tracetool/__init__.py             |  23 -
 scripts/tracetool/transform.py            | 168 -------
 26 files changed, 128 insertions(+), 1954 deletions(-)
 create mode 100644 include/tcg/tcg-temp-internal.h
 delete mode 100644 scripts/tracetool/transform.py

-- 
2.34.1


