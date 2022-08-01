Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF6A586CB9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 16:21:27 +0200 (CEST)
Received: from localhost ([::1]:49516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIWIO-00058P-44
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 10:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIWCK-0001GF-7Z
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:15:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIWCF-0001gi-DO
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:15:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659363301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZYpLESn+Ri8kJUmlHrQ0iWbHUTf4E+w1fFeKc534TLk=;
 b=KeQ9+yuEOz1YnTaSmcga6SYy9Fee3/aMxjU+YAPKd62NQEdFSbWMLpt2SpMTSOWLNt0qZ7
 UE+e5ZYH850Rk7Ia7EMK5SKAvTRy8aTkpn27RWnUwJ2qjmBd4fE1Zduc8X47SX8qwFwb+q
 u7MCMmqBfPEwmUtSb+PBnCESMkddRjE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-vwvOR7CLN2ibsFHmVogG5Q-1; Mon, 01 Aug 2022 10:14:58 -0400
X-MC-Unique: vwvOR7CLN2ibsFHmVogG5Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2072A185A794;
 Mon,  1 Aug 2022 14:14:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAD5A2026D07;
 Mon,  1 Aug 2022 14:14:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A635221E6930; Mon,  1 Aug 2022 16:14:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,  David Hildenbrand
 <david@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  qemu-s390x@nongnu.org,  qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] qapi: Add exit-failure PanicAction
References: <20220725223746.227063-1-iii@linux.ibm.com>
 <20220725223746.227063-2-iii@linux.ibm.com>
Date: Mon, 01 Aug 2022 16:14:56 +0200
In-Reply-To: <20220725223746.227063-2-iii@linux.ibm.com> (Ilya Leoshkevich's
 message of "Tue, 26 Jul 2022 00:37:45 +0200")
Message-ID: <87y1w8caov.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Currently QEMU exits with code 0 on both panic an shutdown. For tests
> it is useful to return 1 on panic, so that it counts as a test
> failure.
>
> Introduce a new exit-failure PanicAction that makes main() return
> EXIT_FAILURE. Tests can use -action panic=exit-failure option to
> activate this behavior.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: David Hildenbrand <david@redhat.com>

[...]

> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 6e2162d7b3..9273ea6516 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -364,10 +364,13 @@
   ##
   # @PanicAction:

This is the type of set-action argument @panic, which is documented as
"action taken on guest panic."

   #
   # @none: Continue VM execution

I guess this is effectively "do nothing / ignore".

   #
   # @pause: Pause the VM

Clear enough.

>  #
>  # @shutdown: Shutdown the VM and exit, according to the shutdown action

I guess this is the value of set-action argument @shutdown, which is
can be

* @poweroff, documented as "Shutdown the VM and exit"

  Do we exit successfully, i.e. with zero status?

* @pause, documented as "pause the VM"

  PanicAction's documentation claims "shutdown the VM and exit", but we
  don't, we pause instead.  Not this patch's problem.

>  #
> +# @exit-failure: Shutdown the VM and exit with nonzero status

non-zero

> +#                (since 7.1)
> +#
>  # Since: 6.0
>  ##
>  { 'enum': 'PanicAction',
> -  'data': [ 'pause', 'shutdown', 'none' ] }
> +  'data': [ 'pause', 'shutdown', 'exit-failure', 'none' ] }
>  
>  ##
>  # @watchdog-set-action:

Not this patch's problem, but here goes anyway:

   ##
   # @set-action:
   #
   # Set the actions that will be taken by the emulator in response to guest
   # events.
   #
   # @reboot: @RebootAction action taken on guest reboot.
   #
   # @shutdown: @ShutdownAction action taken on guest shutdown.
   #
   # @panic: @PanicAction action taken on guest panic.
   #
   # @watchdog: @WatchdogAction action taken when watchdog timer expires .
   #
   # Returns: Nothing on success.
   #
   # Since: 6.0
   #
   # Example:
   #
   # -> { "execute": "set-action",
   #      "arguments": { "reboot": "shutdown",
   #                     "shutdown" : "pause",
   #                     "panic": "pause",
   #                     "watchdog": "inject-nmi" } }
   # <- { "return": {} }
   ##

The arguments are all optional, but the documentation neglects to spell
out what "absent" means.  I guess it means "no change".

The documentation also neglects to spell out the initial settings,
i.e. behavior when you don't configure an action with set-action.

[...]


