Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C736511CAE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:41:05 +0200 (CEST)
Received: from localhost ([::1]:51320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njley-0003g7-Kw
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1njlc8-0001xY-7V
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:38:08 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:49319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1njlc5-0003X8-Lm
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:38:07 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-ywGUpmNSM9yBIBBB4SL6KA-1; Wed, 27 Apr 2022 13:38:00 -0400
X-MC-Unique: ywGUpmNSM9yBIBBB4SL6KA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F0AF381079D;
 Wed, 27 Apr 2022 17:38:00 +0000 (UTC)
Received: from bahia (unknown [10.39.195.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0E6014A5060;
 Wed, 27 Apr 2022 17:37:54 +0000 (UTC)
Date: Wed, 27 Apr 2022 19:37:39 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Message-ID: <20220427193739.4963c60b@bahia>
In-Reply-To: <2323649.gZi5zFeIBc@silver>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <9545176.94nLgIBNA9@silver> <20220427153142.071063f1@bahia>
 <2323649.gZi5zFeIBc@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Apr 2022 18:18:31 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 27. April 2022 15:31:42 CEST Greg Kurz wrote:
> > On Wed, 27 Apr 2022 14:32:53 +0200
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > On Mittwoch, 27. April 2022 12:18:10 CEST Greg Kurz wrote:
> > > > On Wed, 27 Apr 2022 11:27:28 +0900
> > > > 
> > > > Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > > > > On 2022/04/26 21:38, Greg Kurz wrote:
> [...]
> > > > > Considering the transient states are tolerated in 9pfs, we need to
> > > > > design this function to be tolerant with transient states as well. The
> > > > > use of chmod() is not safe when we consider about transient states. A
> > > > > malicious actor may replace the file at the path with a symlink which
> > > > > may escape the shared directory and chmod() will naively follow it.
> > > > 
> > > > You get a point here. Thanks for your tenacity ! :-)
> > > 
> > > Yep, I send a v4 with fchmodat_nofollow() instead of chmod(), thanks!
> > > 
> > > BTW, why is it actually allowed for client to create a symlink pointing
> > > outside exported directory tree with security_model=passthrough/none? Did
> > > anybody want that?
> > 
> > The target argument to symlink() is merely a string that is stored in
> > the inode. It is only evaluated as a path at the time an action is
> > made on the link. Checking at symlink() time is thus useless.
> > 
> > Anyway, we're safe on this side since it's the client's job to
> > resolve links and we explicitly don't follow them in the server.
> 
> I wouldn't call it useless, because it is easier to keep exactly 1 hole
> stuffed instead of being forced to continuously stuff N holes as new ones may
> popup up over time, as this case shows (mea culpa).
> 
> So you are trading (probably minor) performance for security.
> 
> But my question was actually meant seriously: whether there was anybody in the
> past who probably actually wanted to create relative symlinks outside the
> exported tree. For instance for another service with wider host filesystem
> access.
> 

I took the question seriously :-), the problem is that even if you
do a check on the target at symlink() time, you don't know how it
will be evaluated in the end.

Quick demonstration:

$ cd /var/tmp/
$ mkdir foo
$ cd foo/
$ # Suppose foo is the jail
$ mkdir bar
$ ln -sf .. bar/link
$ realpath bar/link
/var/tmp/foo
$ # Good, we're still under foo
$ mv bar/link .
$ realpath link
/var/tmp
$ # Ouch we've escaped

So in the end, the only real fix is to ban path based syscalls and
pass AT_SYMLINK_NOFOLLOW everywhere. This was the justification for
rewriting nearly all 9p local in order to fix CVE-2016-9602.

https://lists.gnu.org/archive/html/qemu-devel/2017-01/msg06225.html

> [...]
> > > > This brings up a new problem I hadn't realized before : the
> > > > fchmodat_nofollow() implementation in 9p-local.c is really
> > > > a linux only thing to cope with AT_SYMLINK_NOFOLLOW not being
> > > > supported with fchmodat(). It looks that this should move to
> > > > 9p-util-linux.c and a proper version should be added for macOS
> > > > in 9p-util-darwin.c
> > > 
> > > Like already agreed on the other thread, yes, that makes sense. But I
> > > think
> > > this can be handled with a follow-up, separate from this series.
> > 
> > Fair enough if you want to handle fchmodat_nofollow() later but you
> > must at least use fchmodat(AT_SYMLINK_NOFOLLOW) in this patch
> > instead of chmod().
> 
> Sounds like a quick and easy workaround. However looking at 'man fchmodat' on
> macOS, this probably does not exactly do what you wanted it to, at least not
> in this particular case:
> 
>      AT_SYMLINK_NOFOLLOW
>              If path names a symbolic link, then the mode of the symbolic link is changed.
> 
>      AT_SYMLINK_NOFOLLOW_ANY
>              If path names a symbolic link, then the mode of the symbolic link is changed and
>              if if the path has any other symbolic links, an error is returned.
> 
> So if somebody replaced the socket file by a 1st order symlink, you would
> adjust the symlink's permissions with both AT_SYMLINK_NOFOLLOW as well as with 
> AT_SYMLINK_NOFOLLOW_ANY. I mean it's better than chmod(), but acceptable?
> 

As long as the link is not followed outside, we're good : it will change the
symlink mode and then what ?

> Using our existing fchmodat_nofollow() instead is no viable alternative
> either, as it uses operations that are not supported on socket files on macOS
> (tested).
> 
> Best regards,
> Christian Schoenebeck
> 
> 


