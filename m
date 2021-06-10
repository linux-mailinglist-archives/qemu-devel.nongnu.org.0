Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614213A3059
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:16:49 +0200 (CEST)
Received: from localhost ([::1]:33726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrNMN-0006pB-TM
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrNKd-0005JN-BS
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:15:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrNKZ-000341-84
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:14:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623341693;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GU49/NtJ9B1L5XOG4FxoEP+ySTWo7xNsLLwolKLY5wY=;
 b=IB8+5XoGsw474iKCy8tFTI+RxZhLDwn3InGkk/m25C4aowRL12GIG/bDnc2l9PQVphU8vu
 r7A1gxW42mzQ3ruzQRt38L3GgNfnfTr3+jD880dk4f8fXYa/iv9sRaCHqPql4texwaWNmp
 L9rNX7ohVdOxUkskUYQXYo5U8UqAM/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-gax6VcjJMte_u_IuYZxZHQ-1; Thu, 10 Jun 2021 12:14:49 -0400
X-MC-Unique: gax6VcjJMte_u_IuYZxZHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAE8318D6A2F;
 Thu, 10 Jun 2021 16:14:47 +0000 (UTC)
Received: from redhat.com (ovpn-112-190.ams2.redhat.com [10.36.112.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9BA319C45;
 Thu, 10 Jun 2021 16:14:46 +0000 (UTC)
Date: Thu, 10 Jun 2021 17:14:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Konstantin Kostiuk <konstantin@daynix.com>
Subject: Re: [PATCH v2] qga-win: Free GMatchInfo properly
Message-ID: <YMI6dP82HBpGM5Bj@redhat.com>
References: <20210610155811.3313927-1-konstantin@daynix.com>
 <YMI3gundDsLZq1lw@redhat.com>
 <CAJ28CFR0CBAsq4WokeW_OG8gG2UFGSL3H0UB-p2FgXxH3pjhbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ28CFR0CBAsq4WokeW_OG8gG2UFGSL3H0UB-p2FgXxH3pjhbg@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Developers <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 07:08:36PM +0300, Konstantin Kostiuk wrote:
> On Thu, Jun 10, 2021 at 7:02 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Thu, Jun 10, 2021 at 06:58:11PM +0300, Kostiantyn Kostiuk wrote:
> > > The g_regex_match function creates match_info even if it
> > > returns FALSE. So we should always call g_match_info_free.
> > > A better solution is using g_autoptr for match_info variable.
> > >
> > > Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
> > > ---
> > >  qga/commands-win32.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> > > index 300b87c859..785a5cc6b2 100644
> > > --- a/qga/commands-win32.c
> > > +++ b/qga/commands-win32.c
> > > @@ -2494,7 +2494,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error
> > **errp)
> > >              continue;
> > >          }
> > >          for (j = 0; hw_ids[j] != NULL; j++) {
> > > -            GMatchInfo *match_info;
> > > +            g_autoptr(GMatchInfo) match_info;
> >
> > This should be initialized to NULL otherwise...
> >
> > >              GuestDeviceIdPCI *id;
> > >              if (!g_regex_match(device_pci_re, hw_ids[j], 0,
> > &match_info)) {
> > >                  continue;
> >
> > this continue will trigger freeing of unintialized memory
> >
> 
> But we always call match_info, so match_info is always initialized.
> The g_regex_match function creates match_info even if it returns FALSE.

Opps, yes, you are right.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


