Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1815C4AC749
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:28:11 +0100 (CET)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7o9-0005lz-Sd
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:28:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nH7IF-0003Yn-WB
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nH7I9-0000aq-JZ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644252904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2K+Ct7n3/4XHkYPXn3kf30u2AE1eAiwllW/ROIQF88=;
 b=HA9aMhMtho5ySr58SjTBv78bpIjvZAppqfXsF69Ht0Sa6QwmxLkzCeiBKqBEvMk8o8+6+F
 BRJcv0eBvo0DQS6yRWEzKgZbYO7sIFuCzyNxftFE+ayTLXri29PE2JuEhWwgY2Ot0W8JWY
 VWLzplRiIbTsxuU7u9YV0x00gn2Rto4=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-sG6xm3WCMEihiAH-C4Rlhg-1; Mon, 07 Feb 2022 11:55:01 -0500
X-MC-Unique: sG6xm3WCMEihiAH-C4Rlhg-1
Received: by mail-oo1-f69.google.com with SMTP id
 bb33-20020a056820162100b0031619149c44so9311644oob.5
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 08:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s2K+Ct7n3/4XHkYPXn3kf30u2AE1eAiwllW/ROIQF88=;
 b=ENf9v+ypN6E2BXPrKxKNK4QbdHmrpLatUQZmZl9UvYt5pPTY1zK+8Fhafb7GJyqQgb
 tR16NXCji25QejXCVoKj2lSmp905BrehJ7kSGlM44JblmkgPqM3X4MrzDb01AzSU94lb
 e2pgLNOCRsTbC1p4pwtckd/qUsINY98eTMSZcZvWeXwO165m7F7QgkOHf75Et6qfZO4U
 eY20ZoUcu1wFPOyLjqy/8ixlLvJJnCGOcgt9TFXG/FFVVUg2Dr6RGdj7hVixc6E29+Il
 30Gq1Of9lp7t0RT+bOh6JRwN9VXqtJsXgAgmEqRZCM4fB/rWN4OQwJZv9Ijs+puh8GD9
 gn8w==
X-Gm-Message-State: AOAM531Wdf0CxtTA3z3zF8qI20QgmDXKtVRdHkuc80rQwixW2GKvFk60
 zovvzo9rK8e77KQWbN2b4yt1TVfLCkp/kxkQFShR3w82247RG83tT669lMQdlz58KdjEw5Pz4fy
 5ewwcbQtAfvOmx1Q=
X-Received: by 2002:aca:c1c3:: with SMTP id r186mr284751oif.304.1644252900819; 
 Mon, 07 Feb 2022 08:55:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDcZqB5i4PzxCaQmrEsuScSyT1P46/cgWwENHxBVdzS6zqoK/6IWTXq8xrvDRc6ZKzKu9zbw==
X-Received: by 2002:aca:c1c3:: with SMTP id r186mr284738oif.304.1644252900546; 
 Mon, 07 Feb 2022 08:55:00 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id s3sm4578407ois.19.2022.02.07.08.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 08:55:00 -0800 (PST)
Date: Mon, 7 Feb 2022 09:54:59 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PULL 0/2] VFIO fixes 2022-02-03
Message-ID: <20220207095459.6fb4b716.alex.williamson@redhat.com>
In-Reply-To: <9ee51368-df12-1f9f-70e4-1fbad90f43ae@amsat.org>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <CAFEAcA-CX6hPOEEr_Yjcd1=4AHfkYgnkQ_ruUJ4mFwBYz1fLQA@mail.gmail.com>
 <20220207085045.1de46df1.alex.williamson@redhat.com>
 <9ee51368-df12-1f9f-70e4-1fbad90f43ae@amsat.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 17:08:01 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> On 7/2/22 16:50, Alex Williamson wrote:
> > On Sat, 5 Feb 2022 10:49:35 +0000
> > Peter Maydell <peter.maydell@linaro.org> wrote: =20
>=20
> >> Hi; this has a format-string issue that means it doesn't build
> >> on 32-bit systems:
> >>
> >> https://gitlab.com/qemu-project/qemu/-/jobs/2057116569
> >>
> >> ../hw/vfio/common.c: In function 'vfio_listener_region_add':
> >> ../hw/vfio/common.c:893:26: error: format '%llx' expects argument of
> >> type 'long long unsigned int', but argument 6 has type 'intptr_t' {aka
> >> 'int'} [-Werror=3Dformat=3D]
> >> error_report("%s received unaligned region %s iova=3D0x%"PRIx64
> >> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> ../hw/vfio/common.c:899:26:
> >> qemu_real_host_page_mask);
> >> ~~~~~~~~~~~~~~~~~~~~~~~~
> >>
> >> For intptr_t you want PRIxPTR. =20
> >=20
> > Darn.  Well, let me use this opportunity to ask, how are folks doing
> > 32-bit cross builds on Fedora?  I used to keep an i686 PAE VM for this
> > purpose, but I was eventually no longer able to maintain the build
> > dependencies.  Looks like this failed on a mipsel cross build, but I
> > don't see such a cross compiler in Fedora.  I do mingw32/64 cross
> > builds, but they leave a lot to be desired for code coverage.  Thanks, =
=20
>=20
> You can use docker images:
> https://wiki.qemu.org/Testing/DockerBuild

