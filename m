Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A421508683
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:01:50 +0200 (CEST)
Received: from localhost ([::1]:49972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh85l-000676-IV
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nh7m9-0001eQ-Qq; Wed, 20 Apr 2022 06:41:33 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:59006 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nh7m7-0008Al-TY; Wed, 20 Apr 2022 06:41:33 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4B49744E3C;
 Wed, 20 Apr 2022 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1650451288; x=1652265689; bh=VnP6+Hnh7zq37rpemWvv3L
 twVOh5np0ohzagpVzmO8I=; b=kDKfZjl6lwBRR+eDqVO8/P+U+6RPzc/17KUh90
 c4c+DvxIjeAyP3rOq5bNK/AYDx/b+XIR1yVzKHwopzMDFbbd7Rttg+qfsglyJmFY
 0xTf5nIC0HIgdQ9trFFNi68BYGU54aB3u4NTalJablubzXFpF11ESOd+K+9KAOBL
 NL0Pc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gOakljx1cZH5; Wed, 20 Apr 2022 13:41:28 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C42214596F;
 Wed, 20 Apr 2022 13:41:27 +0300 (MSK)
Received: from localhost.localdomain (10.178.113.54) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 20 Apr 2022 13:41:27 +0300
Date: Wed, 20 Apr 2022 13:41:26 +0300
From: Dmitry Tikhov <d.tihov@yadro.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/nvme: add new command abort case
Message-ID: <20220420104126.iy5b4exyqh62m632@localhost.localdomain>
References: <20220420082044.n6orslk2aukj2jai@localhost.localdomain>
 <Yl/csehng+W0gfQD@apples> <Yl/iRnvEj+tDycUI@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/iRnvEj+tDycUI@apples>
X-Originating-IP: [10.178.113.54]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=d.tihov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kbusch@kernel.org, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 12:36:54, Klaus Jensen wrote:
> On Apr 20 12:13, Klaus Jensen wrote:
> > On Apr 20 11:20, Dmitry Tikhov wrote:
> > > NVMe command set specification for end-to-end data protection formatted
> > > namespace states:
> > > 
> > >     o If the Reference Tag Check bit of the PRCHK field is set to ‘1’ and
> > >       the namespace is formatted for Type 3 protection, then the
> > >       controller:
> > >           ▪ should not compare the protection Information Reference Tag
> > >             field to the computed reference tag; and
> > >           ▪ may ignore the ILBRT and EILBRT fields. If a command is
> > >             aborted as a result of the Reference Tag Check bit of the
> > >             PRCHK field being set to ‘1’, then that command should be
> > >             aborted with a status code of Invalid Protection Information,
> > >             but may be aborted with a status code of Invalid Field in
> > >             Command.
> > > 
> > > Currently qemu compares reftag in the nvme_dif_prchk function whenever
> > > Reference Tag Check bit is set in the command. For type 3 namespaces
> > > however, caller of nvme_dif_prchk - nvme_dif_check does not increment
> > > reftag for each subsequent logical block. That way commands incorporating
> > > more than one logical block for type 3 formatted namespaces with reftag
> > > check bit set, always fail with End-to-end Reference Tag Check Error.
> > > Comply with spec by handling case of set Reference Tag Check
> > > bit in the type 3 formatted namespace.
> > > 
> > 
> > Note the "should" and "may" in your quote. What QEMU does right now is
> > compliant with v1.4. That is, the reftag must NOT be incremented
> > - it is the same for the first and all subsequent logical blocks.
> > 
> > I'm a bit hesitant to follow v2.0 here, since we do not report v2.0
> > compliance yet. I'm honestly also a bit perplexed as to how the NVMe TWG
> > ended up considering this backwards compatible. As far as I can tell
> > this breaks current hosts that do set the reference tag check bit,
> > provides a valid ILBRT/EILBRT and expects it to succeed.
> 
> Ok, so reading the spec more closely...
> 
> The Invalid Protection Information should not be set just because the
> reference tag check bit is set. It should be set *if* the controller
> chooses to check it and it fails. However, in v2.0, the controller is
> allowed to ignore it and not perform the check.
> 
> So, just because the host sets the bit, that does not mean we fail the
> command. However, a difference is that a v2.0 compliant controller
> should return Invalid Protection Information or Invalid Field in Command
> instead of End-to-end Reference Tag Check Error if the check fails.

Can you please link the spec you are referring to?

