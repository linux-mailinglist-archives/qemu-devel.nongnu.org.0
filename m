Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BA043C7CF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 12:40:56 +0200 (CEST)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfgMZ-00050B-Rt
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 06:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfgKI-0003zr-I4
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfgKF-0001qh-3U
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635331109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kip7lKbTe0ocDg30MfIaHffXTR7h8N0nNYfmVxJOy4k=;
 b=i6ZTQjfhSg584CWyiwjT11+rojNUxIzhZJGg8iGyqJXFCclnXFGRoI42yhU0D5QfhRqZdK
 VPqlgB0el+/laxNDCdPS3DpuCdHJSFnF0lsGxuIDYoCabgG5ORJm1MNcIEfi6Cn+6686hX
 fnVhiFkh3DNlDpFLic5ii9eAacc4oX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-rklJbrESM-iDvP4aJ14CGA-1; Wed, 27 Oct 2021 06:38:26 -0400
X-MC-Unique: rklJbrESM-iDvP4aJ14CGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D94788066FC;
 Wed, 27 Oct 2021 10:38:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8083969117;
 Wed, 27 Oct 2021 10:38:18 +0000 (UTC)
Date: Wed, 27 Oct 2021 12:38:17 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC 0/2] tls: add macros for coroutine-safe TLS variables
Message-ID: <YXksGaeG9HC3Jh6M@redhat.com>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <2ca9c094-61e6-54b8-89a8-6dad22514c96@linaro.org>
 <CANCZdfr5TAUYeZaRrm0TM-iEaV+BNwWw_JTUHbcr5QwPWhO0iQ@mail.gmail.com>
 <YXgBArG7wRi+hpMx@stefanha-x1.localdomain>
 <85df7de0-cebb-efe9-d26b-f459a37a6621@linaro.org>
 <YXguEo8UQUX/cRo9@stefanha-x1.localdomain>
 <4b8a5b71-0ec2-7c2c-6929-de303ec29a53@linaro.org>
MIME-Version: 1.0
In-Reply-To: <4b8a5b71-0ec2-7c2c-6929-de303ec29a53@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fweimer@redhat.com, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.10.2021 um 19:10 hat Richard Henderson geschrieben:
> On 10/26/21 9:34 AM, Stefan Hajnoczi wrote:
> > On Tue, Oct 26, 2021 at 08:10:16AM -0700, Richard Henderson wrote:
> > > On 10/26/21 6:22 AM, Stefan Hajnoczi wrote:
> > > > If "safe" TLS variables are opt-in then we'll likely have obscure bugs
> > > > when code changes to access a TLS variable that was previously never
> > > > accessed from a coroutine. There is no compiler error and no way to
> > > > detect this. When it happens debugging it is painful.
> > > 
> > > Co-routines are never used in user-only builds.
> > 
> > If developers have the choice of using __thread then bugs can slip
> > through.
> 
> Huh?  How.  No, really.
> 
> > Are you concerned about performance, the awkwardness of calling
> > getters/setters, or something else for qemu-user?
> 
> Awkwardness first, performance second.
> 
> I'll also note that coroutines never run on vcpu threads, only io threads.
> So I'll resist any use of these interfaces in TCG as well.

This is wrong. Device emulation is called from vcpu threads, and it
calls into code using coroutines. Using dedicated iothreads is
possible for some devices, but not the default.

In fact, this is probably where the most visible case of the bug comes
from: A coroutine is created in the vcpu thread (while holding the BQL)
and after yielding first, it is subsequently reentered from the main
thread. This is exactly the same pattern as you often get with
callbacks, where the request is made in the vcpu thread and the callback
is run in the main thread.

Kevin


