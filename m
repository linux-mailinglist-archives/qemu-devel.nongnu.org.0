Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B688D209F63
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 15:13:52 +0200 (CEST)
Received: from localhost ([::1]:47306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joRhP-0004KI-Nb
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 09:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joRg0-0002vG-Dg
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 09:12:24 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22375
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joRfv-0008Ik-9v
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 09:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593090738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qn+NKDbtb0x91EJN0M/j+TgPZb5vx1ZSUL2nlnc9Gjw=;
 b=MP0LSBXQoVzeIDYSfXq1s53BgLDPhtxKzNyUp40jFNl03tboJ482PByWmTU/DFkdhaxQ+/
 a/LwDwqcsshVo1Jsc5amWXe/qWIDdYLyRzvsjkpLHgyagORpJEoElVyUDlZufbLNy4v0bC
 4Y0GIYQwu9dS4eVcykqcQCdNpPutjGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-Z9wRKpigOWme_rZOQERVFA-1; Thu, 25 Jun 2020 09:12:16 -0400
X-MC-Unique: Z9wRKpigOWme_rZOQERVFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24EC3805EE6;
 Thu, 25 Jun 2020 13:12:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB03A1A90F;
 Thu, 25 Jun 2020 13:12:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 558ED11384D4; Thu, 25 Jun 2020 15:12:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 13/46] qemu-option: Simplify around find_default_by_name()
References: <20200624164344.3778251-1-armbru@redhat.com>
 <20200624164344.3778251-14-armbru@redhat.com>
 <13665429-b6ae-351b-0b96-7810da94f0db@redhat.com>
Date: Thu, 25 Jun 2020 15:12:13 +0200
In-Reply-To: <13665429-b6ae-351b-0b96-7810da94f0db@redhat.com> (Eric Blake's
 message of "Wed, 24 Jun 2020 14:46:57 -0500")
Message-ID: <87k0zvz3v6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 6/24/20 11:43 AM, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   util/qemu-option.c | 13 ++++---------
>>   1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/util/qemu-option.c b/util/qemu-option.c
>> index ddcf3072c5..d9293814b4 100644
>> --- a/util/qemu-option.c
>> +++ b/util/qemu-option.c
>> @@ -286,11 +286,9 @@ const char *qemu_opt_get(QemuOpts *opts, const char *name)
>>       opt = qemu_opt_find(opts, name);
>>       if (!opt) {
>>           def_val = find_default_by_name(opts, name);
>> -        if (def_val) {
>> -            return def_val;
>> -        }
>> +        return def_val;
>>       }
>> -    return opt ? opt->str : NULL;
>> +    return opt->str;
>>   }
>
> You could go with even fewer lines and variables by inverting the logic:
>
> if (opt) {
>     return opt->str;
> }
> return find_default_by_name(opts, name);

Yes, that's better.

>>     void qemu_opt_iter_init(QemuOptsIter *iter, QemuOpts *opts,
>> const char *name)
>> @@ -320,7 +318,7 @@ char *qemu_opt_get_del(QemuOpts *opts, const char *name)
>>   {
>>       QemuOpt *opt;
>>       const char *def_val;
>> -    char *str = NULL;
>> +    char *str;
>>         if (opts == NULL) {
>>           return NULL;
>> @@ -329,10 +327,7 @@ char *qemu_opt_get_del(QemuOpts *opts, const char *name)
>>       opt = qemu_opt_find(opts, name);
>>       if (!opt) {
>>           def_val = find_default_by_name(opts, name);
>> -        if (def_val) {
>> -            str = g_strdup(def_val);
>> -        }
>> -        return str;
>> +        return g_strdup(def_val);
>
> Similarly, you could drop def_val with:
>  return g_strdup(find_default_by_name(opts, name));

Your contracted version is still readable; sold.

> Either way,
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


