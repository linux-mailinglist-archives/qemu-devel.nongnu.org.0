Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BBA68DD72
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:57:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQKx-0000W9-En; Tue, 07 Feb 2023 10:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPQKv-0000W1-SX
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:56:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPQKu-0000re-AL
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675785407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6uQNtNw0gnTHwchBsaip65DsB1rkCSf/yP4sMFDqs0E=;
 b=PNses6IBDBmaiFXfwxyUX5axRGHuzMpelTzu/mOsQe+68asGricUBLrsmFUqULUYEUeeTV
 hX0U3EIaCHNkyvhgiTVG/Zknask6vaQPSA6PCIpbXUPuBvAMCblxvkowWVKzGctqWeU+O/
 p3qzxHZKvJGgEP+feDVFx3PLB4av45g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-v4AguRpMOV2O7vqkXwW3UA-1; Tue, 07 Feb 2023 10:56:35 -0500
X-MC-Unique: v4AguRpMOV2O7vqkXwW3UA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 369AF100F901;
 Tue,  7 Feb 2023 15:56:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB4FE51FF;
 Tue,  7 Feb 2023 15:56:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 88E1621E6A1F; Tue,  7 Feb 2023 16:56:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Laurent Vivier
 <laurent@vivier.eu>,  Thomas Huth <thuth@redhat.com>,  Warner Losh
 <imp@bsdimp.com>,  Kyle Evans <kevans@freebsd.org>
Subject: Re: [RFC PATCH 0/5] Deprecate/rename singlestep command line option
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
Date: Tue, 07 Feb 2023 16:56:33 +0100
In-Reply-To: <20230206171359.1327671-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Mon, 6 Feb 2023 17:13:54 +0000")
Message-ID: <87h6vxo4em.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
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

Peter Maydell <peter.maydell@linaro.org> writes:

> The command line option '-singlestep' and its HMP equivalent
> the 'singlestep' command are very confusingly named, because
> they have nothing to do with single-stepping the guest (either
> via the gdb stub or by emulation of guest CPU architectural
> debug facilities). What they actually do is put TCG into a
> mode where it puts only one guest instruction into each
> translation block. This is useful for some circumstances
> such as when you want the -d debug logging to be easier to
> interpret, or if you have a finicky guest binary that wants
> to see interrupts delivered at something other than the end
> of a basic block.
>
> The confusing name is made worse by the fact that our
> documentation for these is so minimal as to be useless
> for telling users what they really do.
>
> This series:
>  * renames the 'singlestep' global variable to 'one_insn_per_tb'
>  * Adds new '-one-insn-per-tb' command line options and a
>    HMP 'one-insn-per-tb' command
>  * Documents the '-singlestep' options and 'singlestep'
>    HMP command as deprecated synonyms for the new ones
>
> It does not do anything about the other place where we surface
> 'singlestep', which is in the QMP StatusInfo object returned by the
> 'query-status' command.  This is incorrectly documented as "true if
> VCPUs are in single-step mode" and "singlestep is enabled through
> the GDB stub", because what it's actually returning is the
> one-insn-per-tb state.
>
> Things I didn't bother with because this is only an RFC but
> will do if it turns into a non-RFC patchset:
>  * test the bsd-user changes :-)
>  * add text to deprecated.rst
>
> So, questions:
>
> (1) is this worth bothering with at all? We could just
>     name our global variable etc better, and document what
>     -singlestep actually does, and not bother with the new
>     names for the options/commands.

The feature is kind of esoteric.  Rather weak excuse for not fixing bad
UI, in my opinion.  Weaker still since you already did a good part of
the actual work.

> (2) if we do do it, do we retain the old name indefinitely,
>     or actively put it on the deprecate-and-drop list?

By "the old name", you mean the CLI option name, right?

I'd prefer deprecate and drop.

> (3) what should we do about the HMP StatusInfo object?
>     I'm not sure how we handle compatibility for HMP.

Uh, you mean *QMP*, don't you?

As you wrote above, StatusInfo is returned by query-status, which is a
stable interface.  Changes to members therefore require the usual
deprecation grace period.  We'd add a new member with a sane name, and
deprecate the old one.

The matching HMP command is "info status".  It shows member @singlestep
as " (single step mode)".  Changing that is fine; HMP is not a stable
interface.


