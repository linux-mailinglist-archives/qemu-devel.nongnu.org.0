Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89B4549B8F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 20:31:44 +0200 (CEST)
Received: from localhost ([::1]:42936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0oqj-0005jj-Ry
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 14:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o0ooY-0004pK-3L
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 14:29:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o0ooV-0001Pv-4z
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 14:29:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655144961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PiKzz3ayWolbmahp3ltZvQbvXQfyh76OJ46DSqya3Ls=;
 b=PS+v44jncegyG9K/jB4zq+9++fYHwXsgWptcRqXyZuk5cnJROV2+kiU3j3aojs2blAbrqs
 D7Xl5rDL4JkfEQYHFTd4GFfGhsWb+OmxXoFAmqf1XAwVuobcFDpk7vioxQ4lkusYpeH7/D
 tfP+9qrpB+n0cPN6frcz88MtwSBXKtk=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-6Ltjfp_rNEGjFcyqsc0qVw-1; Mon, 13 Jun 2022 14:29:20 -0400
X-MC-Unique: 6Ltjfp_rNEGjFcyqsc0qVw-1
Received: by mail-ua1-f69.google.com with SMTP id
 x24-20020ab07818000000b00378d73df633so2919389uaq.10
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 11:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PiKzz3ayWolbmahp3ltZvQbvXQfyh76OJ46DSqya3Ls=;
 b=ExdWxOcm3UDNJCOntChwDtB4zBqI4BiIjIXZY6exxxIGKgNYvMKrKZyMaqQ6uctBF8
 PCxeAJ4wBJFd2Vx/Dj8QT6tvAIXwM/ZqdNKJ31gmMsNlHV2QuDjITvwNkIiWpoE4fvnC
 ypE6urDS9VOh8tiUiuITU8nEDcmKOtQLSS/75THzc48yJVekgybi5pD7T+JK5xgSuDiG
 yVtI9vnzr6bwfIxmTca631eBGzs7/fOIyJZUPSGKy7m5mn+LTlmt4FgWyvM7ZILF09an
 h9Q4SwqP8xOlICrvv4g4l0hO8zoG6mQdpK5cny5As/w62ofrQpSlrV3f7jEZ9o+k9ARU
 XlmA==
X-Gm-Message-State: AJIora/+EkDS3RSht5xTIyPHIz/QsigxUZhhkkMH/GUAbrk618BHjlfC
 2R0vpDFXpdXWMme1CUvRTDEmPJl95HxCLoMAiZ0dnC1pHyXx2Vn+psnibc5ZVXFQpKUy77nK2Qj
 vntQdD+RCxbon2HhC0woRfVUOxsjQ+Tc=
X-Received: by 2002:a9f:35d3:0:b0:379:8e0f:711f with SMTP id
 u19-20020a9f35d3000000b003798e0f711fmr542123uad.42.1655144959996; 
 Mon, 13 Jun 2022 11:29:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vuYfS5ySszJrTh6AbvX7u9J1K2eusNe3H2qrc6L4SHAa52htnNVO9NW0tpukuw1VWkbpBwLEKpHBwTPdiinL4=
X-Received: by 2002:a9f:35d3:0:b0:379:8e0f:711f with SMTP id
 u19-20020a9f35d3000000b003798e0f711fmr542121uad.42.1655144959779; Mon, 13 Jun
 2022 11:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-ZwWzYa9h_-rNa-cA0CsDOJusy21D_RNtLffpTOgOHP-Q@mail.gmail.com>
 <48fba5eb-6b93-347f-9a8d-a757f19e5d55@redhat.com>
 <CAFn=p-aLbefiW1shYu-3=Fn4UBAoFzQ0y0jV0__MWkvCfTj3xA@mail.gmail.com>
In-Reply-To: <CAFn=p-aLbefiW1shYu-3=Fn4UBAoFzQ0y0jV0__MWkvCfTj3xA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 13 Jun 2022 14:29:09 -0400
Message-ID: <CAFn=p-bPrAk=TS0HWtgy26-xn9QZp6kntVuKnOuziihJPZq0qg@mail.gmail.com>
Subject: Re: CentOS 8 cloud images not working under VM tests
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On Mon, Jun 13, 2022 at 12:36 PM John Snow <jsnow@redhat.com> wrote:
>
> On Mon, Jun 13, 2022 at 2:05 AM Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 11/06/2022 01.28, John Snow wrote:
> > > This test doesn't appear to work for me:
> > >
> > > def build_image(self, img):
> > >      cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2")
> > >      img_tmp = img + ".tmp"
> > >      subprocess.check_call(["ln", "-f", cimg, img_tmp])
> > >      self.exec_qemu_img("resize", img_tmp, "50G")
> > >      self.boot(img_tmp, extra_args = ["-cdrom", self.gen_cloud_init_iso()])
> > >      self.wait_ssh()
> > >      ^^^^^^^^^^^^^^^
> > >
> > > It appears to be expecting to be able to use passwordless entry, but
> > > that doesn't appear to actually work in this case.
> > >
> > > It looks like the cloud iso generate step is supposed to handle
> > > setting up keys -- and everything appears as if it's working -- but I
> > > get SSH timeouts at this step.
> > >
> > >  From what I can see:
> > >
> > > DEBUG:root:ssh_cmd: ssh -t -o StrictHostKeyChecking=no -o
> > > UserKnownHostsFile=/dev/null -o ConnectTimeout=1 -p 41729 -i
> > > /home/jsnow/src/qemu/bin/git/vm-test-35u779h4.tmp/id_rsa -o
> > > SendEnv=https_proxy -o SendEnv=http_proxy -o SendEnv=ftp_proxy -o
> > > SendEnv=no_proxy qemu@127.0.0.1 exit 0
> > > Warning: Permanently added '[127.0.0.1]:41729' (ED25519) to the list
> > > of known hosts.
> > > qemu@127.0.0.1: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
> > >
> > > ...and the /home/jsnow/src/qemu/bin/git/vm-test-35u779h4.tmp/id_rsa
> > > file looks identical to the qemu.git/tests/keys/id_rsa file, save for
> > > a missing trailing newline.
> > >
> > >  From a subsequent run, turning SSH debug on, I see this:
> > >
> > > debug1: Offering public key:
> > > /home/jsnow/src/qemu/bin/git/vm-test-o_x2vdwo.tmp/id_rsa RSA
> > > SHA256:6TUK9PSgWR+CbTEKA6E9IyizVjt2ZW5ble/Mg4wUiao explicit
> > > debug3: send packet: type 50
> > > debug2: we sent a publickey packet, wait for reply
> > > debug3: receive packet: type 51
> > >
> > > ... Which looks like the usual kind of bog-standard "Unrecognized key"
> > > kind of answer, IIUC.
> > >
> > > Is this working for anyone else, or can anyone offer some debugging
> > > tips on what's gone wrong here?
> > It seems to work for me - maybe it's some issue with a newer version of ssh
> > on your host? (I'm still using RHEL 8 here).
> >
> > Anyway, the VM dies shortly afterwards since it tries to install some
> > additional packages, and non-Stream CentOS 8 has been disabled at the end of
> > last year. So this test is certainly broken since half a year already and
> > nobody noticed until now. I think you can either remove it, or it should get
> > updated to CentosStream instead.
> >
> >   Thomas
> >
>
> Don't really have the interest to upgrade it myself, so if it's been
> broken for half a year, out it goes.
>

It turns out it's because the setup was failing, but we use "ln" to
make a temporary image instead of cp -- so if the setup screws up,
we've permanently damaged the cached image as well. You have to delete
the original downloaded image to restore original behavior. Then, as
you say, the old image doesn't work anymore anyway. Replacing it with
a new CentOS 8 stream image works fine, if we replace the LN with CP
like the fedora recipe does. However, some of the iotests fail due to
permissions issues with docker and FUSE.

Still trying to figure out the FUSE stuff.

I tried to update aarch64, but that test seems to need even more work.
I think I will probably just delete it, it doesn't seem like anyone is
running it or looking after it.

--js


