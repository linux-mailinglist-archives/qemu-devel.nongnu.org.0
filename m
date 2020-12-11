Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3092D7302
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 10:45:38 +0100 (CET)
Received: from localhost ([::1]:55282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knezZ-00078Z-Nb
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 04:45:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kneyU-0006he-OC
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:44:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kneyN-0002hJ-NS
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607679861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BadPyGQDD+eF9tuq+3iOfgsp5QDV/AJ+W6Iy78LESoM=;
 b=V4yA+UhGCsfRkzncoym7z7YjJ/VE1Bk/HGKuiXbGw02M8dJHl6TUfi+UTgq5iYq7nxkU+1
 3a+1k0J2xcNNVpzpZ9COND8GIEZyKcR/8Zp9a4Xa6FkURNDl05AnioAGXClBzm9PE3Ysi0
 F8W6aAkPxgXy1kpnn8gXzO8tBCcjf9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-52OCbnXkO9uO0B0aSSkuHA-1; Fri, 11 Dec 2020 04:44:19 -0500
X-MC-Unique: 52OCbnXkO9uO0B0aSSkuHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 075B1107ACE4;
 Fri, 11 Dec 2020 09:44:18 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 323DF5D705;
 Fri, 11 Dec 2020 09:44:07 +0000 (UTC)
Date: Fri, 11 Dec 2020 10:44:04 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: RFC: don't store backing filename in qcow2 image
Message-ID: <20201211094404.GI2986915@angien.pipo.sk>
References: <20581556-6550-e0f7-aca9-6b4034821f6c@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20581556-6550-e0f7-aca9-6b4034821f6c@virtuozzo.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu block <qemu-block@nongnu.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 17:26:52 +0300, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!

Hi,

> 
> I have an idea, that not storing backing filename in qcow2 image at all may be a good thing. I'll give some reasons and want to know what do you think about it.
> 
> 1. Libvirt has to manage and keep in mind backing chains anyway.
> 
> This means, that storing this information in qcow2 header is a source of bugs when we update it in one place but failed/forget to update in another. Of course, Libvirt is not the only user of qemu.. But we are moving to "blockdev" anyway, when management tool should control all node-names at least. It would be strange to not control the relations between images in the same time.

At the same time many users depend on this. If you move in images from
another host, you'd have to remember the dependencies/order.

> 2. backing file name specified in qcow2 metadata doesn't relate to any other thing, and nothing rely on it.
> 
> 3. calculating and updating backing file name in Qemu is a headache:
>    - with some options specified or with filters we risk to write json filenames into qcow2 metadata, which is almost never what user wants. Also, json may exceed the qcow2 limitation of backing_file_size to be <= 1023

As long as it works (libvirt and qemu have parsers for json:) I don't
think the user cares.

>    - updating it in transactional way for read-only image during reopen, when another transactional permission update is ongoing is difficult (who know, how to do it?) (remember recent d669ed6ab02849 "block: make bdrv_drop_intermediate() less wrong")
> 
> 4. Moving qcow2 files to another directory is a problem: you should care to update backing file names in all dependent qcow2 images.

Or alternatively use relative names.

> So, what about moving libvirt (at least) to not rely on backing file name stored in qcow2 image? Backing chain then should be in xml? Is it hard or not? Finally, will it make the code simpler, or more difficult?
> 
> 
> Then, if the idea is good in general, what to do on Qemu part? If we want to finally get rid of problem code (see [3.]) we should deprecate something.. Just deprecate support for qcow2 images with backing file specified, requiring user always specify backing chain by hand? I don't see anything that should be changed in qcow2 format itself: no reason to add some kind of restricted bits, etc..

I think this will create headaches for many users. Libvirt does support
specification of the chain manually, but doesn't mandate it.

It's also a fairly recent addition to libvirt so I doubt that any other
project which uses libvirt only for a part of the functionality (such as
oVirt or openstack) picked up the full specification of chain in the
XML. The problem here is that libvirt isn't used for the whole knowledge
state here. Rather projects like oVirt feed us a new XML every single
time. This means that they'd need to start keeping the chain info
internally too.

Rather they currently rely on our detection code and the proper setting
of paths in the image, and thus removing it would be a rather serious
regression in behaviour, which would be visible beyond libvirt without
any way for us to make it opaque to higher levels.


