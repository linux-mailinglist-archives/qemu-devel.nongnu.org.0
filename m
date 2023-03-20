Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8131C6C1AE6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:06:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peI0d-0007VM-EU; Mon, 20 Mar 2023 12:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1peI0a-0007Sc-Gp
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1peI0Y-00023g-Ci
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679328313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sr6cFuc7VBPgEaXrnLmuCBWkJEpAcrjeL0w32Yz6r8Q=;
 b=K/VZVeHx3lVhbGfYaHL3Uxf/lKTmQPCLmm/Ob6btTFqTeg9n8bzTJG1GSgxfVhxHNfv03O
 UzNLxTDopmatUvMcG4fIc/+xjP3YS5sCaR1QypFUdvMSYAZBHoXQSxCvOuj6ozQbZjKmw6
 1aVGDcQnaaJIE3aTReeEF0Dw1P/wQM8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-JczZ95nSMPyG0AJMKge9rw-1; Mon, 20 Mar 2023 12:05:10 -0400
X-MC-Unique: JczZ95nSMPyG0AJMKge9rw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 501BB96DC83;
 Mon, 20 Mar 2023 16:05:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25B4140C20FA;
 Mon, 20 Mar 2023 16:05:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E81DA21E6926; Mon, 20 Mar 2023 17:05:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>,  pbonzini@redhat.com,
 qemu-devel@nongnu.org,  david@redhat.com,  borntraeger@de.ibm.com,
 frankja@linux.ibm.com,  fiuczy@linux.ibm.com,  pasic@linux.ibm.com,
 berrange@redhat.com,  alex.bennee@linaro.org
Subject: Re: [PATCH v2 1/1] util/async-teardown: wire up
 query-command-line-options
References: <20230320131648.61728-1-imbrenda@linux.ibm.com>
 <20230320131648.61728-2-imbrenda@linux.ibm.com>
 <87v8ivmocr.fsf@pond.sub.org>
 <6a9ef526-1b30-e9a6-37ee-59ca3dadea9d@redhat.com>
Date: Mon, 20 Mar 2023 17:05:07 +0100
In-Reply-To: <6a9ef526-1b30-e9a6-37ee-59ca3dadea9d@redhat.com> (Thomas Huth's
 message of "Mon, 20 Mar 2023 16:42:17 +0100")
Message-ID: <87355zmmrw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Thomas Huth <thuth@redhat.com> writes:

> On 20/03/2023 16.31, Markus Armbruster wrote:
>> Claudio Imbrenda <imbrenda@linux.ibm.com> writes:
>> 
>>> The recently introduced -async-teardown commandline option was not
>>> wired up properly and did not show up in the output of the QMP command
>>> query-command-line-options. This means that libvirt will have no way to
>>> discover whether the feature is supported.
>> 
>> There was nothing improper in its wiring.  The issue is that
>> query-command-line-options is junk.  See my recent post
>> 
>>      Subject: query-command-line-options (was: [PATCH 1/7] qemu: capabilities: Introduce QEMU_CAPS_MACHINE_ACPI)
>>      Date: Tue, 07 Mar 2023 10:40:23 +0100
>>      Message-ID: <87jzzsc320.fsf_-_@pond.sub.org>
>> 
>>> This patch fixes the issue by correctly wiring up the commandline
>>> option so that it appears in the output of query-command-line-options.
>>>
>>> Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
>>> Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
>>> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
>>> ---
>>>   util/async-teardown.c | 17 +++++++++++++++++
>>>   1 file changed, 17 insertions(+)
>>>
>>> diff --git a/util/async-teardown.c b/util/async-teardown.c
>>> index 62cdeb0f20..c9b9a3cdb2 100644
>>> --- a/util/async-teardown.c
>>> +++ b/util/async-teardown.c
>>> @@ -12,6 +12,9 @@
>>>    */
>>>   
>>>   #include "qemu/osdep.h"
>>> +#include "qemu/config-file.h"
>>> +#include "qemu/option.h"
>>> +#include "qemu/module.h"
>>>   #include <dirent.h>
>>>   #include <sys/prctl.h>
>>>   #include <sched.h>
>>> @@ -144,3 +147,17 @@ void init_async_teardown(void)
>>>       clone(async_teardown_fn, new_stack_for_clone(), CLONE_VM, NULL);
>>>       sigprocmask(SIG_SETMASK, &old_signals, NULL);
>>>   }
>>> +
>>> +static QemuOptsList qemu_async_teardown_opts = {
>>> +    .name = "async-teardown",
>>> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_async_teardown_opts.head),
>>> +    .desc = {
>>> +        { /* end of list */ }
>>> +    },
>>> +};
>>> +
>>> +static void register_async_teardown(void)
>>> +{
>>> +    qemu_add_opts(&qemu_async_teardown_opts);
>>> +}
>>> +opts_init(register_async_teardown);
>> 
>> Now it *is* improperly wired up :)
>> 
>> You're defining new QemuOpts config group "async-teardown" with
>> arbitrary option parameters, but don't actually use it for parsing or
>> recording the option.  I figure because you can't: there is no option
>> argument to parse and record, which is what QemuOpts is designed to do.
>> 
>> If you need the feature to be visible in query-command-line-options, you
>> should make it an option parameter (a KEY, not a GROUP), preferably of
>> an existing group / option.
>
> Would it make sense to add it e.g. to "-action" instead, i.e. something like 
> "-action teardown=async" ?

I believe the new parameter "teardown" would be visible in
query-command-line-options.

How well does it fit -action?


