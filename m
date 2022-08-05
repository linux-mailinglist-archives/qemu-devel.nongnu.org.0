Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD958A991
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:42:16 +0200 (CEST)
Received: from localhost ([::1]:34548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJumV-00040M-NJ
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJuMN-0006M7-0X
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:15:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJuML-00078t-4e
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:15:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659694512;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ECx7LatQHc1kE2K0iML3kydI+2ZI+/2E8lGkzcbgNE=;
 b=TXag1areCE7jFJNmtquxPILEBrvdB+TWNPt4JlqUwsD1ga0t9r+AlO5W5uyW9I/2hz+mFX
 oMDPosYFMZ+ENbqDwN5f7rhbErtxecTlRR5nPhUbNl6c6hgHSMi9OhJqkT+N0wTEZcwDmF
 fORCB1X2dnp51k6KKWOGf4f5PYIW4/0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-HGiau_JtMlixZVJP7W-39A-1; Fri, 05 Aug 2022 06:15:11 -0400
X-MC-Unique: HGiau_JtMlixZVJP7W-39A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E82D811E75
 for <qemu-devel@nongnu.org>; Fri,  5 Aug 2022 10:15:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD3931121314;
 Fri,  5 Aug 2022 10:15:09 +0000 (UTC)
Date: Fri, 5 Aug 2022 11:15:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] RFC: char: deprecate usage of bidirectional pipe
Message-ID: <YuztpbXbc9+VO9nb@redhat.com>
References: <20220726083232.2567756-1-marcandre.lureau@redhat.com>
 <Yt+pabvylcNdh0wL@redhat.com>
 <CAMxuvayRg_q6k_KV8LnYy2W0kbfVPZVzB-Ooz7Fzdc84fjBM6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMxuvayRg_q6k_KV8LnYy2W0kbfVPZVzB-Ooz7Fzdc84fjBM6A@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Aug 05, 2022 at 01:55:41PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Jul 26, 2022 at 12:44 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Jul 26, 2022 at 12:32:32PM +0400, marcandre.lureau@redhat.com wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > As Ed Swierk explained back in 2006:
> > > https://lists.nongnu.org/archive/html/qemu-devel/2006-12/msg00160.html
> > >
> > > "When qemu writes into the pipe, it immediately reads back what it just
> > > wrote and treats it as a monitor command, endlessly breathing its own
> > > exhaust."
> > >
> > > This is similarly confusing when using the chardev with a serial device,
> > > as reported in https://bugzilla.redhat.com/show_bug.cgi?id=2106975.
> > >
> > > It seems we have kept the support for bidirectional pipes for historical
> > > reasons and odd systems, however it's not documented in qemu -chardev
> > > options. I suggest to stop supporting it, for portability reasons.
> >
> > Hmm, I always assumed that in this scenario the pipe was operating
> > in output-only mode. Obviously not the case with the code as it
> > exists, but perhaps this would be useful ?  eg its good as a serial
> > console logging mechanism at least.
> 
> The current "-chardev pipe,id=id,path=path" option handling will first
> check the presence of unidirectional "path.in" & "path.out" (although
> they are opened RDWR...), and fallback on bidirectional "path".
> 
> We could allow for the presence of "path.out" alone, although this may
> be a behaviour/breaking change:

If we allow path.out alone, then we loose error diagnostic when
path.out is succesfully opened, but path.in fails. I wouldn't
call that a back compat breakage.

My preference would always be to use the exact path that was
given as the CLI parameter.

IOW, we really ought to have had

   -chardev pipe,id=id,input=path,output=path

and allowed both of them to be optional, eg both of them should
semantically mean /dev/null in behavioural terms if omitted

IOW we could just deprecate 'path' entirely and introduce this
saner approach to config.

Alternatively, I would just unconditionally change

diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index 66d3b85091..3dda3d5cc6 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -142,7 +142,7 @@ static void qemu_chr_open_pipe(Chardev *chr,
         if (fd_out >= 0) {
             close(fd_out);
         }
-        TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY));
+        TFR(fd_in = fd_out = qemu_open_old(filename, O_WRONLY | O_BINARY));
         if (fd_in < 0) {
             error_setg_file_open(errp, errno, filename);
             return;


given that semantics on any UNIX platform we target are for pipes to be
unidirectional, and eating our own output is uselessly broken, we could
reasonably justify doing that change simply as a bug fix and ignore any
notion of 'deprecation',

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


