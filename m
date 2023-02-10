Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB64691A79
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 09:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQPDi-0005pe-7w; Fri, 10 Feb 2023 03:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQPDc-0005pK-W9
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 03:57:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQPDb-0001jm-75
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 03:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676019438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ux8ZyFGl4mov/lFuusOWE5nTtNcD16XuNOyCpXA2dqQ=;
 b=FXT/gfcgZ3m9uFJR6zcs1Nz815PVBXzHeIWFeBuQdt95rax6+y20A0Zxr/3rUF82SpiRCB
 fTZywMrULExmTG03FY4Oba1JjZWrL/phthcX8qFhf0HRvbMz+ChpKxfCBuTwZ/177Prqf4
 bGMwlkmeMEOsgZs3l8EzcbD2BL/KoQk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-wr2UPCa5PwWK3TVLGmxqXQ-1; Fri, 10 Feb 2023 03:57:12 -0500
X-MC-Unique: wr2UPCa5PwWK3TVLGmxqXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C9F3811E9C;
 Fri, 10 Feb 2023 08:57:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 344901121315;
 Fri, 10 Feb 2023 08:57:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F0A821E6A1F; Fri, 10 Feb 2023 09:57:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Steve Sistare <steven.sistare@oracle.com>,  qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  "Dr.
 David Alan
 Gilbert" <dgilbert@redhat.com>,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH V2 0/4] string list functions
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <Y+TPbIIV34wyZMuW@redhat.com>
Date: Fri, 10 Feb 2023 09:57:11 +0100
In-Reply-To: <Y+TPbIIV34wyZMuW@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 9 Feb 2023 10:48:12 +0000")
Message-ID: <877cwpx5i0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Feb 07, 2023 at 10:48:43AM -0800, Steve Sistare wrote:
>> Add some handy string list functions, for general use now, and for
>> eventual use in the cpr/live update patches.
>>=20
>> Steve Sistare (4):
>>   qapi: strList_from_string
>>   qapi: QAPI_LIST_LENGTH
>>   qapi: strv_from_strList
>>   qapi: strList unit tests
>
> I know that the 'strList' type falls out naturally from the
> QAPI type generator for arrays, but I've always considered
> it to be a rather awkward result.  The normal C approach
> would be to use 'char **' NULL terminated, which conveniently
> already has a bunch of helper APIs from glib, and is also
> accepted or returned by various other functions we might
> like to use.
>
> Should we consider making the QAPI generator handle string
> lists as a special case, emitting 'char **' instead of this
> series ?

I don't like special cases.  I also don't like GenericList in any case.

I believe a linked list was chosen because it results in a fairly simple
visitor interface and implementation.  But it's a poor data structure
for a homogeneous sequence that rarely if ever changes: lots of pointer
chasing, waste of memory when the elements are small.

Output visitors walk the sequence in order.  An array would be perfect.

Input visitors build the sequence by appending elements in order.
A flexible array like GArray would do.

I'm not aware of other code mutating GenericLists or its descendants.
It might exist.  I'd be surprised if there's much of it, though.


