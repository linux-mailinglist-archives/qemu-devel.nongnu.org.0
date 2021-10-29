Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A7143FFB2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 17:38:01 +0200 (CEST)
Received: from localhost ([::1]:47134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgTxA-0001a8-5T
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 11:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgTuP-0007q0-Uz
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:35:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgTuN-0003EZ-Ga
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635521705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0aJKoGheDbDj/ftjO1sGHuFWizEwU9epuneYjZhbesA=;
 b=HQij8pIAyaC84kUpqe96X4XPCpLR/AV2SX/0VbAyBsV1VPHGzQS/W9YSzTWt3PZXoSFYz9
 HMyeZaNWytKRCNNHoPeeYeuvIMxW0iKFcnuqCL6N4IKRlmEMT9m9DHk2Oo21jCPhcrcGSB
 9fP4pMckrP487sc3KjbhyXu+BlrgzOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-936i7c2iPZyNFWUFj5gCow-1; Fri, 29 Oct 2021 11:35:03 -0400
X-MC-Unique: 936i7c2iPZyNFWUFj5gCow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9A88802B7E;
 Fri, 29 Oct 2021 15:35:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B47D60C17;
 Fri, 29 Oct 2021 15:34:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F45611380A7; Fri, 29 Oct 2021 17:34:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 5/9] qapi: Generalize struct member policy checking
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-6-armbru@redhat.com>
 <20211029152024.7x2tiizzswurimdf@redhat.com>
Date: Fri, 29 Oct 2021 17:34:40 +0200
In-Reply-To: <20211029152024.7x2tiizzswurimdf@redhat.com> (Eric Blake's
 message of "Fri, 29 Oct 2021 10:20:24 -0500")
Message-ID: <87fssjc0a7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, philmd@redhat.com, kchamart@redhat.com,
 qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On Thu, Oct 28, 2021 at 12:25:16PM +0200, Markus Armbruster wrote:
>> The generated visitor functions call visit_deprecated_accept() and
>> visit_deprecated() when visiting a struct member with special feature
>> flag 'deprecated'.  This makes the feature flag visible to the actual
>> visitors.  I want to make feature flag 'unstable' visible there as
>> well, so I can add policy for it.
>> 
>> To let me make it visible, replace these functions by
>> visit_policy_reject() and visit_policy_skip(), which take the member's
>> special features as an argument.  Note that the new functions have the
>> opposite sense, i.e. the return value flips.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>> +++ b/qapi/qapi-forward-visitor.c
>> @@ -246,25 +246,27 @@ static void forward_field_optional(Visitor *v, const char *name, bool *present)
>>      visit_optional(ffv->target, name, present);
>>  }
>>  
>> -static bool forward_field_deprecated_accept(Visitor *v, const char *name,
>> -                                            Error **errp)
>> +static bool forward_field_policy_reject(Visitor *v, const char *name,
>> +                                        unsigned special_features,
>> +                                        Error **errp)
>>  {
>>      ForwardFieldVisitor *ffv = to_ffv(v);
>>  
>>      if (!forward_field_translate_name(ffv, &name, errp)) {
>>          return false;
>
> Should this return value be flipped?
>
>>      }
>> -    return visit_deprecated_accept(ffv->target, name, errp);
>> +    return visit_policy_reject(ffv->target, name, special_features, errp);
>>  }
>>  
>> -static bool forward_field_deprecated(Visitor *v, const char *name)
>> +static bool forward_field_policy_skip(Visitor *v, const char *name,
>> +                                      unsigned special_features)
>>  {
>>      ForwardFieldVisitor *ffv = to_ffv(v);
>>  
>>      if (!forward_field_translate_name(ffv, &name, NULL)) {
>>          return false;
>
> and here too?

Good catch!

These functions are called indirectly like

    if (visit_policy_reject(v, "values", 1u << QAPI_DEPRECATED, errp)) {
        return false;
    }
    if (!visit_policy_skip(v, "values", 1u << QAPI_DEPRECATED)) {
        if (!visit_type_strList(v, "values", &obj->values, errp)) {
            return false;
        }
    }

visit_policy_reject() must return true when it sets an error, or else we
call visit_policy_skip() with @errp pointing to non-null.

Same argument for visit_policy_skip().

>>      }
>> -    return visit_deprecated(ffv->target, name);
>> +    return visit_policy_skip(ffv->target, name, special_features);
>>  }
>>  
>
> Otherwise, the rest of the logic changes for flipped sense look right.


