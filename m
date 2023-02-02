Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A7688321
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 16:54:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNbue-0001G4-BQ; Thu, 02 Feb 2023 10:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNbuc-0001Fb-3b
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:54:10 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNbua-00082l-In
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:54:09 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso1754068wms.3
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 07:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:user-agent:from:to:cc:subject:date:message-id:reply-to;
 bh=PaGBlASuj38rpAOkdIhPWITluN6sK0jDUUVCsrNyvDg=;
 b=eLfEPatdWgAA5qDWDVeD8CUtU67vNvrqnPqwumv6R81m0y31O+ZAAV1yYp4vtUfN0a
 78UXo9tebSeYAjVpFGH8q37+rKW/BqyAW39jI0EJ3p8602D+LnK/PaPyRqI7MJEknlI+
 /ab/ESs/KZNcZltXaFPclUDv9o4YxCzHacajfdSmHrHnU1+CVY++Sj1mw0sEy6kwnXZY
 xeupE9Thn6n5tdysKZke0P/7zKLmHbifw6Fy7ZtEj5K/SVk0qeY29dlJR5Gq6GNN/US1
 c0iuf6xdXrW0ucc/HA3USJg07Sc21AtP9uBrcbw1/dewlJknGn3lpBvl9VJO95JTTW93
 7zhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:user-agent:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PaGBlASuj38rpAOkdIhPWITluN6sK0jDUUVCsrNyvDg=;
 b=Oj0qktS7wqw+sUwnm3jt9BnMX6diHYzS3hug9M+aGCaK4qrPQEz3lybJIEBliQ5RWI
 HGNmEOfUs7Oiyu7Ww3n1MPdA8eI/NkQrdv7cznqRIk/XCjq9yP5HxduosdmaM23YCp4b
 bNi9z2TwXiVrchjc7OyyYsRvBu0i6vxbhHQzYQyF+zCAnQUixoc9gkojDPnCVdsQUroU
 OQftqs7D9JiEXYosrh5IohfzyEbCXtQRK0VD0yvVq34J2GkxINTzOEU0Wr9/MZzHIw4u
 W36kv3rRjDY/2eTvY98fMGwK0kcrygY5U66r3LthAu7AbXaDVc75QfF0sF5eAq62f0GM
 FKXg==
X-Gm-Message-State: AO0yUKWjf+yCxZpzaucq8bxWKRbYI2jA/8MB+VOinP2o+jrBbnC9TjE3
 ejBm3Vrp1ofmlu/+/8ynzYlnTA==
X-Google-Smtp-Source: AK7set9pUCBQRp18/Y76EuwEnKF01t44CPk0Bh62jNwMPXz3NulWRKFcjgWly5B2GqKPEn42NDI2rA==
X-Received: by 2002:a05:600c:314e:b0:3d3:52bb:3984 with SMTP id
 h14-20020a05600c314e00b003d352bb3984mr6297522wmo.17.1675353246554; 
 Thu, 02 Feb 2023 07:54:06 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b003da28dfdedcsm194398wmo.5.2023.02.02.07.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 07:54:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D6331FFB7;
 Thu,  2 Feb 2023 15:54:05 +0000 (GMT)
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Roth
 <michael.roth@amd.com>, Remi Duraffort <remi.duraffort@linaro.org>, Anders
 Roxell <anders.roxell@linaro.org>
Subject: Candidate patches for Debian's 7.2 release (and backports)
Date: Thu, 02 Feb 2023 15:10:14 +0000
Message-ID: <87edr8kqqq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


Hi Michael,

As I mentioned on IRC the LKFT team use Debian's backported version of
QEMU to test a wide range of kernel configurations in the cloud.
Unfortunately 7.2 shipped out with a few regressions which has halted
some of the testing when they upgraded from 7.1 to 7.2. Fortunately I
think most of these regressions have fixes in master.

Currently:

  git log --oneline v7.2.0.. --grep "qemu-stable" | wc -l

Reports 14 patches tagged for master since the 7.2 release. For LKFT
purposes I don't this all are needed but I think the following
definitely are:

4a1103afb1: target/arm: Fix in_debug path in S1_ptw_translate
Message-id: 20230114054605.2977022-1-richard.henderson@linaro.org

ec2918b467: target/riscv: Set pc_succ_insn for !rvc illegal insn
Message-Id: <20221203175744.151365-1-richard.henderson@linaro.org>

bc2331635c: target/sh4: Mask restore of env->flags from tb->flags
Message-ID: <20221212011345.GA2235238@roeck-us.net>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

