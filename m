Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D91F33AEF9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:40:41 +0100 (CET)
Received: from localhost ([::1]:33388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjiE-0001Zn-PU
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lLjhE-0000ed-Qf
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lLjhD-0005AK-8M
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615801170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QDxkzIIjyQf8UstPsa/xUIGdCKvHFygPRHy9sxTChGc=;
 b=X99U1iKNAOZYFAAfo09ZzjHoxNihBur3tGhYUthJ0klFl3CE40x4Pcn8Pob39rrdgKJ/ZD
 G2UvwBC9zv1kmJMnivm33byQkDb1ErsCOujOc5saCLPAHqDGY6kKiUDIeoRiy+P1yfLslN
 6rNJPK3IB2qM3NxZRW9dUZfimAmqe/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-oXKz6endPBOvLFIR3NyARA-1; Mon, 15 Mar 2021 05:39:27 -0400
X-MC-Unique: oXKz6endPBOvLFIR3NyARA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 059548030D7;
 Mon, 15 Mar 2021 09:39:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3EA387B2D;
 Mon, 15 Mar 2021 09:39:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1856F1132C12; Mon, 15 Mar 2021 10:39:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 27/30] hmp: QAPIfy object_add
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-28-kwolf@redhat.com>
 <87pn03rxmq.fsf@dusky.pond.sub.org>
 <cb9bee91-8d38-b232-44bd-b163d7081395@redhat.com>
Date: Mon, 15 Mar 2021 10:39:18 +0100
In-Reply-To: <cb9bee91-8d38-b232-44bd-b163d7081395@redhat.com> (Paolo
 Bonzini's message of "Sat, 13 Mar 2021 15:11:33 +0100")
Message-ID: <87tupckb7d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 13/03/21 14:28, Markus Armbruster wrote:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>>> This switches the HMP command object_add from a QemuOpts-based parser to
>>> user_creatable_add_from_str() which uses a keyval parser and enforces
>>> the QAPI schema.
>>>
>>> Apart from being a cleanup, this makes non-scalar properties and help
>>> accessible. In order for help to be printed to the monitor instead of
>>> stdout, the printf() calls in the help functions are changed to
>>> qemu_printf().
>>>
>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>> Acked-by: Peter Krempa <pkrempa@redhat.com>
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> ---
>>>   monitor/hmp-cmds.c      | 17 ++---------------
>>>   qom/object_interfaces.c | 11 ++++++-----
>>>   hmp-commands.hx         |  2 +-
>>>   3 files changed, 9 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>> index 3c88a4faef..652cf9ff21 100644
>>> --- a/monitor/hmp-cmds.c
>>> +++ b/monitor/hmp-cmds.c
>>> @@ -1670,24 +1670,11 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
>>>   
>>>   void hmp_object_add(Monitor *mon, const QDict *qdict)
>>>   {
>>> +    const char *options = qdict_get_str(qdict, "object");
>>>       Error *err = NULL;
>>> -    QemuOpts *opts;
>>> -    Object *obj = NULL;
>>> -
>>> -    opts = qemu_opts_from_qdict(qemu_find_opts("object"), qdict, &err);
>>> -    if (err) {
>>> -        goto end;
>>> -    }
>>>   
>>> -    obj = user_creatable_add_opts(opts, &err);
>>> -    qemu_opts_del(opts);
>>> -
>>> -end:
>>> +    user_creatable_add_from_str(options, &err);
>>>       hmp_handle_error(mon, err);
>>> -
>>> -    if (obj) {
>>> -        object_unref(obj);
>>> -    }
>>>   }
>> 
>> Doesn't this break the list-valued properties (Memdev member host-nodes,
>> NumaNodeOptions member cpus) exactly the same way that made us keep
>> QemuOpts for qemu-system-FOO -object?
>
> Yes, it does.  I guess it can just be documented, unlike for the command 
> line?

Maybe.  Judgement call, not mine to make.

Do people create such objects in HMP?  I figure we don't really know.
Educated guess?

If you try, how does it break?  Is it confusing?  Can you show an
example?


