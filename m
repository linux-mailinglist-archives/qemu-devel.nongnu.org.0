Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E509406773
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 09:03:20 +0200 (CEST)
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOaZD-00046a-LK
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 03:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOaX9-0001bN-RF
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 03:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOaX5-0008La-3W
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 03:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631257264;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lgCeAwgDEPSxOY8YAPmzrwb60hIAPjl3MCHwCa0fdrY=;
 b=Y+uj8KYtpRFehkpANa4lkpxVKHirehm1TWyWu2Spx9kfWC+dmxhrTnHx0H86h6DGSbVmZo
 DRiHHsIdREchRYP6CHjfCW+cH8AbgfY1CYeOef9hHut9XywzcxlozunRePRrWGnV+tciSu
 Bx0j0wf2v7LMAg0xCOhJiMBdNqBgbiw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-l_DEmXqkNcCnfkezDF4kAg-1; Fri, 10 Sep 2021 03:01:02 -0400
X-MC-Unique: l_DEmXqkNcCnfkezDF4kAg-1
Received: by mail-wm1-f72.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so398741wme.6
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 00:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dH2GExrBEf5NKVdF7XN7LVSIiYib1M7a44oqp68Ux+g=;
 b=yoqZRgll8BumlQvJlq0BLRVzkAhl5T6QYt/GSqdpd029TJWlo2aE+00PoF6K/4Lh7I
 G8GsUI/IE7k2RaQ/zKAFBtfQM67a46E/BxHuPnNWLUTbORiV15GpqD+5vmrcyPSesrtD
 H9JmN3xPaNahWN/364XzcXSVCwpEqLhnNiqzcOQiIMYNrvPbIte7kQZrtvkUG0iz9D0Z
 NwSAtyOtYrRfobCYkoZkgzsxSLU7wtR9i1NkonWkFpnwi1mfIzilGX6IFh55kSLCmEFk
 Gc+oTUCqE1D5mKuVCsXcWrCK2k+OGPxkPUadoP2WPHOq92MYtXboijTDRe5MJL+YncdH
 zw6A==
X-Gm-Message-State: AOAM530t+hXQqEOx58q3jDytDdvuyJoJP69euqlxEVrguzonQfd1W1KY
 pKSGQI1Giu81takEmS4q/qklgjhLFcVvroQbuJkW8z1NdFRSA+bNnR6z+/JIdDIxCBy4VVLm3sl
 AgjjA4Sflt5d60hI=
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr6950275wme.52.1631257261095; 
 Fri, 10 Sep 2021 00:01:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTOKE/yKCTAIcgoa07td89OyEYwFLhK9qzAHP2qaLF8eq2/4lCd1tW3mNrO4GEUJD6J1KgYQ==
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr6950249wme.52.1631257260774; 
 Fri, 10 Sep 2021 00:01:00 -0700 (PDT)
Received: from localhost (static-201-64-63-95.ipcom.comunitel.net.
 [95.63.64.201])
 by smtp.gmail.com with ESMTPSA id t11sm3674350wmi.23.2021.09.10.00.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 00:01:00 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: lizhijian@fujitsu.com
