Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEC763A5F4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:19:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozbD5-0006Ek-CC; Mon, 28 Nov 2022 05:17:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1ozbCy-0006Ct-Jb
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:17:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1ozbCw-0005Gh-IZ
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669630669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXcc5NHCwDHx8j8v7FTRB9etuIipNkJKm6E9jJizKq0=;
 b=e4nX6GoudrAyNcPrQebfvbFH7cRCe/6kliiTKZDXaGCZ/FyFe5dpY9myUEiMIqmpQwx2fL
 Uy6wjRF6qCw//Q+S9RCFA0zk4pRREegAbqd4ODt7azUXt6ZIll1yIfHfB5MBDWhQXO97Tk
 Hf2LuzxMTHndcGevnjrakqVP2zrg+R4=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-175-yXYlBvg2NIqVWCfAGxyJxQ-1; Mon, 28 Nov 2022 05:17:48 -0500
X-MC-Unique: yXYlBvg2NIqVWCfAGxyJxQ-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-398d108a04cso93407547b3.16
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 02:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXcc5NHCwDHx8j8v7FTRB9etuIipNkJKm6E9jJizKq0=;
 b=VNk3EQoDb2WZA5wl+doWPUNiOjE2ucy3rxYj9zUpsJ5yGxCxFJ5uir0rNHOzf518pt
 nPwYYZVO7TRiR/FeCwfiyptjO25BZPlubPUoiD4Uh3jjqgh/Ux0SC+BilBM7O5IRyEmB
 9/rkeR+d1/dawx5iOqLkpFiOSo+ARXy9R3Wh7WnxIe/+Tanp+mUChdBuUNRFhDLAJ6t6
 Bj06L1UuabQwj7DlqXFPVVEUpIVemz8irTD9mVBkxPVL0d+ygAX2PxiKPeS5n1U/d3jY
 LwlJds9mxHq5FT5eBEz6yEr3ACYp/4mBA8H9WWYW58mF2wNTLw2rAf6AWdRN7RLGiYpD
 B4zQ==
X-Gm-Message-State: ANoB5pnAHlRbxvtzZQbXugqkfvMPKfj46zzslarANDRpe3fLlDB1L+of
 s0Gtue/OZbJt4W0EkkQL0Tt3HZk7H+RlSzeCdi1Chxn2mDR8HDaz0Rmwoh5V+PiNW+rFJ+zFXKf
 ChCgL+fKgO3aHGIdTTUQRkmqVR5xNJiA=
X-Received: by 2002:a25:949:0:b0:6f8:1e0a:430 with SMTP id
 u9-20020a250949000000b006f81e0a0430mr139959ybm.555.1669630667478; 
 Mon, 28 Nov 2022 02:17:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ErxlSUyHPKM4my06+Crow7LUCqundbPyBf12EiJL8SyHg/hKEvYcOSwuwcdospLtA3EBUsPf/qZADPfzq2hU=
X-Received: by 2002:a25:949:0:b0:6f8:1e0a:430 with SMTP id
 u9-20020a250949000000b006f81e0a0430mr139936ybm.555.1669630667269; 
 Mon, 28 Nov 2022 02:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
 <CAJh=p+7igBB9CMTUi--HCpcuxdHgveqgkw5dY7frE7Wqf==04w@mail.gmail.com>
 <87lenvjvxo.fsf@linux.ibm.com>
In-Reply-To: <87lenvjvxo.fsf@linux.ibm.com>
From: German Maglione <gmaglione@redhat.com>
Date: Mon, 28 Nov 2022 11:17:11 +0100
Message-ID: <CAJh=p+6ZoUD7788GewpvAPq2mc=QDEA89B3QMMcAynTqs9szxQ@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Add `sigreturn` to the seccomp
 whitelist
To: Marc Hartmayer <mhartmay@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Stefan Liebler <stli@linux.ibm.com>,
 virtio-fs@redhat.com, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, 
 Sven Schnelle <svens@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gmaglion@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 28, 2022 at 10:00 AM Marc Hartmayer <mhartmay@linux.ibm.com> wr=
ote:
>
> German Maglione <gmaglione@redhat.com> writes:
>
> > On Fri, Nov 25, 2022 at 3:40 PM Marc Hartmayer <mhartmay@linux.ibm.com>=
 wrote:
> >>
> >> The virtiofsd currently crashes on s390x. This is because of a
> >> `sigreturn` system call. See audit log below:
> >>
> >> type=3DSECCOMP msg=3Daudit(1669382477.611:459): auid=3D4294967295 uid=
=3D0 gid=3D0 ses=3D4294967295 subj=3Dsystem_u:system_r:virtd_t:s0-s0:c0.c10=
23 pid=3D6649 comm=3D"virtiofsd" exe=3D"/usr/libexec/virtiofsd" sig=3D31 ar=
ch=3D80000016 syscall=3D119 compat=3D0 ip=3D0x3fff15f748a code=3D0x80000000=
AUID=3D"unset" UID=3D"root" GID=3D"root" ARCH=3Ds390x SYSCALL=3Dsigreturn
> >>
> >> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> >> ---
> >>  tools/virtiofsd/passthrough_seccomp.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/p=
assthrough_seccomp.c
> >> index 888295c073de..0033dab4939e 100644
> >> --- a/tools/virtiofsd/passthrough_seccomp.c
> >> +++ b/tools/virtiofsd/passthrough_seccomp.c
> >> @@ -110,6 +110,7 @@ static const int syscall_allowlist[] =3D {
> >>  #endif
> >>      SCMP_SYS(set_robust_list),
> >>      SCMP_SYS(setxattr),
> >> +    SCMP_SYS(sigreturn),
> >>      SCMP_SYS(symlinkat),
> >>      SCMP_SYS(syncfs),
> >>      SCMP_SYS(time), /* Rarely needed, except on static builds */
> >> --
> >> 2.34.1
> >>
> >> _______________________________________________
> >> Virtio-fs mailing list
> >> Virtio-fs@redhat.com
> >> https://listman.redhat.com/mailman/listinfo/virtio-fs
> >>
> >
> > Reviewed-by:  German Maglione <gmaglione@redhat.com>
>
> Thanks.
>
> >
> > Should we add this also in the rust version?, I see we don't have it
> > enabled either.
>
> Yep - thanks.

Could you test this MR to see if it is ok?
https://gitlab.com/virtio-fs/virtiofsd/-/merge_requests/144

Thanks,

--=20
German


