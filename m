Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B4D280F62
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 11:01:23 +0200 (CEST)
Received: from localhost ([::1]:56742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOGwM-0004Cu-Bl
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 05:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kOGuW-0003iI-Vc
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 04:59:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kOGuU-0005pZ-Jr
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 04:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601629165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gSQLEzjCoofHvLRyic7Egg1QTCB+2StV2VfL+d22ipE=;
 b=BhgYEpRV66PKI5GHQ+ra9guiUxfwOj0laLQg5ejrjdMZs8QRwpVcIUcQQQyZbfLPTrV+1z
 mHP1Jai2fd00AD+W3DZi1Auj/488ecikV2k01B2Xi1dyucrHnqpj3WAJht5mBNqmIWmYMG
 zf/AJM/Awr02xZj3PZ4fuF+ZgXXyl/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121--3E7gdo5P9aRgYWDxpkf4Q-1; Fri, 02 Oct 2020 04:59:23 -0400
X-MC-Unique: -3E7gdo5P9aRgYWDxpkf4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A953A1015ED6;
 Fri,  2 Oct 2020 08:58:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-101.ams2.redhat.com
 [10.36.112.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4630160C05;
 Fri,  2 Oct 2020 08:58:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BECDD1132784; Fri,  2 Oct 2020 10:58:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] elfload: use g_new instead of malloc
References: <20201001123807.42978-1-eafanasova@gmail.com>
 <87r1qhtdxt.fsf@dusky.pond.sub.org>
 <b4ab229a-0e84-9d0b-1287-846c52a667bb@redhat.com>
Date: Fri, 02 Oct 2020 10:58:50 +0200
In-Reply-To: <b4ab229a-0e84-9d0b-1287-846c52a667bb@redhat.com> (Thomas Huth's
 message of "Fri, 2 Oct 2020 07:18:06 +0200")
Message-ID: <87eemhm2b9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Elena Afanasova <eafanasova@gmail.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 02/10/2020 07.05, Markus Armbruster wrote:
>> Elena Afanasova <eafanasova@gmail.com> writes:
>> 
>>> Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
>>> ---
>>>  bsd-user/elfload.c | 92 +++++++++++++++-------------------------------
>>>  1 file changed, 30 insertions(+), 62 deletions(-)
>>>
>>> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
>>> index 32378af7b2..e10ca54eb7 100644
>>> --- a/bsd-user/elfload.c
>>> +++ b/bsd-user/elfload.c
>>> @@ -867,18 +867,14 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
>>>          if (sizeof(struct elf_phdr) * interp_elf_ex->e_phnum > TARGET_PAGE_SIZE)
>>>              return ~(abi_ulong)0UL;
>>>  
>>> -        elf_phdata =  (struct elf_phdr *)
>>> -                malloc(sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);
>>> -
>>> -        if (!elf_phdata)
>>> -          return ~((abi_ulong)0UL);
>>> +        elf_phdata = g_new(struct elf_phdr, interp_elf_ex->e_phnum);
>>>  
>>>          /*
>>>           * If the size of this structure has changed, then punt, since
>>>           * we will be doing the wrong thing.
>>>           */
>>>          if (interp_elf_ex->e_phentsize != sizeof(struct elf_phdr)) {
>>> -            free(elf_phdata);
>>> +            g_free(elf_phdata);
>>>              return ~((abi_ulong)0UL);
>>>          }
>>>  
>>> @@ -890,9 +886,8 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
>>>          }
>>>          if (retval < 0) {
>>>                  perror("load_elf_interp");
>>> +                g_free(elf_phdata);
>>>                  exit(-1);
>>> -                free (elf_phdata);
>>> -                return retval;
>> 
>> Deleting return looks wrong.
>
> Why? There is an exit(-1) right in front of it, so this is dead code...
> well, maybe that should be done in a separate patch, or at least
> mentioned in the patch description, though.

You're right; I missed the exit(-1).

Following the unpleasant odour spread by exit(-1)...  Aha, the
function's behavior on error is inconsistent: sometimes it returns zero,
sometimes it exits.

Since the problem is bigger than just one dead return, I recommend
leaving it to a separate patch, and keeping this one focused on g_new().


