Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CB833274B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:37:03 +0100 (CET)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcXm-0005Kh-LN
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lJcSm-00081y-UN
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:31:54 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:53986 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lJcSl-0005FQ-59
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:31:52 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3830F4127A;
 Tue,  9 Mar 2021 13:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1615296707;
 x=1617111108; bh=5fNva/QcczEe6Kokua4aw2VwBX4tQxyBtkvqnzR6LnM=; b=
 Swtd8jDAD9/ukBtCytbTsFb2wwWVrfVTzPVsvN3tEEXeEVa/trG8ts44VAXpsoYZ
 zyae/j6uM/ufKPrMlRmw0wt8ilrzuyr/Rph6+gW3TTiPFvb4mvSUQ88hV7DBgrzo
 d3PQwMWziZhUAN5EaZAtRcwfm+4uI6vyZTAbKzkUOAc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IAXpVPsj8WJK; Tue,  9 Mar 2021 16:31:47 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CA0BA4120D;
 Tue,  9 Mar 2021 16:31:45 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 9 Mar
 2021 16:31:45 +0300
Date: Tue, 9 Mar 2021 16:31:44 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH] util/osdep: Avoid mprotect() RWX->NONE on Big Sur 11.2
Message-ID: <YEd4wAwfts0Oma+W@SPB-NB-133.local>
References: <20210210105527.74943-1-r.bolshakov@yadro.com>
 <CA+E+eSDG74cL5kCvHmzk8RR17NGGb-_TA+DpXcqd1owuMvk1xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CA+E+eSDG74cL5kCvHmzk8RR17NGGb-_TA+DpXcqd1owuMvk1xw@mail.gmail.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 07, 2021 at 10:47:06PM -0800, Joelle van Dyne wrote:
> On Wed, Feb 10, 2021 at 2:55 AM Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> >
> > There's a change in mprotect() behaviour [1] in the latest macOS on M1
> > and it's not yet clear if it's going to be fixed by Apple. For now we
> > can avoid unsupported mprotect() calls. QEMU and qtests work fine
> > without it.
> >
> > 1. https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f
> >
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1914849
> > Apple-Feedback: FB8994773
> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> 
> Reviewed-by: Joelle van Dyne <j@getutm.app>
> 

Thanks!

> FYI the "macOS 11.2, *" means it applies to all versions of iOS. I
> think it only broke in iOS 14.2 but making it return on other versions
> seems to be fine from my tests.
> 

Hm... do you know how to say "for macOS 11.2 and above only"?

Regards,
Roman

