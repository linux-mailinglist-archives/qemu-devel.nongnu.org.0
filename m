Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058065FC3AE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 12:25:02 +0200 (CEST)
Received: from localhost ([::1]:56166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiYv5-0002AK-HG
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 06:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oiYtj-0007qy-39
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 06:23:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oiYte-0003vc-Ly
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 06:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665570206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zUYLiwF8VOr3DqegZOMlNApHxR/3RPr6/j4riuGyI5k=;
 b=KTUOrcb25FCwopewB/5+OP3zE3zMWaEYaGvbKFcT29WgpjRkpB8tAupAnUDrSg8tpuwQgx
 ckM/2NnP8F6JukjZVEUGar+kWCcc/385ZGuOarCqf/ohN+EohMfjfoITVJyJhtVhiumOw/
 Iq3BrMmF/vv3feS1B0Ywpkt4J3MpASY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-SRgjDmanMdeMvyzy1AYcMQ-1; Wed, 12 Oct 2022 06:23:22 -0400
X-MC-Unique: SRgjDmanMdeMvyzy1AYcMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B3DD85A583;
 Wed, 12 Oct 2022 10:23:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F9B42221;
 Wed, 12 Oct 2022 10:23:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A4BC21E691D; Wed, 12 Oct 2022 12:23:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  Michal Privoznik <mprivozn@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v2 3/7] util: Introduce ThreadContext user-creatable object
References: <20221010091117.88603-1-david@redhat.com>
 <20221010091117.88603-4-david@redhat.com>
 <87czayj4ig.fsf@pond.sub.org>
 <e689f938-f95d-f34c-117d-da58315576fa@redhat.com>
 <874jw9fp0j.fsf@pond.sub.org>
 <ee441feb-3293-efe7-e273-3d28910a0b19@redhat.com>
Date: Wed, 12 Oct 2022 12:23:20 +0200
In-Reply-To: <ee441feb-3293-efe7-e273-3d28910a0b19@redhat.com> (David
 Hildenbrand's message of "Wed, 12 Oct 2022 10:19:11 +0200")
Message-ID: <878rlle3xj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> Thanks Markus!
>
>> I just tested again, and get the same result as you.  I figure my
>> previous test was with the complete series.
>> PATCH 5 appears to make it work.  Suggest to say something like "The
>> commit after next will make this work".
>
> I'll phrase it like " We'll wire this up next to make it work."

Works for me!

> [...]
>
>>>> So, when a thread is created, its affinity comes from its thread context
>>>> (if any).  When I later change the context's affinity, it does *not*
>>>> affect existing threads, only future ones.  Correct?
>>>
>>> Yes, that's the current state.
>> 
>> Thanks!
>
> I'm adding
>
> "Note that the CPU affinity of previously created threads will not get adjusted."
>
> and
>
> "In general, the interface behaves like pthread_setaffinity_np(): host CPU numbers that are currently not available are ignored; only host CPU 
> numbers that are impossible with the current kernel will fail. If the list of host CPU numbers does not include a single CPU that is 
> available, setting the CPU affinity will fail."

This is one of the reasons why reviewing your work is such a pleasure:
not only do you answer my questions with clarity and patience, you
proactively improve your patches before I can even think to ask.

Thank you!


