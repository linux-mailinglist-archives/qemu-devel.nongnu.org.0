Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333DA6F8FD3
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:21:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCE5-0002YW-Fq; Sat, 06 May 2023 03:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pvCDy-0002Xm-HV
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:20:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pvCDv-00040Y-7E
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683357654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2OFyotySzWbDUXfIGE5XkS+Cl7lSzaMi0fivddblRw=;
 b=gYhDkTqy1xhzoQnDU+6MUp4TufVj8z+bKsVZb9sGX342UAWaQ1dRsLsNAWW7cKROBAZCGb
 pP/AoI4V2LHAmQMR6cN5EEqMDjfdzJBsAFMUQXrJGCCuJwV/xjfk+QLa4+bXu88FlQLCoo
 waY06DtJaaYpVA+F1yALCvUP8iLeyqs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-lcF5rG_SNkiLwFJfuaDAjA-1; Sat, 06 May 2023 03:20:49 -0400
X-MC-Unique: lcF5rG_SNkiLwFJfuaDAjA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 885801C05AEC;
 Sat,  6 May 2023 07:20:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEB53492B01;
 Sat,  6 May 2023 07:20:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9CA0421E6924; Sat,  6 May 2023 09:20:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,  qemu-devel@nongnu.org,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Christian Schoenebeck
 <qemu_oss@crudebyte.com>,  Michael Roth <michael.roth@amd.com>,  Eric
 Blake <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Greg
 Kurz <groug@kaod.org>,  Eduardo Habkost <eduardo@habkost.net>,  Yanan Wang
 <wangyanan55@huawei.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,  Warner Losh <imp@bsdimp.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Riku Voipio <riku.voipio@iki.fi>
Subject: Re: [PATCH v3 05/10] qapi: make the vcpu parameters deprecated for 8.1
References: <20230505155336.137393-1-alex.bennee@linaro.org>
 <20230505155336.137393-6-alex.bennee@linaro.org>
Date: Sat, 06 May 2023 09:20:46 +0200
In-Reply-To: <20230505155336.137393-6-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Fri, 5 May 2023 16:53:31 +0100")
Message-ID: <87a5yirkmp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> I don't think I can remove the parameters directly but certainly mark
> them as deprecated.
>
> Message-Id: <20230420150009.1675181-6-alex.bennee@linaro.org>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20230503091756.1453057-6-alex.bennee@linaro.org>
> ---
>  qapi/trace.json | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/qapi/trace.json b/qapi/trace.json
> index f425d10764..de6b1681aa 100644
> --- a/qapi/trace.json
> +++ b/qapi/trace.json
> @@ -33,9 +33,9 @@
>  #
>  # @name: Event name.
>  # @state: Tracing state.
> -# @vcpu: Whether this is a per-vCPU event (since 2.7).
> +# @vcpu: Whether this is a per-vCPU event (deprecated since 8.1).

We don't normally replace the (since ...) when we deprecate.

>  #
> -# An event is per-vCPU if it has the "vcpu" property in the "trace-event=
s"
> +# There are no longer any events with the "vcpu" property in the "trace-=
events"

Why would a user still need to know what @vcpu used to mean?  Also, long
line.  See below for a possible alternative.

>  # files.
>  #
>  # Since: 2.2

You need to make it official, like so:

   { 'struct': 'TraceEventInfo',
  -  'data': {'name': 'str', 'state': 'TraceEventState', 'vcpu': 'bool'} }
  +  'data': {'name': 'str', 'state': 'TraceEventState',
  +           'vcpu': { 'type': 'bool', 'features': ['deprecated'] } } }

And then the generator will demand you document it formally, so you also
need something like

 # @state: Tracing state.
 # @vcpu: Whether this is a per-vCPU event (since 2.7).
 #
-# An event is per-vCPU if it has the "vcpu" property in the "trace-events"
-# files.
+# Features:
+# @deprecated: Member @vcpu is deprecated, and always false.
 #
 # Since: 2.2
 ##

Additionally, update docs/about/deprecated.rst.

> @@ -49,19 +49,15 @@
>  # Query the state of events.
>  #
>  # @name: Event name pattern (case-sensitive glob).
> -# @vcpu: The vCPU to query (any by default; since 2.7).
> +# @vcpu: The vCPU to query (deprecated since 8.1).

Again, we don't normally replace the (since ...) when we deprecate.

I suggest to just drop the "any by default" part.

>  #
>  # Returns: a list of @TraceEventInfo for the matching events
>  #
>  #          An event is returned if:
>  #
>  #          - its name matches the @name pattern, and
> -#          - if @vcpu is given, the event has the "vcpu" property.
>  #
> -#          Therefore, if @vcpu is given, the operation will only match p=
er-vCPU events,
> -#          returning their state on the specified vCPU. Special case: if=
 @name is an
> -#          exact match, @vcpu is given and the event does not have the "=
vcpu" property,
> -#          an error is returned.
> +#          There are no longer any per-vCPU events
>  #
>  # Since: 2.2
>  #

Please add 'features': ['deprecated'].

> @@ -84,17 +80,13 @@
>  # @name: Event name pattern (case-sensitive glob).
>  # @enable: Whether to enable tracing.
>  # @ignore-unavailable: Do not match unavailable events with @name.
> -# @vcpu: The vCPU to act upon (all by default; since 2.7).
> +# @vcpu: The vCPU to act upon (deprecated since 8.1).

Suggest to just drop the "all by default" part.

>  #
>  # An event's state is modified if:
>  #
> -# - its name matches the @name pattern, and
> -# - if @vcpu is given, the event has the "vcpu" property.
> +# - its name matches the @name pattern
>  #
> -# Therefore, if @vcpu is given, the operation will only match per-vCPU e=
vents,
> -# setting their state on the specified vCPU. Special case: if @name is a=
n exact
> -# match, @vcpu is given and the event does not have the "vcpu" property,=
 an
> -# error is returned.
> +# There are no longer and per-vCPU events so specifying it will never ma=
tch.
>  #
>  # Since: 2.2
>  #

Please add 'features': ['deprecated'].


