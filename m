Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9363DEBA6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 13:22:10 +0200 (CEST)
Received: from localhost ([::1]:36062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAsUo-0006hX-Oz
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 07:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAsTL-0005RT-Rw
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:20:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAsTI-0002UM-KR
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627989630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RriM31YDDhvv0PtdIXrKfn/wH1h1AKS8rEzG2sv6Vxk=;
 b=I0e5tE6oQ5eKmKxFotaK0+yq+3YQ2SewVrsK0SK16lWTHP3Q+F2ADUU3iGhgqcF06vO9rs
 fA7YpMKk//JXs16Qfl2x4TE8piV7mIODh67nCDbZTYhoRqLCvj22Xqkj4b7JsCHBFuuFYL
 97fml/eaghd5R4naPDQBcf2pEVzZ9Go=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-ZAh5J1y7OQCkxhUPYGC6CA-1; Tue, 03 Aug 2021 07:20:29 -0400
X-MC-Unique: ZAh5J1y7OQCkxhUPYGC6CA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB05680196C
 for <qemu-devel@nongnu.org>; Tue,  3 Aug 2021 11:20:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 783EA6A90C;
 Tue,  3 Aug 2021 11:20:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D44DA11380A0; Tue,  3 Aug 2021 13:19:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v6 05/11] qapi: introduce QAPISchemaIfCond.cgen()
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-6-marcandre.lureau@redhat.com>
 <87pmuvoqek.fsf@dusky.pond.sub.org>
Date: Tue, 03 Aug 2021 13:19:59 +0200
In-Reply-To: <87pmuvoqek.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Mon, 02 Aug 2021 16:46:43 +0200")
Message-ID: <87a6lyu65c.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eric Blake <eblake@redhat.com>, jsnow@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> marcandre.lureau@redhat.com writes:
>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Instead of building prepocessor conditions from a list of string, use
>> the result generated from QAPISchemaIfCond.cgen() and hide the
>> implementation details.
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Please mention that the patch changes generated code.  See below for
> details.

[...]

> This patch does three things:
>
> (1) Change gen_if(), gen_endif() to always generate a single #if,
>     #endif.  This enables:
>
> (2) Factor cgen_ifcond() out of gen_if() and gen_endif()
>
> (3) Lift the call of cgen_ifcond() into into gen_if()'s, gen_endif()'s
>     callers.
>
> I'd split the patch.  This is *not* a demand.
>
> The motivation for (3) is unclear.  Is it so gen_if() doesn't depend on
> QAPISchemaIfCond?
>
> Step (1) affects the generated code.  When @ifcond is [COND1, COND2, ...]=
,
> gen_if()'s value changes from
>
>     #if COND1
>     #if COND2
>     ...
>
> to
>
>     #if (COND1) && (COND2)

[...]

> The common case: when it's just [COND], the value changes from
>
>     #if COND
>
> to
>
>     #if (COND)
>
> which is a bit ugly.
>
> Example: in qapi-types-block-export.c

[...]

> Avoiding the redundant pair of parenthesis takes another special case.
> Let's do it.

Looks like PATCH 07 does it.  Avoiding the temporary change would be
nice, but isn't required.


