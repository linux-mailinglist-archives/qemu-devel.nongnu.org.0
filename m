Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D3A3595C4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:48:00 +0200 (CEST)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUkvv-000461-0n
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lUkuq-0003gL-IO
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 02:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lUkun-0006St-Os
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 02:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617950807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Is22tse9A6G40ko1/kyZj6JrXPGtTpCFWS0wn7bCCWY=;
 b=bVWCtfEKsFnGdyA8sm8yLxSR7PFmnzTIbCqnOf5B82e+OlvMZUQN5zDLerdTOxTngBW8NS
 rj3Dn09BqY68uyon2oBtN/iXKkgK3GABupzmWD39hUrRqXZkWQ3VguV0ko3UBnOUHxMNV5
 IKgl6HGM4DjgI/vXxTqwv23H2WBXLKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-UbmF0jQkO52cTM4_9pnUPw-1; Fri, 09 Apr 2021 02:46:45 -0400
X-MC-Unique: UbmF0jQkO52cTM4_9pnUPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EFB9189C441
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 06:46:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB0C25C1D0;
 Fri,  9 Apr 2021 06:46:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4F3FF18000AB; Fri,  9 Apr 2021 08:46:42 +0200 (CEST)
Date: Fri, 9 Apr 2021 08:46:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: QMP introspecting device props common to a bus type
Message-ID: <20210409064642.ah2tz5vjz2ngfiyo@sirius.home.kraxel.org>
References: <YG23ILea4H36TllU@redhat.com> <87pmz5at1v.fsf@dusky.pond.sub.org>
 <YG77DnwTyCVPL3nw@redhat.com> <87o8eo9609.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87o8eo9609.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> device-list-properties uses module_object_class_by_name(), requires the
> result to be a concrete device type, iterates over QOM properties with
> object_property_iter_init() / object_property_iter_next(), skipping
> properties named "type", "realized", "hotpluggable", "hotplugged",
> "parent_bus", and any whose starts with "legacy-".
> 
> Paolo, can you remind us why we skip the "legacy-FOO" properties?
> 
> qom-list-properties uses object_class_by_name(), requires an object type
> (an interface won't do).  If it's abstract, it iterates with
> object_class_property_iter_init() / object_property_iter_next(), else
> with object_property_iter_init() / object_property_iter_next().  It
> doesn't skip properties.
> 
> Looks like device-list-properties has become[*] pretty much redundant
> *except* for the difference between module_object_class_by_name() and
> object_class_by_name().
> 
> Gerd, you changed device-list-properties from object_class_by_name() to
> module_object_class_by_name() in commit 7ab6e7fcce.  Should
> qom-list-properties be changed, too?

Makes sense.  We already have non-device modular objects
(some chardevs).

> If yes, is there any reason to use
> object_class_by_name() for looking up user-provided type names in QMP
> commands?

I've tried to be conservative and call module_object_class_by_name()
only in places where it is actually needed.  Reason one being the extra
overhead.  But maybe this isn't too bad given the extra module code runs
only on lookup failures.  Reason two is to avoid modules being loaded by
accident even when not needed.  This needs checking when you try drop
object_class_by_name().  A VM without --for example -- qxl device should
not load the qxl module.

take care,
  Gerd


