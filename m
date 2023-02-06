Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C2E68B7AF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 09:48:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOx96-0004sE-CG; Mon, 06 Feb 2023 03:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pOx93-0004ql-Og
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:46:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pOx8z-0001mP-Rc
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675673192;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+czsf5TfPCxJaCFeEILkzqSNrKiS6stuclZxPZA740=;
 b=MK6osggqshbdGkilBBBggAfw+LTDpU2a05zpnEs0OxHoYRUVCwawaDuTMlK4WogIClxXyj
 u5kYpBBqjcCItvkloMqTZ/l2jeYrUtOwXZJjEBZA6N6T87yJpL4cr7obN6d4j7fQczbYdR
 mK8sXJM8ZkvCH79oa4Swx7Qc6h2gTP0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-4vzNI-ERPkWasVFZEtFmYA-1; Mon, 06 Feb 2023 03:46:31 -0500
X-MC-Unique: 4vzNI-ERPkWasVFZEtFmYA-1
Received: by mail-wm1-f70.google.com with SMTP id
 d18-20020a05600c34d200b003df901ab982so5420510wmq.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 00:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h+czsf5TfPCxJaCFeEILkzqSNrKiS6stuclZxPZA740=;
 b=qgPU5UnWO7LhvPjWUyCmVPtDYoBFo4OpSYF6EWWu3K1rdtL6cbSmi9PvaArML8FhgL
 9um6crhXNpU7I4bYyLECq1PndSK9w6cl3AnSLWr932bjrXGyUfCH1oAgZhrMDXUeCvt6
 PEvPYAL+D3RBXVz450EsW5NNpQSdset2tnpjDll3HcPEj6a963oPJWH5sGEeNQ3EmFZX
 s75y9CxqfGIwP4hjKaYa4LdRDG8d97X/s3KDJezYFNug4g4oSZUkoyMoLmObISbYIsLJ
 U6qsA+sVY6N1cPrbURScbJpb6eNmZaRNDThH/u+Y+XlFuYBG//pMTEU0OCqTAxKEFLLo
 NXkg==
X-Gm-Message-State: AO0yUKWoKNdn0VHoaHRN0oQTUHLjz0NlW25g9JgOgb5RX1Ga4qPi/wSS
 WkpgTXHoEyHFap2zzYMqgO/2dr3DTMMXFuLosh3kFvTwN+aLGsz2G46/aAl6beBcZGKGM6vV//I
 XC987TnFXpu7nPMg=
X-Received: by 2002:a05:600c:540e:b0:3dc:433a:e952 with SMTP id
 he14-20020a05600c540e00b003dc433ae952mr18812489wmb.33.1675673188662; 
 Mon, 06 Feb 2023 00:46:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/SBR4pwxizmyJ28J4cNCICiIuPYLyabVbDEvHq0i6BGQDJSjsDx2K5lLSWBjHOgK3SSNuM0w==
X-Received: by 2002:a05:600c:540e:b0:3dc:433a:e952 with SMTP id
 he14-20020a05600c540e00b003dc433ae952mr18812461wmb.33.1675673188390; 
 Mon, 06 Feb 2023 00:46:28 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c468a00b003e0015c8618sm2351851wmo.6.2023.02.06.00.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 00:46:27 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Kevin Wolf
 <kwolf@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Qemu-block
 <qemu-block@nongnu.org>,  qemu-devel@nongnu.org,  Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  hreitz@redhat.com,  dgilbert@redhat.com
Subject: Re: [PATCH 6/6] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
In-Reply-To: <21fa9ab9-524d-c44d-905a-f1feddf92099@redhat.com> (Thomas Huth's
 message of "Mon, 6 Feb 2023 08:44:29 +0100")
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-7-thuth@redhat.com>
 <Y9eizgN9UYo5kbgx@redhat.com>
 <fc5dba59-4993-ee66-a94b-a550bdced396@redhat.com>
 <Y9z5TohXERGuQ6TS@redhat.com>
 <2caefefa-8757-af55-ccf3-fcc641db0784@redhat.com>
 <CAFEAcA972rKvQqJh2-FghQcJ1hswVWkhtzb3-KW4CgsypnQgYA@mail.gmail.com>
 <87sffme9jj.fsf@secure.mitica>
 <21fa9ab9-524d-c44d-905a-f1feddf92099@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 06 Feb 2023 09:46:26 +0100
