Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFDD5E6689
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:13:15 +0200 (CEST)
Received: from localhost ([::1]:33728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNt4-0000iP-7p
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obMVA-0008B8-0L
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:44:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obMV6-0003b9-Gp
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663854262;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6bj+Kf/AL++OD3e3NeKRQdGASzZUExP4cO/ZugUYsQ=;
 b=BjNNJWaWrWtVsU97Pux+SMgEDzFDKhc4GNgPLxHrAJrHu9U1VbGt7od0IqH0OkCVipDUeN
 6uZiTsnOc8zOW0Z2+UefWViNgMfgI15AXTGbB7h+8OmqY+yiFMSvE8IYQIL1hFrBbWFbam
 qrtLf8u4aRe8PBQ7Nvhq2b4WS7UXLSY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-8Hn2d6PgNmed4QuM4h4WIg-1; Thu, 22 Sep 2022 09:44:19 -0400
X-MC-Unique: 8Hn2d6PgNmed4QuM4h4WIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5292F811E87;
 Thu, 22 Sep 2022 13:44:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96A9618EB4;
 Thu, 22 Sep 2022 13:44:17 +0000 (UTC)
Date: Thu, 22 Sep 2022 14:44:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
Message-ID: <YyxmrTnpziXGxRMm@redhat.com>
References: <87y1ucdirx.fsf@pond.sub.org>
 <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <87leqb4ul9.fsf@pond.sub.org>
 <5f5921fe-6d4f-490b-4328-702a45973bbc@suse.de>
 <87bkr7mvgr.fsf@pond.sub.org>
 <4a656f0f-1497-5569-e562-f537b115daf3@suse.de>
 <87r103lf4y.fsf@pond.sub.org>
 <CAAdtpL7=6YN+jh30xB_PB5aAxaWoFf4-3nLsWiAMGK6ZvWnLww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAdtpL7=6YN+jh30xB_PB5aAxaWoFf4-3nLsWiAMGK6ZvWnLww@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 03:34:42PM +0200, Philippe Mathieu-Daudé wrote:
> On Thu, Sep 22, 2022 at 3:20 PM Markus Armbruster <armbru@redhat.com> wrote:
> >
> > Claudio Fontana <cfontana@suse.de> writes:
> >
> > [...]
> >
> > > I think it would be better to completely make the return value separate from the Error,
> > > and really treat Error as an exception and not mix it up with the regular execution,
> > >
> > > but if it is the general consensus that I am the only one seeing this conflation problem we can model it this way too.
> >
> > It's a matter of language pragmatics.  In Java, you throw an exception
> > on error.  In C, you return an error value.
> >
> > Trying to emulate exceptions in C might be even more unadvisable than
> > trying to avoid them in Java.  Best to work with the language, not
> > against it.
> >
> > Trouble is the error values we can conveniently return in C can't convey
> > enough information.  So we use Error for that.  Just like GLib uses
> > GError.
> >
> > More modern languages do "return error value" much better than C can.  C
> > is what it is.
> >
> > We could certainly argue how to do better than we do now in QEMU's C
> > code.  However, the Error API is used all over the place, which makes
> > changing it expensive.  "Rethinking the whole Error API" (your words)
> > would have to generate benefits worth this expense.  Which seems
> > unlikely.
> 
> QEMU Error* and GLib GError are designed to report recoverable runtime *errors*.
> 
> There is or is no error. A boolean return value seems appropriate.
> 
> We are bikeshedding about the API because we are abusing it in a non-error case.
> 
> If we want to try to load an optional module, the Error* argument is
> not the proper way to return the information regarding why we couldn't
> load.
> 
> In both cases we want to know if the module was loaded. If this is an
> optional module, we don't care why it couldn't be loaded.

No, that's wrong. If the module exists on disk but is incompatible
with the current QEMU, then we need to be reporting that as an
error to the caller, so they can propagate this problem back up
the stack to the QMP command or CLI arg that started the code path.

We don't need to be using the return status to tell the caller if
the module was loaded or not. We only should be telling thue caller
is there was a reportable error or not.

Consider, there is a call to load block drivers. We don't need
to know whether each block driver was loaded or not. eg if the
'curl' code is a module and we fail to load it, then when code
tries to create a curl based block device the missing curl
support will be reported at that time.  The callers that load
modules should only need to express whether their load attempt
is mandatory or optional, in terms of the module existing on
disk.  If the modules exists on disk, any further errors
encountered when loading it should be propagated.



> So trying to make everybody happy:
> 
>   // Return true if the module could be loaded, otherwise return false
> and errp contains the error.
>  bool module_load_one(const char *prefix, const char *name, Error *errp);
> 
>   // Return true if the module could be loaded, false otherwise.
>   bool module_try_load_one(const char *prefix, const char *name);

Nope, this latter doesn't work as it throws away important errors
when loading an incompatible/broken module.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


