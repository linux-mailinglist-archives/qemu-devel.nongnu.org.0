Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0205437CF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:45:10 +0200 (CEST)
Received: from localhost ([::1]:34980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxrn-0001Xa-Uh
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyxqK-0000lv-N7
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:43:36 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyxqG-000651-8J
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:43:36 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so11308490wmz.2
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=e2QUbp2tbWBx7odY/rbn5BBZ4dCEjNPBV3qERivgGs8=;
 b=Z/hJWiPdwZU937UJdRSBIXT9gOXNtcQft6dYelpJhE7XZKQK3L5gzyyY6iUgv18amk
 hUR1+C4R8A56XZZC8OiSBmkRboAl3vHRTgv9a12mLinlarKmX/Zc8Zp50fo5Yv47aqDV
 lXEBFrmhg5UR1xfpZZMgQhQKnjofgJN/6j9iaRVoU/lse7yUIdNHpPfzEa5R+r6HBc43
 0N5Rmhv9q/bOVWp9Zmq8Fa/LT7Bne2RAcfEbh2PmW1+O6cRbJssNcHGlcSja6gvJirD6
 A8z/7UkUZxm7hnVMVgr7LWl1sKm3zayRWucxrOIsmimv5LIY8VtQs7GBTrbZgs6f5l/3
 Vwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=e2QUbp2tbWBx7odY/rbn5BBZ4dCEjNPBV3qERivgGs8=;
 b=qydFMnHbiJWHmI5YyTjRQo2TIm0GJZv4NEfdVrgVaTGBJpWFzWf3m9udQwb6SK5jK0
 zahJI+rmxvFuGG1E2mxrCUHFaxnrWqPKeqUwfawO7cTkQTgNfVe1AH2bIChusxygr0AD
 8FdEy41pNv1K91tSWnXtHc/vKDSgdaO8czrg74w8i9ZGxQ/5e6ow7H1e2wzyuS/9uOAk
 pgcGPVr8ESSF2Y3KVSSo34Vl3+eENf31IDPSegfabmYkzZq+rADpLUiPch45T8XjIUgf
 IG38RwbGHgrwGrU5q9Nhn/w28PfaD4/K0t2ZVn0uPQxrXTSv9BiCPUhEUBfb/22vGxCZ
 tgOw==
X-Gm-Message-State: AOAM532yOakGDNk+J/GVNw7pAfIZI/+oHUrZ5HMRqld8xU1TQhy0+xIe
 XTcT7fSHvzwgOoqCf9cowUtynw==
X-Google-Smtp-Source: ABdhPJyGyr6UthnKUF+RAC3FD9SK9miixC0lOAKepgms2wAHl9g+bmZF1Ph9J/r5v6xjaqPNV1h1gQ==
X-Received: by 2002:a05:600c:228d:b0:39c:63ff:5f2 with SMTP id
 13-20020a05600c228d00b0039c63ff05f2mr3195562wmf.22.1654703010669; 
 Wed, 08 Jun 2022 08:43:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c155100b0039c4ec6fdacsm2655608wmg.40.2022.06.08.08.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 08:43:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9DC0D1FFB7;
 Wed,  8 Jun 2022 16:43:28 +0100 (BST)
References: <20220527171143.168276-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/tcg/i386: Use explicit suffix on fist insns
Date: Wed, 08 Jun 2022 16:43:22 +0100
In-reply-to: <20220527171143.168276-1-richard.henderson@linaro.org>
Message-ID: <87a6antb33.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Fixes a number of assembler warnings of the form:
>
> test-i386.c: Assembler messages:
> test-i386.c:869: Warning: no instruction mnemonic suffix given
>   and no register operands; using default for `fist'
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

