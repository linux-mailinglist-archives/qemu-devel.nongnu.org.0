Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C7D209EE3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 14:51:39 +0200 (CEST)
Received: from localhost ([::1]:33040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joRLu-00006r-4C
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 08:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joRL9-000867-3e
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:50:51 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31726
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joRL6-0001BG-NQ
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593089447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cb9rjgVHK9ZSO95oudN0TY8RsdjmqgNZD/MXtS8OJD0=;
 b=dOL18td3w07ZX5I+GMf8a+/ijJ+oBKNOK9Nls4UVCLYDzoR//X+Q7bSJkiWk/0tq0kSiAV
 rPlbbPJLQ/TdwJz3YvOP7M5TbE6KpekmuYUJnZclh7Y7hGo3aZ0AL65IdQ1x4khPeetXbU
 QGL63bLf1iGD+WgzimU4BqX2pJHoOqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-ltLve2uePEq2SFBY1P21Kw-1; Thu, 25 Jun 2020 08:50:45 -0400
X-MC-Unique: ltLve2uePEq2SFBY1P21Kw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7498718A0760;
 Thu, 25 Jun 2020 12:50:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 414E29CA0;
 Thu, 25 Jun 2020 12:50:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BCB1011384D4; Thu, 25 Jun 2020 14:50:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 07/46] error: Avoid more error_propagate() when error is
 not used here
References: <20200624164344.3778251-1-armbru@redhat.com>
 <20200624164344.3778251-8-armbru@redhat.com>
 <88bc4c25-4a47-4c28-4b96-b7ea6c14173d@redhat.com>
Date: Thu, 25 Jun 2020 14:50:42 +0200
In-Reply-To: <88bc4c25-4a47-4c28-4b96-b7ea6c14173d@redhat.com> (Eric Blake's
 message of "Wed, 24 Jun 2020 13:21:30 -0500")
Message-ID: <87h7uz1f8d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 02:30:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 6/24/20 11:43 AM, Markus Armbruster wrote:
>> When all we do with an Error we receive into a local variable is
>> propagating to somewhere else, we can just as well receive it there
>> right away.  The previous commit did that for simple cases with
>> Coccinelle.  Do it for a few more manually.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   blockdev.c     |  5 +----
>>   hw/core/numa.c | 44 ++++++++++++++------------------------------
>>   qdev-monitor.c | 11 ++++-------
>>   3 files changed, 19 insertions(+), 41 deletions(-)
>>
>> diff --git a/blockdev.c b/blockdev.c
>> index b66863c42a..73736a4eaf 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -1009,13 +1009,10 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
>>       }
>>         /* Actual block device init: Functionality shared with
>> blockdev-add */
>> -    blk = blockdev_init(filename, bs_opts, &local_err);
>> +    blk = blockdev_init(filename, bs_opts, errp);
>>       bs_opts = NULL;
>>       if (!blk) {
>> -        error_propagate(errp, local_err);
>>           goto fail;
>> -    } else {
>> -        assert(!local_err);
>
> Loses an assertion that blockdev_init() doesn't mis-use errp, but I
> think the goal of your cleanup work has been to make it easier to
> prove any function follows the rules, so the assertion doesn't add
> much at this point.

This is an early use of Error in the block layer.  Back then, we were
concerned about functions that are supposed to either return a value or
set an error doing both or none.  Since then, we've tacitly decided such
programming mistakes are too unlikely to be worth littering the code
with assertions.  Error handling is tediously verbose even without them.

Since this series is about making it somewhat less tediously verbose...

>> +++ b/qdev-monitor.c
>> @@ -600,7 +600,6 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>>       const char *driver, *path;
>>       DeviceState *dev = NULL;
>>       BusState *bus = NULL;
>> -    Error *err = NULL;
>>       bool hide;
>>         driver = qemu_opt_get(opts, "driver");
>> @@ -655,15 +654,14 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>>       dev = qdev_new(driver);
>>         /* Check whether the hotplug is allowed by the machine */
>> -    if (qdev_hotplug && !qdev_hotplug_allowed(dev, &err)) {
>> +    if (qdev_hotplug && !qdev_hotplug_allowed(dev, errp)) {
>>           /* Error must be set in the machine hook */
>> -        assert(err);
>
> Another such case.
>
>>           goto err_del_dev;
>>       }
>>         if (!bus && qdev_hotplug &&
>> !qdev_get_machine_hotplug_handler(dev)) {
>>           /* No bus, no machine hotplug handler --> device is not hotpluggable */
>> -        error_setg(&err, "Device '%s' can not be hotplugged on this machine",
>> +        error_setg(errp, "Device '%s' can not be hotplugged on this machine",
>
> Should we s/can not/cannot/ while touching this?

The longer and the more mechanical the patch, the less willing I am to
include "while we're there" improvements.  This one may still be okay.
But you pointed out a few more error message improvements in later
reviews.  Perhaps collecting them all into an omnibus error message
patch would be better.

> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


