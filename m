Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FB85823CA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:06:36 +0200 (CEST)
Received: from localhost ([::1]:60286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdw3-0005s1-6F
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGdpr-0001re-Ky
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGdpm-0008Vh-41
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658916004;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hO3700GqvMTrIflVwrfCGnpC/LrrdMlTuo7YIcRHvLE=;
 b=U+oFNnRxevfhLMvAta0EA4X1/AGta3+pAgTj5RkVeb8zr4gfLMASDpgk9HkrDClMv7SSWc
 moeRyzKeXXNkXQ9FJCXCywHeRxqV86iq+MargolH5+a/T5Qgeu3skOBTMDA+MHMVO1Asb1
 3sfrEEVXYGVEB2SNq9OrPAuqBPm5p/k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-aSA2SmpDMt2k-8op4QZsug-1; Wed, 27 Jul 2022 06:00:01 -0400
X-MC-Unique: aSA2SmpDMt2k-8op4QZsug-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE25E10B70EE;
 Wed, 27 Jul 2022 10:00:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1DB1401E5C;
 Wed, 27 Jul 2022 09:59:59 +0000 (UTC)
Date: Wed, 27 Jul 2022 10:59:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Yan Vugenfirer <yvugenfi@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 2/5] util/oslib-win32: Add a helper to get the Windows
 version
Message-ID: <YuEMnI/Sji1/r7bk@redhat.com>
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-3-bmeng.cn@gmail.com>
 <CAGoVJZzZN5CNoURh4-uMqkPwUd-Z03PmZZ04v8M+BYi2tX37_g@mail.gmail.com>
 <CAEUhbmWv1zdYFJ-ojWxH_KnJygS2ceQyPPBvDwQ4rEqzR534EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEUhbmWv1zdYFJ-ojWxH_KnJygS2ceQyPPBvDwQ4rEqzR534EQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jul 27, 2022 at 05:38:27PM +0800, Bin Meng wrote:
> On Wed, Jul 27, 2022 at 4:50 PM Yan Vugenfirer <yvugenfi@redhat.com> wrote:
> >
> > On Wed, Jul 27, 2022 at 10:43 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > This adds a helper to get the Windows version via the RtlGetVersion
> > > call, for QEMU codes to determine the Windows version at run-time.
> > >
> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > >  include/sysemu/os-win32.h |  2 ++
> > >  util/oslib-win32.c        | 15 +++++++++++++++
> > >  2 files changed, 17 insertions(+)
> > >
> > > diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> > > index edc3b38a57..1e324026a4 100644
> > > --- a/include/sysemu/os-win32.h
> > > +++ b/include/sysemu/os-win32.h
> > > @@ -204,6 +204,8 @@ ssize_t qemu_recv_wrap(int sockfd, void *buf, size_t len, int flags);
> > >  ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int flags,
> > >                             struct sockaddr *addr, socklen_t *addrlen);
> > >
> > > +void os_get_win_version(RTL_OSVERSIONINFOEXW *info);
> > > +
> > >  #ifdef __cplusplus
> > >  }
> > >  #endif
> > > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> > > index 5723d3eb4c..6d2387b9ff 100644
> > > --- a/util/oslib-win32.c
> > > +++ b/util/oslib-win32.c
> > > @@ -547,3 +547,18 @@ int qemu_msync(void *addr, size_t length, int fd)
> > >       */
> > >      return qemu_fdatasync(fd);
> > >  }
> > > +
> > > +void os_get_win_version(RTL_OSVERSIONINFOEXW *info)
> > > +{
> > > +    typedef LONG (WINAPI *rtl_get_version_t)(PRTL_OSVERSIONINFOEXW);
> > > +
> > > +    /* RtlGetVersion is available starting with Windows 2000 */
> > > +    HMODULE module = GetModuleHandle("ntdll");
> > > +    PVOID fun = GetProcAddress(module, "RtlGetVersion");
> > > +    rtl_get_version_t rtl_get_version = (rtl_get_version_t)fun;
> > > +
> > > +    info->dwOSVersionInfoSize = sizeof(RTL_OSVERSIONINFOEXW);
> > > +    rtl_get_version(info);
> > The original function, when it was present in qemu-ga, tested that
> > getting the function address succeeded.
> > I think this test should be kept.
> > See below:
> > -    PVOID fun = GetProcAddress(module, "RtlGetVersion");
> > -    if (fun == NULL) {
> > -        error_setg(errp, QERR_QGA_COMMAND_FAILED,
> > -            "Failed to get address of RtlGetVersion");
> > -        return;
> > -    }
> >
> 
> Please see the comment:
> 
> /* RtlGetVersion is available starting with Windows 2000 */
> 
> I don't think we need that check.

In include/qemu/osdep.h we have 

/* as defined in sdkddkver.h */
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0601 /* Windows 7 API (should be in sync with glib) */
#endif

so do we even need to have the GetProcAddress calls at all ?

Surely we can just  '#include <ddk/ntddk.h>' and call
RtlGetVersion directly at compile time ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


