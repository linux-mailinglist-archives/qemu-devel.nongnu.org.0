Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB7C6A5CA5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 16:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX2Mv-0005qG-RQ; Tue, 28 Feb 2023 10:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pX2Mo-0005pQ-0M
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:58:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pX2Mm-00072X-4Z
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677599890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mf/KF4tXKuQnCbz4KAzgpPWiQs9jxi+AcZ+NOO2zb58=;
 b=PT2RuNcOubh+bhiXowYMvykTse67Ck4ouL6ga4OZUlPDrmhx8aKVzbtUM2j0KQdaId8DQO
 Y4qFJuknFmNLROdydgF1GAAU3biL7nGzS5lLghep2qWZwyMS79qFZBQ3AIJ97lpgKUaoxt
 EEqIPjAzudTeXUuhzGyzdbkv/DU5gy8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-3FGGPPKfNAGP3wkdQ5JSSA-1; Tue, 28 Feb 2023 10:58:06 -0500
X-MC-Unique: 3FGGPPKfNAGP3wkdQ5JSSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 620A110113C1;
 Tue, 28 Feb 2023 15:58:04 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 213B51121314;
 Tue, 28 Feb 2023 15:58:03 +0000 (UTC)
Date: Tue, 28 Feb 2023 09:58:01 -0600
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
Message-ID: <20230228155801.s2imkaybh3a4d5x3@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-8-marcandre.lureau@redhat.com>
 <87fsb4k85h.fsf@pond.sub.org>
 <CAMxuvax6qPYQCzNX7vESJM9_f5k4C1Yat0sJcJjrHkh_1WGpQA@mail.gmail.com>
 <87a61821y3.fsf@pond.sub.org>
 <CAJ+F1CJNgmf+j36wutNMdPYBShoZUXJvzEBGEVwW-B-Z6Tc3ug@mail.gmail.com>
 <87356yq9rs.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87356yq9rs.fsf@pond.sub.org>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Wed, Feb 22, 2023 at 11:23:03AM +0100, Markus Armbruster wrote:
> > However, I think it would be simpler, and better, if we piped the
> > generated code to clang-format (when available). I made a simple patch
> > for that too.
> 
> Piping through indent or clang-format may well give us neater results
> for less effort.
> 
> We might want to dumb down generator code then.

Indeed, this approach seems like it might be worth pursuing (our
generator doesn't have to worry about spacing, because we do that in a
second pass with something that will still produce human-legible final
results).

> >> > So I would rather assert that we don't introduce such a schema, until we
> >> > fix the code generator. Or we acknowledge the limitation, and treat it as a
> >> > schema error. Other ideas?
> >>
> >> Yes: throw an error.  Assertions are for programming errors.  This isn't
> >> a programming error, it's a limitation of the current implementation.
> >>
> >> How hard would it be to lift the limitation?
> >
> > Taking this as a problematic example:
> >
> > void function(first,
> > #ifdef A
> >     a,
> > #endif
> > #ifdef B
> >     b
> > #endif
> > )

I am NOT a fan of preprocessor conditionals mid-function-signature.
It gets really nasty, really fast.  Is there any way we can have:

struct S {
#ifdef A
  type a;
#endif
#ifdef B
  type b;
#endif
};

void function(struct S)

so that the preprocessor conditionals never appear inside ()?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


