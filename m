Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A336F40D6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:15:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptn1G-0001um-Ma; Tue, 02 May 2023 06:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ptn1D-0001uO-Cl
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:14:00 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ptn1A-0006pP-OZ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:13:59 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 466DB60055;
 Tue,  2 May 2023 13:13:49 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b43b::1:1a] (unknown
 [2a02:6b8:b081:b43b::1:1a])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id lDKKKR0MhOs0-yS13cKAs; Tue, 02 May 2023 13:13:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683022428; bh=pSi72qgTLOr7y+lZyI9uP7L6l0uZHZA2Z7+wB5VAk5g=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=LtLL3UkayPK67I1EV8wc5gSSc73ew4EZpln7dIdqvoiX8H5KjJAMRPxHzQuVfJMvd
 U5YcMon9rqJ7NR6c1KMZotIYjSyz6Z5P5mp5SKL597gnuyPwOGm1ELbtbVj/omtddH
 1cycQ8b3IBL3yJQKZh6R1FqBOg4E9/TC9SV0OW+o=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7fa37044-07bd-245a-8129-8779b9d2805b@yandex-team.ru>
Date: Tue, 2 May 2023 13:13:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
Content-Language: en-US
To: quintela@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, armbru@redhat.com
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
 <20230426002135-mutt-send-email-mst@kernel.org>
 <bf295d76-9c33-4eca-4b88-2d1a299c8b94@yandex-team.ru>
 <20230502054519-mutt-send-email-mst@kernel.org>
 <875y9bujol.fsf@secure.mitica>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <875y9bujol.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02.05.23 13:11, Juan Quintela wrote:
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>>>> CC pbonzini,dgilbert,quintela,armbru : guys, is poking at runstate_check like
>>>> this the right way to figure out we are not going to use the
>>>> device locally before incoming migration will overwrite ROM contents?
>>>
>>> RUN_STATE_INMIGRATE is set in the only one place in qemu_init() when
>>> we parse cmdline option -incoming. VM is not running for sure. And
>>> starting the VM comes with changing the state. So it's OK.
>>>
>>> The possible problem, if we add netcard on target which we didn't
>>> have on source. I now checked, this works.. But that doesn't seem
>>> correct to add device that was not present on source - how would it
>>> work - it's not guaranteed anyway.
>>
>> You can add it on source too while migration is in progress, no?
> 
> DeviceState *qdev_device_add_from_qdict(const QDict *opts,
>                                          bool from_json, Error **errp)
> {
>      ....
>      if (!migration_is_idle()) {
>          error_setg(errp, "device_add not allowed while migrating");
>          return NULL;
>      }
> 
> It should be similar for unplug.
> 
> We only support hotplug for some devices during migration, and we
> shouldn't need any.
> 
> What I think he means is that you can add a device on the command line
> on destination that don't exist on the source machine, and that will
> confuse things.

Yes, that what I mean

> 
> In that case, I would say that the problem is that you are doing
> something not supported.  You are expected that when you run migration
> you use the same command line that on source, module whatever
> hot[un]plug operations you have done before migration.

Agree

> 
> Anything else is not supported.
> And for instance, if you are using libvirt, it will do the right thing.
> 
> Later, Juan.
> 

Thanks!

-- 
Best regards,
Vladimir


