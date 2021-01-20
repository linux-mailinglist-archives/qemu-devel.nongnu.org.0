Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E12FCCE2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 09:43:25 +0100 (CET)
Received: from localhost ([::1]:52358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l295I-0006T2-98
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 03:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l294I-0005vR-3x
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 03:42:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l294E-0004xK-Pr
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 03:42:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611132137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j8fEUDHmuoMs2X0jvkf0d7v+5md3E2YxAFbTR2/u6s4=;
 b=IMM8SXtjT2yoSiYyBUl6IwYtDB9TYdj9vSKSv/6nltVXgknpogQHOPsW6143iA2x4z1FJk
 FVe+P48/3Zmt6KV/YgbRc9FoUJB2IdTx3dWkErHqg/PgffDQfiwwalHLt6ms1QqwipmWqS
 UJJUZZGTZLAHW/aHWhrqvSMrgGaPscI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-JHTwxRHEPj2VkaZqhC7hNQ-1; Wed, 20 Jan 2021 03:42:15 -0500
X-MC-Unique: JHTwxRHEPj2VkaZqhC7hNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72474107ACE4
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 08:42:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FB461D7;
 Wed, 20 Jan 2021 08:42:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA793113865F; Wed, 20 Jan 2021 09:42:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 03/25] qemu-option: warn for short-form boolean options
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-4-pbonzini@redhat.com>
 <87o8hkx6n9.fsf@dusky.pond.sub.org>
 <99a014a0-5d9c-07d6-250a-c56e6337cf69@redhat.com>
Date: Wed, 20 Jan 2021 09:42:12 +0100
In-Reply-To: <99a014a0-5d9c-07d6-250a-c56e6337cf69@redhat.com> (Paolo
 Bonzini's message of "Tue, 19 Jan 2021 18:04:35 +0100")
Message-ID: <878s8ovw2j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 19/01/21 16:56, Markus Armbruster wrote:
>>> +            if (!is_help && warn_on_flag) {
>>> +                warn_report("short-form boolean option '%s%s' deprecated", prefix, *name);
>>> +                error_printf("Please use %s=%s instead\n", *name, *value);
>>> +            }
>> 
>> If @warn_on_flag, we warn except for "help" and "?".  The exception
>> applies regardless of @help_wanted.  Shouldn't we except*only*
>> recognized help requests?
>
> Suggesting "help=yes" would be worse.

Would it?

get_opt_name_value() parses one parameter from params into *name and
*value.  if help_wanted && is_help, it additionally sets *help_wanted to
true.  is_help is true when the parameter is "help" or "?".

How could a parameter "help" be handled?

get_opt_name_value() will set

    *name = g_strdup("help");
    *value = g_strdup("on");

If help_wanted, additionally:

    *help_wanted = true;

Callers that pass non-null help_wanted can do whatever they want with
that.  The actual callers do honor the help request.  The deprecation
warning obviously needs to be suppressed for them.

Callers that pass null help_wanted will treat this just like any other
parameter.  Use of the boolean sugar is just as deprecated for this
parameter as it is for all the others.  Suppressing the deprecation
warning feels wrong.

The alternative is to *outlaw* parameters "help" and "?" in QemuOpts.
I'd be cool with that.

>>> -    opts = opts_parse(list, params, permit_abbrev, false,
>>> +    opts = opts_parse(list, params, permit_abbrev, false, true,
>>>                        opts_accepts_any(list) ? NULL : &help_wanted,
>>>                        &err);
>>>      if (!opts) {
>> 
>> This function now warns, except for "help" and "?".  The exception
>> applies even when we treat "help" and "?" as sugar for "help=on" and
>> "?=on" because opts_accepts_any().
>> 
>> It is the only spot that enables the warning.
>> 
>> Does all user input flow through qemu_opts_parse_noisily()?
>> 
>
> I was going to say yes, but -vnc (and worse, the QMP version of "change 
> vnc") is parsed by qemu_opts_parse() via ui/vnc.c (besides being used by 
> lots of tests).  -vnc has several boolean options, and though Libvirt 
> only uses "sasl" it does so in the short form.
>
> My solution would be to deprecate the QMP "change vnc" command, and 
> postpone switching -vnc to qemu_opts_parse_noisily to 6.2.

QMP command 'change' was deprecated long ago, in 2.5.0 (commit
24fb41330, in 2015).  This predated appendix "Deprecated features"
(which has since become docs/system/deprecated.rst), and remained
missing there until I corrected it in commit 6d570ca10 (v4.2.0).

> The main reason to warn for short-form boolean options, is to block them 
> for command line options that are switched to keyval[1].  Adding a 
> warning does not necessarily imply removing in two releases.

Understand.

> Paolo
>
> [1] This series already does that for -M, -accel and -object.  This 
> means that applying this series would change the command line 
> incompatibly without a two-release deprecation.  It's up for discussion 
> whether to do so, or delay the application of those patches to 6.2.  It 
> would be a pity to hold the dependent changes for effectively a year, 
> but it's not a big deal.

Concur.


