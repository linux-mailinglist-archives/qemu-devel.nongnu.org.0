Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BE1690E54
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 17:27:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9kb-00051H-KH; Thu, 09 Feb 2023 11:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ9kY-00050u-MA
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:26:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ9kX-0004Kg-9N
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675959976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDbs5FzmbeeZUYVCFsYesv24TonLYQSzaKxu6fWOFsc=;
 b=LRAhgpInUzzM9KQv2Wlzv00bSrCBDM1L0NgadSfd7WOOFgXzCXufEAjKwSjrYIfhYvZ+nd
 JFbJooOstugS3zwdKzDWTbFdItkienb75+BS+tQdMH2so7FlBhaoKIOMwmwpQ2+7j+GGZ1
 ACag5RuaT/DIR0ItNLiz1/IDEIh3Oos=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-nZiRs3VrNOGWcc1FRljf7g-1; Thu, 09 Feb 2023 11:26:11 -0500
X-MC-Unique: nZiRs3VrNOGWcc1FRljf7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67DAB85A588;
 Thu,  9 Feb 2023 16:26:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41A8E2166B29;
 Thu,  9 Feb 2023 16:26:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 37BDE21E6A1F; Thu,  9 Feb 2023 17:26:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Eric Blake <eblake@redhat.com>,  Het Gala <het.gala@nutanix.com>,
 qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  quintela@redhat.com,
 dgilbert@redhat.com,  pbonzini@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 2/6] migration: Updated QAPI format for 'migrate'
 qemu monitor command
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com>
 <20230208201712.b3a5xtufscrvncqt@redhat.com>
 <Y+TJr7An261VcVJ/@redhat.com>
Date: Thu, 09 Feb 2023 17:26:10 +0100
In-Reply-To: <Y+TJr7An261VcVJ/@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 9 Feb 2023 10:23:43 +0000")
Message-ID: <87bkm23ivx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

> On Wed, Feb 08, 2023 at 02:17:12PM -0600, Eric Blake wrote:

[...]

>> I'm guessing the reason you didn't go with 'socket': 'SocketAddress'
>> is that SocketAddress is itself a discriminated union, and Markus does
>> not yet have the QAPI generator wired up to support one union as a
>> branch of another larger union?  It leads to extra nesting on the wire
>> [2]
>
> I don't know the backstory on this limitation. Is it something that
> is very difficult to resolve ? I think it is highly desirable to have
> 'socket': 'SocketAddress' here. It would be a shame to introduce this
> better migration API design and then have it complicated by a possibly
> short term limitation of QAPI.

We evolve the QAPI language to satisfy concrete use cases.  If you could
use a language improvement, make a case for it, and we'll see what we
can do within a time frame that works for you.  Better than ugly
work-arounds on the silent assumption the language cannot be adapted.


