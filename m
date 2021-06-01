Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13239701C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 11:15:54 +0200 (CEST)
Received: from localhost ([::1]:48568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo0V7-0002PW-NJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 05:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo0OJ-0005Qp-OL
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 05:08:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo0OH-00068U-8P
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 05:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622538528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CM6nSHLaFP7LDv3HAesIAzwIJb70f8x+2wS4wJEXvJo=;
 b=ZNNIliLtCHaO12LXgKXrGjYwXBGnCd2EWC0DOwORifg8D1ZdBRtflM5WXWimLZaly4OBru
 71fUblyxUc1x3tvkTaLFaELQZR8zNk6bD5swOQ3vcvkLH3a4XJWuu0iR32xQema7ynchsO
 24BN6gnUVc+FXUMn/ICDA3OWV5B+GSY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-C3DDy6e0NTi-YKBkiudrsw-1; Tue, 01 Jun 2021 05:08:45 -0400
X-MC-Unique: C3DDy6e0NTi-YKBkiudrsw-1
Received: by mail-ej1-f69.google.com with SMTP id
 gs18-20020a1709072d12b02903f19777c38aso1379478ejc.9
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 02:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CM6nSHLaFP7LDv3HAesIAzwIJb70f8x+2wS4wJEXvJo=;
 b=ALRNxDVkMMQsv1627yJIEaJMBqPuanxa4zB7gtcwcq5BfuUrabHfhGtro3K9QhtztS
 9Y6+Rlon0LsFhQh91x4WU/kTBC5NSSwuwuBKjeM5sEzeRcuElQgzKz5KCS0r/+Tkaghk
 LPPNYibhQt/nPKgFEhHtes03OjPj9S8TT0nXjUB6Xr6gpNeSQuTBJ31tnAse4YAxHiv2
 O7gsJiiu87eZPxPxL4wefPP8QvcMCFGJVsJBSSTKOJrLm5mvC2W060UUEqNglooM/l0n
 JAn2CtT+Dh4MTtEDM0VVoCzkP8NbgiaOYkmg8MgLqhj9V9TqjgzIdtdELik8pSIRqQa6
 63ng==
X-Gm-Message-State: AOAM533fSqGtVzKjqwrK9FctWaUSCaMcDkUPCFhu6qmvqVKyI6zym65R
 Y7QvBaBOoQCNIJRlBzbfnLPNnDCqrQj2sVz9gWxTiHoC9uzwxa9AXNdNhOLM/uR1QTw8oFJg2HS
 XuuEPaP9KB8QcBic=
X-Received: by 2002:a17:906:2844:: with SMTP id
 s4mr27915923ejc.263.1622538523711; 
 Tue, 01 Jun 2021 02:08:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmApvSAraLpWKPeynGiyhZRQaONxWJVrXDM4Tt/CsCQhEspYLEgHkQAFu41UeVamQ/hKg0jQ==
X-Received: by 2002:a17:906:2844:: with SMTP id
 s4mr27915900ejc.263.1622538523554; 
 Tue, 01 Jun 2021 02:08:43 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 v18sm7805675edc.76.2021.06.01.02.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 02:08:43 -0700 (PDT)
Subject: Re: [PATCH v2 22/33] qapi: publish copy-before-write filter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-23-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <789ddbd8-f0f1-2c85-db21-4d31b532d369@redhat.com>
Date: Tue, 1 Jun 2021 11:08:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-23-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json | 30 ++++++++++++++++++++++++++----
>   1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 2ea294129e..8c4801a13d 100644
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
> @@ -3937,6 +3939,25 @@
>     'base': 'BlockdevOptionsGenericFormat',
>     'data': { '*bottom': 'str' } }
>   
> +##
> +# @BlockdevOptionsCbw:
> +#
> +# Driver specific block device options for the copy-before-write driver,
> +# which does so called copy-before-write operations: when data is
> +# written to the filter, the filter firstly reads corresponding blocks
> +# from its file child and copies them to @target child. After successful
> +# copying the write request is propagated to file child. If copying
> +# filed, the original write request is failed too and no data is written

s/filed/failed/

With that fixed:

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +# to file child.
> +#
> +# @target: The target for copy-before-write operations.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'BlockdevOptionsCbw',
> +  'base': 'BlockdevOptionsGenericFormat',
> +  'data': { 'target': 'BlockdevRef' } }
> +
>   ##
>   # @BlockdevOptions:
>   #
> @@ -3989,6 +4010,7 @@
>         'bochs':      'BlockdevOptionsGenericFormat',
>         'cloop':      'BlockdevOptionsGenericFormat',
>         'compress':   'BlockdevOptionsGenericFormat',
> +      'copy-before-write':'BlockdevOptionsCbw',
>         'copy-on-read':'BlockdevOptionsCor',
>         'dmg':        'BlockdevOptionsGenericFormat',
>         'file':       'BlockdevOptionsFile',


