Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C193D40006E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:23:36 +0200 (CEST)
Received: from localhost ([::1]:36888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9AN-0000e9-RK
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8wM-0008NP-7E
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:09:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8wK-0001aR-FE
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V+gx2ZV37n0r1wjvtRnl1zOB0aJr01rmmUAK0ovYuaU=;
 b=NnAKe8vQ3Am5035MYcDRNI4HYc3jcwcUnz1uBsZnt6CcscbWFTS2p2rq9rRbP+TMYElYz+
 uSM9IilqGCzOHZEpVfHapOrGD6bC/ZcROqba3hkQdAAaHwPyQhICnQK9IdalexFHm9+CHJ
 TDAlfAMAhvSHTFsPD1TqlNyYbo2HoLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-OinkoYl7Ot28fCsVTQLqkw-1; Fri, 03 Sep 2021 09:09:02 -0400
X-MC-Unique: OinkoYl7Ot28fCsVTQLqkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13C06107ACC7;
 Fri,  3 Sep 2021 13:09:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9966A6608B;
 Fri,  3 Sep 2021 13:08:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4D5BA11385C7; Wed,  1 Sep 2021 13:15:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v6 1/6] qmp: add QMP command x-debug-query-virtio
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-2-git-send-email-jonah.palmer@oracle.com>
 <87o8a9e8k8.fsf@dusky.pond.sub.org>
 <a018750e-7066-8582-67a9-31584e24338a@oracle.com>
 <87v93wcmva.fsf@dusky.pond.sub.org>
 <0298fc69-d7f7-ae7a-eb1d-ee553aaf8348@oracle.com>
Date: Wed, 01 Sep 2021 13:15:55 +0200
In-Reply-To: <0298fc69-d7f7-ae7a-eb1d-ee553aaf8348@oracle.com> (Jonah Palmer's
 message of "Thu, 26 Aug 2021 02:18:07 -0400")
Message-ID: <87o89cbl78.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 qemu-block@nongnu.org, david@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jonah Palmer <jonah.palmer@oracle.com> writes:

> No problem! Comments below:
>
> On 8/23/21 9:27 AM, Markus Armbruster wrote:

[...]

>> Hmm...  how is this enum used?  In this patch:
>>
>>      VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
>>      {
>>          VirtioInfoList *list = NULL;
>>          VirtioInfoList *node;
>>          VirtIODevice *vdev;
>>
>>          QTAILQ_FOREACH(vdev, &virtio_list, next) {
>>              DeviceState *dev = DEVICE(vdev);
>>              node = g_new0(VirtioInfoList, 1);
>>              node->value = g_new(VirtioInfo, 1);
>>              node->value->path = g_strdup(dev->canonical_path);
>> --->        node->value->type = qapi_enum_parse(&VirtioType_lookup, vdev->name,
>> --->                                            VIRTIO_TYPE_UNKNOWN, NULL);
>>              QAPI_LIST_PREPEND(list, node->value);
>>          }
>>
>>          return list;
>>      }
>>
>> This maps VirtioDevice member @name (a string) to an enum value.
>>
>> As far as I can tell, this member is set in virtio_init() only, to its
>> argument.  All callers pass string literals.  They also pass a numeric
>> device_id, and the two seem to match, e.g. "virtio-blk" and
>> VIRTIO_ID_BLOCK.
>>
>> Thus, the pairs (numeric device ID, string device ID) already exist in
>> the code, but not in a way that lets you map between them.  To get that,
>> you *duplicate* the pairs in QAPI.
>>
>> Having two copies means we get to keep them consistent.  Can we avoid
>> that?
>>
>> The enum has a special member 'unknown' that gets used when @name does
>> not parse as enum member, i.e. we failed at keeping the copies
>> consistent.  I'm afraid this sweeps a programming error under the rug.
>>
>> The enum has a bunch of dummy members like 'unknown-14' to make QAPI
>> generate numeric enum values match the device IDs.  Error prone.  Can't
>> see offhand why we need them to match.
>
> Sure, I don't mind doing this instead. Just as an FYI, from the previous
> RFC series (RFC v5 1/6), David recommended here that I create a list of
> all the types and in the same order as include/standard-headers/linux/virtio_ids.h.
>
> The benefit from this was that we never have to convert between the QAPI number
> and the header number.

Yes, but it comes with the disadvantages I listed above.

> Let me know if this is still something you'd like me to do!

I think it's simpler overall, especially if you can pick option
"2. Without QAPI enum VirtioType" below.

I could be wrong.  Suggest to try it out to see what you like better.

>>
>> What about the following.  Define a map from numeric device ID to
>> string, like so
>>
>>      const char *virtio_device_name[] = {
>>          [VIRTIO_ID_NET] = "virtio-net",
>>          [VIRTIO_ID_BLOCK] = "virtio-blk",
>>          ...
>>      }
>
> Sorry if this is obvious, but where should I define this mapping?
> virtio.c or virtio.h?

Variable definitions normally live in .c.

> Jonah
>
>> This lets you
>>
>> * map device ID to string by subscripting virtio_device_name[].
>>    Guarding with assert(device_id < G_N_ELEMENTS(virtio_device_name)) may
>>    be advisable.
>>
>> * map string to device ID by searching virtio_device_name[].  May want a
>>    function for that,
>>
>> Now you can have virtio_init() map parameter @device_id to string, and
>> drop parameter @name.
>>
>> Then you have two options:
>>
>> 1. With QAPI enum VirtioType
>>
>>     Define it without the special and the dummy members.
>>
>>     To map from string to QAPI enum, use qapi_enum_parse().
>>
>>     To map from QAPI enum to string, use VirtioType_str().
>>
>>     To map from QAPI enum to device ID, map through string.
>>
>> 2. Without QAPI enum VirtioType
>>
>>     Simply use uint16_t device_id, just like struct VirtioDevice.
>>
>> The choice between 1. and 2. depends on whether you actually need
>> additional functionality provided by QAPI, such as types being visible
>> in query-qmp-schema.
>>
>> [...]
>>