Message-ID: <87357jdvvh.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thomas Huth <thuth@redhat.com> wrote:
> On 03/02/2023 22.14, Juan Quintela wrote:
>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On Fri, 3 Feb 2023 at 15:44, Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> On 03/02/2023 13.08, Kevin Wolf wrote:
>>>>> Am 03.02.2023 um 12:23 hat Thomas Huth geschrieben:
>>>>>> On 30/01/2023 11.58, Daniel P. Berrang=C3=A9 wrote:
>>>>>>> On Mon, Jan 30, 2023 at 11:44:46AM +0100, Thomas Huth wrote:
>>>>>>>> We can get rid of the build-coroutine-sigaltstack job by moving
>>>>>>>> the configure flags that should be tested here to other jobs:
>>>>>>>> Move --with-coroutine=3Dsigaltstack to the build-without-defaults =
job
>>>>>>>> and --enable-trace-backends=3Dftrace to the cross-s390x-kvm-only j=
ob.
>>>>>>>
>>>>>>> The biggest user of coroutines is the block layer. So we probably
>>>>>>> ought to have coroutines aligned with a job that triggers the
>>>>>>> 'make check-block' for iotests.  IIUC,  the without-defaults
>>>>>>> job won't do that. How about, arbitrarily, using either the
>>>>>>> 'check-system-debian' or 'check-system-ubuntu' job. Those distros
>>>>>>> are closely related, so getting sigaltstack vs ucontext coverage
>>>>>>> between them is a good win, and they both trigger the block jobs
>>>>>>> IIUC.
>>>>>>
>>>>>> I gave it a try with the ubuntu job, but this apparently trips up th=
e iotests:
>>>>>>
>>>>>>    https://gitlab.com/thuth/qemu/-/jobs/3705965062#L212
>>>>>>
>>>>>> Does anybody have a clue what could be going wrong here?
>>>>>
>>>>> I'm not sure how changing the coroutine backend could cause it, but
>>>>> primarily this looks like an assertion failure in migration code.
>>>>>
>>>>> Dave, Juan, any ideas what this assertion checks and why it could be
>>>>> failing?
>>>>
>>>> Ah, I think it's the bug that will be fixed by:
>>>>
>>>>    https://lore.kernel.org/qemu-devel/20230202160640.2300-2-quintela@r=
edhat.com/
>>>>
>>>> The fix hasn't hit the master branch yet (I think), and I had another =
patch
>>>> in my CI that disables the aarch64 binary in that runner, so the iotes=
ts
>>>> suddenly have been executed with the alpha binary there --> migration =
fails.
>>>>
>>>> So never mind, it will be fixed as soon as Juan's pull request gets in=
cluded.
>>>
>>> The migration tests have been flaky for a while now,
>>> including setups where host and guest page sizes are the same.
>>> (For instance, my x86 macos box pretty reliably sees failures
>>> when the machine is under load.)
>> I *thought* that we had fixed all of those.
>> But it is difficult for me to know because:
>> - I only happens when one runs "make check"
>> - running ./migration-test have never failed to me
>> - When it fails (and it has been a while since it has failed to me)
>>    it is impossible to me to detect what is going on, and as said, I have
>>    never been able to reproduce running only migration-test.
>> I will try to run several at the same time and see if it happens.
>> And as Thomas said, I *think* that the fix that Peter Xu posted
>> should
>> fix this issue.  Famous last words.
>
> The patch from Peter should fix my problems that I triggered via the
> iotests - but the migration-qtest is still unstable independent from
> that issue, I think. See for example the latest staging pipeline:
>
>  https://gitlab.com/qemu-project/qemu/-/pipelines/767961842
>
> The migration qtest failed in both, the x86-freebsd-build and the
> ubuntu-20.04-s390x-all pipelin.
>
>  Thomas

 31/659 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test            =
       ERROR          48.23s   killed by signal 6 SIGABRT
>>> G_TEST_DBUS_DAEMON=3D/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project=
/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_IMG=3D./qemu-img QTEST_QEMU_B=
INARY=3D./qemu-system-aarch64 MALLOC_PERTURB_=3D124 QTEST_QEMU_STORAGE_DAEM=
ON_BINARY=3D./storage-daemon/qemu-storage-daemon /home/gitlab-runner/builds=
/-LCfcJ2T/0/qemu-project/qemu/build/tests/qtest/migration-test --tap -k
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stderr:
Broken pipe
../tests/qtest/libqtest.c:190: kill_qemu() detected QEMU death from signal =
11 (Segmentation fault) (core dumped)
TAP parsing error: Too few tests run (expected 41, got 12)
(test program exited with status code -6)
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95

