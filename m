Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276706504C6
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:23:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p713t-0000wa-3E; Sun, 18 Dec 2022 16:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p713Q-0000v9-RT
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:18:40 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p713O-0001pP-W3
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:18:40 -0500
Received: by mail-ej1-x634.google.com with SMTP id jo4so8527828ejb.7
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 13:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzJ3g6QskqfI5+kmoSXpiMDcu/zHjd7PoHSfc+W8jYk=;
 b=KT/onxhwpaDzlGGhdyGlFt9eVN3k8g4Lk1ljkSQ3+ivipejBKrArQwcRBcqrCrm7Ki
 fxdV6fdEPw86ckM+yCYi5bRiLne/J1cSxmk+guFNpvJwco0i/8d/exjwMYRFjdfRYmgD
 ndD6m+I2GRYGperAAa+2c5u4wqdbrLb9RvHD/P+3UvBB5t9Ft5GpwPacT/fhiRs6aAB7
 Y2ijc7dFSlp9FrdkBiyS1aHVZvRRvXiUSPJ/pb/VoqxJikaq8LEK7TSw4qzqSq1Q6Jbx
 be3Iy7Q4QinvNRHSJVjZTN367UCkZ0ZShpDF6Tl8i/mbIa+oF6tUWI7VGcQXuU/JPx7X
 LnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzJ3g6QskqfI5+kmoSXpiMDcu/zHjd7PoHSfc+W8jYk=;
 b=LZD1DZ7F86sb2o//VombvP4B/9Pf6rX2pKDjY2WxjlcODgK0QcqZjv5KzNWeYjfSzl
 GDJdbkj+fK62XDyb/E3RxPRauXR3ARmzXBNVu2MIUeKqe62DI9UWcQTHE0xU50bq/H3C
 0+cZYH8vrUZIYOWOr/WBZZdbo8GYOzjDYsexC+/iulTzfYQNtBlcFbIwStt1Vz4IXoIQ
 RXNyDFuqoz2oHrBfEfZz9UCQTyvtQp0XehSxAaFKoJ0kuwLD80biR6T1jb5YMqtlhRnP
 TaOi3blQHTexg1PqV3uk2d26M5MMR4c4aUsP4xs/0jkh8nfs/Awxc15bcpxE8QQt+ydQ
 n7fQ==
X-Gm-Message-State: AFqh2kpdP4G6+1pJempvz3qHzyNZodB63gyMQETe6actKkYFomwb2Hb0
 H9miNL3wkZEKKV8+1Cr/Ay8aUt29SBwNIyBjVco=
X-Google-Smtp-Source: AMrXdXvy6fF3wp63+lnaYW+EOOX9VSigyPoThRJvykvRHZ6+kOg3AXbF2fgOsMZCFtzVrx+Z2/mgWg==
X-Received: by 2002:a17:906:bc1:b0:7f7:a4ed:f2d4 with SMTP id
 y1-20020a1709060bc100b007f7a4edf2d4mr6327847ejg.77.1671398316816; 
 Sun, 18 Dec 2022 13:18:36 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a17090676d600b0080c433a9eeesm1666942ejn.182.2022.12.18.13.18.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 18 Dec 2022 13:18:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v4 20/27] tcg: Vary the allocation size for TCGOp
Date: Sun, 18 Dec 2022 22:18:30 +0100
Message-Id: <20221218211832.73312-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213212541.1820840-21-richard.henderson@linaro.org>
References: <20221213212541.1820840-21-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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

Splitting this patch in 2 to ease review.

Philippe Mathieu-Daudé (1):
  tcg: Pass number of arguments to tcg_emit_op() / tcg_op_insert_*()

Richard Henderson (1):
  tcg: Vary the allocation size for TCGOp

 accel/tcg/plugin-gen.c     | 11 ++++---
 include/exec/helper-head.h |  2 --
 include/tcg/tcg-op.h       |  2 +-
 include/tcg/tcg.h          | 54 +++++++++++++--------------------
 tcg/optimize.c             |  4 +--
 tcg/tcg-op-vec.c           |  8 ++---
 tcg/tcg-op.c               | 12 ++++----
 tcg/tcg.c                  | 61 +++++++++++++++++++++++++-------------
 8 files changed, 82 insertions(+), 72 deletions(-)

-- 
2.38.1


