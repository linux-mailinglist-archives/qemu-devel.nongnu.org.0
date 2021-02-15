Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679B331BB09
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 15:29:04 +0100 (CET)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBes3-0002j5-GI
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 09:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lBerJ-0002Jt-1m
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:28:17 -0500
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:56565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lBerH-0002aE-8Z
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:28:16 -0500
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id C94633F6FA;
 Mon, 15 Feb 2021 15:28:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.9
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_W5gLJVr-2L; Mon, 15 Feb 2021 15:28:10 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id B67DC3F6A7;
 Mon, 15 Feb 2021 15:28:09 +0100 (CET)
Date: Mon, 15 Feb 2021 15:28:09 +0100
From: Fredrik Noring <noring@nocrew.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [RFC PATCH 41/42] tests/acceptance: Test R5900 CPU with BusyBox
 from Sony PS2
Message-ID: <YCqE+QCFbsW4MVmJ@sx9>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-42-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210214175912.732946-42-f4bug@amsat.org>
Received-SPF: softfail client-ip=213.80.101.71; envelope-from=noring@nocrew.org;
 helo=ste-pvt-msa2.bahnhof.se
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 14, 2021 at 06:59:11PM +0100, Philippe Mathieu-Daudé wrote:
> Test BusyBox on the R5900 CPU with 2 different binaries:
> 
> - o32 32-bit (statically linked)
> - o32 64-bit (dynamically linked, uses multimedia instructions)

R5900/libc update:

Gnu libc for o32 was merged some time ago so any recent Gentoo etc. will
do fine without patches.

For n32, there's a provisional patch that needs reworking to get merged
(to have libc emulate DMULT etc. rather than the kernel/QEMU).[1]

Musl has a pending patch I posted[2] about a month ago. Musl is o32 only,
for all MIPS, but other than that it's got two significant advantages
over Gnu libc:

1. excellent support for static linking;

2. program sizes are often much smaller, more than 5x smaller observed.

An important detail is that since the R5900 FPU isn't compliant with
the IEEE 754 standard[3] it's normally wholly emulated by either libc or
the kernel, to comply with the MIPS psABI. The R5900 hardware FPU can
perhaps be enabled with a future R5900 ELF ABI annotation extension.[4]

Finally, the situation with the 128-bit R5900 general purpose registers
(GPRs) is not fully resolved with the Linux kernel. The best case
scenario, I believe, would be to have them available at all times.[5]

Fredrik

References:

[1] https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg00974.html
[2] https://www.openwall.com/lists/musl/2020/12/24/2
[3] https://github.com/frno7/linux/wiki/R5900-floating-point-unit-(FPU)
[4] https://github.com/frno7/linux/issues/3
[5] https://github.com/frno7/linux/issues/5

