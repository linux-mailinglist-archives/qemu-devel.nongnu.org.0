Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ED34A9480
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 08:24:26 +0100 (CET)
Received: from localhost ([::1]:56860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFsxC-0002TU-Oy
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 02:24:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFsZy-0006Xk-HY
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:00:26 -0500
Received: from [2607:f8b0:4864:20::1035] (port=54059
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFsZv-0006Sr-7W
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:00:20 -0500
Received: by mail-pj1-x1035.google.com with SMTP id h12so4667224pjq.3
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 23:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N0/90KdghvF6SYqTTkjuKGlp10vLJQrjGaYMCFWOC9Q=;
 b=IeBwV1e432NF7uraPMU8q2nm7A+dbezIC/uxGys1G3S1ROgvN5H3cOzjxKZZpDAO9B
 wJXT8VCGPA7W4PmlG2ITLESUDo6J2ryBZCUN5n1oOpG/I7BYAU7th3CxE5eC0hclcL1I
 mLWhqKH5NkDNDyBkLUxAfnO+qLcsZOgO5JXZIhyJEZCyPMnbo3ViZYcxK87k5tv8FXzJ
 s2Cfs8cwoFSA9TtWirwJLOSSNwiSi4+tANYhVyetfoSEbVtuvkXC5lgu0KS4e4ph2Nfg
 UEopR6dd5RhtbgDnypiargl5gStdEJehAjPyZdS10Jn3Z5ijoLEYbVqfzP6jiKJrACEi
 /mgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N0/90KdghvF6SYqTTkjuKGlp10vLJQrjGaYMCFWOC9Q=;
 b=BBQc9KOPcxw3Ot7KVYg+G/uMMz80yOf88UTRV+CwfO4svp7wKPlapmA9TXJar/vRj1
 oz0FTFCezt4lQDDWUE8+D+y5uK1gDI+xU1k343sYqw/ELIn58U66yVD5pkPLskOKxIO+
 sAAGXTFVOAlH9w0Uhhx+zalxJMoaoX51NcFCaeOzoGd23hFRk5lFC/FpfeQaSQR+E6PX
 9zb/Kj4+CbTdLZ8pIc+l0xgMaXJ+nUVVeduoObItAlIuCrJu4gpC8dZLXIAadg7OKXFe
 +XHTWEpeQw92y4px7Ql/Z48mCsPdLbZgW0GsC9Fj1ESTSjN2UHiwnlhAEAhWsR+tBzNq
 c+jg==
X-Gm-Message-State: AOAM532IoLu3yYZkeGHb1diYAziuvGkRIZGlk+s8z3X9RdTXawMtByMM
 8e93UQHB5jjfjPxteyHWBeaAEVzAUL9833US
X-Google-Smtp-Source: ABdhPJxr5zYVNllw7r15P7BGA0LJDfSiIU0oNuX7ATDSMql+NQUV5FTrp7PDYa3vUlu7+YCY8JBJgw==
X-Received: by 2002:a17:903:120c:: with SMTP id
 l12mr1760190plh.135.1643958017637; 
 Thu, 03 Feb 2022 23:00:17 -0800 (PST)
Received: from stoup.modem ([2001:8003:3a49:fd00:ed23:b22a:8415:8857])
 by smtp.gmail.com with ESMTPSA id 9sm11808619pjg.50.2022.02.03.23.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 23:00:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] tcg/sparc: Unaligned access for user-only
Date: Fri,  4 Feb 2022 18:00:06 +1100
Message-Id: <20220204070011.573941-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v3:
  * Rebase on master, two patches merged.


r~


Richard Henderson (5):
  tcg/sparc: Add scratch argument to tcg_out_movi_int
  tcg/sparc: Improve code gen for shifted 32-bit constants
  tcg/sparc: Use the constant pool for 64-bit constants
  tcg/sparc: Add tcg_out_jmpl_const for better tail calls
  tcg/sparc: Support unaligned access for user-only

 tcg/sparc/tcg-target.c.inc | 390 +++++++++++++++++++++++++++++++++----
 1 file changed, 354 insertions(+), 36 deletions(-)

-- 
2.25.1


