Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE40508847
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:37:24 +0200 (CEST)
Received: from localhost ([::1]:44240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9aE-0005qv-Io
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nh9VE-0001DT-0P; Wed, 20 Apr 2022 08:32:16 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:39276 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nh9VB-00022F-T9; Wed, 20 Apr 2022 08:32:11 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2B762459C3;
 Wed, 20 Apr 2022 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1650457926; x=1652272327; bh=rZIMIpua96SbVPZ0zsI8wZ
 PxltHvtK/F0MkHSgkKEMA=; b=EPGFeIb0kolq7Irddt1qJ2dp/qEbQ6kChuDi3u
 M8eMtpr7g9mrOzMvfTvDEp3pcvEX6y8TdFOt4INgIikcklVZ5FfrsKjvLG1xSkbw
 bFSqnt4jU6WM5/neW9n2tJ/GYL1+5nmx0ZNJTb6FfQ/g/cw7gKXo8pnYX68AozDC
 NQqMw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9rngZVajhAkb; Wed, 20 Apr 2022 15:32:06 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B10CF459C2;
 Wed, 20 Apr 2022 15:32:05 +0300 (MSK)
Received: from localhost.localdomain (10.178.113.54) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 20 Apr 2022 15:31:57 +0300
Date: Wed, 20 Apr 2022 15:31:56 +0300
From: Dmitry Tikhov <d.tihov@yadro.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/nvme: add new command abort case
Message-ID: <20220420123156.jnw4c3s66ikcl6df@localhost.localdomain>
References: <20220420082044.n6orslk2aukj2jai@localhost.localdomain>
 <Yl/csehng+W0gfQD@apples> <Yl/iRnvEj+tDycUI@apples>
 <20220420104126.iy5b4exyqh62m632@localhost.localdomain>
 <Yl/mdOnDzOE6Fdza@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/mdOnDzOE6Fdza@apples>
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

On Wed, Apr 20, 2022 at 12:54:44, Klaus Jensen wrote:
> 
> NVM Command Set Specification v1.0b, Section 5.2.3. It is exactly what
> you quoted above.
> 
> I think you are interpreting
> 
>   "If a command is aborted as a result of the Reference Tag Check bit of
>   the PRCHK field being set to '1', ..."
> 
> as
> 
>    "If a command is aborted *because* the Reference Tag Check bit of the
>    PRCHK field being set to '1', ...".
Yeah, i was interpreting it exactly this way.

> 
> But that is not what it is saying. IMO, the only meaningful
> interpretation is that "If the command is aborted *as a result of* the
> check being done *because* the bit is set, *then* return an error".
Ok, but return error in this context still means to return either
Invalid Protection Information or Invalid Field in Command, isn't it?
Or why would it specify
    ...then that command should be aborted with a status code of Invalid
	Protection Information, but may be aborted with a status code of
	Invalid Field in Command
exactly this 2 status codes?

> 
> Your interpretation would break existing hosts that set the bit.

I also opened NVM Express 1.4 "8.3.1.5 Control of Protection Information
Checking - PRCHK" and it says
    For Type 3 protection, if bit 0 of the PRCHK field is set to ‘1’, then
	the command should be aborted with status Invalid Protection
	Information, but may be aborted with status Invalid Field in Command.
	The controller may ignore the ILBRT and EILBRT fields when Type 3
	protection is used because the computed reference tag remains
	unchanged.
I think it marks clear intent to abort cmd with "Invalid Protection
Information" or "Invalid Field in Command" status codes exactly in case
reftag check bit is set. Also isn't "may ignore the ILBRT and EILBRT 
fields" means not to compare reftag with ILBRT/EILBRT? If it is not 
compared then reftag check error can't be returned.

But anyways, spec says that "should" and "may" indicates flexibility of
choice and not mandatory behavior. So if you think that current behavior
is right i don't insist.

