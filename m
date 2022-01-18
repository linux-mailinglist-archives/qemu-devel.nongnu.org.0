Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0196492D73
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 19:36:53 +0100 (CET)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9tLg-0001BJ-Vo
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 13:36:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9tJj-0008J2-LG
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 13:34:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9tJg-00015E-Ja
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 13:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642530887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BiRlaH6UD2wGYwgrYnzf754czgQ44YX6I3fxjhKU3Iw=;
 b=fsjDeykc2eoMnn9SR523jYqWx8CyTo2whkzHfnYPo9kg6kyGxnQgmMIOV7q4tarTTunkQQ
 fsHeO76phjDeCN6/8hCV5u9mbhnBFDvKw7aYIjBMb/WDxYQf72sc9fof/DRMd3MqiQIkLL
 MoobuiMx5UyJuA3RIX09cwwObztQWi0=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-noPU8qJ1MWWyZZzXU8S3cQ-1; Tue, 18 Jan 2022 13:34:43 -0500
X-MC-Unique: noPU8qJ1MWWyZZzXU8S3cQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 o12-20020ab0544c000000b002fa5ad28f16so12526772uaa.18
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 10:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BiRlaH6UD2wGYwgrYnzf754czgQ44YX6I3fxjhKU3Iw=;
 b=JmcOAQxbjV5RfUIEvsRKcZrIRnxBoQMolLd00AfnN7f530v4g9W+xVEeKUNwVt9APz
 7pXThGu7dRO4GK+9iqKZmP408DZt09lXbJ/XMrsTtnh/JXOGJlyt3xVw8NLsVVx1VlHC
 dAUXctTRVvF2RBBI7lkOnsq3934Z9eZ+EQrQvP+QTHczVm+70IOyMxm6jO700gZ6bpuH
 iE5JTHMI+8gbKGecuFCOnt/Kly1AGGaCfm3jHNbiqXEWNmggbLgmUC2wFD2K4SHrvQRY
 DgMpjMkNx6wxF6QzYzdTSkHzXfEkItVqPetXzk+ZG8IPfV2i08bZBVK2KDLTdoviUvFj
 xAyg==
X-Gm-Message-State: AOAM533qjzi1cZZzivneb3KsjVkLeFAwVrfOKYe/R8BH+U1r8Co5ixwI
 59Zkzgex9EUmb9RtJHsLM4vdhXzEWM92LSWLar1P0THghHFgH0NYh1Fmgwqfmh7423okHnxPwIz
 t8YHkHADUota4xccfYBncg+BhzYUuwPs=
X-Received: by 2002:ab0:678f:: with SMTP id v15mr2458178uar.87.1642530882563; 
 Tue, 18 Jan 2022 10:34:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznGAv4iB3IcEHOCT/xwGOs9+iL8rxnjWKf8ORPvlPZu+waJBmrsRasmvZYIAg6PmGYVODoipqrGzj1QDWwIOk=
X-Received: by 2002:ab0:678f:: with SMTP id v15mr2458169uar.87.1642530882292; 
 Tue, 18 Jan 2022 10:34:42 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com>
 <YeU/YCUI59f33PBh@redhat.com>
 <CAFn=p-YDo8tTQ1Y8HgtQuCDv3i5EdFEX8-2BAjs-7L5q_b4=Gg@mail.gmail.com>
 <CAFEAcA__xayWZJWCmcPQqR40rKsNk0JxbAe7Hx8V65wSuXCfEg@mail.gmail.com>
In-Reply-To: <CAFEAcA__xayWZJWCmcPQqR40rKsNk0JxbAe7Hx8V65wSuXCfEg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 18 Jan 2022 13:34:31 -0500
Message-ID: <CAFn=p-aLZmh4erVjsMEORJAj5ZC4ME_6TuWh_Bk=EQz=Xh8Ohw@mail.gmail.com>
Subject: Re: iotest 040, 041, intermittent failure in netbsd VM
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 7:13 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 17 Jan 2022 at 20:35, John Snow <jsnow@redhat.com> wrote:
> > I do expect this to print more information on failure than it
> > currently is, though (bug somewhere in machine.py, I think).
> > Can you please try applying this temporary patch and running `./check
> > -qcow2 040 041` until you see a breakage and show me the output from
> > that?
>

Thanks for playing tele-debug.

> Having fixed my setup to not use an ancient host QEMU, here's
> the relevant bit of the log:
>
>   TEST   iotest-qcow2: 037
>   TEST   iotest-qcow2: 038 [not run]
>   TEST   iotest-qcow2: 039 [not run]
>   TEST   iotest-qcow2: 040 [fail]
> QEMU          --
> "/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-system-aarch64"
> -nodefaults -display none -accel qtest -machine virt
> QEMU_IMG      --
> "/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       --
> "/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-io"
> --cache writeback --aio threads -f qcow2
> QEMU_NBD      --
> "/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- qcow2
> IMGPROTO      -- file
> PLATFORM      -- NetBSD/amd64 localhost 9.2
> TEST_DIR      -- /home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmp1h12r7ev
> GDB_OPTIONS   --
> VALGRIND_QEMU --
> PRINT_QEMU_OUTPUT --
>
> --- /home/qemu/qemu-test.vdrI02/src/tests/qemu-iotests/040.out
> +++ 040.out.bad
> @@ -1,5 +1,95 @@
> -.................................................................
> +.......ERROR:qemu.aqmp.qmp_client.qemu-12407:Failed to establish
> connection: concurrent.futures._base.CancelledError
> +ERROR:qemu.machine.machine:Error launching VM
> +ERROR:qemu.machine.machine:Process was forked, waiting on it
> +ERROR:qemu.machine.machine:Command:
> '/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-system-aarch64
> -display none -vga none -chardev
> socket,id=mon,path=/tmp/tmp1h12r7ev/qemu-12407-monitor.sock -mon
> chardev=mon,mode=control -qtest
> unix:path=/tmp/tmp1h12r7ev/qemu-12407-qtest.sock -accel qtest
> -nodefaults -display none -accel qtest -machine virt -drive
> if=none,id=drive0,file=/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/scratch/test.img,format=qcow2,cache=writeback,aio=threads,node-name=top,backing.node-name=mid,backing.backing.node-name=base
> -device virtio-scsi -device scsi-hd,id=scsi0,drive=drive0'

> +ERROR:qemu.machine.machine:Output: "qemu-system-aarch64: -chardev
> socket,id=mon,path=/tmp/tmp1h12r7ev/qemu-12407-monitor.sock: Failed to
> connect to '/tmp/tmp1h12r7ev/qemu-12407-monitor.sock': No such file or
> directory\n"

... Oh. That's unpleasant. My guess is that we aren't listening on the
socket before the QEMU process gets far enough to want to connect to
it. The change to an asynchronous backend must have jostled the
timing.

> +ERROR:qemu.machine.machine:exitcode: 1

And, oh: The VM launching library only chirps about *negative* error
codes. That's why it wasn't printing anything more useful. I suppose
the thinking was that we use the VM launch utility to knowingly launch
bad command lines, so we only wanted to see failure notifications on
-errno style codes, but that obviously makes debugging unintentional
failures a lot more awful. I'll try to improve the usability and
legibility of the errors here.

Thanks,
--js


