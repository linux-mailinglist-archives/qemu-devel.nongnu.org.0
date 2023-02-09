Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7278690463
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:03:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ3ku-00005m-FQ; Thu, 09 Feb 2023 05:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ3kq-0008WQ-Ay
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:02:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQ3ko-0003EL-2I
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675936927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pC7vIC1Cxccwlx4Ewo46yC1Hazy1UdSNcsr6xrK6yw=;
 b=eOm9ZIzf4BmyJ4fvgApJZ84vsxUQiWkSCx1vhfzuJ8pBJwSSyGJTMGnzxSDjPS9noylNQi
 LousQLE3WTEpa50KxtxWGk13GQ71hRnC5NQwol3TOlsbaXOa9UFTW31aVnM2yp5cn8EFlH
 shTWgMxZrv1vOOuX9ZjEgd8fGJQmHp4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-oaxDrfa8MRqC1aXdeh33aw-1; Thu, 09 Feb 2023 05:02:05 -0500
X-MC-Unique: oaxDrfa8MRqC1aXdeh33aw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75B80101A52E;
 Thu,  9 Feb 2023 10:02:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 504E3492C3F;
 Thu,  9 Feb 2023 10:02:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B58AD21E6A1F; Thu,  9 Feb 2023 11:02:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Steven Sistare <steven.sistare@oracle.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@gmail.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH V2 1/4] qapi: strList_from_string
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <1675795727-235010-2-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CLFMUDvaOq2QXCKpb8Zj4PRr-tKV1q9L8m2EfgORPLj7A@mail.gmail.com>
 <32f34f74-213d-7107-907d-dda0a509878e@oracle.com>
 <87h6vwnstx.fsf@linaro.org>
Date: Thu, 09 Feb 2023 11:02:03 +0100
In-Reply-To: <87h6vwnstx.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Wed, 08 Feb 2023 14:17:54 +0000")
Message-ID: <87cz6j6tt0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Steven Sistare <steven.sistare@oracle.com> writes:
>
>> On 2/8/2023 1:43 AM, Marc-Andr=C3=A9 Lureau wrote:
>>> Hi
>>>=20
>>> On Tue, Feb 7, 2023 at 10:50 PM Steve Sistare <steven.sistare@oracle.co=
m> wrote:
>>>>
>>>> Generalize hmp_split_at_comma() to take any delimiter character, rename
>>>> as strList_from_string(), and move it to qapi/util.c.
>>>>
>>>> No functional change.
>>>=20
>>> The g_strsplit() version was a bit simpler, but if you want to
>>> optimize it a bit for 1 char delimiter only, ok.
>>>=20
>>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Yes, and it saves a malloc+free for the array.  Small stuff, but I
>> thought it worth a few lines of code.  Thanks for the speedy review!
>
> But is the HMP path that performance critical? Otherwise I'd favour
> consistent use of the glib APIs because its one less thing to get wrong.

The patch reverts my recent commit 0d79271b570 "hmp: Rewrite
strlist_from_comma_list() as hmp_split_at_comma()", with a different
function name and place, and an additional parameter.

There is no explanation for the revert.

An intentional revert without even mentioning it would be uncourteous.
I don't think this is the case here.  I figure you wrote this patch
before you saw my commit, then rebased, keeping the old code.  A simple
rebase mistake, easy enough to correct.


