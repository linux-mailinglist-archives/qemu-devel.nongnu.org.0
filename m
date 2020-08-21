Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D083E24D579
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 14:53:49 +0200 (CEST)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k96YG-0000iK-TE
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 08:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k96XD-0007zf-Pq; Fri, 21 Aug 2020 08:52:43 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:52018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k96XA-0003ln-Db; Fri, 21 Aug 2020 08:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=TGmkb4YqG1VPb3qoZBygx5ygIv2RMGGFDzg7ueS2dcc=; 
 b=ApNR7uPf2132nMwBWWlcman5HLNtx9S1+04a1bjU2EkDcLuLb184aXRji3BcB6cbb/5TXTdOtxtcmRzqngBWpwp+COvwGzopNJgvYVJX3mYwKSg1ODXuCKA6h8tcpJ5jBFdlTmJmgBv1xz3afUAgXMccW5BvJjkyAlrTjUtuWj1pjlHxSPqU/S7cqrIVmCp5ggivGA32ELSRa4kkcxYGOcO3vunzI1uFn/zgT78WcL4J1HKKIYFp+h31XTIJ9BkFCVRBQMeQDA2NT4Gzq/fiAwKiHQ8ce55C7mKbJ+v51E/GP+RtJ2vTx/p/k6noodTOEZ9zGLy15Rh5mUhhoprTmw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1k96X6-0000tN-UB; Fri, 21 Aug 2020 14:52:36 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1k96X6-00009z-Kw; Fri, 21 Aug 2020 14:52:36 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu block <qemu-block@nongnu.org>
Subject: Re: qcow2 merge_cow() question
In-Reply-To: <b44aafbf-bd00-3bc0-68c4-5cc01a6b8b01@virtuozzo.com>
References: <b44aafbf-bd00-3bc0-68c4-5cc01a6b8b01@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 21 Aug 2020 14:52:36 +0200
Message-ID: <w51wo1si2jv.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 07:08:36
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 21 Aug 2020 02:32:00 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> Hi!
>
> I'm sorry, I feel I already asked about it, but can't now find the answer.
>
> What are these ifs for?
>
>            /* The data (middle) region must be immediately after the
>             * start region */
>            if (l2meta_cow_start(m) + m->cow_start.nb_bytes != offset) {
>                continue;
>            }
>                                                                                                            
>            /* The end region must be immediately after the data (middle)
>             * region */
>            if (m->offset + m->cow_end.offset != offset + bytes) {
>                continue;
>            }
>
> How is it possible that data doesn't immediately follow start cow region or
> end cow region doesn't immediately follow data region?

They are sanity checks. They maybe cannot happen in practice and in that
case I suppose they should be replaced with assertions but this should
be checked carefully. If I remember correctly I was wary of overlooking
a case where this could happen.

In particular, that function receives only one data region but a list of
QCowL2Meta objects. I think you can get more than one QCowL2Meta if the
same request involves a mix of copied and newly allocated clusters, but
that shouldn't be a problem either.

Berto

