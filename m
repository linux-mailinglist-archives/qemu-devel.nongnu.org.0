Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E496E13C8
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 19:55:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn193-0003xH-8i; Thu, 13 Apr 2023 13:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pn191-0003x8-Gd
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:54:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pn18z-0000JB-Bn
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681408438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRYSNUK74GeluGwfdjYzwfFGoSiHDl7W+HJXPP3F5LA=;
 b=ad7nhalGv6BvgWMkyIDppUwrPQpv5A3N7bdlGffRuIV36xYbpzKiGRx9wtdSQiG2569rlV
 2o9MibiiTYjROqBk5Si/kQW+RUqVZuqA67/6zicLO3NyDYNgOqCDHriEfl7FMldnPulQAm
 LjOgJqb3dEzOZuzhBXjYotP5+qL6Mv0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-anv6VypIMzysMujjekU7zQ-1; Thu, 13 Apr 2023 13:53:56 -0400
X-MC-Unique: anv6VypIMzysMujjekU7zQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k29-20020a05600c1c9d00b003ee89ce8cc3so6023393wms.7
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 10:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681408435; x=1684000435;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dRYSNUK74GeluGwfdjYzwfFGoSiHDl7W+HJXPP3F5LA=;
 b=FZzc3bzpWC+TTsHVJ3dACVRFlrQFYWZ9l9LG09rr06leg1F5cl2sjoaBz984quuZo3
 IUCi1d1u2YxI1oKgXGB9cIL5ObegVjwmhyUNuBY4bueQDAgCeYJz9v/2mVNxUDrHFUfe
 ShYCDL10qnPPk9Ubw6gghKvbk2XTxfL7t+Btgld1YOumf1MCD8hETkLDmCUaJKjmZr9a
 DJb9KPG84xLNwGpbGVq3AbvXpk7XJOSYGlmiyQ+UOjahe3R8MPNWfR/90+bWa+L4Y5rC
 yvvPkuLFZrwRJiV8Aj28/7b3W6wmWnbqFmx+4tQ8dj3tAeKv1sOktwCQ+R7dKdIjiq7A
 Whqg==
X-Gm-Message-State: AAQBX9esI21WhelMVeLD2+KDAd5fn8GE94aIDm7o5sRhqTT9zkbOZQWI
 ljOPOwiZvoPIv/0IwO8RSNQqOqeKUt032+nJixvUnXj55viL0rdba9KYLxvghezBiywdX+4J9B9
 cS0GautEHk6NGIlc=
X-Received: by 2002:a5d:6a52:0:b0:2f4:7cd2:8ed1 with SMTP id
 t18-20020a5d6a52000000b002f47cd28ed1mr2254001wrw.24.1681408435704; 
 Thu, 13 Apr 2023 10:53:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350bamveaQQpnDH1apEcTurMjTNBHMWglUi+NOVFs9pfVXfhzYQZrveRf0mhva8aS8q5Ggkw25g==
X-Received: by 2002:a5d:6a52:0:b0:2f4:7cd2:8ed1 with SMTP id
 t18-20020a5d6a52000000b002f47cd28ed1mr2253989wrw.24.1681408435381; 
 Thu, 13 Apr 2023 10:53:55 -0700 (PDT)
