Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A823696B43
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:20:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyxq-0002Ay-Pe; Tue, 14 Feb 2023 12:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pRyxn-00029e-9g; Tue, 14 Feb 2023 12:19:31 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pRyxl-0004ue-I3; Tue, 14 Feb 2023 12:19:31 -0500
Received: from [192.168.0.20] (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7713720E2D36;
 Tue, 14 Feb 2023 09:19:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7713720E2D36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1676395166;
 bh=iJ9UAc0X8dkcScaZD5oh+EryDu9xLZ9cykkbg9dQTPg=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=F2xGcc3n8XVdUlst/on6U8sGoEU75OWXH5j18pDyyj6JC4N2Ldz48iFbVfrBUlgi/
 zO59rg1LBoomzUGIBy0q4SwXqqTGpTx6UeGYMWWZ1x22mFny7e5himzVpy3AEilg2V
 4S66lP+NoEYsoUBnOzvowg80Hdza8mfR8y8/nr30=
Message-ID: <e0675f49-7cae-851f-67bb-56982876deae@linux.microsoft.com>
Date: Tue, 14 Feb 2023 18:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: eiakovlev@linux.microsoft.com
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v4 0/5] Series of fixes for PL011 char device
References: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
 <CAFEAcA8ZDmjP7G0eVpxcB1jiSGarZAbqPV0xr5WquR213mBUBg@mail.gmail.com>
In-Reply-To: <CAFEAcA8ZDmjP7G0eVpxcB1jiSGarZAbqPV0xr5WquR213mBUBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -201
X-Spam_score: -20.2
X-Spam_bar: --------------------
X-Spam_report: (-20.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/2/23 6:54 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Mon, 23 Jan 2023 at 16:23, Evgeny Iakovlev
> <eiakovlev@linux.microsoft.com> wrote:
> >
> > v4:
> > * Fixed post_load hook to be backwards-migratable
> > * Refactored some code in 5/5 as per review comments
> >
> > v3:
> > * Introduced a post_load hook for PL011State migration for
> >    backwards-compatibility due to some input state fragility.
> > * No longer touching irq lines in reset method
> > * Minor changes based on review feedback.
> >
> > v2:
> > * Moved FIFO depth refactoring part of FIFO flags change into its own
> >    commit.
> > * Added a reset method for PL011
> 
> Patch 5 in this series breaks "make check" for both the
> boot-serial-test and the migration-test (both of which
> have some simple code that writes to the serial port).
> I suspect in both cases that the guest code is just not
> bothering to set the UART control register correctly,
> because it's never needed to do so in the past.
> 
> (This does make me wonder about the utility of making
> this change -- it seems likely that we're going to break
> naive bare-metal intended-to-work-on-QEMU code and not
> really benefit any real-world runs-on-real-hardware
> code, which is presumably just enabling TX and RX and
> leaving it that way.)
> 
> I've taken patches 1-4 into target-arm.next.
> 
> thanks
> -- PMM
> 

Thanks Peter! I'll investigate the failures you've mentioned. Maybe you are correct in that regard. Although i have not seen any problems running NTOS.

