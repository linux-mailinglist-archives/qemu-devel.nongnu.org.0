Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF8E6C4C79
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 14:54:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peytg-0008PS-Vc; Wed, 22 Mar 2023 09:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peytd-0008PC-RS
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:52:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peytc-00069P-2c
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679493174;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eb9e1UQksGkKv/J2X/7iZSAB93UVOZUX+WoRuPQ0Bcw=;
 b=XRc/jNZSnX1KT6I1h1A3Gr3yeKY8Lxow7P3KePop4HTWu+VNNrHirozzt2ETn6JqJDd8De
 OqA0HxQdBkaI2/ZpxN+vj2FteqoCmHPHJkTLpdZFy0fgqyFa3jZsUAhfrNT1bXI19JAad5
 osiznLvxg+Pm66WfEclVtV9tQizRC5I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-GjEyfHlyMjC4PLIYiLzZbQ-1; Wed, 22 Mar 2023 09:52:52 -0400
X-MC-Unique: GjEyfHlyMjC4PLIYiLzZbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21818101A552;
 Wed, 22 Mar 2023 13:52:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5808A40C83AC;
 Wed, 22 Mar 2023 13:52:50 +0000 (UTC)
Date: Wed, 22 Mar 2023 13:52:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Brad Smith <brad@comstyle.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] tests/vm: skip X11 in openbsd installation
Message-ID: <ZBsILyBjHfO8oB/O@redhat.com>
References: <20230322123639.836104-1-berrange@redhat.com>
 <20230322123639.836104-2-berrange@redhat.com>
 <d8fe0d24-03ee-4c4a-6886-36319eaa2948@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8fe0d24-03ee-4c4a-6886-36319eaa2948@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 22, 2023 at 02:38:13PM +0100, Philippe Mathieu-Daudé wrote:
> On 22/3/23 13:36, Daniel P. Berrangé wrote:
> > As a VM used only for automated testing there is no need to
> > install the X11 stack.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   tests/vm/openbsd | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/tests/vm/openbsd b/tests/vm/openbsd
> > index eaeb201e91..6af7afac0d 100755
> > --- a/tests/vm/openbsd
> > +++ b/tests/vm/openbsd
> > @@ -106,8 +106,7 @@ class OpenBSDVM(basevm.BaseVM):
> >           self.console_wait("Password for root account")
> >           self.console_send("%s\n" % self._config["root_pass"])
> >           self.console_wait_send("Start sshd(8)",           "yes\n")
> > -        self.console_wait_send("X Window System",         "\n")
> > -        self.console_wait_send("xenodm",                  "\n")
> > +        self.console_wait_send("X Window System",         "no\n")
> 
> Wasn't this useful to link a X11-ready binary, even if only testing
> with -display=none?

I've just confirmed /usr/X11R6/include/X11/  still exists in the image
even after this change, as does /usr/X11R6/lib/

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


