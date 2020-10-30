Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AE82A07E5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 15:31:17 +0100 (CET)
Received: from localhost ([::1]:40142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYVQy-0007W6-UR
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 10:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVJq-0000BG-LO
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:23:54 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:34064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVJp-000083-0b
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:23:54 -0400
Received: by mail-ed1-x541.google.com with SMTP id x1so6876329eds.1
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w8mo5SQC6j7rWAjT+2Gp+4Gx1U8l4y5jkDLId87z/e0=;
 b=x2x8mXGwxlM4aJSPeMck/cqln55UQxmLOmHkztdUzm1YnUUcSzU1kFSYuR5drfOA1m
 WFw7fsbcJDr3VmWkftTXtW3BhYHqi1xsOntG+Uz+nMRWYOl2KhFSRi9mfwXCUeWIFw1C
 wnt8kjL3SaYz8voDQOOTQw5aZPqxa7xaPO8qJnV8/avojA14wjNxBzmSIoojtrME4JdS
 ljK60Hy1uDRVRg1e9nLqje/WHPtwMwJd52Oe2VggdpJ+YFVurLkabU3vJSmiDng3Xmzr
 WMTRnu3Jn/CGzk14sPFm4ce1kqTAoQFdDbXXjzYO+TSiGkn9HDuAr2DAj+5s5DdH+S9w
 eoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w8mo5SQC6j7rWAjT+2Gp+4Gx1U8l4y5jkDLId87z/e0=;
 b=pf80i+xNz2zTLdncPJHiH6GeJtlVPwnjIkBT/PwjH9934SG8gnbjwAKRuwfqEto9dW
 pX9gfU+VE9PEo/PeAkSZUjz33bKl/IfDHztxwyKqadzA8wcw5sbhRxiPTh6YUyVX/E1Q
 ldTqXuEWTtNORhOIJJX7/4EAWDx68TXMyvBPr4bK5Tz5mx4vpWv3mvW0qLZNNy82uYw3
 bTVch2mToLrw5XJX2axZfrMw7uGKEdVmjZdHkQGjjPXidFGfZK+fUdyliDqhXnle9lQ/
 ndy84u1rXTWRcfKI+aUZ6ZkrzeSGtVm55R8vTOhUkjHROS1l9ZSuAbBg/yatHiEm/fxg
 0yoQ==
X-Gm-Message-State: AOAM532q2vMWR9ciiKG+fqpv4Lc/QExE2ypQrw+byP9PcAkiwOLPdN/J
 Ha7iZtA4OJ/1T4/toFzM9ZGm0Rirrm/HJ4xjqeEiiA==
X-Google-Smtp-Source: ABdhPJwFL0OAopGBhumDNGRcgY7PCHK8+B97TJ0S6LApcAVWiG4uTUrZPrK3B6QaCaiv5NEwgfGo5M/qgBvyw3Dpwlc=
X-Received: by 2002:a05:6402:1482:: with SMTP id
 e2mr2750873edv.36.1604067831443; 
 Fri, 30 Oct 2020 07:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201029202506.9209-1-remi@remlab.net>
In-Reply-To: <20201029202506.9209-1-remi@remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 14:23:40 +0000
Message-ID: <CAFEAcA-h2gY9vra6w8vL8hWtKxC2sAL82O4g9jhng6Ac=yPX8A@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: fix LORID_EL1 access check
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Oct 2020 at 20:25, <remi@remlab.net> wrote:
>
> From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
>
> Secure mode is not exempted from checking SCR_EL3.TLOR, and in the
> future HCR_EL2.TLOR when S-EL2 is enabled.
>
> Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>



Applied to target-arm.next, thanks.

-- PMM

