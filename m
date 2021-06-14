Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5263A6C83
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:56:14 +0200 (CEST)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lspsj-0007ZH-9V
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lspqS-00060H-HA
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:53:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lspqQ-0004b0-4e
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623689628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RwHQOwhwRPIuH/YBybibTtLSUZ6enNPFeeFSvanF0cw=;
 b=UY5icQg0MVGU0ROFVc8kpOFBTqHokrcEA7+UhCVPMVV+qbY3KTXJsdtKkRS2QgcPSrNkgg
 Yy+vSXUkxDn7r7I9tchYIg30G5nDxYyt2QQ0IDsMA56lz2slb2rx4zwC6jyAWC7iFkS1AR
 ketyjh7ztfXuliQwlN04mw3Lz1I0UGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-elAiz8yHN5GMNUXmY0UBGA-1; Mon, 14 Jun 2021 12:53:47 -0400
X-MC-Unique: elAiz8yHN5GMNUXmY0UBGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F56819200D0;
 Mon, 14 Jun 2021 16:53:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34AAD5D9E2;
 Mon, 14 Jun 2021 16:53:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BA9FC113865F; Mon, 14 Jun 2021 18:53:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 02/18] qapi: add ModuleInfo schema
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-3-kraxel@redhat.com>
 <87im2g6g54.fsf@dusky.pond.sub.org>
 <20210614152117.kuj6qm4ocptzgonh@sirius.home.kraxel.org>
Date: Mon, 14 Jun 2021 18:53:24 +0200
In-Reply-To: <20210614152117.kuj6qm4ocptzgonh@sirius.home.kraxel.org> (Gerd
 Hoffmann's message of "Mon, 14 Jun 2021 17:21:17 +0200")
Message-ID: <87eed4v14r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

>   Hi,
>
>> > +# @arch: module architecture.
>> 
>> Semantics?
>> 
>> Should this be enum SysEmuTarget?
>
> Probably, will check ...
>
>> > +# @opts: qemu opts implemented by module.
>> 
>> Is this the name of a QemuOptsList?
>> 
>> Since this isn't a list, a module can only ever provide one
>> QemuOptsList.  Sure that's okay?
>
> For the current two in-tree cases yes, and I don't expect this to change
> in the future.  We could turn this into a list though to make it
> future-proof.

If it's not much of a bother, then why not?

>> > +{ 'struct': 'Modules',
>> > +  'data': { 'list' : ['ModuleInfo']}}
>> 
>> This defines only types, no QMP commands or events.  Why do you need the
>> types to be QAPI types?
>
> Want re-use the code to serialize/parse json from/to structs.
> (see patches #3 + #13).

Okay, that's fair.

[...]


