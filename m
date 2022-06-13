Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6183549921
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 18:38:05 +0200 (CEST)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0n4m-00024E-LH
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 12:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o0n3O-0001FE-0V
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 12:36:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o0n3L-0001Yv-Hg
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 12:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655138194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1ZB9tsc/7tLUgOTNsjLiTFNutUp+3+KAFB2p4z4MXzI=;
 b=TAOQyBSuczfrRpX+wSQIIp0GqyoF7uE5f6uLTxFyNjNWGHotGWm9WUPqDSpbwF5Obl/uQK
 dysYrVbnHbXp0QKQaDhxyzpAMb2upH6LdTqo4yKiA2CH7ip7LnPyIEc7KWDc3luTcR/79w
 vTvKyfEuYyatQBfYx9L5ijnF2AXF0gs=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-xPzUB5YdPGCft0gkNenE_Q-1; Mon, 13 Jun 2022 12:36:32 -0400
X-MC-Unique: xPzUB5YdPGCft0gkNenE_Q-1
Received: by mail-ua1-f71.google.com with SMTP id
 s14-20020ab02bce000000b0035d45862725so2754060uar.22
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 09:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZB9tsc/7tLUgOTNsjLiTFNutUp+3+KAFB2p4z4MXzI=;
 b=F077RzFMKIB0cVfK/QrEfQsZW81NnQm/oQpILPhmrBtqXL04iOmTTNHwXV4WgeX50I
 iZrUStrSaMmVfZ8kXOa25YVDuFyr4fEEY4/Htb7kdg/19+PFohjIIaFTQDud21Twcq0h
 PDGPOTcsJRsSAlZh07LHwCzXtL7dqOOkIhqPGnmh5/KC+4F2ieeyuTL0OQN17I9yGZwd
 vev0k/aS9P9rNyhk8dvVV0ArVt2WqLhqC/XoEsosIjZIx3voicyTkqc/UUy4FBoxawjc
 OkgbQqd2MVchX2czRT2+Beieanf2zloRJLPJTcnw2bUb3ynDcgK8kFShn00F+JbhK3zj
 tQqg==
X-Gm-Message-State: AJIora9XotG2JMvt91mmrFgeDbpkRIZpQHlXdO5SSHM1NoMUfQAYjHdC
 yaC/8bCnXfW69vvRhBRcIhgw/cjdmuMh9BSiuMk4rkcYGW5VS7j5kZyZYakYlLlGnUYNFTn2xer
 476V+TP3humr1WKzBvh8ItVeajMcQ7Tg=
X-Received: by 2002:a67:f592:0:b0:34b:ba28:f7b4 with SMTP id
 i18-20020a67f592000000b0034bba28f7b4mr107680vso.61.1655138192210; 
 Mon, 13 Jun 2022 09:36:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vq4mh4ek98Arlucf74U+Sc7crFN8CZIUe5XpyvIYEaivJwVXPbckLdounHRK2DV3aAkY3XWzORaDWS5Ojo5T0=
X-Received: by 2002:a67:f592:0:b0:34b:ba28:f7b4 with SMTP id
 i18-20020a67f592000000b0034bba28f7b4mr107669vso.61.1655138191929; Mon, 13 Jun
 2022 09:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-ZwWzYa9h_-rNa-cA0CsDOJusy21D_RNtLffpTOgOHP-Q@mail.gmail.com>
 <48fba5eb-6b93-347f-9a8d-a757f19e5d55@redhat.com>
In-Reply-To: <48fba5eb-6b93-347f-9a8d-a757f19e5d55@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 13 Jun 2022 12:36:21 -0400
Message-ID: <CAFn=p-aLbefiW1shYu-3=Fn4UBAoFzQ0y0jV0__MWkvCfTj3xA@mail.gmail.com>
Subject: Re: CentOS 8 cloud images not working under VM tests
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 13, 2022 at 2:05 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 11/06/2022 01.28, John Snow wrote:
> > This test doesn't appear to work for me:
> >
> > def build_image(self, img):
> >      cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2")
> >      img_tmp = img + ".tmp"
> >      subprocess.check_call(["ln", "-f", cimg, img_tmp])
> >      self.exec_qemu_img("resize", img_tmp, "50G")
> >      self.boot(img_tmp, extra_args = ["-cdrom", self.gen_cloud_init_iso()])
> >      self.wait_ssh()
> >      ^^^^^^^^^^^^^^^
> >
> > It appears to be expecting to be able to use passwordless entry, but
> > that doesn't appear to actually work in this case.
> >
> > It looks like the cloud iso generate step is supposed to handle
> > setting up keys -- and everything appears as if it's working -- but I
> > get SSH timeouts at this step.
> >
> >  From what I can see:
> >
> > DEBUG:root:ssh_cmd: ssh -t -o StrictHostKeyChecking=no -o
> > UserKnownHostsFile=/dev/null -o ConnectTimeout=1 -p 41729 -i
> > /home/jsnow/src/qemu/bin/git/vm-test-35u779h4.tmp/id_rsa -o
> > SendEnv=https_proxy -o SendEnv=http_proxy -o SendEnv=ftp_proxy -o
> > SendEnv=no_proxy qemu@127.0.0.1 exit 0
> > Warning: Permanently added '[127.0.0.1]:41729' (ED25519) to the list
> > of known hosts.
> > qemu@127.0.0.1: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
> >
> > ...and the /home/jsnow/src/qemu/bin/git/vm-test-35u779h4.tmp/id_rsa
> > file looks identical to the qemu.git/tests/keys/id_rsa file, save for
> > a missing trailing newline.
> >
> >  From a subsequent run, turning SSH debug on, I see this:
> >
> > debug1: Offering public key:
> > /home/jsnow/src/qemu/bin/git/vm-test-o_x2vdwo.tmp/id_rsa RSA
> > SHA256:6TUK9PSgWR+CbTEKA6E9IyizVjt2ZW5ble/Mg4wUiao explicit
> > debug3: send packet: type 50
> > debug2: we sent a publickey packet, wait for reply
> > debug3: receive packet: type 51
> >
> > ... Which looks like the usual kind of bog-standard "Unrecognized key"
> > kind of answer, IIUC.
> >
> > Is this working for anyone else, or can anyone offer some debugging
> > tips on what's gone wrong here?
> It seems to work for me - maybe it's some issue with a newer version of ssh
> on your host? (I'm still using RHEL 8 here).
>
> Anyway, the VM dies shortly afterwards since it tries to install some
> additional packages, and non-Stream CentOS 8 has been disabled at the end of
> last year. So this test is certainly broken since half a year already and
> nobody noticed until now. I think you can either remove it, or it should get
> updated to CentosStream instead.
>
>   Thomas
>

Don't really have the interest to upgrade it myself, so if it's been
broken for half a year, out it goes.

--js


