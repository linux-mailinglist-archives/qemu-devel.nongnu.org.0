Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52541691B40
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 10:27:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQPf6-000444-4T; Fri, 10 Feb 2023 04:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQPem-00043T-PH
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 04:25:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQPek-0008IM-QB
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 04:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676021117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0lFi/k9izfZfiCfb/MetUJCN2WJ1vfcOldQQptF1Xec=;
 b=NPu8/Q/r/wYhB0oPT2O1vMhXmZG+fH4ChnuynqYj9VoE/1DbIjDlA3l7A/77+CEcUZw9D/
 zRuaEdOvuuRiZrY2fEuyd17O17mAj3hR8nr4zuMHsndLfk76pbiToCuh1BLqatgAFdob5P
 C2mWCcxQPoBdXXrcr0gZ57466K8+XBY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-rm4keeCINZ-PqwFvOxsj0A-1; Fri, 10 Feb 2023 04:25:15 -0500
X-MC-Unique: rm4keeCINZ-PqwFvOxsj0A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ACB985A5A3;
 Fri, 10 Feb 2023 09:25:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D0D3492C3E;
 Fri, 10 Feb 2023 09:25:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E956821E6A1F; Fri, 10 Feb 2023 10:25:13 +0100 (CET)
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
 <875yca23dd.fsf@pond.sub.org>
 <7beaf84a-008e-c9a3-3698-2a230196acf9@oracle.com>
 <87cz6izmtz.fsf@pond.sub.org>
 <1bb65a74-d444-7601-47d3-290959239831@oracle.com>
Date: Fri, 10 Feb 2023 10:25:13 +0100
In-Reply-To: <1bb65a74-d444-7601-47d3-290959239831@oracle.com> (Steven
 Sistare's message of "Thu, 9 Feb 2023 16:34:41 -0500")
Message-ID: <87sffdvpmu.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Steven Sistare <steven.sistare@oracle.com> writes:

> On 2/9/2023 1:59 PM, Markus Armbruster wrote:
>> Steven Sistare <steven.sistare@oracle.com> writes:
>>> On 2/9/2023 11:46 AM, Markus Armbruster wrote:
>>>> Steven Sistare <steven.sistare@oracle.com> writes:

[...]

>>>>> For more context, this patch has been part of my larger series for live update,
>>>>> and I am submitting this separately to reduce the size of that series and make
>>>>> forward progress:
>>>>>     https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/
>>>>>
>>>>> In that series, strList_from_string is used to parse a space-separated list of args
>>>>> in an HMP command, and pass them to the new qemu binary.
>>>>>     https://lore.kernel.org/qemu-devel/1658851843-236870-16-git-send-email-steven.sistare@oracle.com/
>>>>>
>>>>> I moved and renamed the generalized function because I thought it might be useful
>>>>> to others in the future, along with the other functions in this 'string list functions'
>>>>> patch series.  But if you disagree, I can minimally modify hmp_split_at_comma() in its 
>>>>> current location.
>>>>
>>>> I'm fine with moving it out of monitor/ if there are uses outside the
>>>> monitor.  I just don't think qapi/ is the right home.
>>>
>>> I don't know where else it would go, as strList is a QAPI type.
>>> include/qapi/util.h already defines QAPI_LIST_PREPEND and QAPI_LIST_APPEND, so it
>>> seems like the natural place to add qapi strList functions.  I am open to
>>> suggestions.
>> 
>> What about util/?  Plenty of QAPI use there already.
>> 
>> Another thought.  Current hmp_split_at_comma() does two things:
>> 
>>     strList *hmp_split_at_comma(const char *str)
>>     {
>> 
>> One, split a comma-separated string into NULL-terminated a dynamically
>> allocated char *[]:
>> 
>>         char **split = g_strsplit(str ?: "", ",", -1);
>> 
>> Two, convert a dynamically allocated char *[] into a strList:
>> 
>>         strList *res = NULL;
>>         strList **tail = &res;
>>         int i;
>> 
>>         for (i = 0; split[i]; i++) {
>>             QAPI_LIST_APPEND(tail, split[i]);
>>         }
>> 
>>         g_free(split);
>>         return res;
>>     }
>> 
>> Part two could live in qapi/.
>
> Works for me.

Note that I'm not demanding such a split.  I'm merely throwing in
another idea for you to use or reject.

> For future reference, what is your organizing principle for putting things in 
> qapi/ vs util/ ?  I see plenty of calls to g_str* functions from qapi/*, so I 
> don't know why removing g_strsplit changes the answer.
>
> Per your principle, where does strv_from_strList (patch 3) belong?  And if I
> substitute char ** for GStrv, does the answer change?

As is, qapi/qapi-util provides:

1. Helpers for qapi/ and QAPI-generated code.  Some of them are
   used elsewhere, too.  That's fine.

2. Tools for working with QAPI data types such as GenericList.

strv_from_strList() would fall under 2.  Same if you use char **
instead.

hmp_split_at_comma() admittedly also falls under 2.  I just dislike
putting things under qapi/ that contradict QAPI design principles.

util/ is a bit of a grabbag, I feel.  Perhaps we could describe it as
"utilities that don't really fit into a particular subsystem".

Does this help you along?


