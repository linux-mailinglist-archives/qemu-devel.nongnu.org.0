Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0CE4364DF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 16:59:08 +0200 (CEST)
Received: from localhost ([::1]:45842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZX9-00014J-EG
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 10:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdZVy-0000EU-Hi
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:57:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdZVw-0005ol-8h
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:57:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 193-20020a1c01ca000000b00327775075f7so1661626wmb.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 07:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XBwBrgQ+QhHg2DZhvB+1RbSt0CLOxJPUx281Vzsyp1o=;
 b=sUjrvGjh4Vu0PrXYlzss8XXPO70WjcuappGE9RaDODOFhEyWTHNx9Cpc6KmMjPkPiM
 HW8p5RUc51CbxtJh8ohwOcJKLxBILOYt1yWclvien8ocZLkZ7PAIIPqU1siyop/etdtV
 cLBdLzcS5O0jMWjbtSiekZTthMiysUsT67bTmb9ck2zMdinA7Fq3Zv8jUz9EBLDWFF2b
 A3wsnzPf7vh/RZv00WDMHTl+iQcQTe3wbG4vUOG2ybxI2SctLIhEvKwctml3RKRtB4Vk
 MXkC0ZZJjUI9RqtvPvT0EYPcUCPY6fvkDC0NjUaegS/DQ085MfoJ4JvWa28A/Bz6eKoT
 juyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XBwBrgQ+QhHg2DZhvB+1RbSt0CLOxJPUx281Vzsyp1o=;
 b=Wj5DuYbV13i5LSfqykRg7UWSP7AzaSYYjT0InSiqQIYUn7+Afsv2h1gPfpOkae5r+H
 +HCMxWiZlW34JqshS9PvPVhI8fU01fytfgVUAPHnY3VdRs24Ax1Bmr/5goMK1plqN6ln
 3tcIH6AI+kVnxg8Xvyu0Nfnr1k3DiL4xm5PCC7NufqW2Plyra03xFG/YahurX8vy5Z9H
 /yNKHYs//Q1weB3Ck0fWSvLLVLzwzbQxTmVXLIvV7Oiz8ST7LtNrvW+eL7nY/NLnPqc2
 9KarRY0Q8NtdlsFUgsOqQRPXhGzuEQ2mxVTeOFIpGmO3tsiePggT9QREEHYfrubN3Qsg
 2fkA==
X-Gm-Message-State: AOAM530E8RtW6EeWS/5nH9/NPK3znEnldOk0/3JJWzDUHhxLSRLi768Q
 lrwuQAWns9UABi45O3+My4kjo/usf/tjng==
X-Google-Smtp-Source: ABdhPJx4RfFJkGGbXIlj9CE1OolELi4GJ9608WpA8LWdP9kljnBz1m8WaAOXFDkhXlVTrGNuXkHlxg==
X-Received: by 2002:a05:600c:3508:: with SMTP id
 h8mr22111473wmq.122.1634828269349; 
 Thu, 21 Oct 2021 07:57:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n26sm6445749wmi.16.2021.10.21.07.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 07:57:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E2DFF1FF96;
 Thu, 21 Oct 2021 15:57:47 +0100 (BST)
References: <BYAPR02MB550976DDDA818CEB090B41C5BEBF9@BYAPR02MB5509.namprd02.prod.outlook.com>
 <fad02feb-09f3-4ef8-a2eb-bec76e2ee968@redhat.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [gdbstub] redirecting qemu console output to a debugger
Date: Thu, 21 Oct 2021 15:51:55 +0100
In-reply-to: <fad02feb-09f3-4ef8-a2eb-bec76e2ee968@redhat.com>
Message-ID: <87ilxqtogk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Sid Manning <sidneym@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Sid,
>
> Cc'ing maintainers:
>
> $ ./scripts/get_maintainer.pl -f  chardev/char.c
> "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com> (maintainer:charde=
v)
> Paolo Bonzini <pbonzini@redhat.com> (reviewer:Character device...)
>
> $ ./scripts/get_maintainer.pl -f  gdbstub.c
> "Alex Benn=C3=A9e" <alex.bennee@linaro.org> (maintainer:GDB stub)
> "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com> (reviewer:GDB stub)
>
> On 10/21/21 14:37, Sid Manning wrote:
>> Currently when I attach a debugger (lldb) to my qemu session all of the =
output goes to the shell running qemu not to the debugger.  Fixing this mea=
nt that I needed to point the semi-hosting output to the gdb chardev.  I st=
arted qemu like this:
>>=20
>> -s -S -semihosting-config target=3Dauto,chardev=3Dch0 -chardev gdb,id=3D=
ch0

Mixing up semihosting and gdb is not going to end well. We do already
re-direct semihosting output to the debugger when it's attached. To
specify a socket for gdb to connect to you need:

  -chardev socket,path=3D/tmp/gdb-socket,server=3Don,wait=3Doff,id=3Dgdb0 -=
gdb chardev:gdb0

The -chardev specifies the details of the socket and the -gdb tells gdb
where it should make the gdbserver port visible. The only
semihosting-config variable you may want to tweak is the target.

<snip>
>
> I'm not sure why "chardev-gdb" is internal, maybe because it uses
> static state as singleton, so can't be TYPE_USER_CREATABLE?
>
>   static GDBState gdbserver_state;

One good reason - we don't support multiple connections.

>
> But TYPE_DBUS_VMSTATE is TYPE_USER_CREATABLE and have:
>
> static void
> dbus_vmstate_complete(UserCreatable *uc, Error **errp)
> {
>     DBusVMState *self =3D DBUS_VMSTATE(uc);
>     g_autoptr(GError) err =3D NULL;
>
>     if (!object_resolve_path_type("", TYPE_DBUS_VMSTATE, NULL)) {
>         error_setg(errp, "There is already an instance of %s",
>                    TYPE_DBUS_VMSTATE);
>         return;
>     }
>     ...
>
> So it should be possible to have TYPE_CHARDEV_GDB implement
> TYPE_USER_CREATABLE and check for singleton the same way,
> then remove the ChardevClass::internal field IMO...
>
> But let see what the maintainers prefer :)
>
> Regards,
>
> Phil.


--=20
Alex Benn=C3=A9e

