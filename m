Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1239531CADD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:06:58 +0100 (CET)
Received: from localhost ([::1]:49562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC049-0006CF-6D
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lC01q-0004oI-MS
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:04:36 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:3329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noring@nocrew.org>) id 1lC01m-00028R-Ga
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:04:32 -0500
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 8DC143F716;
 Tue, 16 Feb 2021 14:04:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -1.901
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LY0nGn1CiWMl; Tue, 16 Feb 2021 14:04:27 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 0463C3F4DE;
 Tue, 16 Feb 2021 14:04:25 +0100 (CET)
Date: Tue, 16 Feb 2021 14:04:25 +0100
From: Fredrik Noring <noring@nocrew.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [RFC PATCH 28/42] target/mips/tx79: Move RDHWR usermode kludge
 to trans_SQ()
Message-ID: <YCvC2ZzfLwtaYiAY@sx9>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-29-f4bug@amsat.org>
 <d47d5ab7-9663-8647-483f-878e0bcb3bbe@linaro.org>
 <YCtu1czHMjeixsj+@sx9>
 <alpine.DEB.2.21.2102161244430.1521@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102161244430.1521@angie.orcam.me.uk>
Received-SPF: softfail client-ip=213.80.101.70; envelope-from=noring@nocrew.org;
 helo=ste-pvt-msa1.bahnhof.se
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 01:21:34PM +0100, Maciej W. Rozycki wrote:
> > > I would do this as
> > > 
> > > {
> > >   RDHWR_user  011111 00000 ..... ..... 00000 111011   @rd_rt
> > >   SQ          011111 ..... ..... ................     @ldst
> > > }
> > 
> > Both rd and rt have fixed values, as mentioned.
> 
>  I would suggest actually supporting variable `rt', see below.  Would it 
> be a problem?

No problem on my part, I'll update the kernel code!

Fredrik

