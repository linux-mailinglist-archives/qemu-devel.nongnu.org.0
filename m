Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABB8336D44
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 08:48:27 +0100 (CET)
Received: from localhost ([::1]:51116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKG3W-0002Uw-Rg
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 02:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lKG2V-0001yE-8H
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:47:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lKG2S-0003yx-4h
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615448838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/lI/reTrBASAIQKJ+Y0YYmrfuOcckYYZM1yXwR9nwwk=;
 b=QcDJyJp7ueNUPTRQ5MACUB204geYLD0GamF1OS/X3YmTdieWp+wFYGZDZk4BBL0BVGJNTx
 F2yLIT5pOd+yhO1YH4/CuRy4WpsIMj3WE+aIsXlnFRobvOnTP1vTiOohHMXU+7SoajiEzy
 53Yg8+z8zk5G0bKVVqR1bykLZjrdtkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-2UA2pKgOPyq-Q9chfxwyNw-1; Thu, 11 Mar 2021 02:47:16 -0500
X-MC-Unique: 2UA2pKgOPyq-Q9chfxwyNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53FE957;
 Thu, 11 Mar 2021 07:47:15 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 805AF60C05;
 Thu, 11 Mar 2021 07:47:05 +0000 (UTC)
Date: Thu, 11 Mar 2021 08:47:02 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
Message-ID: <YEnK9rgRRz+0qyGh@angien.pipo.sk>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210310173044.GF6076@merkur.fritz.box>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 18:30:44 +0100, Kevin Wolf wrote:
> Am 10.03.2021 um 15:31 hat Paolo Bonzini geschrieben:
> > On 10/03/21 15:22, Peter Krempa wrote:

[...]

> The keyval parser would create a list if multiple values are given for
> the same key. Some care needs to be taken to avoid mixing the magic
> list feature with the normal indexed list options.
> 
> The QAPI schema would then use an alternate between 'int' and ['int'],
> with the the memory-backend-ram implementation changed accordingly.
> 
> We could consider immediately deprecating the syntax and printing a
> warning in the keyval parser when it automatically creates a list from
> two values for a key, so that users don't start using this syntax

By 'creating a list from two values for a key' you mean:

host-nodes=0,host-nodes=1

to be converted into [0, 1] ?

> instead of the normal list syntax in other places. We'd probably still
> leave the implementation around for -device and other users of the same
> magic.

There's three options actually that libvirt uses, visible in one our
test files [1]

For a single value we format:

-object memory-backend-ram,id=ram-node0,size=20971520,host-nodes=3,policy=preferred

For a contiguous list:

-object memory-backend-ram,id=ram-node1,size=676331520,host-nodes=0-7,policy=bind

And for an interleaved list:

-object memory-backend-ram,id=ram-node2,size=24578621440,host-nodes=1-2,host-nodes=5,host-nodes=7,policy=bind

If any of the above is to be deprecated we'll need to adjust our
JSON->commandline generator accordignly.

Luckily the 'host-nodes' is storeable as a bitmap and the generator is
actually modular to allow plugging an array interpretor which actually
does the above conversion from a JSON array.

So, what is the preferred syntax here? Additionally we might need a
witness property to detect when to use the new syntax if basing it on
the object-add qapification will not be enough.

[1] https://gitlab.com/libvirt/libvirt/-/blob/master/tests/qemuxml2argvdata/numatune-memnode.args


