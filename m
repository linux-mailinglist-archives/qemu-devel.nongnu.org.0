Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1002654C804
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 13:59:24 +0200 (CEST)
Received: from localhost ([::1]:59590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Rg9-0008VH-A0
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 07:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o1Rdb-0006KJ-Kq
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:56:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o1RdY-0008HF-Ow
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655294199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cevr6JF9r/CfQw0fSstk79f0mOEbJkFoPNoRRG7APM8=;
 b=KsbmHeaTpTNE8mslCNeTZxqoZYJXC/4YJRQnheOj58NhHi2khI4Tb92NImVHkEMAvXotv1
 MSaI+ckNjn/tYHpQRuZ4i6FyOgL/OBHXLvBB07El+5qw4UpdBZvIOQW4IxhKUH3kwlcvDm
 tHTvkjcDErzKKgd/CCige3vEE3glzd0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-RM6NEkqhMZOBpCmXdLLDaw-1; Wed, 15 Jun 2022 07:56:38 -0400
X-MC-Unique: RM6NEkqhMZOBpCmXdLLDaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3536880159B
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 11:56:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA3CC2026D64;
 Wed, 15 Jun 2022 11:56:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9064B21E59D1; Wed, 15 Jun 2022 13:56:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Jason Wang <jasowang@redhat.com>,  Thomas Huth
 <thuth@redhat.com>
Subject: Re: [RFC PATCH v2 2/8] qapi: net: introduce a way to bypass
 qemu_opts_parse_noisily()
References: <20220512080932.735962-1-lvivier@redhat.com>
 <20220512080932.735962-3-lvivier@redhat.com>
 <87v8u91xwd.fsf@pond.sub.org>
 <81563e7d-7743-beab-6eaa-3bb20be1b0df@redhat.com>
Date: Wed, 15 Jun 2022 13:56:36 +0200
In-Reply-To: <81563e7d-7743-beab-6eaa-3bb20be1b0df@redhat.com> (Laurent
 Vivier's message of "Thu, 9 Jun 2022 22:52:37 +0200")
Message-ID: <87a6aegmx7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> writes:

> On 13/05/2022 13:21, Markus Armbruster wrote:
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>>> As qemu_opts_parse_noisily() flattens the QAPI structures ("type" field
>>> of Netdev structure can collides with "type" field of SocketAddress),
>> 
>> To remember how this works, I have to write a more verbose version of
>> the above.  Why not post it then, so here goes.
>> 
>> qemu_init() passes the argument of -netdev, -nic, and -net to
>> net_client_parse().
>> 
>> net_client_parse() parses with qemu_opts_parse_noisily(), passing
>> QemuOptsList qemu_netdev_opts for -netdev, qemu_nic_opts for -nic, and
>> qemu_net_opts for -net.  Their desc[] are all empty, which means any
>> keys are accepted.  The result of the parse (a QemuOpts) is stored in
>> the QemuOptsList.
>> 
>> Note that QemuOpts is flat by design.  In some places, we layer non-flat
>> on top using dotted keys convention, but not here.
>> 
>> net_init_clients() iterates over the stored QemuOpts, and passes them to
>> net_init_netdev(), net_param_nic(), or net_init_client(), respectively.
>> 
>> These functions pass the QemuOpts to net_client_init().  They also do
>> other things with the QemuOpts, which we can ignore here.
>> 
>> net_client_init() uses the opts visitor to convert the (flat) QemOpts to
>> a (non-flat) QAPI object Netdev.  Netdev is also the argument of QMP
>> command netdev_add.
>> 
>> The opts visitor was an early attempt to support QAPI in
>> (QemuOpts-based) CLI.  It restricts QAPI types to a certain shape; see
>> commit eb7ee2cbeb "qapi: introduce OptsVisitor".
>> 
>> A more modern way to support QAPI is qobject_input_visitor_new_str().
>> It uses keyval_parse() instead of QemuOpts for KEY=VALUE,... syntax, and
>> it also supports JSON syntax.  The former isn't quite as expressive as
>> JSON, but it's a lot closer than QemuOpts + opts visitor.
>> 
>>> we introduce a way to bypass qemu_opts_parse_noisily() and use directly
>>> visit_type_Netdev() to parse the backend parameters.
>> 
>> This commit paves the way to use of the modern way instead.
>
> I'm going to copy your analysis to the commit message of the patch.

Go right ahead :)

>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> ---
>>>   net/net.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 54 insertions(+)
>>>
>>> diff --git a/net/net.c b/net/net.c
>>> index 58c05c200622..2aab7167316c 100644
>>> --- a/net/net.c
>>> +++ b/net/net.c
>>> @@ -54,6 +54,7 @@
>>>   #include "net/colo-compare.h"
>>>   #include "net/filter.h"
>>>   #include "qapi/string-output-visitor.h"
>>> +#include "qapi/qobject-input-visitor.h"
>>>   
>>>   /* Net bridge is currently not supported for W32. */
>>>   #if !defined(_WIN32)
>>> @@ -63,6 +64,17 @@
>>>   static VMChangeStateEntry *net_change_state_entry;
>>>   static QTAILQ_HEAD(, NetClientState) net_clients;
>>>   
>>> +typedef struct NetdevQueueEntry {
>>> +    bool is_netdev;
>>> +    Netdev *nd;
>>> +    Location loc;
>>> +    QSIMPLEQ_ENTRY(NetdevQueueEntry) entry;
>>> +} NetdevQueueEntry;
>>> +
>>> +typedef QSIMPLEQ_HEAD(, NetdevQueueEntry) NetdevQueue;
>>> +
>>> +static NetdevQueue nd_queue = QSIMPLEQ_HEAD_INITIALIZER(nd_queue);
>>> +
>>>   /***********************************************************/
>>>   /* network device redirectors */
>>>   
>>> @@ -1559,6 +1571,19 @@ int net_init_clients(Error **errp)
>>>   
>>>       QTAILQ_INIT(&net_clients);
>>>   
>>> +    while (!QSIMPLEQ_EMPTY(&nd_queue)) {
>>> +        NetdevQueueEntry *nd = QSIMPLEQ_FIRST(&nd_queue);
>>> +
>>> +        QSIMPLEQ_REMOVE_HEAD(&nd_queue, entry);
>>> +        loc_push_restore(&nd->loc);
>>> +        if (net_client_init1(nd->nd, nd->is_netdev, errp) < 0) {
>> 
>> I think you need to loc_pop() here.
>> 
>>> +            return -1;
>>> +        }
>> 
>> Since the only caller passes &error_fatal, I'd be tempted to ditch the
>> @errp argument, and simply do
>> 
>>             net_client_init1(nd->nd, nd->is_netdev, &error_fatal);
>> 
>> It's what we do for -blockdev, -device, and -object.
>
> I've added a patch to remove the @errp from the net_init_clients() arguments.
>
>> 
>>> +        loc_pop(&nd->loc);
>>> +        qapi_free_Netdev(nd->nd);
>>> +        g_free(nd);
>>> +    }
>>> +
>>>       if (qemu_opts_foreach(qemu_find_opts("netdev"),
>>>                             net_init_netdev, NULL, errp)) {
>>>           return -1;
>>> @@ -1575,8 +1600,37 @@ int net_init_clients(Error **errp)
>>>       return 0;
>>>   }
>>>   
>>> +/*
>>> + * netdev_is_modern() returns true when the backend needs to bypass
>>> + * qemu_opts_parse_noisily()
>>> + */
>>> +static bool netdev_is_modern(const char *optarg)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>>   int net_client_parse(QemuOptsList *opts_list, const char *optarg)
>>>   {
>>> +    if (netdev_is_modern(optarg)) {
>>> +            /*
>>> +             * We need to bypass qemu_opts_parse_noisily() to accept
>>> +             * new style object like addr.type=inet in SocketAddress
>>> +             */
>> 
>> I'm not sure this will makes sense to future readers.
>> 
>> What about "Use modern, more expressive syntax"?
>
> Done.
>
>> 
>>> +            Visitor *v;
>>> +            NetdevQueueEntry *nd;
>>> +
>>> +            v = qobject_input_visitor_new_str(optarg, "type",
>>> +                                              &error_fatal);
>>> +            nd = g_new(NetdevQueueEntry, 1);
>>> +            visit_type_Netdev(v, NULL, &nd->nd, &error_fatal);
>>> +            visit_free(v);
>>> +            loc_save(&nd->loc);
>>> +            nd->is_netdev = strcmp(opts_list->name, "netdev") == 0;
>>> +
>>> +            QSIMPLEQ_INSERT_TAIL(&nd_queue, nd, entry);
>>> +            return 0;
>>> +    }
>> 
>> Matches what we do for -blockdev, except we additionally have
>> nd->is_netdev.  We need it for calling net_client_init1().
>> 
>> If netdev_is_modern(optarg), then the only use of parameter @opts_list
>> is opts_list->name in the initialization of nd->is_netdev.
>> 
>> There's a bit of code smell, I'm afraid.
>
> I don't see what is the problem.

The function's signature

    int net_client_parse(QemuOptsList *opts_list, const char *optarg)

suggests we're parsing @optarg into @opts_list.

We do only if !netdev_is_modern(optarg).  In other words, the function's
actual behavior doesn't match reasonable expectations based on
signature.  A function comment would mitigate.

If nd->is_netdev wasn't needed, we could code all this just like
-blockdev.  I think that would be simpler.

>> I believe @is_netdev needs to be true for -netdev, -nic, and netdev_add;
>> false for -net.
>> 
>> Will we ever use the modern syntax with -net?
>
> Yes, I think we should support the same syntax with -netdev and -net.
>
> My first iteration was to pass is_netdev=true to net_client_init1() and Stefano reported a 
> problem with "-net" with things like that:
>
>      -net dgram,id=socket0,local.type=inet,local.host=localhost,local.port=1234,\
>                            remote.type=inet,remote.host=localhost,remote.port=1235
>      -net nic,model=virtio,macaddr=9a:2b:2c:2d:2e:2f
>
>> 
>> Any chance we can deprecate -net?
>
> Who can decide of that?

Thomas, I think you've done some work to replace use cases of -net.  Do
you know what's left?

>>> +
>>>       if (!qemu_opts_parse_noisily(opts_list, optarg, true)) {
>>>           return -1;
>>>       }
>> 
>
> Thanks,
> Laurent


