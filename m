Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1F06FCA84
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:49:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPZr-0002h1-Fz; Tue, 09 May 2023 11:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwPZp-0002gZ-5r
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:48:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwPZn-0006dW-Ni
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683647311;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JsJpSlLA2NwIZr/Hbd53DzNSwBo26FKdTD1r7pXMxcg=;
 b=Hns+VR5NnpkHYraWprGEqwj/iheVHRxtze6f0Yr9tVEcnsxdXVxC8U1/HyL1YdRtaXUS8Q
 iBSJVvHVVxf9FQ+RpZTcK41nqecL8HgAtG0RaKfUpBnGsdsSGKSOP5Z02vtd5CaAI8rlOy
 icWCYHoJ6dwKACTmKsRcVUEHrd/K11o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-misRrGjlOlCmigQoIfqfKQ-1; Tue, 09 May 2023 11:48:29 -0400
X-MC-Unique: misRrGjlOlCmigQoIfqfKQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f42d18a079so3598285e9.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683647309; x=1686239309;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JsJpSlLA2NwIZr/Hbd53DzNSwBo26FKdTD1r7pXMxcg=;
 b=EFVpXwXhQ9NXRhOJwTuMMPPKpXW6uQX4AXyuqNqPES0tPqSuaWPTfXsB5LNac9JMlo
 AUI+gysYAvkDFv+n0fLnLJeoxagsIxIdaeIZuTSI/9Cy/ffpta2LOykMe2KkcjVEkV1a
 P1TtNmQL3CpWoYMdIOc8UKcdJIl65zm6uLQZ6/9mPo/Z4fsAMWsMMWTYUdmInNZFhzN6
 mjyEAO1ZUtpli3u5AHwSCsMsBlzZh40/pbI22kiBcVfHY35vituPPzoL1Pd5yA5HNzI4
 jz1YAjlfSXIUsmcMxLRo1pZDCheE9DY+pMsrYvHCj4hEn7NDnXx/pzIG2cv6n1hpGdsT
 6bew==
X-Gm-Message-State: AC+VfDz+pyMry5wHHE1yIenSpSQjskoASyXSp+mTf3S7R9LWmlwa6fVc
 aj8yHrB39Rnj8wXXl5GgNLKieTmYnM/mzsCfmJzYpPcDrYyPagg2Ait0xv2hLwQijqDAT5A2rlV
 GdlCTpx1Xlv1GEM4=
X-Received: by 2002:a7b:c5c3:0:b0:3f3:2ba9:94e1 with SMTP id
 n3-20020a7bc5c3000000b003f32ba994e1mr9977839wmk.25.1683647308839; 
 Tue, 09 May 2023 08:48:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6CUkLhH9DS+PNboOoX++yXCEvpvISSizMf1qWrP4UZG+EKYEZ2vY92TvU2I8SZ99KpLAZe5g==
X-Received: by 2002:a7b:c5c3:0:b0:3f3:2ba9:94e1 with SMTP id
 n3-20020a7bc5c3000000b003f32ba994e1mr9977819wmk.25.1683647308486; 
 Tue, 09 May 2023 08:48:28 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 n6-20020a7bcbc6000000b003f33f8f0a05sm20288214wmi.9.2023.05.09.08.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 08:48:27 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org,  marcel.apfelbaum@gmail.com,  philmd@linaro.org,
 david@redhat.com,  peterx@redhat.com,  pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru,  lersek@redhat.com,  kraxel@redhat.com,
 dgilbert@redhat.com,  armbru@redhat.com
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
In-Reply-To: <20230502072501-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Tue, 2 May 2023 07:26:43 -0400")
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
 <20230426002135-mutt-send-email-mst@kernel.org>
 <bf295d76-9c33-4eca-4b88-2d1a299c8b94@yandex-team.ru>
 <20230502054519-mutt-send-email-mst@kernel.org>
 <875y9bujol.fsf@secure.mitica>
 <20230502072501-mutt-send-email-mst@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 17:48:27 +0200
Message-ID: <87cz39cxpw.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Tue, May 02, 2023 at 12:11:38PM +0200, Juan Quintela wrote:
>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> 
>> >> > CC pbonzini,dgilbert,quintela,armbru : guys, is poking at runstate_check like
>> >> > this the right way to figure out we are not going to use the
>> >> > device locally before incoming migration will overwrite ROM contents?
>> >> 
>> >> RUN_STATE_INMIGRATE is set in the only one place in qemu_init() when
>> >> we parse cmdline option -incoming. VM is not running for sure. And
>> >> starting the VM comes with changing the state. So it's OK.
>> >> 
>> >> The possible problem, if we add netcard on target which we didn't
>> >> have on source. I now checked, this works.. But that doesn't seem
>> >> correct to add device that was not present on source - how would it
>> >> work - it's not guaranteed anyway.
>> >
>> > You can add it on source too while migration is in progress, no?
>> 
>> DeviceState *qdev_device_add_from_qdict(const QDict *opts,
>>                                         bool from_json, Error **errp)
>> {
>>     ....
>>     if (!migration_is_idle()) {
>>         error_setg(errp, "device_add not allowed while migrating");
>>         return NULL;
>>     }
>> 
>> It should be similar for unplug.
>> 
>> We only support hotplug for some devices during migration, and we
>> shouldn't need any.
>> 
>> What I think he means is that you can add a device on the command line
>> on destination that don't exist on the source machine, and that will
>> confuse things.
>> 
>> In that case, I would say that the problem is that you are doing
>> something not supported.  You are expected that when you run migration
>> you use the same command line that on source, module whatever
>> hot[un]plug operations you have done before migration.
>> 
>> Anything else is not supported.
>> And for instance, if you are using libvirt, it will do the right thing.
>> 
>> Later, Juan.
>
> OK, so you ack this patch?

Reviewed-by: Juan Quintela <quintela@redhat.com>

It is ok, or should I do it at toplevel?

Later, Juan.


