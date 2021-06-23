Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A033B1DCA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:46:08 +0200 (CEST)
Received: from localhost ([::1]:57326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw54p-0004Vd-MY
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw53H-0003OM-Lm
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw53C-0006eU-CX
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624463065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VcnYrqbI98B6exVXe233fZoMZKqey+7YZ70Qf3GUeiw=;
 b=KkcbYuc0y420iSFoIKW/p08en1874VZengT6hYdWg5ODNXCyttwUG27gnchfujfs5n8cJX
 1d0nd8Dvjm52XZoIR3m/XCDfKmKR7nGAUVedReWLRMIm0plqDj3l/18c+Zs5PRBUbJymJC
 p/a8PR+UFy3qe4bPjw687AWSpbDWzL8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-mjvsZlkDN3ixJCzhXBaDag-1; Wed, 23 Jun 2021 11:44:22 -0400
X-MC-Unique: mjvsZlkDN3ixJCzhXBaDag-1
Received: by mail-ed1-f70.google.com with SMTP id
 m4-20020a0564024304b0290394d27742e4so1539467edc.10
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 08:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VcnYrqbI98B6exVXe233fZoMZKqey+7YZ70Qf3GUeiw=;
 b=Mq5G9buANMeEh/Nujjjtgtm+go2+u7S8ZghmAEshl3xLYhI2bIW7zMWJDuglhH5CjF
 Z899gQCypxH6p1SRJjWrbSn2NmV4Nc1yZZLkzLxMSw/1Du2EFf/52kv5euO2J8bM6QOD
 eCT54pJc0Pc3hg+uVM1NCqC+YXvDaS/J2w6ctojU7NgULdbHYPRKPAswyL3Q6KqIqTEa
 tZUMgl/occ/l/R4il5gCOMuf8Xi6VbKdkJJYEb3D6DVmjVTBX3sZLh4HiwVnrtxXYatA
 0weAprWrIh6PyQXRv1naMeUcyfLEk8UlYM3Gh6/7FWjOxMn4BDvu8TUmX4h7VWBmPkJo
 LTQQ==
X-Gm-Message-State: AOAM5303uthAXOJ1nZIHCBs1o5RClQKSoc3NjwNZ6oKpBr5rsGaekYuo
 MdGOcwIpB8wMwKxJGZkOWB6JSpfNacWjJQsS8dLCVvFCllOPoJ5/VipKgXgsaPcSFAcv7B84KKi
 At4V6L6JbntcYhQg=
X-Received: by 2002:aa7:db94:: with SMTP id u20mr413587edt.381.1624463061441; 
 Wed, 23 Jun 2021 08:44:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygLYLrItTo9sAbZuH4zqMf75rt7DtSFYyog8VHxQmiTRNnStsrfggDY9HcJQNRj1xUXyvZBg==
X-Received: by 2002:aa7:db94:: with SMTP id u20mr413557edt.381.1624463061237; 
 Wed, 23 Jun 2021 08:44:21 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 q15sm226301edr.84.2021.06.23.08.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 08:44:20 -0700 (PDT)
Subject: Re: [PATCH v4 5/7] block: feature detection for host block support
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-6-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <020924b3-34bc-648b-602d-9fcb458182af@redhat.com>
Date: Wed, 23 Jun 2021 17:44:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608131634.423904-6-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, Joelle van Dyne <j@getutm.app>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.06.21 15:16, Paolo Bonzini wrote:
> From: Joelle van Dyne <j@getutm.app>
>
> On Darwin (iOS), there are no system level APIs for directly accessing
> host block devices. We detect this at configure time.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> Message-Id: <20210315180341.31638-2-j@getutm.app>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c   | 33 ++++++++++++++++++++++-----------
>   meson.build          |  6 +++++-
>   qapi/block-core.json | 10 +++++++---
>   3 files changed, 34 insertions(+), 15 deletions(-)

[...]

> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 2ea294129e..2dd41be156 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -897,7 +897,8 @@
>     'discriminator': 'driver',
>     'data': {
>         'file': 'BlockStatsSpecificFile',
> -      'host_device': 'BlockStatsSpecificFile',
> +      'host_device': { 'type': 'BlockStatsSpecificFile',
> +                       'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
>         'nvme': 'BlockStatsSpecificNvme' } }
>   
>   ##
> @@ -2814,7 +2815,9 @@
>   { 'enum': 'BlockdevDriver',
>     'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
>               'cloop', 'compress', 'copy-on-read', 'dmg', 'file', 'ftp', 'ftps',
> -            'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
> +            'gluster', 'host_cdrom',
> +            {'name': 'host_device', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
> +            'http', 'https', 'iscsi',
>               'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
>               'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
>               { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
> @@ -3996,7 +3999,8 @@
>         'ftps':       'BlockdevOptionsCurlFtps',
>         'gluster':    'BlockdevOptionsGluster',
>         'host_cdrom': 'BlockdevOptionsFile',
> -      'host_device':'BlockdevOptionsFile',
> +      'host_device': { 'type': 'BlockdevOptionsFile',
> +                       'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
>         'http':       'BlockdevOptionsCurlHttp',
>         'https':      'BlockdevOptionsCurlHttps',
>         'iscsi':      'BlockdevOptionsIscsi',

As I asked in v3: What about host_cdrom?

Max


