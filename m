Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7519A612682
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 01:37:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oovN3-0004FU-GF; Sat, 29 Oct 2022 19:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oovN1-00049O-MN
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 19:36:07 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oovMx-0004sD-RJ
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 19:36:07 -0400
Received: by mail-io1-f51.google.com with SMTP id 11so7394891iou.0
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 16:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2fl312FO7HuuBo0QpllpIY4izA7WVnL0kGNbAvmb5w=;
 b=YFsAK9P+4HcfKtb+bVdMEZ3j965zDKdeW9wo+jh9aXhP2ZLWeyn5S9TEByw8lik0+I
 4BtVIGn89Q2L8+5C6qsFiMdqFhco5vLJ6W2qS4O47Ur3G9XbpUIJP8LaWb8tUwk0OBaG
 TF4P85A5MeIW6zxc6fBjr65a4O5cdU0CKWBrY91WQWkJAY9ZYT9oanZFzitT49M/kn6T
 VZK3rAJXDc7HRkYmscdwhORVAJ2mo9O7HB3QPFtWBYWsiSuKLLA8zROvQ7zAekLBSnsC
 R7qLGPv4Lemfq54sQExz+uEkJc7icvlF71nr3Xdy2+ExwsE30VzGCetBk5jUrTGX5Xho
 MLMg==
X-Gm-Message-State: ACrzQf3cu9+xP50x4D5LIdw2DvFnkZG7swNOhZgEbvf/KRWkI9T21+ws
 pgNHZoAZlbxzX1sGolLqLsilf7LAOJE=
X-Google-Smtp-Source: AMsMyM4kzCPb6vH26Hn8Sxc21UNcqeQJRz3CQisLF7BombTxZDXKlPO9JoDQH6BMCl89eomwo/gNuQ==
X-Received: by 2002:a05:6602:2c89:b0:67b:7e8c:11c1 with SMTP id
 i9-20020a0566022c8900b0067b7e8c11c1mr3145733iow.101.1667086562107; 
 Sat, 29 Oct 2022 16:36:02 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53]) by smtp.gmail.com with ESMTPSA id
 c18-20020a056e020cd200b002f592936fbfsm1022428ilj.41.2022.10.29.16.36.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 16:36:01 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id h206so3873250iof.10
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 16:36:01 -0700 (PDT)
X-Received: by 2002:a5e:8517:0:b0:6c6:fbe7:1c0e with SMTP id
 i23-20020a5e8517000000b006c6fbe71c0emr2894414ioj.95.1667086561256; Sat, 29
 Oct 2022 16:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220813011031.3744-1-j@getutm.app>
 <20220813011031.3744-3-j@getutm.app> <YwNWPFKchWnUIO8f@redhat.com>
In-Reply-To: <YwNWPFKchWnUIO8f@redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 29 Oct 2022 16:35:50 -0700
X-Gmail-Original-Message-ID: <CA+E+eSAAccpDCkxJMTRCRTYPtFWDdC6smFtTUVJiy-FPj5JXkw@mail.gmail.com>
Message-ID: <CA+E+eSAAccpDCkxJMTRCRTYPtFWDdC6smFtTUVJiy-FPj5JXkw@mail.gmail.com>
Subject: Re: [PATCH 2/3] vl: on -loadvm set run state to "restore-vm"
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.51; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f51.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Aug 22, 2022 at 3:11 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Fri, Aug 12, 2022 at 06:10:30PM -0700, Joelle van Dyne wrote:
> > This allows us to differentiate between a fresh boot and a restore boot=
.
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  softmmu/runstate.c | 1 +
> >  softmmu/vl.c       | 3 +++
> >  2 files changed, 4 insertions(+)
>
> What happens if the user launches QEMU with -S and NOT  -loadvm, and
> then uses the 'loadvm' monitor command to restore the VM state ?
Sorry, this email totally slipped past me. The 'loadvm' monitor
command does this:

vm_stop(RUN_STATE_RESTORE_VM);

Which sets the correct state.

>
>
> > diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> > index 1e68680b9d..fa3dd3a4ab 100644
> > --- a/softmmu/runstate.c
> > +++ b/softmmu/runstate.c
> > @@ -76,6 +76,7 @@ typedef struct {
> >
> >  static const RunStateTransition runstate_transitions_def[] =3D {
> >      { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
> > +    { RUN_STATE_PRELAUNCH, RUN_STATE_RESTORE_VM },
> >
> >      { RUN_STATE_DEBUG, RUN_STATE_RUNNING },
> >      { RUN_STATE_DEBUG, RUN_STATE_FINISH_MIGRATE },
> > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > index 706bd7cff7..29586d94ff 100644
> > --- a/softmmu/vl.c
> > +++ b/softmmu/vl.c
> > @@ -3131,6 +3131,9 @@ void qemu_init(int argc, char **argv, char **envp=
)
> >                  add_device_config(DEV_DEBUGCON, optarg);
> >                  break;
> >              case QEMU_OPTION_loadvm:
> > +                if (!loadvm) {
> > +                    runstate_set(RUN_STATE_RESTORE_VM);
> > +                }
> >                  loadvm =3D optarg;
> >                  break;
> >              case QEMU_OPTION_full_screen:
> > --
> > 2.28.0
> >
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

