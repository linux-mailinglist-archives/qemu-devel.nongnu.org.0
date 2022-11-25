Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E9638E4C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 17:35:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oybeQ-0004I7-6L; Fri, 25 Nov 2022 11:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1oybeO-0004Fx-QA
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 11:34:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1oybeM-0008Dv-47
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 11:34:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669394041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xr3Y2TkzMqKKXDvXL2rgOqa3Uy21nLyiPzXR1aXt33o=;
 b=UT0h+Ojc14TGANqMjfMY0tljgy02ARruUdHGScqxhZwRUbg0Rm2Bv6k8WKqw8joK5GQ7hn
 5YDdyzeWDwiwvmBpcDOjPQGR/83Nz2OOHzh23mDhbnWh19EA4GmimqVyMwN97Uz8db9a7S
 tLZJCwt9AkuPQh36Jm7M+OdKVISmcls=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-we7JlR1mOr24ZRkDkjABXQ-1; Fri, 25 Nov 2022 11:32:44 -0500
X-MC-Unique: we7JlR1mOr24ZRkDkjABXQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 z15-20020a05640240cf00b00461b253c220so2823824edb.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 08:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xr3Y2TkzMqKKXDvXL2rgOqa3Uy21nLyiPzXR1aXt33o=;
 b=j+gazadeGmjoMqSMiUe6zwTMathE4kwN2EK6stsdcKwnW1fX9Mxkwr1L0LkIv6Znl5
 /0OJXWe8zJlKL2RNpPkyGEWWT7kWY9UtOIU02azgCjxwKcHWI4XuXiAcGpDXeFS4+T7S
 KlckLcmQY9TFxEczMhhuaZAT3QBdTEhhOr0WAvcAlEFWJxKMu/0wcuESU4QTD9rsQRJG
 dfHATtMQtcC8G0YVnireLgxpfSa0EU9mbkch6grxaFnz2rkLIqp1zSGysld5pGHMkf4E
 4OrLZpZChAWOp4laovRt+zBxj17MW5w+hunK3I4I5sL9qVl9bkgH5bRi2LFhcOqtrC2L
 Ow4A==
X-Gm-Message-State: ANoB5pkqWeXieNI5ch2kNcu0wGT+aAYFD7GPqnTDnJKV9vniUhk4gG0R
 bfSF+vCPd87aUBwtrfBA7lys/wxIanqYcjtsJ02qhe7XLZ13BCtrcR6tDusok0Ddxm2gyrTeSAr
 D5RfubPqMCU85ZLh+aO1aICqwnmgQ1uM=
X-Received: by 2002:a05:6402:541a:b0:463:be84:5283 with SMTP id
 ev26-20020a056402541a00b00463be845283mr27029921edb.7.1669393963103; 
 Fri, 25 Nov 2022 08:32:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5XSD75IU8fHBak2jwTU++o7FaU29fGfwRuYuKQZQfa/5PWnfZHKo4sruePQUHOLo6T72hfsMDsyo6lYH212Qc=
X-Received: by 2002:a05:6402:541a:b0:463:be84:5283 with SMTP id
 ev26-20020a056402541a00b00463be845283mr27029890edb.7.1669393962821; Fri, 25
 Nov 2022 08:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
In-Reply-To: <20221125143946.27717-1-mhartmay@linux.ibm.com>
From: German Maglione <gmaglione@redhat.com>
Date: Fri, 25 Nov 2022 17:32:06 +0100
Message-ID: <CAJh=p+7igBB9CMTUi--HCpcuxdHgveqgkw5dY7frE7Wqf==04w@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Add `sigreturn` to the seccomp
 whitelist
To: Marc Hartmayer <mhartmay@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Stefan Liebler <stli@linux.ibm.com>,
 virtio-fs@redhat.com, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, 
 Sven Schnelle <svens@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gmaglion@redhat.com;
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

On Fri, Nov 25, 2022 at 3:40 PM Marc Hartmayer <mhartmay@linux.ibm.com> wro=
te:
>
> The virtiofsd currently crashes on s390x. This is because of a
> `sigreturn` system call. See audit log below:
>
> type=3DSECCOMP msg=3Daudit(1669382477.611:459): auid=3D4294967295 uid=3D0=
 gid=3D0 ses=3D4294967295 subj=3Dsystem_u:system_r:virtd_t:s0-s0:c0.c1023 p=
id=3D6649 comm=3D"virtiofsd" exe=3D"/usr/libexec/virtiofsd" sig=3D31 arch=
=3D80000016 syscall=3D119 compat=3D0 ip=3D0x3fff15f748a code=3D0x80000000AU=
ID=3D"unset" UID=3D"root" GID=3D"root" ARCH=3Ds390x SYSCALL=3Dsigreturn
>
> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> ---
>  tools/virtiofsd/passthrough_seccomp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/pass=
through_seccomp.c
> index 888295c073de..0033dab4939e 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -110,6 +110,7 @@ static const int syscall_allowlist[] =3D {
>  #endif
>      SCMP_SYS(set_robust_list),
>      SCMP_SYS(setxattr),
> +    SCMP_SYS(sigreturn),
>      SCMP_SYS(symlinkat),
>      SCMP_SYS(syncfs),
>      SCMP_SYS(time), /* Rarely needed, except on static builds */
> --
> 2.34.1
>
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
>

Reviewed-by:  German Maglione <gmaglione@redhat.com>

Should we add this also in the rust version?, I see we don't have it
enabled either.

--=20
German


