Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65776F40CC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:13:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmz7-000127-70; Tue, 02 May 2023 06:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptmz5-00011j-AK
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptmz3-0005l1-Je
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683022304;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=a7xOA8GfMOYr6EamFKIwbDPjENYW1d2NU7aW8ptVM40=;
 b=HE9bh++9+dWWP5DYtt/B+tK+PpC+poQjw/2ReZFSMoZaK3XclP/8h/NZCPtTiWdm8eiB8u
 RxQq6m7cSLaI6wCeCa2ZjRl15/ZZrZe+2igTRCDzw+e+568X1XUxSR4LBmOPv7ESfy4bIw
 k7NHyna/cB/g1SMc/q6SEEGjwBG9xHw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-U6e0mAatNCG3BHCNARoCZg-1; Tue, 02 May 2023 06:11:43 -0400
X-MC-Unique: U6e0mAatNCG3BHCNARoCZg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30629b36d9bso874337f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683022302; x=1685614302;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7xOA8GfMOYr6EamFKIwbDPjENYW1d2NU7aW8ptVM40=;
 b=TM9VRtG5klqeQ1kpPjXtcMwbGj8rRwwbkJm9Z7icwVgpFM98KVWYOt+JhTNGYdQNGo
 zhaAxWlmaTxx+6EyYdY/LZzdSC20gXRXYvQkq+gE/TIc5Q3ury/knK3CPCgdI7npVpvd
 rlNe86135YikyTDQOV5UTxGm5ltcPfyvMStjWCckU286qTurjG+yLBSeaDOQnPVNP/x2
 23dR2OfPIWOW+JBio7DI+a0d3t//hUlE3BvloUCesSw/TxAPpndwL1ecJVy/kmn+Rbhw
 5TDPnJOVRGOd8MC4wR5vWUCOZSr6TOF6N9SHjiVpVsbxGMdhgPAER+YgceJwx56Q2Pux
 xOqA==
X-Gm-Message-State: AC+VfDz/HbZIQJ7uCNZqJybKNKeosX1/wyOTs2B3g+NN3umgagt8PlkM
 2K0pMzbcuCeYJXjAYXsW/nv+CgqFogB/CrI8a3zfGi4JPsAVIvrS7LASUvDUpb6j3Xw+OeZtGed
 lLl3SZRAk7EWscP4=
X-Received: by 2002:a5d:6901:0:b0:2ce:aa2d:c625 with SMTP id
 t1-20020a5d6901000000b002ceaa2dc625mr12008196wru.22.1683022302021; 
 Tue, 02 May 2023 03:11:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Pa3uYd4nUBvvwdJbdfgkMYTha2K4BYCkdFEnN7GbX7aGToXuwb7uLuoUXlLLRlKY6VjtlEQ==
X-Received: by 2002:a5d:6901:0:b0:2ce:aa2d:c625 with SMTP id
 t1-20020a5d6901000000b002ceaa2dc625mr12008180wru.22.1683022301659; 
 Tue, 02 May 2023 03:11:41 -0700 (PDT)
Received: from redhat.com ([188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 u12-20020adfdd4c000000b0030635735a57sm1937603wrm.60.2023.05.02.03.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 03:11:40 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org,  marcel.apfelbaum@gmail.com,  philmd@linaro.org,
 david@redhat.com,  peterx@redhat.com,  pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru,  lersek@redhat.com,  kraxel@redhat.com,
 dgilbert@redhat.com,  armbru@redhat.com
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
In-Reply-To: <20230502054519-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Tue, 2 May 2023 05:48:56 -0400")
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
 <20230426002135-mutt-send-email-mst@kernel.org>
 <bf295d76-9c33-4eca-4b88-2d1a299c8b94@yandex-team.ru>
 <20230502054519-mutt-send-email-mst@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 02 May 2023 12:11:38 +0200
Message-ID: <875y9bujol.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Michael S. Tsirkin" <mst@redhat.com> wrote:

>> > CC pbonzini,dgilbert,quintela,armbru : guys, is poking at runstate_check like
>> > this the right way to figure out we are not going to use the
>> > device locally before incoming migration will overwrite ROM contents?
>> 
>> RUN_STATE_INMIGRATE is set in the only one place in qemu_init() when
>> we parse cmdline option -incoming. VM is not running for sure. And
>> starting the VM comes with changing the state. So it's OK.
>> 
>> The possible problem, if we add netcard on target which we didn't
>> have on source. I now checked, this works.. But that doesn't seem
>> correct to add device that was not present on source - how would it
>> work - it's not guaranteed anyway.
>
> You can add it on source too while migration is in progress, no?

DeviceState *qdev_device_add_from_qdict(const QDict *opts,
                                        bool from_json, Error **errp)
{
    ....
    if (!migration_is_idle()) {
        error_setg(errp, "device_add not allowed while migrating");
        return NULL;
    }

It should be similar for unplug.

We only support hotplug for some devices during migration, and we
shouldn't need any.

What I think he means is that you can add a device on the command line
on destination that don't exist on the source machine, and that will
confuse things.

In that case, I would say that the problem is that you are doing
something not supported.  You are expected that when you run migration
you use the same command line that on source, module whatever
hot[un]plug operations you have done before migration.

Anything else is not supported.
And for instance, if you are using libvirt, it will do the right thing.

Later, Juan.