Received: from ?IPV6:2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e?
 (p200300cfd735c67f6ed98c907a1de97e.dip0.t-ipconnect.de.
 [2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a5d58c5000000b002f47ae62fe0sm1748868wrf.115.2023.04.13.10.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 10:53:54 -0700 (PDT)
Message-ID: <db66184c-a6ab-f4e0-2740-e4bcd6a65993@redhat.com>
Date: Thu, 13 Apr 2023 19:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Virtio-fs] [PATCH 0/4] vhost-user-fs: Internal migration
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela
 <quintela@redhat.com>, qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Anton Kuchin <antonkuchin@yandex-team.ru>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230413120554-mutt-send-email-mst@kernel.org>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230413120554-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13.04.23 18:11, Michael S. Tsirkin wrote:
> On Tue, Apr 11, 2023 at 05:05:11PM +0200, Hanna Czenczek wrote:
>> RFC:
>> https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg04263.html
>>
>> Hi,
>>
>> Patch 2 of this series adds new vhost methods (only for vhost-user at
>> this point) for transferring the back-end’s internal state to/from qemu
>> during migration, so that this state can be stored in the migration
>> stream.  (This is what we call “internal migration”, because the state
>> is internally available to qemu; this is in contrast to “external
>> migration”, which Anton is working on, where the back-end’s state is
>> handled by the back-end itself without involving qemu.)
>>
>> For this, the state is handled as a binary blob by qemu, and it is
>> transferred over a pipe that is established via a new vhost method.
>>
>> Patch 3 adds two high-level helper functions to (A) fetch any vhost
>> back-end’s internal state and store it in a migration stream (a
>> `QEMUFile`), and (B) load such state from a migrations stream and send
>> it to a vhost back-end.  These build on the low-level interface
>> introduced in patch 2.
>>
>> Patch 4 then uses these functions to implement internal migration for
>> vhost-user-fs.  Note that this of course depends on support in the
>> back-end (virtiofsd), which is not yet ready.
>>
>> Finally, patch 1 fixes a bug around migrating vhost-user devices: To
>> enable/disable logging[1], the VHOST_F_LOG_ALL feature must be
>> set/cleared, via the SET_FEATURES call.  Another, technically unrelated,
>> feature exists, VHOST_USER_F_PROTOCOL_FEATURES, which indicates support
>> for vhost-user protocol features.  Naturally, qemu wants to keep that
>> other feature enabled, so it will set it (when possible) in every
>> SET_FEATURES call.  However, a side effect of setting
>> VHOST_USER_F_PROTOCOL_FEATURES is that all vrings are disabled.
>
> I didn't get this part.
> Two questions:
> 	Rings can be enabled or disabled by ``VHOST_USER_SET_VRING_ENABLE``.
>
> 	If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
> 	ring starts directly in the enabled state.
>
> 	If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
> 	initialized in a disabled state and is enabled by
> 	``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.
>
> so VHOST_USER_F_PROTOCOL_FEATURES only controls initial state of rings,
> it does not disable rings.

Oh.  Thanks. :)

That’s indeed a valid and more sensible interpretation.  I know that the 
vhost-user-backend crate virtiofsd uses has interpreted it differently.  
Looking into libvhost-user and DPDK, both have decided to instead have 
all vrings be disabled at reset, and enable them only when a 
SET_FEATURES with F_PROTOCOL_FEATURES comes in.  Doesn’t sound quite 
literally to spec either, but adheres to the interpretation of not 
disabling any rings just because F_PROTOCOL_FEATURES appears.

(I thought of proposing this (“only disable vrings for a `false` -> 
`true` flag state transition”), but thought that’d be too complicated.  
Oh, well. :))

So, the fix will go to the vhost-user-backend crate instead of qemu.  
That’s good!

Still, I will also prepare a patch to vhost-user.rst for this, because I 
still don’t find the specification clear on this.  The thing is, nobody 
interprets it as “negotiating this feature will decide whether, when all 
rings are initialized, they will be initialized in disabled or enabled 
state”, which is how I think you’ve interpreted it.  The problem is that 
“initialization” isn’t well-defined here.

Even libvhost-user and DPDK initialize the rings always in disabled 
state, regardless of this feature, but will put them into an enabled 
state later on if the feature isn’t negotiated.  I think this exact 
behavior should be precisely described in the spec, like:

Between initialization and ``VHOST_USER_SET_FEATURES``, it is 
implementation-defined whether each ring is enabled or disabled.

If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, each 
ring, when started, will be enabled immediately.

If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, each ring 
will remain in the disabled state until ``VHOST_USER_SET_VRING_ENABLE`` 
enables it with parameter 1.

Hanna


