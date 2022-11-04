Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E642061A05A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 19:54:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or1oj-0002vk-RT; Fri, 04 Nov 2022 14:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1or1oh-0002uq-3K
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 14:53:23 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1or1of-000657-JD
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 14:53:22 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 f5-20020a17090a4a8500b002131bb59d61so8080887pjh.1
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 11:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=i9oKGR3dFj8eHeA7Ntn9YaUWFVgkAsTJGd3eqM2jUTw=;
 b=xiWf9OIUUs9DtfZ9DK7B4x3SwUziDn9XTbpL6cCXB8x01mL9fj5QJxqqeo+Z+OESsj
 bq357ZAmp4XgOXnLWutUl2v9T19MkgQd2DdAq3XxhjYpXgf3kCpCvJ4fziDEtNCWB+D1
 1Fh0qsM03PyiAllarNUrENuctal9HxfoJspVnai5PWY43+3PaGQ7aQOQxw8vuT0q8Ptx
 bmWmz5/B+G4ICLI6SSFyS96dx06DC+ym/VRGLVcd8//No0nx8mjWZszYKpFjggiyT5iZ
 6otu6UOMnrcNc9wVUjJBXR9kLYoPNZuzrD3RqVnKL0goq5s5XiVPJUBLOCwxOOEgSBvV
 pDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i9oKGR3dFj8eHeA7Ntn9YaUWFVgkAsTJGd3eqM2jUTw=;
 b=mKPXc8BHlMHwZopOESEE+w5PnUrCANeRxRfEDV8XfVD4MoDVQtdZ+pnKi0UqKHiyb9
 1+khF/zUn2lIO/ExwXxbf43McvbmSabVkRttRrVPtoDBKUo0zhAl+9fiVa+5hzbkGmaJ
 i0iI0/twlRLK9oC2rHI2ojR9z8RQNhQid5XvBWNCGUA8O8q1+Di8VuXNLyvR6Gi2cugj
 nXKqV3xJXUYnYzcLA3i5E6xizq+lJ8UssrA6CNJh7eFlmx+JBJpur3kPVWeSwWxHJGGl
 VNApCNQiAKX0ATRdxf30QcxV7toTo9J6vX0K9GL5yZx2b3qfzWJwznQ30lPYTvalgE2y
 sjhA==
X-Gm-Message-State: ACrzQf3r66lwfyAqHESHDMD8PwyVZyx9qfF7ZAWzUvL7OT5j6Xm0B2z0
 DuuSJqBeOzB5DcEqPHc28vIg1PwXZmfqX604UcS7SI4r3zY2rQ==
X-Google-Smtp-Source: AMsMyM59sytolC9n0CNF7mAdJa6R3aM0P/KZyO18sZRRfQSKSpMOsQ1G+7x6v8eYHpHjzQNg5vKj8//x4uwjfjDwQ2w=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr36958812plb.60.1667587999265; Fri, 04
 Nov 2022 11:53:19 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Nov 2022 18:53:07 +0000
Message-ID: <CAFEAcA-uLCqTGRPv4KLkc8b4j0QDhx5CFrspcSF+W1NdTDHN1g@mail.gmail.com>
Subject: Intermittent hang on x86 replay avocado test?
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On my machine this avocado test:

./build/all/tests/venv/bin/avocado run
./build/all/tests/avocado/replay_kernel.py:ReplayKernelNormal.test_x86_64_pc

seems to hang intermittently (maybe 1 time in 3?).

Does anybody else see this? Looking at the avocado logs suggests
the record part runs fine but the replay part hangs very early
in the kernel bootup. (Or possibly Avocado has got confused and
isn't logging all the output.)

I couldn't trigger it outside avocado.

thanks
-- PMM

