Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0E2B9880
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:47:38 +0100 (CET)
Received: from localhost ([::1]:49038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfn5t-0001Yd-KA
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:47:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <macro@linux-mips.org>)
 id 1kfn45-0000Bo-Tz
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:45:49 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:39110
 helo=cvs.linux-mips.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <macro@linux-mips.org>) id 1kfn42-00007X-D8
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:45:43 -0500
Received: from localhost.localdomain ([127.0.0.1]:51136 "EHLO localhost"
 rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
 id S23991915AbgKSQp33nVaE (ORCPT <rfc822;qemu-devel@nongnu.org>);
 Thu, 19 Nov 2020 17:45:29 +0100
Date: Thu, 19 Nov 2020 16:45:29 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/4] default-configs: Support o32 ABI with 64-bit MIPS CPUs
In-Reply-To: <20201119161710.1985083-4-f4bug@amsat.org>
Message-ID: <alpine.LFD.2.21.2011191634540.656242@eddie.linux-mips.org>
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Received-SPF: none client-ip=148.251.95.138; envelope-from=macro@linux-mips.org;
 helo=cvs.linux-mips.org
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Fredrik Noring <noring@nocrew.org>, Mathieu Malaterre <malat@debian.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, YunQiang Su <wzssyqa@gmail.com>,
 James Cowgill <james410@cowgill.org.uk>, David Daney <ddaney.cavm@gmail.com>,
 =?UTF-8?Q?J=C3=BCrgen_Urban?= <JuergenUrban@gmx.de>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020, Philippe Mathieu-Daudé wrote:

> MIPS o32 ABI on 64-bit CPUs looks like a ILP32-on-64bit data
> model, allowing 64-bit arithmetic and data movement instructions.
> 
> This is the default ABI used by the "Sony Linux Toolkit for
> Playstation 2".

 Please don't, not at least with a generic configuration (i.e. make it 
unambiguous that this is R5900-specific).  This only works with R5900 
because it does not implement the MIPS ISA correctly (e.g. see what $ra is 
set to with JAL/JALR/etc. in the kernel mode), and it is not supported by 
the standard Linux ABI.  Use n32 instead, which has the same functionality 
and is standard (and is also a better ABI in terms of performance).

 You'd probably need to implement all the R5900 addressing quirks for your 
proposed hack to match hardware, or otherwise you'll end up with emulation 
that creates its own reality.

  Maciej

