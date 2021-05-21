Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA41338C94C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 16:37:27 +0200 (CEST)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6HG-0003rd-JR
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 10:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk6FT-0003BB-NA
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk6FQ-00065N-NW
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621607730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jtEM2zbqRAa+GRvLHDr+CMSVXpk51BipBFanhiC5CSM=;
 b=atcf/ltg3QC/H1P2kxXFyV4e8hGjCJsopDD8Wv3kAUh41ZWMrcJ5gu4cZx9kWilupp0zrA
 mDn+OE5pNhWQGhCVrttOjxQzycf9zPzAYSQzTs8wYh3Q2P9SPJR5+k5wpHt8FxPFtTtPnk
 AZdkcVkJhN0jZDT4xkreYzYn2+9NMNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-Cc-nu56kM6-RxAwQ36sQQw-1; Fri, 21 May 2021 10:35:26 -0400
X-MC-Unique: Cc-nu56kM6-RxAwQ36sQQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5067610082E2
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 14:35:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F46110013C1;
 Fri, 21 May 2021 14:35:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 99B78113865F; Fri, 21 May 2021 16:35:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 2/9] qapi: move gen_if/gen_endif to QAPISchemaIfCond
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-3-marcandre.lureau@redhat.com>
 <9ebdf3c4-d991-3ad9-1919-6b1f3f95efa6@redhat.com>
Date: Fri, 21 May 2021 16:35:23 +0200
In-Reply-To: <9ebdf3c4-d991-3ad9-1919-6b1f3f95efa6@redhat.com> (John Snow's
 message of "Wed, 12 May 2021 17:01:04 -0400")
Message-ID: <87k0ns2lzo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 4/29/21 9:40 AM, marcandre.lureau@redhat.com wrote:
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Move the generating function to the QAPISchemaIfCond class.
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

[...]

> Tested-by: John Snow <jsnow@redhat.com>
>
> Seems fine, though I'm a lot less sure of baking the C-specific stuff
> right into the class -- I want a bit more distance to the C output=20
> instead of less.
>
> (Though I do admit that I'm quite fond of centralizing things into
> classes like this myself. I think if we want to add Rust, Go, Python
> and other generators that it won't scale the way we want it to.)

I share this concern.

In a compiler, we commonly have one or more intermediate
representations, and several separate tasks that work on an IR.

The classical organisation is to define a "thin" IR data type, and have
the tasks work on that.

If you are (or your implementation language is) religious about OO, keep
a task separate gets a bit more complicated.  The visitor pattern is a
common solution.  The temptation to just put it in the IR class and call
it a day is always there, of course.

schema.py is my attempt at writing compiler in an OO way.  It's not 100%
pure.  For instance, there is QAPISchemaEntity.c_name().  Note that most
of the actual work is done *outside* schema.py, in function c_name().
The separation could certainly be cleaner.  But this is simple, and it
feels tolerably clean to me.

However, such things do add up.  At some point, we need to stop, think,
and maybe refactor.  I haven't looked at the patch, so I can't say
whether this patch gets us to this point already.


