Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112F33446CE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:11:56 +0100 (CET)
Received: from localhost ([::1]:48866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLHf-0005N1-22
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lOKub-0005rV-KJ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:48:05 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:57306 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lOKuZ-0004sJ-IA
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:48:05 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D1F234120B;
 Mon, 22 Mar 2021 13:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1616420877; x=1618235278; bh=KkNAv/CgdsuUL8mAvUERW7
 j0C5GdXnNYUuPEchfqPlA=; b=SQ6PVuObXDZLC8gJtwLKyVGYmolwil80bJUYlM
 xVO2tuGpuzQC6rDDwhadgJClg8AThK75MFlSK/yG8wBKSWicEM0EotgLzvNkZLoq
 ihcDYJ942nApTEx5zq1xQdsWuDntqfgaPpoKsXnMDoARPTFBn5meYfF2amEXOlAu
 b69K0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IcuZFFYFiRyS; Mon, 22 Mar 2021 16:47:57 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 044F2411F8;
 Mon, 22 Mar 2021 16:47:56 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 22
 Mar 2021 16:47:56 +0300
Date: Mon, 22 Mar 2021 16:47:55 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 for-6.0 2/2] tcg: Workaround macOS 11.2 mprotect bug
Message-ID: <YFigC3Q8iBlxb+Q6@SPB-NB-133.local>
References: <20210320165720.1813545-1-richard.henderson@linaro.org>
 <20210320165720.1813545-3-richard.henderson@linaro.org>
 <6155888a-e1af-0a47-a669-1bc12c4478fa@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6155888a-e1af-0a47-a669-1bc12c4478fa@amsat.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 11:03:05AM +0100, Philippe Mathieu-Daudé wrote:
> On 3/20/21 5:57 PM, Richard Henderson wrote:
> > There's a change in mprotect() behaviour [1] in the latest macOS
> > on M1 and it's not yet clear if it's going to be fixed by Apple.
> > 
> > As a short-term fix, ignore failures setting up the guard pages.
> > 
> > [1] https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f
> > 
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1914849
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  tcg/tcg.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tcg/tcg.c b/tcg/tcg.c
> > index 88c9e6f8a4..1fbe0b686d 100644
> > --- a/tcg/tcg.c
> > +++ b/tcg/tcg.c
> > @@ -864,11 +864,15 @@ void tcg_region_init(void)
> >       */
> >      for (i = 0; i < region.n; i++) {
> >          void *start, *end;
> > -        int rc;
> >  
> >          tcg_region_bounds(i, &start, &end);
> > -        rc = qemu_mprotect_none(end, page_size);
> 
> What about:
> 
> #ifdef CONFIG_DARWIN
> 
>            /* ... */
>            (void)rc;
> #else
> 
> > -        g_assert(!rc);
> 
> #endif
> 
> > +
> > +        /*
> > +         * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
> > +         * rejects a permission change from RWX -> NONE.  Guard pages are
> > +         * nice for bug detection but are not essential; ignore any failure.
> > +         */
> > +        (void)qemu_mprotect_none(end, page_size);
> >      }
> >  
> >      tcg_region_trees_init();
> > 
> 

I agree with Philippe, it's worth to keep the bug detection on non-buggy
platforms.

Otherwise:

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman

