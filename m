Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456EF435E22
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 11:43:29 +0200 (CEST)
Received: from localhost ([::1]:34960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdUbf-00020D-TZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 05:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdUZX-0000V4-AI
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:41:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdUZV-0003Nw-5Z
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634809272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+6AGyIlslrgIdGe9jP4DGU/j02in1K4zrQhZsPyZW2A=;
 b=K5KclpluLzKCbU0n1wPhhFN41UXv5Vij8OKRmbhuP3vz0qtgfItDAVeFc5Fje5xHInUt4y
 PKyw1M5renmuBWplGFcdltNfo7MwBR3rblMuS7/RZtjtEm3MR678lB+6hw6/OjkeKtvVtc
 HATBj7bb75Lyt4WRfwjXQH51LIgagxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-_lrKRDi9O9SoywrGYpipKg-1; Thu, 21 Oct 2021 05:41:08 -0400
X-MC-Unique: _lrKRDi9O9SoywrGYpipKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F20A1006ABE;
 Thu, 21 Oct 2021 09:41:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 539487A8DF;
 Thu, 21 Oct 2021 09:40:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7A66811380A7; Thu, 21 Oct 2021 11:40:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 4/5] qapi: Implement deprecated-input={reject,crash}
 for enum values
References: <20211009120944.2858887-1-armbru@redhat.com>
 <20211009120944.2858887-5-armbru@redhat.com>
 <20211011185323.ajhqe4qyvvi3bke4@redhat.com>
Date: Thu, 21 Oct 2021 11:40:58 +0200
In-Reply-To: <20211011185323.ajhqe4qyvvi3bke4@redhat.com> (Eric Blake's
 message of "Mon, 11 Oct 2021 13:53:23 -0500")
Message-ID: <87a6j2emvp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com,
 Markus Armbruster <armbru@redhat.com>, libvir-list@redhat.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On Sat, Oct 09, 2021 at 02:09:43PM +0200, Markus Armbruster wrote:
>> This copies the code implementing the policy from qapi/qmp-dispatch.c
>> to qapi/qobject-input-visitor.c.  Tolerable, but if we acquire more
>> copes, we should look into factoring them out.
>
> copies

Fixing, thanks!

>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  docs/devel/qapi-code-gen.rst |  6 ++++--
>>  qapi/compat.json             |  3 ++-
>>  include/qapi/util.h          |  6 +++++-
>>  qapi/qapi-visit-core.c       | 18 +++++++++++++++---
>>  scripts/qapi/types.py        | 17 ++++++++++++++++-
>>  5 files changed, 42 insertions(+), 8 deletions(-)
>> 
>> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
>> index 00334e9fb8..006a6f4a9a 100644
>> --- a/docs/devel/qapi-code-gen.rst
>> +++ b/docs/devel/qapi-code-gen.rst
>> @@ -708,8 +708,10 @@ QEMU shows a certain behaviour.
>>  Special features
>>  ~~~~~~~~~~~~~~~~
>>  
>> -Feature "deprecated" marks a command, event, or struct member as
>> -deprecated.  It is not supported elsewhere so far.
>> +Feature "deprecated" marks a command, event, struct or enum member as
>
> Do we want the comma before the conjunction?  (I've seen style guides
> that recommend it, and style guides that discourage it; while I tend
> to write by the former style, I usually don't care about the latter.
> Rather, switching styles mid-patch caught my attention).

With a comma there, we claim structs can be marked, which is actually
wrong.  Correct is "command, event, struct member, or enum member".

I'll rephrase to "marks a command, event, enum value, or struct member
deprecated."

>> +deprecated.  It is not supported elsewhere so far.  Interfaces so
>> +marked may be withdrawn in future releases in accordance with QEMU's
>> +deprecation policy.
>>  
>>  
>> +++ b/qapi/qapi-visit-core.c
>> @@ -393,7 +393,7 @@ static bool input_type_enum(Visitor *v, const char *name, int *obj,
>>                              const QEnumLookup *lookup, Error **errp)
>>  {
>>      int64_t value;
>> -    char *enum_str;
>> +    g_autofree char *enum_str = NULL;
>
> Nice change while touching the code.  Is it worth mentioning in the
> commit message?

I figure it would be more distracting than useful.

>>  
>>      if (!visit_type_str(v, name, &enum_str, errp)) {
>>          return false;
>> @@ -402,11 +402,23 @@ static bool input_type_enum(Visitor *v, const char *name, int *obj,
>>      value = qapi_enum_parse(lookup, enum_str, -1, NULL);
>>      if (value < 0) {
>>          error_setg(errp, QERR_INVALID_PARAMETER, enum_str);
>> -        g_free(enum_str);
>>          return false;
>>      }
>>  
>> -    g_free(enum_str);
>> +    if (lookup->flags && (lookup->flags[value] & QAPI_ENUM_DEPRECATED)) {
>> +        switch (v->compat_policy.deprecated_input) {
>> +        case COMPAT_POLICY_INPUT_ACCEPT:
>> +            break;
>> +        case COMPAT_POLICY_INPUT_REJECT:
>> +            error_setg(errp, "Deprecated value '%s' disabled by policy",
>> +                       enum_str);
>> +            return false;
>> +        case COMPAT_POLICY_INPUT_CRASH:
>> +        default:
>> +            abort();
>> +        }
>> +    }
>> +
>>      *obj = value;
>>      return true;
>>  }
>
> Grammar fixes are minor, so:
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


