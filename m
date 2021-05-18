Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B3F387C96
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:38:25 +0200 (CEST)
Received: from localhost ([::1]:36908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1nc-00042j-Vg
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj1aJ-0002fI-NO
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:24:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj1aI-00082A-04
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621351477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41BXkGUSVeYk0fN5MOUSuRAS1qs93CIljSi5FM8ajdI=;
 b=WWuWLJ3CpNQFNso4I1ee7VWaEd9qv/QBNE3LezbBuOOIZZLdsHKph4bMOGy7Rr9Wb/YVdf
 mAv+KVzUKDMJV4IjLO50Rcx4F7BwIleACt/MKXD3Ec1xzkzqZlle7ubnWo/aGswfiFOU8O
 rCB3v0fQwe1Grxaikby6TXt5DjM0QzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-rx8EIaWiN-yFNArz5Kq6MA-1; Tue, 18 May 2021 11:24:34 -0400
X-MC-Unique: rx8EIaWiN-yFNArz5Kq6MA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E648E803620;
 Tue, 18 May 2021 15:24:32 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-121.ams2.redhat.com
 [10.36.115.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9164E5C1C5;
 Tue, 18 May 2021 15:24:30 +0000 (UTC)
Subject: Re: [PATCH 21/21] itotests/222: add test-case for copy-before-write
 filter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-23-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e96e1500-fe77-ed78-eec5-559122d76785@redhat.com>
Date: Tue, 18 May 2021 17:24:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064428.16223-23-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
> New fleecing method becomes available: copy-before-write filter.
> 
> Actually we don't need backup job to setup image fleecing. Add test
> fore new recommended way of image fleecing.

*for

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/222     | 56 ++++++++++++++++++++++-------
>   tests/qemu-iotests/222.out | 72 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 115 insertions(+), 13 deletions(-)

Looks good, just wondering about some variable usage (why is src_node a 
BB name?) and whether the virtio-blk qdev path couldn’t be expressed in 
some nicer way.

> diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/222
> index b48afe623e..8f8e1e4d7f 100755
> --- a/tests/qemu-iotests/222
> +++ b/tests/qemu-iotests/222
> @@ -48,11 +48,13 @@ remainder = [("0xd5", "0x108000",  "32k"), # Right-end of partial-left [1]
>                ("0xdc", "32M",       "32k"), # Left-end of partial-right [2]
>                ("0xcd", "0x3ff0000", "64k")] # patterns[3]
>   
> -with iotests.FilePath('base.img') as base_img_path, \
> -     iotests.FilePath('fleece.img') as fleece_img_path, \
> -     iotests.FilePath('nbd.sock', base_dir=iotests.sock_dir) as nbd_sock_path, \
> -     iotests.VM() as vm:
> +def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
> +    if use_cbw:
> +        log('=== Test filter based fleecing ===')
> +    else:
> +        log('=== Test backup(sync=none) based fleecing ===')
>   
> +    log('')
>       log('--- Setting up images ---')
>       log('')
>   
> @@ -69,7 +71,7 @@ with iotests.FilePath('base.img') as base_img_path, \
>       log('--- Launching VM ---')
>       log('')
>   
> -    vm.add_drive(base_img_path)
> +    vm.add_drive(base_img_path, "node-name=node0")
>       vm.launch()
>       log('Done')
>

Afterwards, src_node is set to 'drive0'.  So src_node is actually a BB 
name...

> @@ -91,11 +93,22 @@ with iotests.FilePath('base.img') as base_img_path, \
>           "backing": src_node,
>       }))
>   
> -    # Establish COW from source to fleecing node
> -    log(vm.qmp("blockdev-backup",
> -               device=src_node,
> -               target=tgt_node,
> -               sync="none"))
> +    # Establish CBW from source to fleecing node
> +    if use_cbw:
> +        log(vm.qmp("blockdev-add", **{
> +            "driver": "copy-before-write",
> +            "node-name": "fl-cbw",
> +            "file": src_node,
> +            "target": tgt_node

Which makes this look strange, and also TIL (or maybe “today I was 
reminded”?) that you can use BB names as node references.

(It’s also already weird in the `"backing": src_node` line right at the 
beginning of this hunk...)

So I guess it works, but I’d find it would be nicer to distinguish 
between the node name and the BB name.

> +        }))
> +
> +        log(vm.qmp("qom-set", path="/machine/peripheral-anon/device[0]",
> +                   property="drive", value="fl-cbw"))

Is that path portable across targets?  Should we maybe instead manually 
add a virtio-scsi device that we can give a proper name?

Or I suppose we could do

path = next(dev for dev in vm.qmp('query-block')['return']
             if dev['device'] == 'drive0')['qdev']

> +    else:
> +        log(vm.qmp("blockdev-backup",
> +                   device=src_node,
> +                   target=tgt_node,
> +                   sync="none"))
>   
>       log('')
>       log('--- Setting up NBD Export ---')
> @@ -139,9 +152,15 @@ with iotests.FilePath('base.img') as base_img_path, \
>       log('--- Cleanup ---')
>       log('')
>   
> -    log(vm.qmp('block-job-cancel', device=src_node))
> -    log(vm.event_wait('BLOCK_JOB_CANCELLED'),
> -        filters=[iotests.filter_qmp_event])
> +    if use_cbw:
> +        log(vm.qmp("qom-set", path="/machine/peripheral-anon/device[0]",
> +                   property="drive", value="node0"))

If src_node were 'node0', we wouldn’t need to use the 'node0' literal 
here and could use src_node instead.  (Because it kind of seems like 
this test wants to use those variables instead of literals.  I mean, we 
could also just call the node 'src-node', but, well.)

Max

> +        log(vm.qmp("blockdev-del", node_name="fl-cbw"))
> +    else:
> +        log(vm.qmp('block-job-cancel', device=src_node))
> +        log(vm.event_wait('BLOCK_JOB_CANCELLED'),
> +            filters=[iotests.filter_qmp_event])
> +
>       log(vm.qmp('nbd-server-stop'))
>       log(vm.qmp('blockdev-del', node_name=tgt_node))
>       vm.shutdown()


