Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF68C3AC7D9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:42:45 +0200 (CEST)
Received: from localhost ([::1]:42532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luB1Q-0003PG-OH
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1luB0K-0002k9-RM
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:41:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1luB0I-0007zB-1Z
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624009293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHBA1dzXZ8lfVInq6nzgwecQ77kxnstNVeVWKjq6+WY=;
 b=NmG67nzsgw6pLr0XXsC6L4/8WV2YsN9dSTxFlLGwfSftVKdmTxPLrPqSBO9/t5DlVbouHC
 fu2yxvbK9fRpxNJ4Lalo6conGufJIi8DMvS6AZbbnJUNt+ekJH/eUcJR9upcQzaeHGSSzh
 dXYm4au78YsiSUna3hl+pYyBGeiAbdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-7FCLN-zZPmm-xTz1ZuZctA-1; Fri, 18 Jun 2021 05:41:31 -0400
X-MC-Unique: 7FCLN-zZPmm-xTz1ZuZctA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B41F9F92B;
 Fri, 18 Jun 2021 09:41:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DA646A056;
 Fri, 18 Jun 2021 09:41:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A9413113865F; Fri, 18 Jun 2021 11:41:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v5 3/9] qapi: make gen_if/gen_endif take a simple string
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-4-marcandre.lureau@redhat.com>
 <87zgvszkas.fsf@dusky.pond.sub.org>
 <CAJ+F1CLtxBzK1WOqgepQC2iBWqfujaH4F5XM4rRzAuS5xWOnNg@mail.gmail.com>
Date: Fri, 18 Jun 2021 11:41:28 +0200
In-Reply-To: <CAJ+F1CLtxBzK1WOqgepQC2iBWqfujaH4F5XM4rRzAuS5xWOnNg@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 16 Jun 2021
 14:44:02 +0400")
Message-ID: <87im2btsqf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Mon, Jun 14, 2021 at 4:48 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Instead of building prepocessor conditions from a list of string, use
>> > the result generated from QAPISchemaIfCond.cgen().
>>
>> I understand why you're doing this, but only because I know where you're
>> headed.  By itself, it is not an improvement: you move C generation out
>> of common.py into schema.py.  You need to explain why that's useful.
>>
>>
> What about?
>
> In the following commits, QAPISchemaIfCond is going to hold an internal
> tree structure. Moving cgen() there allows to abstract away the condition
> representation.

Yes, that's better.

[...]