Subject: Re: [PULL 0/7] Migration.next patches
In-Reply-To: <dc771570-e47d-9926-6a10-11ad3bfa69ae@fujitsu.com>
 (lizhijian@fujitsu.com's message of "Fri, 10 Sep 2021 05:27:41 +0000")
References: <20210909103346.1990-1-quintela@redhat.com>
 <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
 <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com>
 <87fsudn30g.fsf@secure.mitica>
 <14fbe8b5-0212-c0fd-e0fd-4198ab5d217b@fujitsu.com>
 <dc771570-e47d-9926-6a10-11ad3bfa69ae@fujitsu.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 10 Sep 2021 09:00:59 +0200
Message-ID: <87bl50ncd0.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"lizhijian@fujitsu.com" <lizhijian@fujitsu.com> wrote:
> On 10/09/2021 13:20, Li Zhijian wrote:
>>
>>
>> On 10/09/2021 00:10, Juan Quintela wrote:
>>> "Li, Zhijian" <lizhijian@cn.fujitsu.com> wrote:
>>>> on 2021/9/9 21:42, Peter Maydell wrote:
>>>>> On Thu, 9 Sept 2021 at 11:36, Juan Quintela <quintela@redhat.com> wro=
te:
>>>>> Fails to build, FreeBSD:
>>>>>
>>>>> ../src/migration/rdma.c:1146:23: error: use of undeclared identifier
>>>>> 'IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int advice =3D wr ? IBV_ADVISE_MR_ADVI=
CE_PREFETCH_WRITE :
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>>>>> ../src/migration/rdma.c:1147:18: error: use of undeclared identifier
>>>>> 'IBV_ADVISE_MR_ADVICE_PREFETCH'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IBV_ADVISE_MR_ADVICE_PREFETCH;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>>>>> ../src/migration/rdma.c:1150:11: warning: implicit declaration of
>>>>> function 'ibv_advise_mr' is invalid in C99
>>>>> [-Wimplicit-function-declaration]
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ibv_advise_mr(pd, advice,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>>>>> ../src/migration/rdma.c:1151:25: error: use of undeclared identifier
>>>>> 'IBV_ADVISE_MR_FLAG_FLUSH'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^
>>>>>
>>>> it's introduced by [PULL 4/7] migration/rdma: advise prefetch write fo=
r ODP region
>>>> where it calls a ibv_advise_mr(). i have checked the latest FreeBSD, i=
t didn't ship with this API
>>>> May i know if just FressBSD reports this failure? if so, i just need f=
iltering out FreeBSD only
>>> Second try.=C2=A0 I can't see an example where they search for:
>>> a symbol on the header file
>>> =C2=A0=C2=A0 and
>>> a function in a library
>>>
>>> so I assume that if you have the symbols, you have the function.
>>>
>>> How do you see it?
>>>
>>> Trying to compile it on vm-build-freebsd, but not being very sucessfull
>>> so far.
>
> BTW: Does QEMU provide any mean to set http(s)_proxy to building vm ? Cur=
rently, i have to
> hack the code like:
>
> -        self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
> + self.ssh_root_check("setenv HTTP_PROXY http://myproxy; setenv
> HTTPS_PROXY http://myproxy; pkg install -y %s\n" % "
> ".join(self.pkgs))

Dunno.  I don't need http proxy, for me what fails is the "tar" stage.

(master)$ make HOME=3D/scratch/tmp/ vm-build-fedora
    VM-BUILD fedora=20
tar: Skipping to next header
tar: Exiting with failure status due to previous errors
failed append submodule slirp to /mnt/code/qemu/full/vm-test-eqebvy5r.tmp/d=
ata-3a52c.tar
Failed to prepare guest environment
Traceback (most recent call last):
  File "/mnt/code/qemu/full/tests/vm/basevm.py", line 636, in main
    vm.add_source_dir(args.build_qemu)
  File "/mnt/code/qemu/full/tests/vm/basevm.py", line 270, in add_source_di=
r
    subprocess.check_call(["./scripts/archive-source.sh", tarfile],
  File "/usr/lib64/python3.9/subprocess.py", line 373, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['./scripts/archive-source.sh', '/m=
nt/code/qemu/full/vm-test-eqebvy5r.tmp/data-3a52c.tar']' returned non-zero =
exit status 1.
make: *** [tests/vm/Makefile.include:96: vm-build-fedora] Error 2

forget about the HOME=3D change, it also fails if I don't use it.  And the
problem is the archive bits.


>>>> on 2021/9/9 21:42, Peter Maydell wrote:
>>>>> On Thu, 9 Sept 2021 at 11:36, Juan Quintela <quintela@redhat.com> wro=
te:
>>>>> Fails to build, FreeBSD:
>>>>>
>>>>> ../src/migration/rdma.c:1146:23: error: use of undeclared identifier
>>>>> 'IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int advice =3D wr ? IBV_ADVISE_MR_ADVI=
CE_PREFETCH_WRITE :
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>>>>> ../src/migration/rdma.c:1147:18: error: use of undeclared identifier
>>>>> 'IBV_ADVISE_MR_ADVICE_PREFETCH'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IBV_ADVISE_MR_ADVICE_PREFETCH;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>>>>> ../src/migration/rdma.c:1150:11: warning: implicit declaration of
>>>>> function 'ibv_advise_mr' is invalid in C99
>>>>> [-Wimplicit-function-declaration]
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ibv_advise_mr(pd, advice,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>>>>> ../src/migration/rdma.c:1151:25: error: use of undeclared identifier
>>>>> 'IBV_ADVISE_MR_FLAG_FLUSH'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^
>>>>>
>>>> it's introduced by [PULL 4/7] migration/rdma: advise prefetch write fo=
r ODP region
>>>> where it calls a ibv_advise_mr(). i have checked the latest FreeBSD, i=
t didn't ship with this API
>>>> May i know if just FressBSD reports this failure? if so, i just need f=
iltering out FreeBSD only
>>> Second try.=C2=A0 I can't see an example where they search for:
>>> a symbol on the header file
>>> =C2=A0=C2=A0 and
>>> a function in a library
>>>
>>> so I assume that if you have the symbols, you have the function.
>>>
>>> How do you see it?
>>>
>>> Trying to compile it on vm-build-freebsd, but not being very sucessfull
>>> so far.
>
> BTW: Does QEMU provide any mean to set http(s)_proxy to building vm ? Cur=
rently, i have to
> hack the code like:
>
> -        self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
> + self.ssh_root_check("setenv HTTP_PROXY http://myproxy; setenv
> HTTPS_PROXY http://myproxy; pkg install -y %s\n" % "
> ".join(self.pkgs))

Dunno.  I don't need http proxy, for me what fails is the "tar" stage.

(master)$ make HOME=3D/scratch/tmp/ vm-build-fedora
    VM-BUILD fedora=20
tar: Skipping to next header
tar: Exiting with failure status due to previous errors
failed append submodule slirp to /mnt/code/qemu/full/vm-test-eqebvy5r.tmp/d=
ata-3a52c.tar
Failed to prepare guest environment
Traceback (most recent call last):
  File "/mnt/code/qemu/full/tests/vm/basevm.py", line 636, in main
    vm.add_source_dir(args.build_qemu)
  File "/mnt/code/qemu/full/tests/vm/basevm.py", line 270, in add_source_di=
r
    subprocess.check_call(["./scripts/archive-source.sh", tarfile],
  File "/usr/lib64/python3.9/subprocess.py", line 373, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['./scripts/archive-source.sh', '/m=
nt/code/qemu/full/vm-test-eqebvy5r.tmp/data-3a52c.tar']' returned non-zero =
exit status 1.
make: *** [tests/vm/Makefile.include:96: vm-build-fedora] Error 2

forget about the HOME=3D change, it also fails if I don't use it.  And the
problem is the archive bits.

master)$  ./scripts/archive-source.sh /tmp/kk.tar
tar: Skipping to next header
tar: Exiting with failure status due to previous errors
failed append submodule slirp to /tmp/kk.tar

See that the problem is the slirp submodule, but it has the "right"
version, i.e. not a case of updating the module.  the dtc works without pro=
blem.

(master)$ sh -x ./scripts/archive-source.sh /tmp/kk.tar
+ test 1 -lt 1
++ realpath /tmp/kk.tar
+ tar_file=3D/tmp/kk.tar
++ mktemp -d /tmp/kk.sub.XXXXXXXX
+ sub_tdir=3D/tmp/kk.sub.WKj1o6oP
+ sub_file=3D/tmp/kk.sub.WKj1o6oP/submodule.tar
+ submodules=3D'dtc slirp meson ui/keycodemapdb'
+ submodules=3D'dtc slirp meson ui/keycodemapdb tests/fp/berkeley-softfloat=
-3 tests/fp/berkeley-testfloat-3'
+ sub_deinit=3D
+ trap cleanup 0 1 2 3 15
++ tree_ish
++ local retval=3DHEAD
++ git diff-index --quiet --ignore-submodules=3Dall HEAD --
++ echo HEAD
+ git archive --format tar HEAD
+ test 0 -ne 0
+ for sm in $submodules
++ git submodule status dtc
+ status=3D' 85e5d839847af54efab170f2b1331b2a6421e647 dtc (v1.6.0-4-g85e5d8=
3)'
+ smhash=3D'85e5d839847af54efab170f2b1331b2a6421e647 dtc (v1.6.0-4-g85e5d83=
)'
+ smhash=3D85e5d839847af54efab170f2b1331b2a6421e647
+ case "$status" in
+ cd dtc
++ tree_ish
++ local retval=3DHEAD
++ git diff-index --quiet --ignore-submodules=3Dall HEAD --
++ echo HEAD
+ git archive --format tar --prefix dtc/ HEAD
+ test 0 -ne 0
+ tar --concatenate --file /tmp/kk.tar /tmp/kk.sub.WKj1o6oP/submodule.tar
+ test 0 -ne 0
+ for sm in $submodules
++ git submodule status slirp
+ status=3D' a88d9ace234a24ce1c17189642ef9104799425e0 slirp (v4.6.1-7-ga88d=
9ac)'
+ smhash=3D'a88d9ace234a24ce1c17189642ef9104799425e0 slirp (v4.6.1-7-ga88d9=
ac)'
+ smhash=3Da88d9ace234a24ce1c17189642ef9104799425e0
+ case "$status" in
+ cd slirp
++ tree_ish
++ local retval=3DHEAD
++ git diff-index --quiet --ignore-submodules=3Dall HEAD --
++ echo HEAD
+ git archive --format tar --prefix slirp/ HEAD
+ test 0 -ne 0
+ tar --concatenate --file /tmp/kk.tar /tmp/kk.sub.WKj1o6oP/submodule.tar
tar: Skipping to next header
tar: Exiting with failure status due to previous errors
+ test 2 -ne 0
+ error 'failed append submodule slirp to /tmp/kk.tar'
+ printf '%s\n' 'failed append submodule slirp to /tmp/kk.tar'
failed append submodule slirp to /tmp/kk.tar
+ exit 1
+ cleanup
+ local status=3D1
+ rm -rf /tmp/kk.sub.WKj1o6oP
+ test '' '!=3D' ''
+ exit 1
(master)$=20

Doing the things on the command line, the=20

  git archive --format tar --prefix slirp/ HEAD

Creates a tar archive, so I get completely lost.

I showed here fedora, but it fails exactly the same for freebsd,
openbsd, ... and everything that I decided to build.  It fails in the
smae stage.

Later, Juan.


