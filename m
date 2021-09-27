Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BE2419253
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:38:50 +0200 (CEST)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUo24-0006Ps-V8
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mUnxE-0003ky-8v; Mon, 27 Sep 2021 06:33:48 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:57252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mUnx7-0003sg-Px; Mon, 27 Sep 2021 06:33:47 -0400
Received: from [192.168.15.164] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7D0AB20777;
 Mon, 27 Sep 2021 10:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632738814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=db5qkmM+2vNNgmbl2hoTf61puFV6WIfM7ENDnHPGMpQ=;
 b=WjqsSm8DaebBVLYDfJvo9iIHUfIv2+tx08XhHxzTRSY+ClfgCrqVgBUT1l8CsewZY4WkI3
 lm9A3QzIYwESzVfEnjcgQTLiq9WsjU3qbk55ul3P/Sf94uA5/q5PbzN4cRbvD7w/Sh3JP7
 KiGxtZopyLX0AUdCIpw7UsrLeBM8qxc=
Message-ID: <90412958-721b-4ae8-0177-3ae6af8394af@greensocs.com>
Date: Mon, 27 Sep 2021 12:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 06/11] qdev: Add Error parameter to qdev_set_id()
Content-Language: en-US-large
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-7-kwolf@redhat.com>
 <7b9afc35-af95-ad21-6296-7e112ada9c87@virtuozzo.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <7b9afc35-af95-ad21-6296-7e112ada9c87@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kevin,

I proposed a very similar patch in our rfc series because we needed some 
of the cleaning you do here.
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05679.html
I've added a bit of doc for the function, feel free to take it if you want.

On 9/24/21 16:09, Vladimir Sementsov-Ogievskiy wrote:
> 24.09.2021 12:04, Kevin Wolf wrote:
>> object_property_add_child() fails (with &error_abort) if an object with
>> the same name already exists. As long as QemuOpts is in use for -device
>> and device_add, it catches duplicate IDs before qdev_set_id() is even
>> called. However, for enabling non-QemuOpts code paths, we need to make
>> sure that the condition doesn't cause a crash, but fails gracefully.
>>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> ---
>>   include/monitor/qdev.h      |  2 +-
>>   hw/xen/xen-legacy-backend.c |  3 ++-
>>   softmmu/qdev-monitor.c      | 16 ++++++++++------
>>   3 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
>> index 389287eb44..7961308c75 100644
>> --- a/include/monitor/qdev.h
>> +++ b/include/monitor/qdev.h
>> @@ -9,6 +9,6 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, 
>> Error **errp);
>>   int qdev_device_help(QemuOpts *opts);
>>   DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
>> -void qdev_set_id(DeviceState *dev, char *id);
>> +void qdev_set_id(DeviceState *dev, char *id, Error **errp);
>>   #endif
>> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
>> index dd8ae1452d..17aca85ddc 100644
>> --- a/hw/xen/xen-legacy-backend.c
>> +++ b/hw/xen/xen-legacy-backend.c
>> @@ -276,7 +276,8 @@ static struct XenLegacyDevice 
>> *xen_be_get_xendev(const char *type, int dom,
>>       xendev = g_malloc0(ops->size);
>>       object_initialize(&xendev->qdev, ops->size, TYPE_XENBACKEND);
>>       OBJECT(xendev)->free = g_free;
>> -    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, 
>> dev));
>> +    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev),
>> +                &error_abort);
>>       qdev_realize(DEVICE(xendev), xen_sysbus, &error_fatal);
>>       object_unref(OBJECT(xendev));
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 1207e57a46..c2af906df0 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -593,26 +593,27 @@ static BusState *qbus_find(const char *path, 
>> Error **errp)
>>   }
>>   /* Takes ownership of @id, will be freed when deleting the device */
>> -void qdev_set_id(DeviceState *dev, char *id)
>> +void qdev_set_id(DeviceState *dev, char *id, Error **errp)
> 
> According to recommendations in error.h, worth adding also return value 
> (for example true=success false=failure), so [..]
> 
>>   {
>>       if (id) {
>>           dev->id = id;
>>       }
> 
> Unrelated but.. What's the strange logic?
> 
> Is it intended that with passed id=NULL we don't update dev->id variable 
> but try to do following logic with old dev->id?

dev->id is expected to be NULL. The object is created just before 
calling this function so it is always the case. We could probably assert 
this.

> 
>>       if (dev->id) {
>> -        object_property_add_child(qdev_get_peripheral(), dev->id,
>> -                                  OBJECT(dev));
>> +        object_property_try_add_child(qdev_get_peripheral(), dev->id,
>> +                                      OBJECT(dev), errp);
>>       } else {
>>           static int anon_count;
>>           gchar *name = g_strdup_printf("device[%d]", anon_count++);
>> -        object_property_add_child(qdev_get_peripheral_anon(), name,
>> -                                  OBJECT(dev));
>> +        object_property_try_add_child(qdev_get_peripheral_anon(), name,
>> +                                      OBJECT(dev), errp);
>>           g_free(name);
>>       }
>>   }
>>   DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>>   {
>> +    ERRP_GUARD();
>>       DeviceClass *dc;
>>       const char *driver, *path;
>>       DeviceState *dev = NULL;
>> @@ -691,7 +692,10 @@ DeviceState *qdev_device_add(QemuOpts *opts, 
>> Error **errp)
>>           }
>>       }
>> -    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)));
>> +    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)), errp);
>> +    if (*errp) {
>> +        goto err_del_dev;
>> +    }
> 
> [..] here we'll have
> 
> if (!qdev_set_id(...)) {
>    goto err_del_dev;
> }
> 
> and no need for ERRP_GUARD.
> 
>>       /* set properties */
>>       if (qemu_opt_foreach(opts, set_property, dev, errp)) {
>>
> 
> 

