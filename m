Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48314246BEF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 18:05:33 +0200 (CEST)
Received: from localhost ([::1]:53596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7hdc-0006s8-9O
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 12:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k7hXF-0002g1-Lb; Mon, 17 Aug 2020 11:58:57 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:45825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k7hXD-0001m2-II; Mon, 17 Aug 2020 11:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=4d5ePVlLOyLPBKgsK9Y8Z3AyOMiE/VUlbfzAOTxoGX0=; 
 b=K8DQWsFkHyeHj/BFdWlRuS7d0p4h7pUQQEj4cQbNf4Mx84LQsQQlDXdPALtA1pSfjExBn/pcwGjeXPNbUNefKajfPk4akffN70eyUf6JihnDNVLADYeHCrmMqVRSRoMYnpDwa8ZdLKCPJQhsuV2jWcdQixQ7c+ooBKeFifjE6SAwNOkcdEm/f/OzXggDl18k4ERJOgJCs9JEcs6417WSJUjGWc1YGU5GLEWiUNNXkWVOykWZZll+2ckInfmmgWhlEllB7lfrur6WhpXBPbsO/JiqAU2ut/8lpsr379AqnYfJwtjPnsnQYd2+e0iLCQ+p6r0T/z+Ionbw/hGq7M/J/Q==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1k7hXA-00009J-0y; Mon, 17 Aug 2020 17:58:52 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1k7hX9-00064S-NJ; Mon, 17 Aug 2020 17:58:51 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 0/1] qcow2: Skip copy-on-write when allocating a zero
 cluster
In-Reply-To: <20200817155307.GS11402@linux.fritz.box>
References: <cover.1597416317.git.berto@igalia.com>
 <20200817101019.GD11402@linux.fritz.box>
 <w518sedz3td.fsf@maestria.local.igalia.com>
 <20200817155307.GS11402@linux.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 17 Aug 2020 17:58:51 +0200
Message-ID: <w515z9hz2kk.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 11:31:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 17 Aug 2020 05:53:07 PM CEST, Kevin Wolf wrote:
>> > Or are you saying that ZERO_RANGE + pwrite on a sparse file (=
>> > cluster allocation) is faster for you than just the pwrite alone (=
>> > writing to already allocated cluster)?
>> 
>> Yes, 20% faster in my tests (4KB random writes), but in the latter
>> case the cluster is already allocated only at the qcow2 level, not on
>> the filesystem. preallocation=falloc is faster than
>> preallocation=metadata (preallocation=off sits in the middle).
>
> Hm, this feels wrong. Doing more operations should never be faster
> than doing less operations.
>
> Maybe the difference is in allocating 64k at once instead of doing a
> separate allocation for every 4k block?

That's what I imagine, yes. I'll have a look at your patches and tell
you.

Berto

