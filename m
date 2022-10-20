Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80493605E23
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 12:46:54 +0200 (CEST)
Received: from localhost ([::1]:49532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olT4N-0006Lw-73
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:46:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSf0-0003PJ-72
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1olSJz-0001HV-I4
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:58:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1olSJw-00007v-Aa
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666259914;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NzM7x8N8l9jp2JOHpkkbE7N3xaLpP2WG2R8in3+F7BY=;
 b=CawGrFzw6NhqMnMzumzDgdWKJRLocF5+ompCRAtqe7Oj9J9vVNz7fxiKxw3vfHQeNixMtd
 VviHlV45c9PmDJfJFdHrehM2glzXSA/SIsYEbz/hANpvmZjv8xeXD9ov401lBDJNC5sEtD
 7m7JaQvo7pGRw5Zvi6w6eYOoPjK0z2g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-BrSj-5WNMRuYL_pEbLu7PQ-1; Thu, 20 Oct 2022 05:58:30 -0400
X-MC-Unique: BrSj-5WNMRuYL_pEbLu7PQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53CA686477C;
 Thu, 20 Oct 2022 09:58:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA7672166BA0;
 Thu, 20 Oct 2022 09:58:26 +0000 (UTC)
Date: Thu, 20 Oct 2022 10:58:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/2] util/log: Always send errors to logfile when
 daemonized
Message-ID: <Y1Ebv28whPgwdaMW@redhat.com>
References: <20221019151651.334334-1-groug@kaod.org>
 <20221019151651.334334-3-groug@kaod.org>
 <47ea1c0e-9e32-ce9a-7bef-bd2ac70bdbb9@linaro.org>
 <20221020114937.3558737e@bahia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221020114937.3558737e@bahia>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 11:49:37AM +0200, Greg Kurz wrote:
> On Thu, 20 Oct 2022 12:21:27 +1000
> Richard Henderson <richard.henderson@linaro.org> wrote:
> 
> > On 10/20/22 01:16, Greg Kurz wrote:
> > 
> > I don't understand why daemonize changes -d tid at all.
> > If there's a bug there, please separate it out.
> > 
> > I don't understand the is_main_log_thread checks.
> > Why is the main thread special?
> > 
> 
> The current code base either opens a per-thread file in
> qemu_log_trylock() when -d tid is enabled, or only a
> single global file in qemu_log_set_internal() in the
> opposite case.
> 
> The goal of this patch is to go through the `In case we
> are a daemon redirect stderr to logfile` logic, so that
> other users of stderr, aka. error_report(), can benefit
> from it as well. Since this is only done for the global
> file, the logic was changed to : _main_ thread to always
> use the global file and other threads to use the per-thread
> file.
> 
> I now realize how terrible a choice this is. It violates
> the current logic too much and brings new problems like
> "how to identify the main thread"...

snip

> > I would have thought that this was the only change required -- ignoring qemu_loglevel when 
> > daemonized.
> > 
> 
> I was thinking the same at first, but this ended up in the
> global file being open with a filename containing a '%d'...
> I chose the direction of doing the g_strdup_printf() trick
> for the global file as well but then I had to make sure
> that qemu_log_trylock() wouldn't try later to open the same
> file, hence the _main_ thread check...
> 
> The question is actually : where stderr should point to in
> the '-daemonize -D foo%d.log -d tid` case ?

I'm tending towards thinking the question is wrong, because
it is imposing semantics on -D that it was never designed to
address.

The '-d' option enables logging in QEMU, primary for things
related to TCG. By default that logging goes to stderr, but
it can be sent to 1 or mnay files, using -D. IOW, -D is NOT
about controlling where stderr/out is connected. It is
about where TCG logging goes.


Separately, IIUC, you found that when using -daemonize any
error_report() messages end up in the void, because stderr
is connected to /dev/null.

This patch is thus attempting to repurpose -D as a way to
say where error_report() messages end up with daemonized,
and this creates the complexity  because -D was never
intended to be a mechanism to control stderr or error_report
output.

If we want to connect stdout/err to something when daemonized
then lets either have a dedicated option for that, or simply
tell apps not to use -daemonize and to take care of daemonzing
themselves, thus having full control over stdout/err. The latter
is what libvirt uses, because we actually want stderr/out on a
pipe, not a file, in order to enforce rollover.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


