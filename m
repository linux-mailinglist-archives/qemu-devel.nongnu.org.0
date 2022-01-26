Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EBA49CC82
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:39:29 +0100 (CET)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCjSK-0001Ar-Q5
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:39:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCjLW-0008QS-RB
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:32:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCjLT-0001I4-H2
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643207542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Imy/xJBNpZPLY5bQDd42/ad9N6T3UuMFL9ujdlq2T3w=;
 b=USU2NIpUuC+Ah8dhCupu3B76BK3MuNnW62yrHmvyOcRdEP48222yJAFTh+PsZ4cf3rOI7W
 gUm75bqSuGf8QXL24CF3RO09G+6wCetYLhqOFuqTQeD6OnKjD0DpnTyVkcqF5cT0+xXzaD
 PZ1T7KJZM3ly0IrOkjz+w0+2z4yd5J4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-l04NkKUYPJK9H1FcvFsXhg-1; Wed, 26 Jan 2022 09:32:20 -0500
X-MC-Unique: l04NkKUYPJK9H1FcvFsXhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5FDE19253C0;
 Wed, 26 Jan 2022 14:32:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-10.ams2.redhat.com
 [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 737396D032;
 Wed, 26 Jan 2022 14:32:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EAF79113864A; Wed, 26 Jan 2022 15:32:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 1/7] scripts/qapi/gen.py: add FOO.trace-events output
 module
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
 <20220125215655.3111881-2-vsementsov@virtuozzo.com>
 <YfFKimcv/Eyn4jIb@stefanha-x1.localdomain>
Date: Wed, 26 Jan 2022 15:32:17 +0100
In-Reply-To: <YfFKimcv/Eyn4jIb@stefanha-x1.localdomain> (Stefan Hajnoczi's
 message of "Wed, 26 Jan 2022 13:20:10 +0000")
Message-ID: <87bkzysh3i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 michael.roth@amd.com, qemu-devel@nongnu.org, hreitz@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Tue, Jan 25, 2022 at 10:56:49PM +0100, Vladimir Sementsov-Ogievskiy wrote:
>> @@ -264,6 +272,14 @@ def _genh(self) -> QAPIGenH:
>>          assert self._current_module is not None
>>          return self._module[self._current_module][1]
>>  
>> +    @property
>> +    def _gent(self) -> QAPIGenTrace:
>
> If you respin maybe rename this to _gentrace() or even
> _gen_trace_events() so the name is clearer (although the latter collides
> with the self._gen_trace_events field and may need to be renamed to
> enable_trace_events or similar).

We have ._genc() for .c, and ._genh() for .h.  Applying the same to
.trace-events results in ._gentrace_events, but that's ugly.

I'm okay with ._gen_trace_events().  Regarding the name collision: I
already suggested renaming attribute ._gen_trace_events to
._gen_tracing.

We might want to rename ._genc() and .genh() to .gen_c() and .gen_h()
for consistency.  Don't worry about that now.


