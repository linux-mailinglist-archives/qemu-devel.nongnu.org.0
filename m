Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EDD18D875
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 20:36:42 +0100 (CET)
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFNRh-0003O9-KQ
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 15:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57070)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jFNQw-0002mk-N0
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 15:35:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jFNQv-0000Jw-Gy
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 15:35:54 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:31856)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jFNQv-0000JD-Dx
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 15:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584732953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMwo4Qvcp8fcxGpXD0PRfXZswwC0GMAAkByPQDn9gRc=;
 b=bCIeb3cHbail+/Nzurr56WMjj1rgq4yFc4JYgKFK6j1WKePyae1vde9WWmowiNlhPRWN3e
 5eerI7eGZNzpb+nYgTdbnSl9fH676cOIvZzlXzmzkbcaqvjzcTBOw6e8vclkUZWLZxT4fH
 PriD9MOAAmigmxsUM5sAXzQvlyXir7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-fdJg5Dz_MCOnYZz8mJvNkA-1; Fri, 20 Mar 2020 15:35:47 -0400
X-MC-Unique: fdJg5Dz_MCOnYZz8mJvNkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F2771005514;
 Fri, 20 Mar 2020 19:35:46 +0000 (UTC)
Received: from [10.3.112.193] (ovpn-112-193.phx2.redhat.com [10.3.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FB3C1001B07;
 Fri, 20 Mar 2020 19:35:44 +0000 (UTC)
Subject: Re: discard and v2 qcow2 images
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <20200320185848.GA5720@igalia.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c0dcacfd-16cc-e2c2-304a-043e281d6bde@redhat.com>
Date: Fri, 20 Mar 2020 14:35:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200320185848.GA5720@igalia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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

On 3/20/20 1:58 PM, Alberto Garcia wrote:
> Hi,
> 
> when full_discard is false in discard_in_l2_slice() then the selected
> cluster should be deallocated and it should read back as zeroes. This
> is done by clearing the cluster offset field and setting OFLAG_ZERO in
> the L2 entry.
> 
> This flag is however only supported when qcow_version >= 3. In older
> images the cluster is simply deallocated, exposing any possible
> previous data from the backing file.

Discard is advisory, and has no requirements that discarded data read 
back as zero.  However, if write zeroes uses discard under the hood, 
then THAT usage must guarantee reading back as zero.

> 
> This can be trivially reproduced like this:
> 
>     qemu-img create -f qcow2 backing.img 64k
>     qemu-io -c 'write -P 0xff 0 64k' backing.img
>     qemu-img create -f qcow2 -o compat=0.10 -b backing.img top.img
>     qemu-io -c 'write -P 0x01 0 64k' top.img
> 
> After this, top.img is filled with 0x01. Now we issue a discard
> command:
> 
>     qemu-io -c 'discard 0 64k' top.img
> 
> top.img should now read as zeroes, but instead you get the data from
> the backing file (0xff). If top.img was created with compat=1.1
> instead (the default) then it would read as zeroes after the discard.

I'd argue that this is undesirable behavior, but not a bug.

> 
> This seems like a bug to me, and I would simply forbid using discard
> in this case (see below). The other user of full_discard = false is
> qcow2_snapshot_create() but I think that one is safe and should be
> allowed?
> 
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -3763,6 +3763,10 @@ static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
>       int ret;
>       BDRVQcow2State *s = bs->opaque;
>   
> +    if (s->qcow_version < 3) {
> +        return -ENOTSUP;
> +    }
> +

This changes it so you no longer see stale data, but doesn't change the 
fact that you don't read zeroes (just that your stale data is now from 
the current layer instead of the backing layer, since we did nothing at 
all).

I'm not opposed to the patch, per se, but am not convinced that this is 
a problem to worry about.

>       if (!QEMU_IS_ALIGNED(offset | bytes, s->cluster_size)) {
>           assert(bytes < s->cluster_size);
>           /* Ignore partial clusters, except for the special case of the
> 
> Berto
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


