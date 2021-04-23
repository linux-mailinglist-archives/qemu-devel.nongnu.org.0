Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDA3369527
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 16:54:33 +0200 (CEST)
Received: from localhost ([::1]:55344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZxCR-0001cP-Qh
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 10:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZxBh-0001B7-On
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 10:53:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZxBe-0001LP-Uv
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 10:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619189621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z0vLoyhwo5RPzu/8T+Y8Rq1IIQQ8woNonm+DEcwTKOY=;
 b=bj/K3NYVJHJya1o8vz2xk7yEPD5zw2sNBTg/FB2w6R6G76xNTtmYgGrTh/llGWCPuW5PM9
 o2S1b7YqeI5OkY19PijIHlQV5fE0mgFuc8k25XNQNwDBnUvJnIfKrBky83LolSQY4mvxVV
 3eoBl4vo86dtDTvmCSNo8Ha/zvfAwPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-Hi9H5IwRNBuHurM6Z5juzA-1; Fri, 23 Apr 2021 10:53:38 -0400
X-MC-Unique: Hi9H5IwRNBuHurM6Z5juzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 981B1107ACCD;
 Fri, 23 Apr 2021 14:53:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 392B712BF3;
 Fri, 23 Apr 2021 14:53:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ABC8B113525D; Fri, 23 Apr 2021 16:53:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 10/15] hostmem: Wire up RAM_NORESERVE via "reserve"
 property
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-11-david@redhat.com>
 <87a6ppi77c.fsf@dusky.pond.sub.org>
 <7cf63e36-1d1c-113d-15b5-227d099d76a1@redhat.com>
 <878s59gq1v.fsf@dusky.pond.sub.org>
 <884e43d0-36c1-f897-3a4e-03d96a9861c0@redhat.com>
Date: Fri, 23 Apr 2021 16:53:18 +0200
In-Reply-To: <884e43d0-36c1-f897-3a4e-03d96a9861c0@redhat.com> (David
 Hildenbrand's message of "Fri, 23 Apr 2021 16:21:22 +0200")
Message-ID: <87sg3hdpcx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> On 23.04.21 14:10, Markus Armbruster wrote:
>> David Hildenbrand <david@redhat.com> writes:
>> 
>>>>> diff --git a/backends/hostmem.c b/backends/hostmem.c
>>>>> index c6c1ff5b99..58fdc1b658 100644
>>>>> --- a/backends/hostmem.c
>>>>> +++ b/backends/hostmem.c
>>>>> @@ -217,6 +217,11 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
>>>>>        Error *local_err = NULL;
>>>>>        HostMemoryBackend *backend = MEMORY_BACKEND(obj);
>>>>>    +    if (!backend->reserve && value) {
>>>>> +        error_setg(errp, "'prealloc=on' and 'reserve=off' are incompatible");
>>>>> +        return;
>>>>> +    }
>>>>
>>>> Aha.  Shouldn't this be documented in qom.json?
>>>
>>> Whoops, skipped that comment. Can add it if that's the place to
>>> document that.
>> 
>> Yes, please.  .json doc comments is where we document the external
>> interface.
>> 
>
> What about something like this:
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index e9b86893a5..4fa3137aab 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -559,6 +559,12 @@
>   #                                        false generally, but true for machine
>   #                                        types <= 4.0)
>   #
> +# Note: prealloc=true and reserve=false cannot be set at the same time. With
> +#       reserve=true, the behavior depends on the operating system: for example,
> +#       Linux will not reserve swap space for shared file mappings --
> +#       "not applicable". In contrast, reserve=false will bail out if it cannot
> +#       be configured accordingly.
> +#
>   # Since: 2.1
>   ##
>   { 'struct': 'MemoryBackendProperties',

Thanks!

Reviewed-by: Markus Armbruster <armbru@redhat.com>


