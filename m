Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4176318D87F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 20:42:28 +0100 (CET)
Received: from localhost ([::1]:58280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFNXH-0005PP-3S
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 15:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jFNWP-0004pd-1g
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 15:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jFNWO-0002uJ-2f
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 15:41:32 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42081)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jFNWN-0002iY-IM; Fri, 20 Mar 2020 15:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=+0cl7hH5kvcvTDrsFQRft4HMAoMwj9jt9djWTYSbjLo=; 
 b=PbBJ4KFd74dPM6XTbcQJZmSdwJLgAqGEDXSoQYkD7ljOxvkMOmv1Y2tlsoDpbQLB6RHJ3RWiLH0Hminq7/DQafjCQQWuMxnL+VeoMlyLFJWADVDn7WFcmIIjsXvLWXPNiD9HIbgW99ANueEC7sShpKPDTne8+C221ie1RUAEiG4CaIn1FqTCuAg7nEKuKW3xOo0x2X390AwdRUIwBvsuvOmlfc4IIhwRxTrG56itdrkmv6SsM3K7z4czn6gbMt7f0VIw1uDA5Be2LAeOwdUIekKosDC9fysanrRUgF81aMtff7rKuZQvnK7UX4NqXkxS4VsOgspuqJg3fDBd/Sa2Kw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jFNWJ-0003HS-M6; Fri, 20 Mar 2020 20:41:27 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1jFNWJ-0003vq-CW; Fri, 20 Mar 2020 20:41:27 +0100
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: discard and v2 qcow2 images
In-Reply-To: <c0dcacfd-16cc-e2c2-304a-043e281d6bde@redhat.com>
References: <20200320185848.GA5720@igalia.com>
 <c0dcacfd-16cc-e2c2-304a-043e281d6bde@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 20 Mar 2020 20:41:27 +0100
Message-ID: <w514kuivmoo.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 20 Mar 2020 08:35:44 PM CET, Eric Blake <eblake@redhat.com> wrote:
>> This flag is however only supported when qcow_version >= 3. In older
>> images the cluster is simply deallocated, exposing any possible
>> previous data from the backing file.
>
> Discard is advisory, and has no requirements that discarded data read
> back as zero.  However, if write zeroes uses discard under the hood,
> then THAT usage must guarantee reading back as zero.

write_zeroes doesn't seem to use discard in any case, so no problem
there.

>> @@ -3763,6 +3763,10 @@ static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
>>       int ret;
>>       BDRVQcow2State *s = bs->opaque;
>>   
>> +    if (s->qcow_version < 3) {
>> +        return -ENOTSUP;
>> +    }
>> +
>
> This changes it so you no longer see stale data, but doesn't change
> the fact that you don't read zeroes (just that your stale data is now
> from the current layer instead of the backing layer, since we did
> nothing at all).

discard can already fail if the request is not aligned, in this case you
get -ENOTSUP and stay with the same data as before.

What's different in this case is that you can actually get stale data,
that doesn't seem like a desirable outcome.

Berto

