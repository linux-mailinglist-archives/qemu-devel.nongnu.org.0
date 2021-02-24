Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AF0323E5F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:36:23 +0100 (CET)
Received: from localhost ([::1]:40678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuL0-0005kZ-N2
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEuCX-0005nr-Ua
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:27:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEuCW-0002Ji-FN
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614173255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjhtbAZiRJMVC4CrgCBWlF7Kc8ViAshIGTh5Vz69JEs=;
 b=WM7jEh23+m36L0+4dCKFYPW4a9GUUBoRnyf2RZjpZZVgAKR06RcVWa8bk631stvJsHfgyL
 erMcWXpJ1BQhXuphZ2CsdRx3Faa2aWdv4yxYTLt5mm++79mALekc+fIYZ7IzQrGEC7/lcA
 UtROw4+zo+uaSqtmost/9fu7R8ETVFY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-QFogAslUNBGktx_vAe4K1g-1; Wed, 24 Feb 2021 08:26:15 -0500
X-MC-Unique: QFogAslUNBGktx_vAe4K1g-1
Received: by mail-ed1-f71.google.com with SMTP id y90so859607ede.8
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 05:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kjhtbAZiRJMVC4CrgCBWlF7Kc8ViAshIGTh5Vz69JEs=;
 b=R20k4Skq92K+8d09cwogZ8CSKsyOTvTZ76LxjoPofKxi58q0Yl+rzqc1NcbNMSw26J
 P8Uy8GPbMaEbN64L65hjNGx9G+Dj6FI8u5iX1hzYBSJVJ9rFLYp7/mkfs7DxbI2WB1eu
 DKHc45SWaMPm+KXEMYOMs0aZxnxPHItpk89xmXZNgzgPVWx0s5l3Zy/SIGYIfhAnJRxk
 5+5ylfEDTw1lgRTkNBEX/7sG5u1jZMqJLx9fML49iFVN+2TO+PiPv5YUpkaTrMft7g9c
 mOjCtRI0lYj+KDtrgI2cmAzHo8r9TpgXxQ0PLd3tz3oEjDoJxu3o7LwW3efbafyxFFbY
 DVsA==
X-Gm-Message-State: AOAM531bGSM1nbUOEtquNMWt76OFnEg/yZhCMKp7EP5HRCjS8vFDsZLg
 BoBeHoR3g71hFDUloToTNY/RHhXwwG/1f5jG+SuHtbGis0D5N0iz7LQff7fi5j6Y4No2nfzn3UE
 gfgxAWaiH3WET6Kc=
X-Received: by 2002:a17:906:5ad5:: with SMTP id
 x21mr15321374ejs.38.1614173174276; 
 Wed, 24 Feb 2021 05:26:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO7XbWcb4394AwnNPMg/2j8OJj3HD+Rv25Cm2jKSxFUm17xyjBYbF1A45meC+YNUekSF/3HA==
X-Received: by 2002:a17:906:5ad5:: with SMTP id
 x21mr15321334ejs.38.1614173174087; 
 Wed, 24 Feb 2021 05:26:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n13sm1328495ejc.84.2021.02.24.05.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 05:26:13 -0800 (PST)
Subject: Re: [PATCH 00/14] deprecations: remove many old deprecations
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210224131142.1952027-1-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9acb4443-bc9e-2c03-e6e2-7f449649d222@redhat.com>
Date: Wed, 24 Feb 2021 14:26:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224131142.1952027-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/21 14:11, Daniel P. Berrangé wrote:
> The following features have been deprecated for well over the 2
> release cycle we promise
> 
>    ``-usbdevice`` (since 2.10.0)
>    ``-drive file=3Djson:{...{'driver':'file'}}`` (since 3.0)
>    ``-vnc acl`` (since 4.0.0)
>    ``-mon ...,control=3Dreadline,pretty=3Don|off`` (since 4.1)
>    ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
>    ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
>    ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)
>    ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0)
>    ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].sta=
> tus (ince 4.0)
>    ``query-cpus`` (since 2.12.0)
>    ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
>    ``query-events`` (since 4.0)
>    chardev client socket with ``wait`` option (since 4.0)
>    ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` (s=
> ince 4.0.0)
>    ``ide-drive`` (since 4.2)
>    ``scsi-disk`` (since 4.2)
> 
> AFAICT, libvirt has ceased to use all of these too.

No objections except possibly for -usbdevice.

Paolo


