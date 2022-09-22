Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEBD5E66A3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:17:04 +0200 (CEST)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNwl-0006bn-1b
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obNbU-0006jU-Hd
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obNbQ-00078j-LQ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663858499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=grbMvzPashXA65ruGPD1NX7Zsf+7xa9rAzzTi030hp4=;
 b=C228Ux09KeE1vuFvmTkDMrutyrwJlPuPo/eg0u9NtHxrhhQh6AC9Gxv7Dlj4mVrsyXECYS
 libCnXgQwpjBnV9fhFqrcOGcv23oamlmCWnwGc3PdYi4iitwXxeEXsb8VSutFMuh6iCqdi
 Rk+aQKWtEE1j9Q4RBON3EETGDlQQXtM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-ylsCAhWJNCudmuPWQWMwVg-1; Thu, 22 Sep 2022 10:54:57 -0400
X-MC-Unique: ylsCAhWJNCudmuPWQWMwVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F83A855306;
 Thu, 22 Sep 2022 14:54:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B683E40C2064;
 Thu, 22 Sep 2022 14:54:54 +0000 (UTC)
Date: Thu, 22 Sep 2022 16:54:53 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
Message-ID: <Yyx3Pc89tbqBliM0@redhat.com>
References: <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org>
 <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <87leqb4ul9.fsf@pond.sub.org>
 <5f5921fe-6d4f-490b-4328-702a45973bbc@suse.de>
 <87bkr7mvgr.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bkr7mvgr.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.09.2022 um 14:42 hat Markus Armbruster geschrieben:
> Claudio Fontana <cfontana@suse.de> writes:
> 
> > On 9/22/22 11:38, Markus Armbruster wrote:
> >> Daniel P. Berrangé <berrange@redhat.com> writes:
> >> 
> >>> On Thu, Sep 22, 2022 at 08:07:43AM +0200, Markus Armbruster wrote:
> >>>> Ease of use matters, too.  When sticking to the rule leads to awkward
> >>>> code, we should stop and think.  Should we deviate from the rule?  Or
> >>>> can we avoid that by tweaking the interface?
> >>>>
> >>>> Philippe's proposed interface sticks to the rule.
> >>>
> >>> The cost is that when you see a  function   dosomething(true|false) as
> >>> a reader you often have no idea what the effect of true vs false is
> >>> on the behaviour of that function. You resort to looking at the
> >>> API docs and/or code.  This is where C would really benefit from
> >>> having named parameters like as  dosomething(ignore_errors=true|false)
> >>> is totally obvious. Anyway, I digress.
> >> 
> >> Right.  Quoting myself: "If having to pass a flag turns out to to be a
> >> legibility issue, we can have wrapper functions."  :)
> >
> > There is something more fundamental that seems to be missed by most in this conversation,
> > ie the distinction between the normal execution path and the error path.
> >
> >
> >> 
> >>>> Another interface that does: return -1 for error, 0 for module not found
> >>>> (no error), and 1 for loaded.
> >>>
> >>> IMHO this pattern is generally easier to understand when looking at
> >>> the callers, as the fatal error scenario is always clear.
> >>>
> >>> That said I would suggest neither approach as the public facing
> >>> API. Rather stop trying to overload 3 states onto an error reporting
> >>> pattern that inherantly wants to be 2 states. Instead just have
> >>> distinct methods
> >> 
> >> Like these:
> >> 
> >>>   bool module_load_one(const char *prefix, const char *name, Error *errp)
> >>>   bool module_try_load_one(const char *prefix, const char *name, Error *errp)
> >>>
> >>> other names are available for the second, eg module_load_one_optional()
> >> 
> >> module_load_one_if_there()?
> >
> > And what do you do with the caller that needs to _know_ whether the module was "there" or not?
> >
> > This is losing this information along the way, and the callers NEED it.
> >
> > I really invite, with no offense intended,
> 
> None taken!
> 
> >                                            to read the hunks of my patch and the callers,
> > there are occasions where we need to _know_ if the module was there or not, and act depending on the context.
> >
> > The information about "bool is_there" needs to be passed to the caller.
> 
> If you have callers that need to distinguish between not found, found
> but bad, found and good, then return three distinct values.
> 
> I proposed to return -1 for found but bad (error), 0 for not found (no
> error), and 1 for loaded (no error).

My intuition with this one was that "not found" is still an error case,
but it's an error case that we need to distinguish from other error
cases.

Is this one of the rare use cases for error classes?

Kevin


