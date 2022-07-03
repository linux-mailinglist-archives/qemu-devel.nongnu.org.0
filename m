Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A742564A46
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 00:22:29 +0200 (CEST)
Received: from localhost ([::1]:46672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o87z2-0004CD-40
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 18:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o87xa-0003N7-8P
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 18:20:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o87xX-0005Ec-6Q
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 18:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656886853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vlQLSbqJBQketzMjjZbbCAepc2kNUR142aRsDmBDElI=;
 b=GiTrgPAiKtEK3/cs4z9PlbX10fLo7L6ayeybjbwFFKW/adswTO1ORkLUosjFIsn6to9FL9
 C2SEyxTe9MD8SwnV2MSnMmoHAkrfP/wSQMIDzLGc4sz6ix/THdbacomoScDp7z7JsLNaQb
 g4PlKRJC1fc8a9hH/ZfYFaEwmVNpP8g=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-IOGwCqwOONWJqshsMHAqfQ-1; Sun, 03 Jul 2022 18:20:52 -0400
X-MC-Unique: IOGwCqwOONWJqshsMHAqfQ-1
Received: by mail-il1-f198.google.com with SMTP id
 e4-20020a92de44000000b002dab11299d9so3331397ilr.9
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 15:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vlQLSbqJBQketzMjjZbbCAepc2kNUR142aRsDmBDElI=;
 b=C69xsHvOSe1bbdtpbIKNCulOEMl0Dj0gKcoLGoXLrGHzgZo4szeBfwq6BKzy3NFYX+
 fN6BcY7gKAzCS5mBzYAxSPd6scNuOz6l6ikUCdvWKufKDRf3RvyVYgluh48AquUK15M6
 LTC5YE9gTvBj6dwSukIz7O9T4pdi0aKrOwLAbe7pV3oPvHJqoTvNswnF2SN/xP8QTl37
 AX1hr+6KewJ0wh2VGgoZWv6kv8Yc9EOtcdi0AT8tyMQ2kQwil7r2veHV1bLs0tW7WIaY
 WH8mBOMTTjAKh2EmVGcVx4QUuppqoqJz7NjlsoDDsC7TPdNybjnplmhi9UT1EnLX2ao2
 3Xng==
X-Gm-Message-State: AJIora8XIMbJ4afczJuaPn1czR7nM6dJ7rh1BSM+5JcH7xuZlH5Ovg7m
 sgjI6aNVu48fo2fNQvjzxZehMXfKR/TbHKe2unx4HbQJ/CBrN7FzydfskZGGiW6XC/CBKJWua5F
 O2gRSDIVUM+1pKnfjP8dIK+bIHxCHPyA=
X-Received: by 2002:a05:6638:4088:b0:33c:dbe4:e84 with SMTP id
 m8-20020a056638408800b0033cdbe40e84mr13717346jam.130.1656886851853; 
 Sun, 03 Jul 2022 15:20:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vanaWBG8maQBTwZ8Yt3akp8UYDMe1mrQSKyqhtMX/pYvMYIL+bBvG9Lcm7ks8AwwUPpemDGp8TObDCYvp7zdM=
X-Received: by 2002:a05:6638:4088:b0:33c:dbe4:e84 with SMTP id
 m8-20020a056638408800b0033cdbe40e84mr13717325jam.130.1656886851638; Sun, 03
 Jul 2022 15:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220702113331.2003820-1-afaria@redhat.com>
 <20220702113331.2003820-5-afaria@redhat.com>
 <9ed28055-2420-823e-02ed-fdbdcbcd9bae@redhat.com>
In-Reply-To: <9ed28055-2420-823e-02ed-fdbdcbcd9bae@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Sun, 3 Jul 2022 23:20:15 +0100
Message-ID: <CAELaAXwwqTuNhLM75uFdxyffF9udmeYMXD4EhVKwYwtT8xgprg@mail.gmail.com>
Subject: Re: [RFC 4/8] Fix some direct calls from non-coroutine_fn to
 coroutine_fn
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Alberto Garcia <berto@igalia.com>,
 John Snow <jsnow@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Markus Armbruster <armbru@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 2, 2022 at 3:13 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> These functions should be coroutine_fn (all coroutine entry points
> should be).

Thanks, I see now that you fixed this in [1].

Alberto

[1] https://patchew.org/QEMU/20220509103019.215041-1-pbonzini@redhat.com/


