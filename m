Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9BF689998
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 14:21:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNvzV-0003ru-08; Fri, 03 Feb 2023 08:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNvyl-0003U6-Sr
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:19:51 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNvyj-00067n-LP
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:19:47 -0500
Received: by mail-pg1-x52a.google.com with SMTP id a23so3576066pga.13
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 05:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kHVPC9ym/1smgi2UBEJrdLpSudn31TwDv7rs/PGBiQQ=;
 b=be6EfWtpWdDmwcAg9grlW802p2LqEZ0ZeJBlqcwFAl4UDXLyfPswJ5x2E/Yb80DYCo
 ihQmtHEFV8g6v/diUgOW1mfs0n8WicByFqqoi9ABBkpNZ9ocgnYGBHAXGy1Uh+M2lP8c
 C3A6wsbQTIb/9CYFtaUwQ9yaxrIPQp+28UrrnxI0Jx6QOLFVgAf5AN1d5PllqcyZD7VZ
 mRsQNT6v2B+2e7VebW/HctFrLEVvZVBAx9ikA8/5mf9GbtCsgxsn+FHbpKwAilQxnAda
 SEoyhJUc9hDiBOzSBvFxrOQUeRs46SpbfEX+Hn4OG3qOpK2S+rtEeXYc9CUhvc/hUtU2
 Kp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kHVPC9ym/1smgi2UBEJrdLpSudn31TwDv7rs/PGBiQQ=;
 b=pRBA+HBiG/RrcuMMMLktiyqqgmpqXrhRtvruhGSXTO2YyNFz1Roc+uznXrSucgbuRV
 iWfmmZfURXyOSKZR6VYddQ4YGVhvT66bGKyH+ZqX+0wY7sTlW3PK/HzKSlSalftgFscc
 Q9/ql+jn8g7a4L3MkLeyzN5MZ+lMdVRoZq1rq4oSYvEz374m0+LH4SOh+GGjxBDGSslj
 iq36xpUlJjUTspok+Pmq5ddfndKEFVijFT/ze+fAnOQw67nbY48wk/rckulLELLXu5G0
 naba1Wlss4pR51UWKZGZPewzpO3eJn+JXPCWSFZAABwF2ufNRbFVu+iSNz3e3AEHFAvV
 KbgA==
X-Gm-Message-State: AO0yUKWjpeJRY0JSKkosn2HZXgG1BzgWEP/TOmgt5APW5kT9iXUbxDmN
 pkkBaNtrJoVketSfjp8DQhfXLotW/0PId0vjit0Sf9Y78LaW6E0t
X-Google-Smtp-Source: AK7set8c6wTrxrbFtfTapOwlS1acJQU0p5tM/MFqVzpliFOj87DE8mGCWw5YG71i5OWMewnLUSoYrjJndrq0RZMwhE8=
X-Received: by 2002:aa7:9686:0:b0:58d:ce70:4683 with SMTP id
 f6-20020aa79686000000b0058dce704683mr2310819pfk.39.1675430383885; Fri, 03 Feb
 2023 05:19:43 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 13:19:32 +0000
Message-ID: <CAFEAcA-Vr8=br=9jGU1Tr=HTyH6o+S9H79oG=6BqZb8FSp+2Tw@mail.gmail.com>
Subject: tricore container toolchain build broken again
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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

The tricore container toolchain build is still not reliable.

Latest failure:
https://gitlab.com/qemu-project/qemu/-/jobs/3710561054

#6 43.63 ldlex.l: In function 'yy_input':
#6 43.63 ldlex.l:615:7: error: 'yy_current_buffer' undeclared (first
use in this function); did you mean 'yy_create_buffer'?
#6 43.63 {
#6 43.63 ^
#6 43.63 yy_create_buffer

Any ideas ?

thanks
-- PMM