Hmm, not ideal...

Clean git clone, HEAD 55ef0b702bc2 ("Merge remote-tracking branch 'remotes/=
lvivier-gitlab/tags/linux-user-for-7.0-pull-request' into staging")

$ make docker-test-quick@debian-mips64el-cross J=3D16
...
1/1 qemu:block / qemu-iotests qcow2 RUNNING      =20
>>> PYTHON=3D/usr/bin/python3 MALLOC_PERTURB_=3D188 /bin/sh /tmp/qemu-test/=
build/../src/tests/qemu-iotests/../check-block.sh qcow2
1/1 qemu:block / qemu-iotests qcow2 ERROR           0.18s   exit status 1


Summary of Failures:

1/1 qemu:block / qemu-iotests qcow2 ERROR           0.18s   exit status 1


Ok:                 0  =20
Expected Fail:      0  =20
Fail:               1  =20
Unexpected Pass:    0  =20
Skipped:            0  =20
Timeout:            0  =20

Full log written to /tmp/qemu-test/build/meson-logs/iotestslog.txt
make: *** [/tmp/qemu-test/src/tests/Makefile.include:160: check-block] Erro=
r 1
make: *** Waiting for unfinished jobs....
130/131 qemu:qapi-schema+qapi-frontend / QAPI schema regression tests     O=
K              0.20s
131/131 qemu:decodetree / decodetree                                      O=
K              1.75s


Ok:                 3  =20
Expected Fail:      0  =20
Fail:               0  =20
Unexpected Pass:    0  =20
Skipped:            128=20
Timeout:            0  =20

Full log written to /tmp/qemu-test/build/meson-logs/testlog.txt
Traceback (most recent call last):
  File "/tmp/qemu.git/./tests/docker/docker.py", line 758, in <module>
    sys.exit(main())
  File "/tmp/qemu.git/./tests/docker/docker.py", line 754, in main
    return args.cmdobj.run(args, argv)
  File "/tmp/qemu.git/./tests/docker/docker.py", line 430, in run
    return Docker().run(argv, args.keep, quiet=3Dargs.quiet,
  File "/tmp/qemu.git/./tests/docker/docker.py", line 388, in run
    ret =3D self._do_check(["run", "--rm", "--label",
  File "/tmp/qemu.git/./tests/docker/docker.py", line 252, in _do_check
    return subprocess.check_call(self._command + cmd, **kwargs)
  File "/usr/lib64/python3.9/subprocess.py", line 373, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['podman', 'run', '--rm', '--label'=
, 'com.qemu.instance.uuid=3D560d8331a06b4fd9bbb74910f3a2b436', '--userns=3D=
keep-id', '-u', '1000', '--security-opt', 'seccomp=3Dunconfined', '--net=3D=
none', '-e', 'TARGET_LIST=3D', '-e', 'EXTRA_CONFIGURE_OPTS=3D', '-e', 'V=3D=
', '-e', 'J=3D16', '-e', 'DEBUG=3D', '-e', 'SHOW_ENV=3D', '-e', 'CCACHE_DIR=
=3D/var/tmp/ccache', '-v', '/home/alwillia/.cache/qemu-docker-ccache:/var/t=
mp/ccache:z', '-v', '/tmp/qemu.git/docker-src.2022-02-07-09.45.59.2258561:/=
var/tmp/qemu:z,ro', 'qemu/debian-mips64el-cross', '/var/tmp/qemu/run', 'tes=
t-quick']' returned non-zero exit status 2.
filter=3D--filter=3Dlabel=3Dcom.qemu.instance.uuid=3D560d8331a06b4fd9bbb749=
10f3a2b436
make[1]: *** [tests/docker/Makefile.include:306: docker-run] Error 1
make[1]: Leaving directory '/tmp/qemu.git'
make: *** [tests/docker/Makefile.include:339: docker-run-test-quick@debian-=
mips64el-cross] Error 2


