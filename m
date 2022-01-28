Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82B349FE09
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:27:35 +0100 (CET)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDU62-0002pI-Gf
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:27:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nDTPU-00059P-NA
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:43:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nDTPM-0008DW-Ca
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643384583;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4DUJyZa3foaIjEqXQjuzpe9Codx1X0oHsjJH8P/XGfs=;
 b=E4hteU1HYSRZoG2Cu16lazvzqyfHDjvyzAQwwKiK+V2qmMkUMNdrpe6RBsOvcEaWBRRUX/
 sRuRaT4LQmghUfYEZZE2G18t0NAf0yMiZFzJMqu9QGoR0TjJ8QHbYMogBjeUQlH/6HtdLs
 +T3bFleFw/2bSu/ohETF0V/ylhTTLGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-P3mllhgyOy--tz9iX3OhoA-1; Fri, 28 Jan 2022 10:42:57 -0500
X-MC-Unique: P3mllhgyOy--tz9iX3OhoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A66038143EF
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:42:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6A0910A3955;
 Fri, 28 Jan 2022 15:42:42 +0000 (UTC)
Date: Fri, 28 Jan 2022 15:42:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Terrell Ferrari Otubo <eterrell@redhat.com>
Subject: Re: [PATCH 0/5] seccomp: fix hole in blocking forks
Message-ID: <YfQO7w9QL+LrE11D@redhat.com>
References: <20210802130303.3300108-1-berrange@redhat.com>
 <008bee58061405c8f9fe36d8c40a62d360bd4547.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <008bee58061405c8f9fe36d8c40a62d360bd4547.camel@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo,

You acked this series, but going through my old git branches I
just discovered that this never got merged. I guess I was assuming
you had queued it for a future PULL when you acked it.

I don't mind sending a pull request myself if you've no objections.

On Wed, Aug 04, 2021 at 10:05:38AM +0200, Eduardo Terrell Ferrari Otubo wrote:
> On Mon, 2021-08-02 at 14:02 +0100, Daniel P. Berrangé wrote:
> > Blocking the 'fork' syscall on Linux is not sufficient to block the
> > 'fork' C library function, because the latter is essentially always
> > implemented using the 'clone' syscall these days.
> > 
> > Blocking 'clone' is difficult as that also blocks pthread creation,
> > so it needs careful filtering.
> > 
> > Daniel P. Berrangé (5):
> >   seccomp: allow action to be customized per syscall
> >   seccomp: add unit test for seccomp filtering
> >   seccomp: fix blocking of process spawning
> >   seccomp: block use of clone3 syscall
> >   seccomp: block setns, unshare and execveat syscalls
> > 
> >  MAINTAINERS               |   1 +
> >  softmmu/qemu-seccomp.c    | 282 +++++++++++++++++++++++++++++-------
> > --
> >  tests/unit/meson.build    |   4 +
> >  tests/unit/test-seccomp.c | 269 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 490 insertions(+), 66 deletions(-)
> >  create mode 100644 tests/unit/test-seccomp.c
> > 
> > -- 
> > 2.31.1
> > 
> > 
> 
> Acked-by: Eduardo Otubo <otubo@redhat.com>
> 
> -- 
> Eduardo Otubo
> 
> 



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


