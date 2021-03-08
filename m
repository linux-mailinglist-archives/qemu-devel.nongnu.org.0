Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8E6330D63
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:22:32 +0100 (CET)
Received: from localhost ([::1]:39428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEu7-0002RO-3L
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJEt6-0001wk-Jc; Mon, 08 Mar 2021 07:21:28 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:49134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJEt4-0005qY-47; Mon, 08 Mar 2021 07:21:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=Zjt+Vll6o1+zM9z2tNs+p3ccL5vEdqIEbP2mvRVPKAI=; 
 b=RFwhhVZIpZDdX2GTDKxBsE77Br63M/v/2YMklpbn2+dNyHW3lGlGRW+zUqR9gD5mYu7MZ7fvPtyriB3K8ASVqE0UQf9ISiDAz8slTn8dEGEZtTTiZSB9xYFzIlM56J/O3GfFUw7GSXXi35gPh7zETISGxCPO8z4RLCuRFCOFBxaW6tbuDL2HpDyVNIEIY+SSefYOqCIuJ06QnqdQgPRrV4hEFlZDqDBEzzKkfxDpn9nopiYBnSqjrdIiDP60hLLbBrEIfW+n6GQ2vNDdf5FUVHWpyAtRC7yTEbft1P4Tr4Rbj/b6TJ7jqCKodSGHwHlb6PH1rH+xfiXYSbrsWofWRA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lJEsa-0000Gb-0d; Mon, 08 Mar 2021 13:20:56 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lJEsZ-0001Ih-MW; Mon, 08 Mar 2021 13:20:55 +0100
From: Alberto Garcia <berto@igalia.com>
To: Peter Lieven <pl@kamp.de>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: block/throttle and burst bucket
In-Reply-To: <a56688da-d433-8405-cec5-3298d4edd91b@kamp.de>
References: <efe8ee1c-e12f-b739-b9dd-9bd6d80527cb@kamp.de>
 <w51blc7ji0b.fsf@maestria.local.igalia.com>
 <3b68544d-66bc-1790-26f9-6e50683119cc@kamp.de>
 <20210301105934.GB7698@merkur.fritz.box>
 <a56688da-d433-8405-cec5-3298d4edd91b@kamp.de>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 08 Mar 2021 13:20:55 +0100
Message-ID: <w51czw925w8.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 01 Mar 2021 01:11:55 PM CET, Peter Lieven <pl@kamp.de> wrote:
> Why we talk about throttling I still do not understand the following part=
 in util/throttle.c function throttle_compute_wait
>
>
> =C2=A0=C2=A0=C2=A0 if (!bkt->max) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* If bkt->max is 0 we still w=
ant to allow short bursts of I/O
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * from the guest, otherw=
ise every other request will be throttled
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * and performance will s=
uffer considerably. */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bucket_size =3D (double) bkt->=
avg / 10;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 burst_bucket_size =3D 0;
> =C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* If we have a burst limit th=
en we have to wait until all I/O
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * at burst rate has fini=
shed before throttling to bkt->avg */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bucket_size =3D bkt->max * bkt=
->burst_length;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 burst_bucket_size =3D (double)=
 bkt->max / 10;
> =C2=A0=C2=A0=C2=A0 }
>
>
> Why burst_bucket_size =3D bkt->max / 10?
>
> From what I understand it should be bkt->max. Otherwise we compare the
> "extra" against a tenth of the bucket capacity

1) bkt->max is the burst rate in bytes/second [*]
2) burst_bucket_size is used to decide when to start throttling (you can
   see the code at the end of throttle_compute_wait()).

The important thing is that burst_bucket_size does not actually have an
influence on the actual burst rate. Increasing that value is not going
to make the I/O faster, it just means that I/O will be throttled later.

Once the I/O is throttled, the actual burst rate is define by how quick
the burst bucket leaks (see throttle_leak_bucket()).

The higher burst_bucket_size is, the longer we allow the guest to exceed
the maximum rate. So we divide blk->max by 10 in order to allow the
guest to perform 100ms' worth of I/O without being throttled.

See the commit message of 0770a7a6466cc2dbf4ac91841173ad4488e1fbc7 for
more details.

Berto

