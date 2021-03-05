Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F5D32EB6E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 13:44:52 +0100 (CET)
Received: from localhost ([::1]:51200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI9p4-0000bw-V4
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 07:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lI9nv-0008Ia-0b
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 07:43:39 -0500
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14]:43134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lI9nq-00076l-0b
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 07:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ENoyFnJ3NNW4nC2aQeSoaNRZyMRTdYloTPZ4KLmB7cY=; b=E7TBcV86pW7RumwQsiU9t2MDlK
 MUGBEFtwio4cQlPy16H8dAbyw1s0wMeH1BGd2xmNYJ6HOe8u6/tz8VSRZv+2DOcEwLpOqzu9asxOA
 jxGNZ1M6h2QAwxI0elo52a+htg1XKlCuE6QkFhRXl/BQ8xlV4qNVgl3C4RfNUt79sB9Y=;
Date: Fri, 5 Mar 2021 13:43:21 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: "Konopik, Andreas (EFS-GH2)" <andreas.konopik@efs-auto.de>
Subject: Re: [PATCH v2 1/1] tricore: fixed faulty conditions for extr and imask
Message-ID: <20210305124321.25ppziim6qhklukg@schnipp-desktop>
References: <20210211115329.8984-1-david.brenken@efs-auto.org>
 <20210211115329.8984-2-david.brenken@efs-auto.org>
 <fdd6bbdb-a943-3e38-3b83-9c4af95ff6fd@amsat.org>
 <DB8PR05MB61074744610D1B29FDAC9F49B08C9@DB8PR05MB6107.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB8PR05MB61074744610D1B29FDAC9F49B08C9@DB8PR05MB6107.eurprd05.prod.outlook.com>
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=30585586, da=102557267,
 mc=519, sc=4, hc=515, sp=0, fso=30585586, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.5.123318, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::14;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=collins.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Hofstetter,
 Georg \(EFS-GH2\)" <georg.hofstetter@efs-auto.de>, "Brenken,
 David \(EFS-GH5\)" <david.brenken@efs-auto.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Brenken <david.brenken@efs-auto.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 01:49:14PM +0000, Konopik, Andreas (EFS-GH2) wrote:
> Hi Philippe,
> 
> > From: Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> On
> > Behalf Of Philippe Mathieu-Daudé
> > Sent: Thursday, February 11, 2021 13:10
> > Hi David and Andreas,
> > 
> > On 2/11/21 12:53 PM, David Brenken wrote:
> > > From: Andreas Konopik <andreas.konopik@efs-auto.de>
> > 
> > Here is a good place to explain why you need this change, how did you
> > noticed it (example of opcode and conditions reaching this issue) - eventually
> > provide a reproducer (asm dump could be enough) - and also eventually a
> > reference to the manual (chapter, table) justifying your change.
> > 
> > See also:
> > https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
> > https://chris.beams.io/posts/git-commit/#why-not-how
> 
> I appreciate your feedback and will write more verbose commit messages in
> the future.
> 
> According to the TC 1.3.1. Architecture Manual [1; page 174], results are
> undefined, if pos + width > 32 or if width = 0.

While editing the commit message of this patch, I realized that we are not
checking for width=0. A quick test let to:

qemu-system-tricore: ../upstream/tcg/tcg-op.c:217: tcg_gen_sari_i32: Assertion `arg2 >= 0 && arg2 < 32' failed.

As Richard suggested that is not what should happen in case of undefined behaviour.
I'll fix this in a another patch.

Cheers,
Bastian

