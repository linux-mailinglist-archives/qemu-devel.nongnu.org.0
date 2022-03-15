Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1289F4D9D3F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:19:10 +0100 (CET)
Received: from localhost ([::1]:37750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU80y-0007TG-S0
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:19:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU7y3-0006ZN-4Q
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU7y0-0005gA-OK
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647353764;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G34M2wqplRWeWarXP0G90H9Fcumln5YneSZGyKEyuqA=;
 b=JIir7fGc75OkrO6UaI77uhmDa1aMfsnAqH6OmYKt4x8HmFUgFyaUnDu5dtySL2WeXxZ13/
 fyoo7KyxfsBZxGEvUTTb0xUbQDm8dLFFPIlL69VNotCkb3F72pdWGRA5D1ByC+/um5Dc27
 RZM33917aaK9U+k2bU+nGvvSLEx//FQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-damje9vXMueOcGOcWhJQuA-1; Tue, 15 Mar 2022 10:15:48 -0400
X-MC-Unique: damje9vXMueOcGOcWhJQuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A4903C11C7A;
 Tue, 15 Mar 2022 14:15:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 049DF41136E2;
 Tue, 15 Mar 2022 14:15:44 +0000 (UTC)
Date: Tue, 15 Mar 2022 14:15:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v1 7/8] semihosting: clean up handling of expanded argv
Message-ID: <YjCfjmxMnGZYGGv6@redhat.com>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-8-alex.bennee@linaro.org>
 <6c7bdb98-ad58-e48e-caa5-a9747b8ad90b@gmail.com>
 <87a6dr48n2.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87a6dr48n2.fsf@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: fam@euphon.net, sw@weilnetz.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 01:59:59PM +0000, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> writes:
> 
> > On 15/3/22 13:12, Alex Bennée wrote:
> >> Another cleanup patch tripped over the fact we weren't being careful
> >> in our casting. Fix the casts, allow for a non-const and switch from
> >> g_realloc to g_renew.
> >> The whole semihosting argument handling could do with some tests
> >> though.
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> ---
> >>   semihosting/config.c | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >> diff --git a/semihosting/config.c b/semihosting/config.c
> >> index 137171b717..50d82108e6 100644
> >> --- a/semihosting/config.c
> >> +++ b/semihosting/config.c
> >> @@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
> >>       bool enabled;
> >>       SemihostingTarget target;
> >>       Chardev *chardev;
> >> -    const char **argv;
> >> +    char **argv;
> >>       int argc;
> >>       const char *cmdline; /* concatenated argv */
> >>   } SemihostingConfig;
> >> @@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
> >>       if (strcmp(name, "arg") == 0) {
> >>           s->argc++;
> >>           /* one extra element as g_strjoinv() expects NULL-terminated array */
> >> -        s->argv = g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
> >> -        s->argv[s->argc - 1] = val;
> >> +        s->argv = g_renew(char *, s->argv, s->argc + 1);
> >> +        s->argv[s->argc - 1] = g_strdup(val);
> >
> > Why strdup()?
> 
> The compiler was having issues with adding a const char * into the array
> and it was the quickest way to stop it complaining. I'm not sure what
> guarantees you can make about a const char * after you leave the scope
> of the function.

No guarantees at all. This method was implicitly relying on the caller
never free'ing the const arg it passed in. That is indeed the case here,
because the arg came from a QemuOpts list. It is bad practice to rely
on such things though, so adding the strdup is sane IMHO.

I would have split the strdup out from the realloc -> renew change
though, since it is an independent cleanup.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


