Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959A0690E9D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 17:48:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQA4t-000829-DZ; Thu, 09 Feb 2023 11:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQA4M-0007yg-UP
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:46:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQA4K-0000zL-Tx
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:46:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675961203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KZ2ELYENmOGuVk45VHOZpX+gcRkoMBnzuUqPP3MhxU=;
 b=KCo7U6Y1MflHKZpD0tuDZfYJaI8fdJNzY3fbJaLYm14cnyEWN9Bsmf+LLfDL2mt3XqiGAV
 qvn8mk3gs9B/mqsXEttK4XcGkfpV/FnqsuZpZxhKtcdaFHSOR0+NtgskUTBOjIvC+pImAF
 BDE06FObY61MkELaDkwh4b44GHUFMGU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-iKlS4r6KOe22aigo0V0_pA-1; Thu, 09 Feb 2023 11:46:40 -0500
X-MC-Unique: iKlS4r6KOe22aigo0V0_pA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94123185A7A4;
 Thu,  9 Feb 2023 16:46:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65DBF51FF;
 Thu,  9 Feb 2023 16:46:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A87C21E6A1F; Thu,  9 Feb 2023 17:46:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  =?utf-8?Q?Marc?=
 =?utf-8?Q?-Andr=C3=A9?= Lureau
 <marcandre.lureau@gmail.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH V2 1/4] qapi: strList_from_string
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <1675795727-235010-2-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CLFMUDvaOq2QXCKpb8Zj4PRr-tKV1q9L8m2EfgORPLj7A@mail.gmail.com>
 <32f34f74-213d-7107-907d-dda0a509878e@oracle.com>
 <87h6vwnstx.fsf@linaro.org> <87cz6j6tt0.fsf@pond.sub.org>
 <d25846e4-13fd-c683-b5e1-1660f4470d35@oracle.com>
Date: Thu, 09 Feb 2023 17:46:38 +0100
In-Reply-To: <d25846e4-13fd-c683-b5e1-1660f4470d35@oracle.com> (Steven
 Sistare's message of "Thu, 9 Feb 2023 09:41:46 -0500")
Message-ID: <875yca23dd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Steven Sistare <steven.sistare@oracle.com> writes:

> On 2/9/2023 5:02 AM, Markus Armbruster wrote:
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>>> Steven Sistare <steven.sistare@oracle.com> writes:
>>>
>>>> On 2/8/2023 1:43 AM, Marc-Andr=C3=A9 Lureau wrote:
>>>>> Hi
>>>>>
>>>>> On Tue, Feb 7, 2023 at 10:50 PM Steve Sistare <steven.sistare@oracle.=
com> wrote:
>>>>>>
>>>>>> Generalize hmp_split_at_comma() to take any delimiter character, ren=
ame
>>>>>> as strList_from_string(), and move it to qapi/util.c.
>>>>>>
>>>>>> No functional change.
>>>>>
>>>>> The g_strsplit() version was a bit simpler, but if you want to
>>>>> optimize it a bit for 1 char delimiter only, ok.
>>>>>
>>>>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>>
>>>> Yes, and it saves a malloc+free for the array.  Small stuff, but I
>>>> thought it worth a few lines of code.  Thanks for the speedy review!
>>>
>>> But is the HMP path that performance critical? Otherwise I'd favour
>>> consistent use of the glib APIs because its one less thing to get wrong.
>>=20
>> The patch reverts my recent commit 0d79271b570 "hmp: Rewrite
>> strlist_from_comma_list() as hmp_split_at_comma()", with a different
>> function name and place, and an additional parameter.
>>=20
>> There is no explanation for the revert.
>>=20
>> An intentional revert without even mentioning it would be uncourteous.
>> I don't think this is the case here.  I figure you wrote this patch
>> before you saw my commit, then rebased, keeping the old code.  A simple
>> rebase mistake, easy enough to correct.
>
> Hi Markus, I am sorry, I intended no slight.

Certainly no offense taken :)

>                                               I will document your commit
> in this commit message.  And in response to Alex' comment, I will use your
> version as the basis of the new function.
>
> For more context, this patch has been part of my larger series for live u=
pdate,
> and I am submitting this separately to reduce the size of that series and=
 make
> forward progress:
>     https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email=
-steven.sistare@oracle.com/
>
> In that series, strList_from_string is used to parse a space-separated li=
st of args
> in an HMP command, and pass them to the new qemu binary.
>     https://lore.kernel.org/qemu-devel/1658851843-236870-16-git-send-emai=
l-steven.sistare@oracle.com/
>
> I moved and renamed the generalized function because I thought it might b=
e useful
> to others in the future, along with the other functions in this 'string l=
ist functions'
> patch series.  But if you disagree, I can minimally modify hmp_split_at_c=
omma() in its=20
> current location.

I'm fine with moving it out of monitor/ if there are uses outside the
monitor.  I just don't think qapi/ is the right home.

I'm also fine with generalizing the function to better serve new uses.


