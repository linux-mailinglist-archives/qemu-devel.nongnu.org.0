Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E733A86B5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:41:44 +0200 (CEST)
Received: from localhost ([::1]:51630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltC8D-0007UM-1G
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltC7B-0006Wn-37
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltC78-0006bd-Vm
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bTcLE+YCZ+lwO1G86sMJwWTmx7vQJWiVc/oZXpmQJvo=;
 b=Ak7h39M2WGlV+0Dj5I+4bGyzDsNPCt8uG26m9WHtxbGrqdQdzi7YD3Lk6KoRlFqhL1SRBh
 EnKyU+g1+kUu8qLAIJ/tbz7GMxki5DqgRPAVRRR4qMmdIlsUM398Z53HQ52QJ++0t8XETK
 5M1ZQ4wFfEW9nio2TjcO+T7laIRXHTc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-y2lnLYYyPz-MrdtFFElJ6A-1; Tue, 15 Jun 2021 12:40:30 -0400
X-MC-Unique: y2lnLYYyPz-MrdtFFElJ6A-1
Received: by mail-ed1-f71.google.com with SMTP id
 v12-20020aa7dbcc0000b029038fc8e57037so4442111edt.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bTcLE+YCZ+lwO1G86sMJwWTmx7vQJWiVc/oZXpmQJvo=;
 b=hX1RCvPx2XAMi5DrK0mAiKltpqzClzSp0Mjo2gFNgkkdiOVl9WIlqnqheI1qFtxJ82
 rQEWMatGkM94Eh1F4lnVxnqz43iG28OsAI8/zAQh0bQ+dSmXpzp3+CVEhFEeLJDAyyuN
 bOYc5WwUlckTf8ES+yxvz30sBitevBNNigb/jvyvranb4xiC24IJMS2gK4Hvaq8FM7Vn
 Q3ea6cHGcJT2jHtC2X5Mx/w1YuZANcCUadMyoItpIQPs20MxjjG9WyTVI/HFxiBsAiYC
 yKrRWm8iPjs+jgW3iEjpUW9gBdG8zKtaVE7gvJehQAFVk4GDUur7OYibO1yIsj9n3d1y
 CNgA==
X-Gm-Message-State: AOAM531TZvVoBIHlxrTMlJ4APLCVIZa+RFH9Tm8cmGeCcLBWogF9A5FL
 BpZGIuBfM7oepNCojupIx47Rgv0eYxYC2n9/tmBDctX7G+39Gn/e7h19/0DUJy+bKKpLXBlwWyW
 xJJ0PHMLJfHsXPsc=
X-Received: by 2002:a17:907:1c1c:: with SMTP id
 nc28mr420464ejc.519.1623775229077; 
 Tue, 15 Jun 2021 09:40:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjszqOoFpP/M4CQwyMGYua0RLmJlU2Umgu8TRs67sq7NY9NrI/APdi99Df1hXgWaXxLk/Xcw==
X-Received: by 2002:a17:907:1c1c:: with SMTP id
 nc28mr420430ejc.519.1623775228817; 
 Tue, 15 Jun 2021 09:40:28 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 m7sm2136346edc.46.2021.06.15.09.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 09:40:28 -0700 (PDT)
Subject: Re: [PATCH v3 5/7] block: feature detection for host block support
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-6-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6a3e1f39-e14d-08e5-9c9e-85b3bab20e8d@redhat.com>
Date: Tue, 15 Jun 2021 18:40:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603133722.218465-6-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Joelle van Dyne <j@getutm.app>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.06.21 15:37, Paolo Bonzini wrote:
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

Shouldn’t this be done for host_cdrom, too? (and below)

Apart from that, looks good to me.

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


