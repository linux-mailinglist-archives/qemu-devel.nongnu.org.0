Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4C33598FF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:19:46 +0200 (CEST)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnIn-0000ml-KD
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUnI1-0000LT-2v
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:18:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUnHy-0008Aw-6i
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617959932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OykKmScdPrIDN6cFy+M8cOztiuwQvIrfyHVcyijUtlM=;
 b=UoH8EOB2X99MVWGDPNDMq/iAmym+4OSZk6SZgSXUipiNKr+/+eXTrbIsuBW9kuxEn0NBal
 lCjjrS/Y+zUBY9+LXhLMFevZ8kI2DAGH8AeLPESVyx0k53gab8fdjJguvRCrPHiO3KqJ4v
 oQlJjZKjipTHHvSARY3ErNbwKBvHUkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-ECBqZ-SgPbeq3tncxpw1mQ-1; Fri, 09 Apr 2021 05:18:51 -0400
X-MC-Unique: ECBqZ-SgPbeq3tncxpw1mQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 771CB8749BC
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 09:18:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0325819C66;
 Fri,  9 Apr 2021 09:18:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 675CB113525D; Fri,  9 Apr 2021 11:18:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: QMP introspecting device props common to a bus type
References: <YG23ILea4H36TllU@redhat.com> <87pmz5at1v.fsf@dusky.pond.sub.org>
 <YG77DnwTyCVPL3nw@redhat.com> <87o8eo9609.fsf@dusky.pond.sub.org>
 <20210409064642.ah2tz5vjz2ngfiyo@sirius.home.kraxel.org>
Date: Fri, 09 Apr 2021 11:18:42 +0200
In-Reply-To: <20210409064642.ah2tz5vjz2ngfiyo@sirius.home.kraxel.org> (Gerd
 Hoffmann's message of "Fri, 9 Apr 2021 08:46:42 +0200")
Message-ID: <87czv34xzh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang?= =?utf-8?Q?=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

>   Hi,
>
>> device-list-properties uses module_object_class_by_name(), requires the
>> result to be a concrete device type, iterates over QOM properties with
>> object_property_iter_init() / object_property_iter_next(), skipping
>> properties named "type", "realized", "hotpluggable", "hotplugged",
>> "parent_bus", and any whose starts with "legacy-".
>> 
>> Paolo, can you remind us why we skip the "legacy-FOO" properties?
>> 
>> qom-list-properties uses object_class_by_name(), requires an object type
>> (an interface won't do).  If it's abstract, it iterates with
>> object_class_property_iter_init() / object_property_iter_next(), else
>> with object_property_iter_init() / object_property_iter_next().  It
>> doesn't skip properties.
>> 
>> Looks like device-list-properties has become[*] pretty much redundant
>> *except* for the difference between module_object_class_by_name() and
>> object_class_by_name().
>> 
>> Gerd, you changed device-list-properties from object_class_by_name() to
>> module_object_class_by_name() in commit 7ab6e7fcce.  Should
>> qom-list-properties be changed, too?
>
> Makes sense.  We already have non-device modular objects
> (some chardevs).
>
>> If yes, is there any reason to use
>> object_class_by_name() for looking up user-provided type names in QMP
>> commands?
>
> I've tried to be conservative and call module_object_class_by_name()
> only in places where it is actually needed.  Reason one being the extra
> overhead.  But maybe this isn't too bad given the extra module code runs
> only on lookup failures.  Reason two is to avoid modules being loaded by
> accident even when not needed.  This needs checking when you try drop
> object_class_by_name().  A VM without --for example -- qxl device should
> not load the qxl module.

Yes, module load should be reasonably explicit, to avoid accidental
loading.

Automatic load on use is explicit enough.

Automatic load on introspection could perhaps be surprising.  I figure
it depends on how the introspection request is phrased.  Loading X on
"tell me more about X" feels okay.  Loading X on "show me all the X that
satisfy Y" feels iffy.

A systematic review of object_class_by_name() and
module_object_class_by_name() use might be advisable.


