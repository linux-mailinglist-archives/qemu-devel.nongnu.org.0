Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F11C94C6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 17:19:03 +0200 (CEST)
Received: from localhost ([::1]:59158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWiIg-0006iI-D0
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 11:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jWiGj-00057Z-OM; Thu, 07 May 2020 11:17:01 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:35785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jWiGh-0000zh-Fe; Thu, 07 May 2020 11:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=CFUm8VG1NKUPuGjXgmM6pJi/4RUHGzjxdr0Fp9Vg6f4=; 
 b=DPWNplDqvl11Q+muD+R3dc4tx7DU5U6/YyI5hgDNjW24PZdbAlWPZY3UkDOBGCUnVAwcKovDpDGnKZe3cYTNTYUkeDxna1sVDx8qY8m4LWevbrniXWaDXF2nJ4zNNXT7wj6DPXTJ+3yBZ76eGpj9QupOcZ0tugWhcHzsc65QnajOsAHCwcuA6lHs7R3JeOiBd3dEUNbIDMJhopwBdtiryUCCgfBP6jf8BjJijBNvvp4oE7AGjENhFmRKteUz4cW8NkMF2CI98C2+AlekpkZDsSzkM20LyYynfxc9BeymHsXGNofyueqdMQ9c5G1V7sGF6sgftrouDzpcaq6LElIPVw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jWiGd-0005oZ-6K; Thu, 07 May 2020 17:16:55 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jWiGc-0007Hd-Su; Thu, 07 May 2020 17:16:54 +0200
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 30/31] qcow2: Add subcluster support to qcow2_measure()
In-Reply-To: <39aaec0f-e81f-16c9-986d-f2c06aae8fd2@redhat.com>
References: <cover.1588699789.git.berto@igalia.com>
 <04394b984ec09146373ad6a23996423bcfffdb19.1588699789.git.berto@igalia.com>
 <39aaec0f-e81f-16c9-986d-f2c06aae8fd2@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 07 May 2020 17:16:54 +0200
Message-ID: <w51d07fn5ax.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 10:37:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 06 May 2020 08:13:51 PM CEST, Eric Blake wrote:
> On 5/5/20 12:38 PM, Alberto Garcia wrote:
>> Extended L2 entries are bigger than normal L2 entries so this has an
>> impact on the amount of metadata needed for a qcow2 file.
>> 
>> Signed-off-by: Alberto Garcia <berto@igalia.com>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/qcow2.c | 19 ++++++++++++-------
>>   1 file changed, 12 insertions(+), 7 deletions(-)
>
> Should this be hoisted earlier in the series, before 28/31?

I can do that if I call qcow2_calc_prealloc_size() with extended_l2
always set to false (because there would be no BLOCK_OPT_EXTL2 that the
caller could use). Maybe it's not a bad idea.

> Should there be iotest coverage?

There are already, in the last patch.

Berto