I don't know hat to do with this:
- this is aarch64 tcg
- this *works* on f37, or at least I can't reproduce any error with make
  check on my box, and I *think* my configuration is quite extensive (as
  far as I know everything that can be compiled in fedora with packages
  in the distro):

configure file: /mnt/code/qemu/full/configure
--enable-trace-backends=3Dlog
	--prefix=3D/usr
	--sysconfdir=3D/etc/sysconfig/
	--audio-drv-list=3Dpa,alsa
	--with-coroutine=3Ducontext
	--with-git-submodules=3Dvalidate
	--enable-alsa
	--enable-attr
	--enable-auth-pam
	--enable-avx2
	--enable-avx512f
	--enable-bochs
	--enable-bpf
	--enable-brlapi
	--disable-bsd-user
	--enable-bzip2
	--enable-cap-ng
	--enable-capstone
	--disable-cfi
	--disable-cfi-debug
	--enable-cloop
	--disable-cocoa
	--enable-containers
	--disable-coreaudio
	--enable-coroutine-pool
	--enable-crypto-afalg
	--enable-curl
	--enable-curses
	--enable-dbus-display
	--enable-debug-info
	--disable-debug-mutex
	--disable-debug-stack-usage
	--disable-debug-tcg
	--enable-dmg
	--enable-docs
	--disable-dsound
	--enable-fdt
	--enable-fuse
	--enable-fuse-lseek
	--disable-fuzzing
	--disable-gcov
	--disable-gcrypt
	--enable-gettext
	--enable-gio
	--enable-glusterfs
	--enable-gnutls
	--disable-gprof
	--enable-gtk
	--enable-guest-agent
	--disable-guest-agent-msi
	--disable-hax
	--disable-hvf
	--enable-iconv
	--enable-install-blobs
	--enable-jack
	--enable-keyring
	--enable-kvm
	--enable-l2tpv3
	--enable-libdaxctl
	--enable-libiscsi
	--enable-libnfs
	--enable-libpmem
	--enable-libssh
	--enable-libudev
	--enable-libusb
	--enable-linux-aio
	--enable-linux-io-uring
	--enable-linux-user
	--enable-live-block-migration
	--disable-lto
	--disable-lzfse
	--enable-lzo
	--disable-malloc-trim
	--enable-membarrier
	--enable-module-upgrades
	--enable-modules
	--enable-mpath
	--enable-multiprocess
	--disable-netmap
	--enable-nettle
	--enable-numa
	--disable-nvmm
	--enable-opengl
	--enable-oss
	--enable-pa
	--enable-parallels
	--enable-pie
	--enable-plugins
	--enable-png
	--disable-profiler
	--enable-pvrdma
	--enable-qcow1
	--enable-qed
	--disable-qom-cast-debug
	--enable-rbd
	--enable-rdma
	--enable-replication
	--enable-rng-none
	--disable-safe-stack
	--disable-sanitizers
	--enable-stack-protector
	--enable-sdl
	--enable-sdl-image
	--enable-seccomp
	--enable-selinux
	--enable-slirp
	--enable-slirp-smbd
	--enable-smartcard
	--enable-snappy
	--enable-sparse
	--enable-spice
	--enable-spice-protocol
	--enable-system
	--enable-tcg
	--disable-tcg-interpreter
	--enable-tools
	--enable-tpm
	--disable-tsan
	--disable-u2f
	--enable-usb-redir
	--enable-user
	--disable-vde
	--enable-vdi
	--enable-vhost-crypto
	--enable-vhost-kernel
	--enable-vhost-net
	--enable-vhost-user
	--enable-vhost-user-blk-server
	--enable-vhost-vdpa
	--enable-virglrenderer
	--enable-virtfs
	--enable-virtiofsd
	--enable-vnc
	--enable-vnc-jpeg
	--enable-vnc-sasl
	--enable-vte
	--enable-vvfat
	--enable-werror
	--disable-whpx
	--enable-xen
	--enable-xen-pci-passthrough
	--enable-xkbcommon
	--enable-zstd

- It gives a segmentation fault.  Nothing else.

Can we get at least a backtrace to work from there?

Thanks, Juan.



