Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A5256284E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 03:35:48 +0200 (CEST)
Received: from localhost ([::1]:37216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o75ZT-0001Q8-2F
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 21:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o75XP-0000bJ-6W
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:33:39 -0400
Received: from gw2.atmark-techno.com ([35.74.137.57]:38278)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o75XL-00013q-9u
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:33:38 -0400
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id A94FF20D06
 for <qemu-devel@nongnu.org>; Fri,  1 Jul 2022 10:33:32 +0900 (JST)
Received: by mail-pg1-f199.google.com with SMTP id
 r142-20020a632b94000000b0040c978aef47so500000pgr.10
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 18:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qgb8gAH3Ks+hKGztvJx2PWU45JwULKiApex/jYRE0aE=;
 b=jXuvOAxT4bVNMy0A1OE8GOjofGdfDrC7zCdqaZnU/tAYQmuxa6n5ZyI71NY5sqBvE/
 f6Kw8Vg7r1y+qYTN6Sy/ls1lz3fgInm3k7W6bY5s5CGqHw6Gepp3NBW9xGbjqosCaUvo
 xaP4qveguipxpYaAXoLeDYH5i3ua0zGcvUu60dNXVPNWO/BkWhawnWGM42t4+wFLbMjs
 UGlL6kEKEU+ZHMikIPFS+FnbA6wbyDS+vUTFbGCLHwjDesi2LEnO+dMEWBPgp9BE5ce1
 x1dFWXf1zS8iWDsecNkm/D/Sx+SEf+MtnqqL+pDT4Y3zfz3J9pUZqBwhLMk8mbBDw8lw
 WXOw==
X-Gm-Message-State: AJIora+ork1Hg3GBSuUvCkPRAXx5zzimF/7N/ryqOT+PYsmhnTfDYCpH
 nS2FAcV1Zh5a60tLyWf/WKtJD/4Qho9jVNYvVCH7tSag+4Ujwif76bQcPZS+sd6KPG35onwS33x
 5kXgSqJEPRFE6b5Tm
X-Received: by 2002:a17:90b:3e89:b0:1ee:195e:abaf with SMTP id
 rj9-20020a17090b3e8900b001ee195eabafmr15831189pjb.112.1656639211574; 
 Thu, 30 Jun 2022 18:33:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uklSzXPnmVC0iRXA8YB362i4W3EDwiZgPMeHOrpOGQm5ZnM95kG1ocyrt9+qRzelQz+4HKlg==
X-Received: by 2002:a17:90b:3e89:b0:1ee:195e:abaf with SMTP id
 rj9-20020a17090b3e8900b001ee195eabafmr15831158pjb.112.1656639211279; 
 Thu, 30 Jun 2022 18:33:31 -0700 (PDT)
Received: from pc-zest.atmarktech (117.209.187.35.bc.googleusercontent.com.
 [35.187.209.117]) by smtp.gmail.com with ESMTPSA id
 e7-20020a170902784700b0015eab1b097dsm14168129pln.22.2022.06.30.18.33.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2022 18:33:30 -0700 (PDT)
Received: from martinet by pc-zest.atmarktech with local (Exim 4.95)
 (envelope-from <martinet@pc-zest>) id 1o75XF-00012h-Jr;
 Fri, 01 Jul 2022 10:33:29 +0900
Date: Fri, 1 Jul 2022 10:33:19 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Filipe Manana <fdmanana@kernel.org>
Subject: Re: [PATCH v2] io_uring: fix short read slow path
Message-ID: <Yr5O3/RFN/gvabTc@atmark-techno.com>
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
 <20220630154921.ekl45dzer6x4mkvi@sgarzare-redhat>
 <Yr4pLwz5vQJhmvki@atmark-techno.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yr4pLwz5vQJhmvki@atmark-techno.com>
Received-SPF: pass client-ip=35.74.137.57;
 envelope-from=dominique.martinet@atmark-techno.com; helo=gw2.atmark-techno.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dominique Martinet wrote on Fri, Jul 01, 2022 at 07:52:31AM +0900:
> Stefano Garzarella wrote on Thu, Jun 30, 2022 at 05:49:21PM +0200:
> > > so when we ask for more we issue an extra short reads, making sure we go
> > > through the two short reads path.
> > > (Unfortunately I wasn't quite sure what to fiddle with to issue short
> > > reads in the first place, I tried cutting one of the iovs short in
> > > luring_do_submit() but I must not have been doing it properly as I ended
> > > up with 0 return values which are handled by filling in with 0 (reads
> > > after eof) and that didn't work well)
> > 
> > Do you remember the kernel version where you first saw these problems?
> 
> Since you're quoting my paragraph about testing two short reads, I've
> never seen any that I know of; but there's also no reason these couldn't
> happen.
> 
> Single short reads have been happening for me with O_DIRECT (cache=none)
> on btrfs for a while, but unfortunately I cannot remember which was the
> first kernel I've seen this on -- I think rather than a kernel update it
> was due to file manipulations that made the file eligible for short
> reads in the first place (I started running deduplication on the backing
> file)
> 
> The older kernel I have installed right now is 5.16 and that can
> reproduce it --  I'll give my laptop some work over the weekend to test
> still maintained stable branches if that's useful.

I can confirm the same behavior happens with 5.4.202
I'm not sure about older kernels as my io_uring test that reproduces
short reads just doesn't start on these, but for all intent and purposes
we can probably say this has just always been possible.

The fix Filipe sent me unfortunately doesn't apply as far back as 5.4
(btrfs_get_blocks_direct had no flags argument back then, that got
introduced with conversion to dio in 5.8), but should probably work as
is for 5.10/15 kernels.

-- 
Dominique

