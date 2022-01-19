Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A381B493802
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:14:14 +0100 (CET)
Received: from localhost ([::1]:41100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7yn-0005F5-GO
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nA7ww-0004V9-IL
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:12:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nA7wu-0005hm-M0
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642587135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R8YbzVCHwAJ6c64zw1jv8Rdo8T+OTXyFS1S508IE6Yc=;
 b=Ab4UrZh+C4O72Gbz4RTirS+fur4itqyCTeNiHve2GKbNkEkG6LwblRl00WHKpRp5OqxJWD
 4YMQtKnms0DrYzW7ppwBtqVjbQt4lM1QlpCzzgWWkWpf/kFl34F0Z80eVQ91BybJnz194y
 StNxumENtyZjA7cjUsgzNprXJ9np+oI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-2AHep1-6OJS6kAxQhIE_6w-1; Wed, 19 Jan 2022 05:12:12 -0500
X-MC-Unique: 2AHep1-6OJS6kAxQhIE_6w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 260CB192CC43;
 Wed, 19 Jan 2022 10:12:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-16.ams2.redhat.com
 [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBC5860C5B;
 Wed, 19 Jan 2022 10:12:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1E793113865F; Wed, 19 Jan 2022 11:12:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: RFC: QMP configuration - allocating/setting qdev array properties?
References: <cccba1ec-34c7-73da-1100-416a0afa8cea@greensocs.com>
 <cd48c959-9262-cc42-73c0-3d10a4bd44b1@greensocs.com>
Date: Wed, 19 Jan 2022 11:12:03 +0100
In-Reply-To: <cd48c959-9262-cc42-73c0-3d10a4bd44b1@greensocs.com> (Damien
 Hedde's message of "Wed, 12 Jan 2022 10:47:54 +0100")
Message-ID: <87ee543uh8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Damien Hedde <damien.hedde@greensocs.com> writes:

> Hi Mirela,
>
> On 1/11/22 17:54, Mirela Grujic wrote:
>> Hi,
>> 
>> While working on a prototype and configuring a whole machine using
>> QMP we run into the following scenario.
>> 
>> Some device models use array properties.

A gift that keeps on giving...

>>                                          The array is allocated when
>> len-<arrayname> property is set, then, individual elements of the
>> array can be set as any other property (see description above the 
>> DEFINE_PROP_ARRAY definition in qdev-properties.h for more
>> details). We need to do both (allocate the array and set its
>> elements) before the device can be realized. Attempting to set
>> len-<arrayname> and array elements in a single device_add command
>> does not work because the order of setting properties is not
>> guaranteed, i.e. we're likely attempting to set an element of the
>> array that's not yet allocated.
>
> It happens because device options are stored in an optdict. When this
> optdict is traversed to set the qdev-properties, no specific order is
> used.

To be precise: it's stored in a QDict[*]

qdev_device_add_from_qdict() sets properties with
object_set_properties_from_qdict(), which iterates over the QDict in
unspecified order.

> Better json format support would probably solve this issue in the
> long-term. But right now, we are stuck with the optdict in the middle 
> which do not support advanced structure like lists or dictionaries.

I figure you mean actual array-valued properties, like

    'foo': [ 1, 2, 3 ]

instead of

    'len-foo': 3, 'len[0]': 1, 'len[1]': 2, 'len[2]': 3

> We could solve this by being more "smart" in when setting the
> properties. I'm not sure we can be really smart here and detect which 
> options is an array length but we could at least have some heuristic
> and for example: set first "len-xxx" properties so that array will be 
> allocated before being filled.

Ugh!

Another stop gap solution could be making QDict iterate in insertion
order, like Python dict does since 3.6.

>> Allowing the device initialize and realize phases to be split would 
>> solve this problem. For example, the device_add would be issued with
>> 'realized=false', we can set the len-<arrayname> in the same
>> device_add command or a following qom-set command, then we would use
>> a sequence of qom-set commands to set array elements, and at the
>> end, we would realize the device by issuing qom-set path=<device_id>
>> property=realized value=true. This is what we currently do in our
>> prototype.
>
> I think that is a bad idea. Because then the user would have access to
> a "not-realized" device (which is really a not-constructed object).
> It could then do anything with the object (which might work or not
> might). And at the end, maybe realize will fail and that would leave 
> qemu in a inconsistent state: the object will be used somewhere and at
> the same time it will be a state where it is not usable.

I don't regard a not-realized device as not-constructed object.
Construction is qdev_new().  We then configure by setting properties.
Realization makes the device accessible to the guest.

-device / device_add fuse all this into one operation: create device,
set the properties specified by the user, realize.

C code need not fuse like this.  There are places where we create
devices, then abandon them, i.e. destroy them without realizing.

I share your concern that providing the user the basic operations
unfused might expose more bugs.

In today's usage, a fused operation is all we need.  But when wiring up
complex composite devices in configuration rather than C code, we may
get to the point where we need the basic operations unfused.


[*] -device / device_add with a non-JSON argument go to QDict via
QemuOpts.  Doesn't matter here.


