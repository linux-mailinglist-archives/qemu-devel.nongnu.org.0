Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EB12FD1BE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:55:08 +0100 (CET)
Received: from localhost ([::1]:39716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Dwx-0000gt-KK
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l2DuW-0007Ru-K4; Wed, 20 Jan 2021 08:52:38 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:56797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l2DuL-0003VP-SP; Wed, 20 Jan 2021 08:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=92MUKKvF+r2XsnsxvbBnmenVvM/uJGxRx1NgB4bmJVs=; 
 b=qZlXNuS/fM1HPCqOpnFmfEh3tM9w5IpH8/j1KD92bOjZCI056Vjn8mB26tNqFMGooxkjkl6eKfk1iAwPlUSnDbMF0g2rcTr8xToxSMMC6fDUPfGjeQynxse7kp2/OalElUss3dfnp96yTxtDybmRIV7hp27/zp7aPYWdR4dWHolRUsuuivuDM7pNDPDdkpAMZMvvVpGeItrI6SgPdSr9P+NzMaOsUvGzMEy7O3ykTH/zhmhwmNek3SYZt58s629VxUE2QGbvGvCFgL9YkGjVlXnejE8mnl61NKrrcggCU822rwzRDSmDp/FMNCMIZ9lyiy0PXe4cWfZoB6SH+j8lVg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1l2Dtv-0002fH-Np; Wed, 20 Jan 2021 14:51:59 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1l2Dtv-0006dg-EV; Wed, 20 Jan 2021 14:51:59 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/2] Allow changing bs->file on reopen
In-Reply-To: <dafbbcb3-9d87-ab04-5413-eac551cdfe44@virtuozzo.com>
References: <cover.1610715661.git.berto@igalia.com>
 <dafbbcb3-9d87-ab04-5413-eac551cdfe44@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 20 Jan 2021 14:51:59 +0100
Message-ID: <w518s8npvgg.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 18 Jan 2021 11:22:49 AM CET, Vladimir Sementsov-Ogievskiy wrote:
>> This is still an RFC but you can see the idea.
>
> Good idea and I glad to see that my patches help:)
>
> Hmm, still, removing a filter which want to unshare WRITE even when
> doesn't have any parents will be a problem anyway, so we'll need a new
> command to drop filter with a logic like in bdrv_drop_filter in my
> series.

Do you have an example?

Berto

