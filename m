Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27D5203E39
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 19:45:04 +0200 (CEST)
Received: from localhost ([::1]:33810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnQVD-0005GB-QT
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 13:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jnQUJ-0004cx-EL; Mon, 22 Jun 2020 13:44:07 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:48240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jnQUH-0000MO-IM; Mon, 22 Jun 2020 13:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=o1Jla6JJNH45R6i4i7FeKrXqPriBXVXZpCOdltwAWrM=; 
 b=py1inbYdYIb1f2Jb95TDdpPZMlROg7BY5sF57Myy802e4AIV+UE9gKvjbqCmZ54C7MjRh8T7IzxBdHQECxHggd2GGHlTvtiKioV0BerAbu/zuTIrHEpHo7jpDX97n45NSagwGTSHqGaTlu4Y/ZjKRQD5VgSfo9P1YQaASl0HG1f2ph9yuX8e3afzLThHGhCixgbG+fdwJE/bhViaGkHTvEH6wDGxPO5RMeGvfyOB144IwMRqdwheeu7QQMY9/8A1RZRtfPy7UtZRgfZkLgnZ8iH+Q0PSVQKGmj6v9J2VqY/PvxhP/+gkKAqWEW1tq8Ez6lunWPhp/iG/Z8VX2VawrA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jnQUE-0001pk-8H; Mon, 22 Jun 2020 19:44:02 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jnQUD-0007Nm-TI; Mon, 22 Jun 2020 19:44:01 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH 0/2] qcow2: Force preallocation with data-file-raw
In-Reply-To: <72eb5700-faf6-22ee-69be-1e7653cf06c6@redhat.com>
References: <20200619104012.235977-1-mreitz@redhat.com>
 <CAMRbyyu1ZC2qMKSHJXNy7-98-nXHh00dL-v_D0BKcEL6Rmmj+g@mail.gmail.com>
 <72eb5700-faf6-22ee-69be-1e7653cf06c6@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 22 Jun 2020 19:44:01 +0200
Message-ID: <w51lfkf807y.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 13:36:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 22 Jun 2020 11:47:32 AM CEST, Max Reitz wrote:
>> I don't know the internals of qcow2 data_file, but are we really using
>> qcow2 metadata when accessing the data file?
>
> Yes.
>
>> This may have unwanted performance consequences.
>
> I don=E2=80=99t think so, because in practice normal lookups of L1/L2 map=
pings
> generally don=E2=80=99t cost that much performance.

...if the L2 cache size is large enough. Otherwise you need one extra
read operation to retrieve the L2 metadata.

Possible performance problems when you have preallocation:

   - If a block hasn't been written yet (it's all zeroes) then you still
     need to read the L2 entry and read the data block. If there is not
     L2 table then you can simply return zeroes without going to disk at
     all. This of course assumes that the contents of the unwritten data
     block are zeroes.

   - QEMU still needs to read from disk (and cache in memory) the L2
     metadata, when it already knows in advance the contents of the L2
     entry (guest_offset =3D=3D host_offset).

But as you say:

> Sure, it=E2=80=99s not free.  But if we decide we should indeed fully ign=
ore
> the L1/L2 tables for data-file-raw images, the qcow2 spec must be
> amended.  As I can read it, it currently doesn=E2=80=99t say so.
>
> (By the way, this is not a trivial change.  Right now, data-file-raw
> is an autoclear flag: If a version of qemu that doesn=E2=80=99t support it
> accesses the image, it will automatically clear the flag, but the
> image stays valid.  If we decide to completely ignore the L1/L2 tables
> (i.e. not even create them), then this can no longer be an autoclear
> flag.  We=E2=80=99d need a new incompatible flag.  (Because without L1/L2
> tables, the image becomes useless to older qemu versions.))

Berto

