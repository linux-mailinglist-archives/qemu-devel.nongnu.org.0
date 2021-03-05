Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD732E76D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:51:53 +0100 (CET)
Received: from localhost ([::1]:56780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI8zn-0001js-PU
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lI8yD-0000qU-Gh
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:50:13 -0500
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14]:51166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lI8yB-0000fG-0n
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FJSNhLxcXxefwxuN2al/AmvA+jF44EFhDv9VCJnHfD8=; b=FYIRtjOSAI6PK2WcnngY0zndUP
 hDfnfzvyHqmDlzBYpFKFRI+4Mut6eEuKO6kEnqjLjV7u+w9xvBVB6PsDEGNM0pGKMP2TtURn6bOue
 HvEZQuO3pgYy7Z+phouTQWB2uX5IbIa5pYMWRlBDLZ8UA2JldqBLRI4MzuEAS+CBxzuo=;
Date: Fri, 5 Mar 2021 12:50:01 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: David Brenken <david.brenken@efs-auto.org>
Subject: Re: [PATCH v2 1/1] tricore: fixed faulty conditions for extr and imask
Message-ID: <20210305115001.c2kdcndniskfjnvo@schnipp-desktop>
References: <20210211115329.8984-1-david.brenken@efs-auto.org>
 <20210211115329.8984-2-david.brenken@efs-auto.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211115329.8984-2-david.brenken@efs-auto.org>
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.5.114517, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=30582388, da=102554069,
 mc=518, sc=4, hc=514, sp=0, fso=30582388, re=0, sd=0, hd=0
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
Cc: Andreas Konopik <andreas.konopik@efs-auto.de>,
 David Brenken <david.brenken@efs-auto.de>, qemu-devel@nongnu.org,
 Georg Hofstetter <georg.hofstetter@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 12:53:29PM +0100, David Brenken wrote:
> From: Andreas Konopik <andreas.konopik@efs-auto.de>
> 
> Signed-off-by: Andreas Konopik <andreas.konopik@efs-auto.de>
> Signed-off-by: Georg Hofstetter <georg.hofstetter@efs-auto.de>
> Signed-off-by: David Brenken <david.brenken@efs-auto.de>
> ---
>  target/tricore/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Applied to my tricore.next queue. I'll fix the commit message according to
Philippes suggestions. 

Cheers,
Bastian

