Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A95062599F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:41:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otSP3-0003hN-05; Fri, 11 Nov 2022 06:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otSP0-0003f1-Ab
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:40:54 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otSOy-00026q-Ig
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:40:53 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 130so4213009pgc.5
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=CdMJMOO61G+WFx7isDknruUTUVOBX6maSgMtVYdlSiw=;
 b=ciL7q7n8CQCsSgiWEAcxGc7vhrsYcB8BiJuX70tOPwcguAlvwXKSzt37y683cbZVhe
 1G/28cHSbKu6hUF0X8et06EsT1U3fWzd57j2bCMH5LcXNt7ZwjH4J5Xp9XuczD9ejOOp
 47fU9kOV7z9H4abZhCcqWDlsvTgI+2YkMd8SccIT1uSe946YsHHJOvehq6pPIpSbyUu4
 JHJLs4mlnYEUPP4Tp2lufR+04G5ipmYM/mZceTb7RJDgLERLcvKHPZeWnNtvZaOG8zku
 xq7DnHBikSEEOTcH2h1FIQ5403mRUntLfSpqP0l8gU9CnHhKJuFhlpQ610nUc4Wc9zwz
 sYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CdMJMOO61G+WFx7isDknruUTUVOBX6maSgMtVYdlSiw=;
 b=iAEQe9WV7VcmvyYGoKnRrZ7zCbUSOH0N2p4cWCqNlYkmHX2DibCJ3EW9DRYKAXJTcb
 9PVzpVIvhJt40KMoTfuOmS0UmhdIAEGq7EEvqkKMG2igNsfWJhPTGgv/ghuOu+D4r/9/
 N70+Q/gGX3bXdac7MrzgwBqvO40jx4txXXxjqEcSNVRzUsQIHnn5KKy3pGGLftPUbywm
 S84YOsc1oqgBrF/vvzPmkzHMtlHla9VLqa6VyN/XM75hX4zKZAiUb9xHMxR3EN1asmnh
 B5hT8L58gCnXsPkpNrep/AQtAsACFgG/a80lE8CGBgaIpUUIfvH+YKk+EEwJt9cEJ9hW
 sI1Q==
X-Gm-Message-State: ANoB5pmmu7Xc9vSPV3UAmmxY0BrRz2dslLDoLsbaEg0ZlA/fDkw0p4PO
 iVpPefaAZ5qJFxVJbwFyiVUfNMM3/XFafQ8u
X-Google-Smtp-Source: AA0mqf5FcN76zRDr5CtAchQBAgKPcWzlXWRgoAtaTErdqRO9WZazsSAf8jsza2Jkers+20/W/zXsjg==
X-Received: by 2002:aa7:83d5:0:b0:56b:b8d8:f564 with SMTP id
 j21-20020aa783d5000000b0056bb8d8f564mr2252945pfn.46.1668166851005; 
 Fri, 11 Nov 2022 03:40:51 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 e29-20020a056a0000dd00b005668b26ade0sm1393933pfj.136.2022.11.11.03.40.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:40:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.2 0/2] target/i386: misc tcg patches
Date: Fri, 11 Nov 2022 21:40:42 +1000
Message-Id: <20221111114044.2510256-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

While poking at cmpxchg{8,16}b this week, I remembered there
was a fix for cmpxchgl floating around.  I pulled these two
fixes out of Paolo's i386 branch and added a test case.


r~


Paolo Bonzini (2):
  target/i386: fix cmpxchg with 32-bit register destination
  target/i386: hardcode R_EAX as destination register for LAHF/SAHF

 target/i386/tcg/translate.c      | 86 +++++++++++++++++++++-----------
 tests/tcg/x86_64/cmpxchg.c       | 42 ++++++++++++++++
 tests/tcg/x86_64/Makefile.target |  1 +
 3 files changed, 101 insertions(+), 28 deletions(-)
 create mode 100644 tests/tcg/x86_64/cmpxchg.c

-- 
2.34.1


