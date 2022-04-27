Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE355114DD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 12:31:13 +0200 (CEST)
Received: from localhost ([::1]:56328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njewy-0002Tg-71
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 06:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1njeo4-0001dM-Lj
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:22:03 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:52655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1njeo1-0006Cl-CS
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:21:58 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-EfM5sjEVO4iAqKAUawyEGw-1; Wed, 27 Apr 2022 06:21:53 -0400
X-MC-Unique: EfM5sjEVO4iAqKAUawyEGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50107185A7BA;
 Wed, 27 Apr 2022 10:21:53 +0000 (UTC)
Received: from bahia (unknown [10.39.195.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D994C15D75;
 Wed, 27 Apr 2022 10:21:52 +0000 (UTC)
Date: Wed, 27 Apr 2022 12:21:51 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] 9pfs: local: Do not follow symlink in _nofollow
Message-ID: <20220427122151.6a22267b@bahia>
In-Reply-To: <3805748.cZurrHcIA4@silver>
References: <20220427024545.18298-1-akihiko.odaki@gmail.com>
 <3805748.cZurrHcIA4@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Apr 2022 10:46:31 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 27. April 2022 04:45:45 CEST Akihiko Odaki wrote:
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > ---
> >  hw/9pfs/9p-local.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > index d42ce6d8b82..def8afdb4d6 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -365,7 +365,7 @@ static int fchmodat_nofollow(int dirfd, const char
> > *name, mode_t mode) if (fd == -1) {
> >          /* In case the file is writable-only and isn't a directory. */
> >          if (errno == EACCES) {
> > -            fd = openat_file(dirfd, name, O_WRONLY, 0);
> > +            fd = openat_file(dirfd, name, O_WRONLY | O_NOFOLLOW, 0);
> 
> O_NOFOLLOW flag is always added inside openat_file() implementation:
> 
> https://github.com/qemu/qemu/blob/master/hw/9pfs/9p-util.h#L60
> 
> So this change is not necessary AFAICS.
> 

Right, and with macOS in mind, maybe fchmodat(AT_SYMLINK_NOFOLLOW) just
works unlike with linux ?

> >          }
> >          if (fd == -1 && errno == EISDIR) {
> >              errno = EACCES;
> 
> 


