Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA5134D0A3
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 14:58:06 +0200 (CEST)
Received: from localhost ([::1]:47612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQrT2-0005ME-QC
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 08:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lQrRU-0004lz-FB
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 08:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lQrRI-0001iX-OZ
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 08:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617022572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMW61PXglF/8YxLQ4jENrB/JoegyeuLoFD66SQEchxY=;
 b=NmwdmY3itxCygXPOLz7XoPq3syVcgVv+npnHMBEU8wMgAao079QY3U8pWMeywGZIyiEJ17
 HI7/T8y6yJRjbsbW8v4I1E8h1mAEJH45grDz5KeRl+e8UMNxpnNPjNAvHhVpkdJfCSpGKc
 ULcs0mYO79hCVAPpwHRtUflWhzR1fik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-v01poZkYOxSHAcIuU0MK7Q-1; Mon, 29 Mar 2021 08:56:08 -0400
X-MC-Unique: v01poZkYOxSHAcIuU0MK7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A81051853027;
 Mon, 29 Mar 2021 12:56:06 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-119.ams2.redhat.com
 [10.36.113.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A0BE62499;
 Mon, 29 Mar 2021 12:56:04 +0000 (UTC)
Subject: Re: [PATCH] iotests: add test for removing persistent bitmap from
 backing file
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210317160207.626468-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <50162cf1-a4b3-4aec-9f29-7edafc83bd9b@redhat.com>
Date: Mon, 29 Mar 2021 14:56:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317160207.626468-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, den@virtuozzo.com, pkrempa@redhat.com,
 qemu-devel@nongnu.org, nshirokovskiy@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.21 17:02, Vladimir Sementsov-Ogievskiy wrote:
> Just demonstrate one of x-blockdev-reopen usecases. We can't simply
> remove persistent bitmap from RO node (for example from backing file),
> as we need to remove it from the image too. So, we should reopen the
> node first.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   .../tests/remove-bitmap-from-backing          | 68 +++++++++++++++++++
>   .../tests/remove-bitmap-from-backing.out      |  6 ++
>   2 files changed, 74 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/remove-bitmap-from-backing
>   create mode 100644 tests/qemu-iotests/tests/remove-bitmap-from-backing.out
> 
> diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
> new file mode 100755
> index 0000000000..121860d035
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing
> @@ -0,0 +1,68 @@
> +#!/usr/bin/env python3
> +#
> +# Test removing persistent bitmap from backing
> +#
> +# Copyright (c) 2021 Virtuozzo International GmbH.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +import iotests
> +from iotests import log, qemu_img_create
> +
> +iotests.script_initialize(supported_fmts=['qcow2'])
> +
> +top, base = iotests.file_path('top', 'base')
> +size = '1M'
> +
> +qemu_img_create('-f', iotests.imgfmt, base, size)
> +qemu_img_create('-f', iotests.imgfmt, '-b', base, top, size)

I think qemu-img create nowadays complains when you use -b without -F. 
Also, I’d prefer an assert around this (i.e. assert qemu_img_create() == 0).

> +
> +iotests.qemu_img('bitmap', '--add', base ,'bitmap0')

s/ ,/, /

Which makes me notice that 297 doesn’t yet check tests/.  I’ll send a patch.

Also, again, an assert == 0 might be nice.

And then I wonder why you import qemu_img_create from iotests, but not 
qemu_img and qemu_img_pipe.

> +# Just assert that our method of checking bitmaps in the image works.
> +assert 'bitmaps' in iotests.qemu_img_pipe('info', base)
> +
> +vm = iotests.VM().add_drive(top, 'backing.node-name=base')
> +vm.launch()
> +
> +log('Trying to remove persistent bitmap from r-o base node, should fail:')
> +vm.qmp_log('block-dirty-bitmap-remove', node='base', name='bitmap0')
> +
> +new_base_opts = {
> +    'node-name': 'base',
> +    'driver': 'qcow2',
> +    'file': {
> +        'driver': 'file',
> +        'filename':  base
> +    },
> +    'read-only': False
> +}
> +
> +# Don't want to bother with filtering qmp_log for reopen command
> +result = vm.qmp('x-blockdev-reopen', **new_base_opts)
> +if result != {'return': {}}:
> +    log('Failed to reopen: ' + str(result))
> +
> +log('Remove persistent bitmap from base node reopened to RW:')
> +vm.qmp_log('block-dirty-bitmap-remove', node='base', name='bitmap0')
> +
> +new_base_opts['read-only'] = True
> +result = vm.qmp('x-blockdev-reopen', **new_base_opts)
> +if result != {'return': {}}:
> +    log('Failed to reopen: ' + str(result))
> +
> +vm.shutdown()
> +
> +if 'bitmaps' in iotests.qemu_img_pipe('info', base):
> +    "Hmm, bitmap is still in the base image. That's wrong"

With 297 covering tests/, it complains about this “pointless string 
statement”.  Shouldn’t this be something like

log('ERROR: Bitmap is still in the base image')

?

Apart from that more syntax-y stuff, the test looks good to me.

Max


