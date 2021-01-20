Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA272FCC48
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 09:06:08 +0100 (CET)
Received: from localhost ([::1]:60320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l28VE-0002ee-1c
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 03:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l28TG-000284-Ar
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 03:04:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l28TE-000075-G8
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 03:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611129840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fNfNdOC8wrrA+ruUhuZ6jHyVRZBjFbKTEjWl4IONwQo=;
 b=Um10y62a/1LrPU9/0HVTA6V7R57vIEeGc9vpi5WCehmwRJSs0BX7YP0wb6czlR6xui2w3V
 Vz0km5X+hd7DrJjpZmB8/aiyqAV/qZKKD+6BkNudLbwxLGS9EEo2Egyux7Y6os6nKlVwyG
 mEii/SScottJK/B5bt05v4Sd5LbvZWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-II2GZQouPt2cckyeI7aYNw-1; Wed, 20 Jan 2021 03:03:58 -0500
X-MC-Unique: II2GZQouPt2cckyeI7aYNw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D70510054FF
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 08:03:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA21F1002382;
 Wed, 20 Jan 2021 08:03:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 66128113865F; Wed, 20 Jan 2021 09:03:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/25] qemu-option: clean up id vs. list->merge_lists
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-2-pbonzini@redhat.com>
 <87y2gpxc2q.fsf@dusky.pond.sub.org>
 <0802f4d3-f9b1-540f-b83a-977c01ce8f62@redhat.com>
Date: Wed, 20 Jan 2021 09:03:55 +0100
In-Reply-To: <0802f4d3-f9b1-540f-b83a-977c01ce8f62@redhat.com> (Paolo
 Bonzini's message of "Tue, 19 Jan 2021 15:20:41 +0100")
Message-ID: <87eeigqbkk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 19/01/21 14:58, Markus Armbruster wrote:
>>> qemu_machine_opts ("-M")
>>> 	qemu_find_opts_singleton("machine")
>> 
>> Gone since your commit 4988a4ea4d "vl: switch -M parsing to keyval".
>
> Which is part of this series and not yet included in QEMU. Hence the 
> commit message talks about it in the present tense.

I got confused.

>> If the user passes multiple -boot with different ID, we merge the ones
>> with same ID, and then vl.c gets the (merged) one without ID, but the
>> other two get the (merged) one that contains the first -boot.  All three
>> silently ignore the ones they don't get.  Awesomely weird.  I'd call it
>> a bug.
>> 
>> Test case:
>> 
>>      $ upstream-qemu -S -display none -boot strict=on,id=id -boot strict=off
>> 
>> vl.c uses strict=off, but fw_cfg.c uses strinct=on,id=id.
>> 
>> Outlawing "id" with .merge_lists like this patch does turns the cases
>> where the two methods yield different results into errors.  A bug fix of
>> sorts.  Should the commit message should cover it?
>
> Yeah, I can add that.

Thanks!

>> [qemu_action_opts]
>> should not use QemuOpts at all.  Use of qmp_marshal_FOO() is an
>> anti-pattern.  Needs cleanup.  Not in this patch, and probably not even
>> in this series.
>
> --verbose needed.  Why is it an anti-pattern?  I found it a clever way 
> to avoid code duplication. :)  Doesn't matter for this series, anyway.

Because it's a clever way to do something that should not be done :)

-action wraps around QMP command set-action.  This means we need to
parse -action's argument into set-action's argument type.  That's a QAPI
type.  It's anonymous in the schema, and q_obj_set_action_arg in C.

As implemented, the parsing takes a detour through QemuOpts:

        char *optarg
             |
             |  opts = qemu_opts_parse_noisily(optarg);
             v
       QemuOpts *opts
             |
             |  qdict = qemu_opts_to_qdict(opts, NULL);
             v
        QDict *qdict
             |
             |  in qmp_marshal_set_action(qdict):
             |  v = qobject_input_visitor_new_str(qdict);
             |  visit_type_q_obj_set_action_arg_members(v, &arg, errp);
             v
  q_obj_set_action_arg arg

qmp_marshal_set_action() then passes the members of
q_obj_set_action_arg() to qmp_set_action().

The detour should be avoided, because QemuOpts should be avoided.  Using
the appropriate visitor, we get:

        char *optarg
             |
             |  v = qobject_input_visitor_new_str(string, NULL, errp)
             |  visit_type_q_obj_set_action_arg(v, NULL, &arg, errp);
             v
  q_obj_set_action_arg arg

except visit_type_q_obj_set_action_arg() doesn't exist, because the QAPI
type is anonymous.  So give it a name:

    { 'struct: 'Action',
      'data': { '*reboot': 'RebootAction',
                '*shutdown': 'ShutdownAction',
                '*panic': 'PanicAction',
                '*watchdog': 'WatchdogAction' } }

    { 'command': 'set-action',
      'data': 'Action',
      'allow-preconfig': true }

        char *optarg
             |
             |  v = qobject_input_visitor_new_str(string, NULL, errp)
             |  visit_type_Action(v, NULL, &arg, errp);
             v
         Action act

To avoid having to pass the members of Action to qmp_set_action(), throw
in 'boxed': true, so you can simply call qmp_set_action(&act, errp).

Aside: I'd like to have this QAPI/CLI boilerplate generated, like we
generate the QAPI/QMP boilerplate.  Not today; QAPI-land is busy with
John's static typing work.

>>> command line is considered.  With this patch we just forbid id
>>> on merge-lists QemuOptsLists; if the command line still works,
>>> it has the same semantics as before.
>> 
>> It can break working (if weird) command lines, such as ones relying on
>> "merge ignoring ID" behavior of -name, -icount, -action.  Okay.
>
> Right, I wrote that down as a feature.  The important thing is keeping 
> things the same if they still work.

Yes.

>> [If !lists->merge_lists], if id= is specified, it must be unique,
>> i.e. no prior opts with the same id.
>> 
>> Else, we don't check for prior opts without id.
>> 
>> There's at most one opts with a certain id, but there could be any
>> number without id.  Is this what we want?
>
> Yes, positively.  Example: "qemu-system-x86_64 -device foo -device bar".

D'oh!  QemuOpts left me no brain capacity for remembering the simplest
things %-}

>>> Discounting the case that aborts as it's not user-controlled (it's
>>> "just" a matter of inspecting qemu_opts_create callers), the paths
>>> through qemu_opts_create can be summarized as:
>>>
>>> - merge_lists = true: singleton opts with NULL id; non-NULL id fails
>>>
>>> - merge_lists = false: always return new opts; non-NULL id fails if dup
>> 
>> This renders the qemu_opts_foreach() silly.  Cleanup is in order, not
>> necessarily in this patch.
>
> Agreed.  This one is already tricky enough (though I like the outcome).

Me too.


