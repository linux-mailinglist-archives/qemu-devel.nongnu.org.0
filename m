Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73611387BD0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:59:38 +0200 (CEST)
Received: from localhost ([::1]:53260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1C5-0003tD-9y
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj12N-0007SM-VX
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:49:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj12K-0005EL-EK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621349368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQwM0ntWu58JBQ+w1Atn4FU0oCC0GuTFHNh9JAq89HI=;
 b=Cl691uFpA9E0cLa+gVmlSHgWyijkVaBSiW9LS6ywEx7+vx/jgXAgMUv8UNQzwlJ3yj8n8u
 WCJUU8h//+b4njuykRLTWIvkcVfSGchmfNV/u5l//pApg1WPK5mWFX/LivEMa+QMKRWqjY
 d0yq9eWPROyhzSOf4le281klpRS8WqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-Ej8LIzv8N_GO1Dd1oqUKsA-1; Tue, 18 May 2021 10:49:27 -0400
X-MC-Unique: Ej8LIzv8N_GO1Dd1oqUKsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3D5D8D91EA;
 Tue, 18 May 2021 14:48:55 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-121.ams2.redhat.com
 [10.36.115.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 534555D6A1;
 Tue, 18 May 2021 14:48:53 +0000 (UTC)
Subject: Re: [PATCH 20/21] qapi: publish copy-before-write filter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-22-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <b6c8a8e6-63f3-8437-93d4-5f1522383b7e@redhat.com>
Date: Tue, 18 May 2021 16:48:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064428.16223-22-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
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
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json | 22 ++++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 2ea294129e..f8fbcb6416 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2808,15 +2808,17 @@
>   # @blklogwrites: Since 3.0
>   # @blkreplay: Since 4.2
>   # @compress: Since 5.0
> +# @copy-before-write: Since 6.1
>   #
>   # Since: 2.9
>   ##
>   { 'enum': 'BlockdevDriver',
>     'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
> -            'cloop', 'compress', 'copy-on-read', 'dmg', 'file', 'ftp', 'ftps',
> -            'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
> -            'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
> -            'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
> +            'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
> +            'file', 'ftp', 'ftps', 'gluster', 'host_cdrom', 'host_device',
> +            'http', 'https', 'iscsi', 'luks', 'nbd', 'nfs', 'null-aio',
> +            'null-co', 'nvme', 'parallels', 'preallocate', 'qcow', 'qcow2',
> +            'qed', 'quorum', 'raw', 'rbd',
>               { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
>               'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
>   
> @@ -3937,6 +3939,17 @@
>     'base': 'BlockdevOptionsGenericFormat',
>     'data': { '*bottom': 'str' } }
>   
> +##
> +# @BlockdevOptionsCbw:
> +#
> +# Driver specific block device options for the copy-before-write driver.
> +#

I think there should be a description of @target here.

(Looks good otherwise, though.)

Max

> +# Since: 6.1
> +##
> +{ 'struct': 'BlockdevOptionsCbw',
> +  'base': 'BlockdevOptionsGenericFormat',
> +  'data': { 'target': 'BlockdevRef' } }
> +
>   ##
>   # @BlockdevOptions:
>   #
> @@ -3989,6 +4002,7 @@
>         'bochs':      'BlockdevOptionsGenericFormat',
>         'cloop':      'BlockdevOptionsGenericFormat',
>         'compress':   'BlockdevOptionsGenericFormat',
> +      'copy-before-write':'BlockdevOptionsCbw',
>         'copy-on-read':'BlockdevOptionsCor',
>         'dmg':        'BlockdevOptionsGenericFormat',
>         'file':       'BlockdevOptionsFile',
> 


