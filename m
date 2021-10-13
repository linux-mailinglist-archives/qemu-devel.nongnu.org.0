Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B61442C13A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:17:49 +0200 (CEST)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mae8i-00081O-AZ
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mae1v-0002Nj-1Z; Wed, 13 Oct 2021 09:10:47 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:59096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mae1s-0005yy-Cx; Wed, 13 Oct 2021 09:10:46 -0400
Received: from [192.168.15.165] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 0B2DB21C32;
 Wed, 13 Oct 2021 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1634130640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/C8L/g392joCYb3gBrXTCXn7SPx1r6jDP0WBEzyUsg=;
 b=E5Nf3bvvoUDnYsICPlzyrXTxm2p54VgG/n41mR9Ru7GFumqxk6vnGRYhNsqVGf9iCyPd5v
 W9mKgt/QQCT9rzw7D+zHAFXKEW4NUgdH+6iFA3V0EvnjCKnKR95zv2R4KI8athCHUJUsib
 5rrdZpMpd27izJmt7mv4DsOcRqIRKLE=
Message-ID: <5a732276-a974-1a8c-7f45-921713454bfa@greensocs.com>
Date: Wed, 13 Oct 2021 15:10:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 09/15] softmmu/qdev-monitor: add error handling in
 qdev_set_id
Content-Language: en-US-large
To: Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-10-kwolf@redhat.com>
 <20211011210025.kq4qjwn7kzfcwwl5@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20211011210025.kq4qjwn7kzfcwwl5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: lvivier@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 libvir-list@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@virtuozzo.com,
 its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/11/21 23:00, Eric Blake wrote:
> On Fri, Oct 08, 2021 at 03:34:36PM +0200, Kevin Wolf wrote:
>> From: Damien Hedde <damien.hedde@greensocs.com>
>>
>> qdev_set_id() is mostly used when the user adds a device (using
>> -device cli option or device_add qmp command). This commit adds
>> an error parameter to handle the case where the given id is
>> already taken.
>>
>> Also document the function and add a return value in order to
>> be able to capture success/failure: the function now returns the
>> id in case of success, or NULL in case of failure.
>>
>> The commit modifies the 2 calling places (qdev-monitor and
>> xen-legacy-backend) to add the error object parameter.
>>
>> Note that the id is, right now, guaranteed to be unique because
>> all ids came from the "device" QemuOptsList where the id is used
>> as key. This addition is a preparation for a future commit which
>> will relax the uniqueness.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> ---
> 
>> +        } else {
>> +            error_setg(errp, "Duplicate device ID '%s'", id);
>> +            return NULL;
> 
> id is not freed on this error path...
> 

>>   
>>   DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>> @@ -691,7 +703,13 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>>           }
>>       }
>>   
>> -    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)));
>> +    /*
>> +     * set dev's parent and register its id.
>> +     * If it fails it means the id is already taken.
>> +     */
>> +    if (!qdev_set_id(dev, g_strdup(qemu_opts_id(opts)), errp)) {
>> +        goto err_del_dev;
> 
> ...nor on this, which means the g_strdup() leaks on failure.
> 

Since we strdup the id just before calling qdev_set_id.
Maybe we should do the the strdup in qdev_set_id (and free things on 
error there too). It seems simplier than freeing things on the callee 
side just in case of an error.


Damien





