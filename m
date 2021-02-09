Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FBC315476
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 17:56:25 +0100 (CET)
Received: from localhost ([::1]:36594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9WJM-00036F-1e
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 11:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l9WGG-0001fU-7g
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:53:12 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:40801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l9WGB-0008Ns-Kn
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:53:11 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D8E767462FD;
 Tue,  9 Feb 2021 17:53:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9E5767462D6; Tue,  9 Feb 2021 17:53:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9D0B57462D3;
 Tue,  9 Feb 2021 17:53:03 +0100 (CET)
Date: Tue, 9 Feb 2021 17:53:03 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/6] m68k: Overhaul of MOVEC instruction to support
 exception/MSP
In-Reply-To: <cover.1612137712.git.balaton@eik.bme.hu>
Message-ID: <fb454b83-ed29-9315-423b-5d82ba5713a0@eik.bme.hu>
References: <cover.1612137712.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021, BALATON Zoltan wrote:
> Hello,
>
> This is Lucien's m68k series rebased on and fixed up to work with
> current master as per previous discussion:
> https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg02840.html
>
> I've left previous Reviewed-by tags for reference but these should
> probably be reviewed again. I've only lightly tested it so I don't
> know if everything is correct but it does seem to fix the problem my
> original patch tried to fix at least. More testing, review and help to
> finish this so it can be merged at last is welcome.

Ping?

> Regards,
> BALATON Zoltan
>
> Lucien Murray-Pitts (6):
>  m68k: improve cpu instantiation comments
>  m68k: cascade m68k_features by m680xx_cpu_initfn() to improve
>    readability
>  m68k: improve comments on m68k_move_to/from helpers
>  m68k: add missing BUSCR/PCR CR defines, and BUSCR/PCR/CAAR CR to
>    m68k_move_to/from
>  m68k: MOVEC insn. should generate exception if wrong CR is accessed
>  m68k: add MSP detection support for stack pointer swap helpers
>
> target/m68k/cpu.c       | 116 ++++++++++++++------
> target/m68k/cpu.h       |  64 +++++++----
> target/m68k/helper.c    | 234 +++++++++++++++++++++++++++++++---------
> target/m68k/translate.c |   2 +-
> 4 files changed, 309 insertions(+), 107 deletions(-)
>
>

