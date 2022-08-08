Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A53C58C2C0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 07:19:06 +0200 (CEST)
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKvAP-0005rZ-Gh
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 01:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oKv5x-0002cH-1v
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:14:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oKv5k-0002TE-Vb
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659935655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Thob7gePXl9Jy9AjQmoGbMg5qhdRuJu7xdniGsDXDY=;
 b=Tc1oaLg3VUSjCJtbGuK1rOJfGTKOGDEIKwCQ1DWK2DDR8oDiMNg8NRf6WyjhJ6X0GL094v
 9M1V62cjQbNhYErFXpQ8U2tWLnOqGSzXZPhOfTfMV8cP9Bj6Ot2l4cWfZxaB1BZ9oyJjzJ
 SIpPeNxEVSPJesUsTxMuRRujvsT9b0A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-L6CKxFGuNpeb7MoI3i7f2A-1; Mon, 08 Aug 2022 01:14:12 -0400
X-MC-Unique: L6CKxFGuNpeb7MoI3i7f2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 340AC811766
 for <qemu-devel@nongnu.org>; Mon,  8 Aug 2022 05:14:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 113204010D27;
 Mon,  8 Aug 2022 05:14:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E067421E6930; Mon,  8 Aug 2022 07:14:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH for-7.1] vl: fix [memory] section with -readconfig
References: <20220805100635.493961-1-pbonzini@redhat.com>
 <875yj66c6f.fsf@pond.sub.org>
 <438ab33b-62c8-d114-4360-9baa2300cc58@redhat.com>
Date: Mon, 08 Aug 2022 07:14:10 +0200
In-Reply-To: <438ab33b-62c8-d114-4360-9baa2300cc58@redhat.com> (Paolo
 Bonzini's message of "Fri, 5 Aug 2022 19:16:43 +0200")
Message-ID: <878rnzz599.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 8/5/22 15:40, Markus Armbruster wrote:
>>> +    loc_push_none(&loc);
>>> +    qemu_opts_loc_restore(opts);
>>> +
>>>       prop = qdict_new();
>>>         if (qemu_opt_get_size(opts, "size", 0) != 0) {
>>
>> This treats "size=0" like absent size.  Before commit ce9d03fb3f, we
>> instead checked
>>         mem_str = qemu_opt_get(opts, "size");
>>         if (mem_str) {
>> Makes more sense, doesn't it?
>
> True, on the other hand before commit ce9d03fb3f we handled "-m 0" like this:
>
>     sz = 0;
>     mem_str = qemu_opt_get(opts, "size");
>     if (mem_str) {
>         ...
>     }
>     if (sz == 0) {
>         sz = default_ram_size;
>     }
>
> Now instead, the "-m 0" case results in no qdict_put_str() call at all.   So the code flows better with qemu_opt_get_size(opts, "size", 0).

I see.

> In addition, using qemu_opt_get_size() is what enables the dead code removal below, because it generates an error for empty size.

My personal preference would be to default only absent size, but not an
explicit size=0.  But that's a change, and you patch's mission is fix,
not change, so okay.

>> Also, with the new check above, the check below...
>>             mem_str = qemu_opt_get(opts, "size");
>>             if (!*mem_str) {
>>                 error_report("missing 'size' option value");
>>                 exit(EXIT_FAILURE);
>>             }
>> ... looks dead.  We get there only when qemu_opt_get_size() returns
>> non-zero, which implies a non-blank string.
>
> Makes sense.  Separate patch?

Sure!

>>>   static void qemu_create_machine(QDict *qdict)
>> Commit ce9d03fb3f changed this function's purpose and renamed it from
>> set_memory_options() to parse_memory_options().
>> This commit is a partial revert.  It doesn't revert the change of name.
>> Intentional?
>
> Yes, though honestly both are pretty bad names.  set_memory_options() is bad because it's not setting anything, it's just putting the values in a 
> QDict.  I kept parse_*() because it does do a limited amount of parsing to handle the suffix-less memory size.

Intentionally keeping a moderately bad name is okay.

Okay need not stop us from looking for a better one, so: the function's
purpose is to merge the contents of QemuOpts (singleton) group "memory"
into machine options.  merge_memory_into_machine_options()?


