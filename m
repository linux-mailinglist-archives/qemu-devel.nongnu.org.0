Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A61E0772
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 09:02:59 +0200 (CEST)
Received: from localhost ([::1]:60886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jd78U-0007Zp-IZ
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 03:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jd77G-00075J-AV
 for qemu-devel@nongnu.org; Mon, 25 May 2020 03:01:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28141
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jd77F-0005ud-L2
 for qemu-devel@nongnu.org; Mon, 25 May 2020 03:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590390100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DaFI3P7YjCboMKvLuJ5BQ/bRjqhX+uKlkw3rHlTtDys=;
 b=OnrSWg3bMqL3X7o5056k1lbWHI+u5EHOOVmTvdppfN4smeVFvP7bnNbuJYRN3MFL83Kknb
 hR3bexPnRsT884laemZ8pEJ533GsAVM9UM0xsQxVCc++T9C21s3FiPu+4/RfHsuNtc0M17
 oZiM/LuZc5XWXNb+jT8V7SHwR1qEU+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-WHTv6ZZNNTSHGzAs0nlHVQ-1; Mon, 25 May 2020 03:01:37 -0400
X-MC-Unique: WHTv6ZZNNTSHGzAs0nlHVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A324D107ACCA;
 Mon, 25 May 2020 07:01:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E2AF8384C;
 Mon, 25 May 2020 07:01:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 92CA8113864A; Mon, 25 May 2020 09:01:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 50/55] s390x/event-facility: Simplify creation of SCLP
 event devices
References: <5c6028bd-0bab-6c78-90fe-f00e23ab71b9@redhat.com>
 <03AEEA41-0543-4097-8FFB-9E41038F31EE@redhat.com>
Date: Mon, 25 May 2020 09:01:30 +0200
In-Reply-To: <03AEEA41-0543-4097-8FFB-9E41038F31EE@redhat.com> (David
 Hildenbrand's message of "Thu, 21 May 2020 10:44:39 +0200")
Message-ID: <87k110fqgl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 01:54:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, ehabkost@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 pbonzini@redhat.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

>>> +static void realize_event_facility(DeviceState *dev, Error **errp)
>>> +{
>>> +    SCLPEventFacility *event_facility = EVENT_FACILITY(dev);
>>> +    Error *local_err = NULL;
>>> +
>>> +    qdev_realize(DEVICE(&event_facility->quiesce),
>>> +                 BUS(&event_facility->sbus), &local_err);
>>> +    if (local_err) {
>>> +        error_propagate(errp, local_err);
>>> +        return;
>>> +    }
>>> +    qdev_realize(DEVICE(&event_facility->cpu_hotplug),
>>> +                 BUS(&event_facility->sbus), errp);
>> 
>> Just wondering, do we have to care about un-realizing quiesce in case
>> this fails?
>
> Just remembered that we fail creating the machine and therefore abort. So not necessary :)

True.

But let's review briefly what happens when a realize method fails.

In theory, realize fails cleanly, i.e. doing nothing.  Another attempt
could be made then.

In practice, realize failure is always followed by destruction, unless
preempted by outright exit(1).

Destroying a device must also destroy its components.

Paolo, is destroying a realized device okay, or does it have to be
unrealized first?  I can't see automatic unrealize on destruction...

>>> }
>>> 
>>> static void reset_event_facility(DeviceState *dev)
>>> @@ -479,6 +467,7 @@ static void init_event_facility_class(ObjectClass *klass, void *data)
>>>     DeviceClass *dc = DEVICE_CLASS(sbdc);
>>>     SCLPEventFacilityClass *k = EVENT_FACILITY_CLASS(dc);
>>> 
>>> +    dc->realize = realize_event_facility;
>>>     dc->reset = reset_event_facility;
>>>     dc->vmsd = &vmstate_event_facility;
>>>     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>> 
>> 
>> LGTM
>> 
>> Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks!


