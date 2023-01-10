Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF30664E7F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 23:05:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFMjG-00039N-PU; Tue, 10 Jan 2023 17:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pFMjE-00034P-2f; Tue, 10 Jan 2023 17:04:20 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pFMjB-0004bL-UP; Tue, 10 Jan 2023 17:04:19 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3ACFA745712;
 Tue, 10 Jan 2023 23:01:53 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F3B30745706; Tue, 10 Jan 2023 23:01:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F05E37456E3;
 Tue, 10 Jan 2023 23:01:52 +0100 (CET)
Date: Tue, 10 Jan 2023 23:01:52 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, ale@rev.ng, 
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org, 
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx
In-Reply-To: <20230110212947.34557-1-philmd@linaro.org>
Message-ID: <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
References: <20230110212947.34557-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1251169997-1673388112=:35553"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1251169997-1673388112=:35553
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 10 Jan 2023, Philippe Mathieu-Daudé wrote:
> The 'hwaddr' type is defined in "exec/hwaddr.h" as:
>
>    hwaddr is the type of a physical address
>   (its size can be different from 'target_ulong').
>
> All definitions use the 'HWADDR_' prefix, except TARGET_FMT_plx:
>
> $ fgrep define include/exec/hwaddr.h
> #define HWADDR_H
> #define HWADDR_BITS 64
> #define HWADDR_MAX UINT64_MAX
> #define TARGET_FMT_plx "%016" PRIx64
>         ^^^^^^
> #define HWADDR_PRId PRId64
> #define HWADDR_PRIi PRIi64
> #define HWADDR_PRIo PRIo64
> #define HWADDR_PRIu PRIu64
> #define HWADDR_PRIx PRIx64

Why are there both TARGET_FMT_plx and HWADDR_PRIx? Why not just use 
HWADDR_PRIx instead?

Regards,
BALATON Zoltan
--3866299591-1251169997-1673388112=:35553--

