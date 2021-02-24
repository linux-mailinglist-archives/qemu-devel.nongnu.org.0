Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6533240E4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:38:31 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwFC-0007f8-2x
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lEwCg-0005gX-DB
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:35:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lEwCe-0001GF-N5
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614180952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UFZmlzTAuEGE6ZFch0ja74QQhkiVv6QNCnOoPAPVKCM=;
 b=Xs6bE952YfnnngGoL+7T15MkQYwD7kRki3HWLQWZGRIF35/aynfOxAiLRr5A1N+FONgV/Z
 /A/cH5lBKZQNF+Y4G29mZvhlQmP0WkJPG6FLkRFjrCi5BqzXNouLgUX75QZDFYqGnq8bza
 wSwOW+6VVkVv7mGrc5G9HoC0uXHZAGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-nc2uN8ykNpyDaY7DE5NRew-1; Wed, 24 Feb 2021 10:35:48 -0500
X-MC-Unique: nc2uN8ykNpyDaY7DE5NRew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63C6B1103897;
 Wed, 24 Feb 2021 15:01:51 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-142.ams2.redhat.com [10.36.115.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63DD06E505;
 Wed, 24 Feb 2021 15:01:25 +0000 (UTC)
Subject: Re: [PATCH 11/14] block: remove 'encryption_key_missing' flag from
 QAPI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-12-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6884bef5-3d1a-cde8-5429-31987b7e2f6b@redhat.com>
Date: Wed, 24 Feb 2021 16:01:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224131142.1952027-12-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/2021 14.11, Daniel P. Berrangé wrote:
> This has been hardcoded to "false" since 2.10.0, since secrets required
> to unlock block devices are now always provided upfront instead of using
> interactive prompts.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   block/qapi.c                     |  1 -
>   docs/system/deprecated.rst       | 10 -------
>   docs/system/removed-features.rst | 10 +++++++
>   qapi/block-core.json             |  8 ------
>   tests/qemu-iotests/184.out       |  6 ++--
>   tests/qemu-iotests/191.out       | 48 +++++++++++---------------------
>   tests/qemu-iotests/273.out       | 15 ++++------
>   7 files changed, 33 insertions(+), 65 deletions(-)
> 
> diff --git a/block/qapi.c b/block/qapi.c
> index 84a0aadc09..3acc118c44 100644
> --- a/block/qapi.c
> +++ b/block/qapi.c
> @@ -62,7 +62,6 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
>       info->ro                     = bs->read_only;
>       info->drv                    = g_strdup(bs->drv->format_name);
>       info->encrypted              = bs->encrypted;
> -    info->encryption_key_missing = false;
>   
>       info->cache = g_new(BlockdevCacheInfo, 1);
>       *info->cache = (BlockdevCacheInfo) {
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index cb88fea94f..e746a63edf 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -147,16 +147,6 @@ Use argument ``id`` instead.
>   
>   Use argument ``id`` instead.
>   
> -``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -Always false.
> -
> -``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -Always false.
> -
>   ``blockdev-add`` empty string argument ``backing`` (since 2.10.0)
>   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index bb6bc8dfc8..583f14f02e 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -112,6 +112,16 @@ chardev client socket with ``wait`` option (removed in 6.0)
>   Character devices creating sockets in client mode should not specify
>   the 'wait' field, which is only applicable to sockets in server mode
>   
> +``query-named-block-nodes`` result ``encryption_key_missing`` (removed in 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Always false.

Should that be "Removed with no replacement", too ? (just like the one below)

> +``query-block`` result ``inserted.encryption_key_missing`` (removed in 6.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Removed with no replacement
> +

Apart from that nit:
Reviewed-by: Thomas Huth <thuth@redhat.com>


