Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850A831D2EF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 00:08:53 +0100 (CET)
Received: from localhost ([::1]:55512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC9Se-0006XD-4S
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 18:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lC9Re-00067o-Mx
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 18:07:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lC9Rb-0007Vo-Ra
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 18:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613516866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyV0DHj+zrZ2K0Wo4ORGTzExoaDBwjRvgpN1g4PdAl4=;
 b=gpMClrnDnJTS8X7z/JrYIZQb434HqYFuV0ILRnWcFVOKLEYUf2XH/U5Xb3Ts4+FKYkMQNq
 WMQy3B0zPXpOI3x5iNLPxh44fpVWKJdlK0ubBsdf3pZB4jly1pfJvREdN6Vl8bVcea+s0F
 15b1SLGc0DTT6jPiX6gdKS46PZRgyZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-DSdCjzL3OkqVEY51VcW-Tg-1; Tue, 16 Feb 2021 18:07:42 -0500
X-MC-Unique: DSdCjzL3OkqVEY51VcW-Tg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54782107ACE3
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 23:07:41 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8872C10016DB;
 Tue, 16 Feb 2021 23:07:40 +0000 (UTC)
Subject: Re: [PATCH RESEND] hostmem: Don't report pmem attribute if unsupported
To: Eduardo Habkost <ehabkost@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <dfcc5dc7e2efc0283bc38e3036da2c0323621cdb.1611647111.git.mprivozn@redhat.com>
 <20210216222357.GL4070@habkost.net>
From: John Snow <jsnow@redhat.com>
Message-ID: <6ecacba7-5a7b-a5ce-efac-e24dd65eb5ea@redhat.com>
Date: Tue, 16 Feb 2021 18:07:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210216222357.GL4070@habkost.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 5:23 PM, Eduardo Habkost wrote:
> On Tue, Jan 26, 2021 at 08:48:25AM +0100, Michal Privoznik wrote:
>> When management applications (like Libvirt) want to check whether
>> memory-backend-file.pmem is supported they can list object
>> properties using 'qom-list-properties'. However, 'pmem' is
>> declared always (and thus reported always) and only at runtime
>> QEMU errors out if it was built without libpmem (and thus can not
>> guarantee write persistence). This is suboptimal since we have
>> ability to declare attributes at compile time.
>>
>> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1915216
>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> I'm not a fan of making availability of properties conditional
> (even if at compile time), but if this helps libvirt I guess it
> makes sense.
> 

Compile time might be OK, but if we want to describe everything via QAPI 
eventually, we just need to be able to describe that compile-time 
requisite appropriately.

Conditional at run-time is I think the thing that absolutely has to go 
wherever it surfaces.

> CCing John, who has been thinking a lot about these questions.
> 

Thanks for the heads up. Good reminder that libvirt uses the existence 
of properties as a bellwether for feature support. I don't think I like 
that idea, but I like breaking libvirt even less.

--js

> I'm queueing this on machine-next.  Thanks, and sorry for the delay!
> 
>> ---
>>
>> This is just a resend of a patch I've sent earlier with Reviewed-by and
>> Tested-by added:
>>
>> https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg04558.html
>>
>>   backends/hostmem-file.c | 13 ++++---------
>>   1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
>> index 40e1e5b3e3..7e30eb5985 100644
>> --- a/backends/hostmem-file.c
>> +++ b/backends/hostmem-file.c
>> @@ -123,6 +123,7 @@ static void file_memory_backend_set_align(Object *o, Visitor *v,
>>       fb->align = val;
>>   }
>>   
>> +#ifdef CONFIG_LIBPMEM
>>   static bool file_memory_backend_get_pmem(Object *o, Error **errp)
>>   {
>>       return MEMORY_BACKEND_FILE(o)->is_pmem;
>> @@ -139,17 +140,9 @@ static void file_memory_backend_set_pmem(Object *o, bool value, Error **errp)
>>           return;
>>       }
>>   
>> -#ifndef CONFIG_LIBPMEM
>> -    if (value) {
>> -        error_setg(errp, "Lack of libpmem support while setting the 'pmem=on'"
>> -                   " of %s. We can't ensure data persistence.",
>> -                   object_get_typename(o));
>> -        return;
>> -    }
>> -#endif
>> -
>>       fb->is_pmem = value;
>>   }
>> +#endif /* CONFIG_LIBPMEM */
>>   
>>   static void file_backend_unparent(Object *obj)
>>   {
>> @@ -180,8 +173,10 @@ file_backend_class_init(ObjectClass *oc, void *data)
>>           file_memory_backend_get_align,
>>           file_memory_backend_set_align,
>>           NULL, NULL);
>> +#ifdef CONFIG_LIBPMEM
>>       object_class_property_add_bool(oc, "pmem",
>>           file_memory_backend_get_pmem, file_memory_backend_set_pmem);
>> +#endif
>>   }
>>   
>>   static void file_backend_instance_finalize(Object *o)
>> -- 
>> 2.26.2
>>
> 


