Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC9214657
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 16:08:18 +0200 (CEST)
Received: from localhost ([::1]:43706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jriq1-0005Wt-FG
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 10:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jrioa-0004I8-8N
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 10:06:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30395
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jrioX-0002x2-Qf
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 10:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593871604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mgEyP99ISKv8sNfQMqbinuAqxbaqDMiVX8j6M5W8r8I=;
 b=P46uEWPG5czG2Q+uXDRbg+4n66xMfuZTOtyr3noiGiNqFDNVv9qTwlUcIukHnoZwMK3LiV
 jg/EpUMZDooML43O0BiPeO23z4410emvbgcJKk6+fEY4s/jByhu5PS9YTBKerjtsNGlC/S
 4JE+chasuzbmXtIsbNx+EufZier0ENw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-WBqqh4DFPe6ijZIsQ7hMgA-1; Sat, 04 Jul 2020 10:06:38 -0400
X-MC-Unique: WBqqh4DFPe6ijZIsQ7hMgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 928611005510;
 Sat,  4 Jul 2020 14:06:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F2AF5D9CA;
 Sat,  4 Jul 2020 14:06:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E0BFE1138648; Sat,  4 Jul 2020 16:06:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 25/44] qom: Use return values to check for error where
 that's simpler
References: <20200702155000.3455325-1-armbru@redhat.com>
 <20200702155000.3455325-26-armbru@redhat.com>
 <3468bdbe-2e7d-3a51-4c2e-5f188ca092fd@virtuozzo.com>
Date: Sat, 04 Jul 2020 16:06:35 +0200
In-Reply-To: <3468bdbe-2e7d-3a51-4c2e-5f188ca092fd@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 3 Jul 2020 19:06:04 +0300")
Message-ID: <87wo3jml1w.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 08:57:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 02.07.2020 18:49, Markus Armbruster wrote:
>> When using the Error object to check for error, we need to receive it
>> into a local variable, then propagate() it to @errp.
>>
>> Using the return value permits allows receiving it straight to @errp.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> ---
>>   qom/object.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/qom/object.c b/qom/object.c
>> index 0808da2767..56d858b6a5 100644
>> --- a/qom/object.c
>> +++ b/qom/object.c
>> @@ -549,8 +549,7 @@ void object_initialize_child_with_propsv(Object *parentobj,
>>       object_initialize(childobj, size, type);
>>       obj = OBJECT(childobj);
>>   -    object_set_propv(obj, &local_err, vargs);
>> -    if (local_err) {
>> +    if (object_set_propv(obj, errp, vargs) < 0) {
>>           goto out;
>>       }
>>   @@ -743,7 +742,7 @@ Object *object_new_with_propv(const char
>> *typename,
>>       }
>>       obj = object_new_with_type(klass->type);
>>   -    if (object_set_propv(obj, &local_err, vargs) < 0) {
>> +    if (object_set_propv(obj, errp, vargs) < 0) {
>>           goto error;
>>       }
>>   @@ -1767,14 +1766,17 @@ static void
>> object_set_link_property(Object *obj, Visitor *v,
>>       char *path = NULL;
>>         visit_type_str(v, name, &path, &local_err);
>
> why not use return value of visit_type_str ?

Yes, that's better.

>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>   -    if (!local_err && strcmp(path, "") != 0) {
>> -        new_target = object_resolve_link(obj, name, path, &local_err);
>> +    if (strcmp(path, "") != 0) {
>> +        new_target = object_resolve_link(obj, name, path, errp);
>>       }
>
> Hmmm. You actually change the logic when visit_type_str succeeded but path equal to "":
>
> prepatch, we continue processing with new_target == NULL, after the patch we just do nothing and report success (errp == NULL).
>
> I don't know whether pre-patch or after-patch behavior is correct, but if it is a logic change, let's note it in the commit message, if path equal to "" actually impossible, let's assert it. Or just keep old logic as is, by moving return (together with duplicated g_free(path) of course) into "if (strcmp(path, "") != 0) {".

After having another stare at the function, I conclude it's awful before
the patch, and only slightly less awful but also wrong after.

>>         g_free(path);
>> -    if (local_err) {
>> -        error_propagate(errp, local_err);
>> +    if (!new_target) {
>>           return;
>>       }

What about this:

   @@ -1763,20 +1762,24 @@ static void object_set_link_property(Object *obj, Visitor *v,
        LinkProperty *prop = opaque;
        Object **targetp = object_link_get_targetp(obj, prop);
        Object *old_target = *targetp;
   -    Object *new_target = NULL;
   +    Object *new_target;
        char *path = NULL;

   -    visit_type_str(v, name, &path, &local_err);
   +    if (!visit_type_str(v, name, &path, errp)) {
   +        return;
   +    }

   -    if (!local_err && strcmp(path, "") != 0) {
   -        new_target = object_resolve_link(obj, name, path, &local_err);
   +    if (*path) {
   +        new_target = object_resolve_link(obj, name, path, errp);
   +        if (!new_target) {
   +            g_free(path);
   +            return;
   +        }
   +    } else {
   +        new_target = NULL;
        }

        g_free(path);
   -    if (local_err) {
   -        error_propagate(errp, local_err);
   -        return;
   -    }

        prop->check(obj, name, new_target, &local_err);
        if (local_err) {


