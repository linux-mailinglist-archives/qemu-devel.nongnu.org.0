Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ACC32A419
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:29:57 +0100 (CET)
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6yC-0000Un-HV
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lH6wn-0008VQ-Dk
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:28:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lH6wk-0000jo-5h
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614698903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=it9hRCUFJFmJ4UclJ5Ie+AgcQXOk6/NYLRugJz+VbO4=;
 b=AMwWHRRCG1kK6i1At3dXvX/8t665TG6xsR0E5hGFMKovCRLaXmj3abOrYSfp1BjCFC+Ubs
 aBqefsXctOES48daZ7598o3bMTv8DsePy+JS5s7mi7Op4+7LsP+bP8/rGCuOxzXy2jrei1
 kTAKZWqFEVGkFgo61G/HCuyvA8/KhZE=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-DVat8pMLPBK5myZZ1BPBqg-1; Tue, 02 Mar 2021 10:28:11 -0500
X-MC-Unique: DVat8pMLPBK5myZZ1BPBqg-1
Received: by mail-yb1-f200.google.com with SMTP id v6so22899904ybk.9
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 07:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=it9hRCUFJFmJ4UclJ5Ie+AgcQXOk6/NYLRugJz+VbO4=;
 b=GTp+37WN7G/5SdMffSTrZWRHduMczif+8NeLPkg3x+iJNLvG2I/7Fe0CXYBaIiCzPI
 nvTSVS3XfnxVbJDjF59/cbv/LZvRTG/Z0vsXC9KG/EaIz5esM90a8Ai6OoMndfiE2RLZ
 4jBBVqh+0xD/WcDTzzQwtJ8EJLqV/xABhS+KsQRqZgUz2JiqJjHZX4oHSxyX+Z+LE65f
 IuVyxoml3gdC+xivJ2aixqK75tefqIOtmLb4CA7XgJnTIKfXaSiaYEiZvZc26Ytt650a
 o8nSPrzB8tX2HaMofKtWdbUAfeFTYWsboU0FodHKhd5cT0w8rBnDRVbMqufq40e4x4QN
 /LsA==
X-Gm-Message-State: AOAM5328FfsCQm6YdGbYl6sp+/olN9rH5Oy0Zz1n0ZhhMqRbvgZnpVUJ
 MnwVce8ytzNwxW91+Nosqo0NznMiItI4MmUaqY3rQDtBwBMg25BbPOZzoNxahbPHcLKI9akZFWL
 5cy1zEyiPdqjhL9C8raVocvRnqQ7oVdU=
X-Received: by 2002:a25:d017:: with SMTP id h23mr33345539ybg.267.1614698890442; 
 Tue, 02 Mar 2021 07:28:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSySgfAcgvTCivMo3y+OAujZYpnEnip5e5g+XF+UlSr/H58tEp3GZSw1cQRo/ZuCtzpY58JScg2+zS7uOk7O8=
X-Received: by 2002:a25:d017:: with SMTP id h23mr33345506ybg.267.1614698890157; 
 Tue, 02 Mar 2021 07:28:10 -0800 (PST)
MIME-Version: 1.0
References: <20210228224343.310677-1-f4bug@amsat.org>
 <c11afdea-2faf-b445-cb35-05fed0c99a35@redhat.com>
 <b0dc999b-ddd1-fc4b-cd7d-56905c85616b@amsat.org>
In-Reply-To: <b0dc999b-ddd1-fc4b-cd7d-56905c85616b@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 2 Mar 2021 12:27:42 -0300
Message-ID: <CAKJDGDZzWKYrDiBPmDFBihEH=hOCymHuXZ8cNP4ZTSdLisAefA@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: Use imgtec.com URL for Fedora 22
 artifacts
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Phil,

On Mon, Mar 1, 2021 at 11:11 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 3/1/21 2:30 PM, Wainer dos Santos Moschetta wrote:
> > Hi,
> >
> > On 2/28/21 7:43 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Having artifacts stored in personal namespace is not ideal,
> >> as these might get closed and disappear. Use the original URL
> >> where these artifacts could be found.
> >>
> >> For more references:
> >> https://fedoraproject.org/wiki/Architectures/MIPS/2015Bootstrap/mips64=
el
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >>   tests/acceptance/boot_linux_console.py | 4 ++--
> >>   tests/acceptance/replay_kernel.py      | 4 ++--
> >>   2 files changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/tests/acceptance/boot_linux_console.py
> >> b/tests/acceptance/boot_linux_console.py
> >> index eb012867997..138bd8cb7d3 100644
> >> --- a/tests/acceptance/boot_linux_console.py
> >> +++ b/tests/acceptance/boot_linux_console.py
> >> @@ -239,8 +239,8 @@ def test_mips64el_malta_5KEc_cpio(self):
> >>           :avocado: tags=3Dmachine:malta
> >>           :avocado: tags=3Dendian:little
> >>           """
> >> -        kernel_url =3D ('https://github.com/philmd/qemu-testing-blob/=
'
> >> -                      'raw/9ad2df38/mips/malta/mips64el/'
> >> +        kernel_url =3D ('http://mipsfedora.imgtec.com/development/22/=
'
> >> +                      'mips64el/images/20150601/'
> >>                         'vmlinux-3.19.3.mtoman.20150408')
> >
> > http://mipsfedora.imgtec.com/development/22/mips64el/images/20150601/vm=
linux-3.19.3.mtoman.20150408
> > did not get resolve here. Could you please double-check the url is corr=
ect?
>
> Yes it is correct, the domain is dead. It was working when I wrote
> the test. Should I remove the test instead?
>

This test is already skipped by default because of the
AVOCADO_ALLOW_UNTRUSTED_CODE flag. Even if the flag is set to allow
the test to run, it will be skipped because the cache lacks the asset.

Instead of removing the test, my suggestion is to add information to
allow people to run it locally, like:

diff --git a/tests/acceptance/boot_linux_console.py
b/tests/acceptance/boot_linux_console.py
index eb01286799..23efc18a99 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -239,11 +239,13 @@ def test_mips64el_malta_5KEc_cpio(self):
         :avocado: tags=3Dmachine:malta
         :avocado: tags=3Dendian:little
         """
-        kernel_url =3D ('https://github.com/philmd/qemu-testing-blob/'
-                      'raw/9ad2df38/mips/malta/mips64el/'
-                      'vmlinux-3.19.3.mtoman.20150408')
+        # to run this test locally, download the following asset and regis=
ter
+        # it manually to the avocado cache with:
+        #   $(BUILD_DIR)/tests/venv/bin/avocado assets register \
+        #   vmlinux-3.19.3.mtoman.20150408 <path to the file>
+        kernel_name =3D 'vmlinux-3.19.3.mtoman.20150408'
         kernel_hash =3D '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
-        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel_h=
ash)
+        kernel_path =3D self.fetch_asset(kernel_name, asset_hash=3Dkernel_=
hash)
         initrd_url =3D ('https://github.com/groeck/linux-build-test/'
                       'raw/8584a59e/rootfs/'
                       'mipsel64/rootfs.mipsel64r1.cpio.gz')
diff --git a/tests/acceptance/replay_kernel.py
b/tests/acceptance/replay_kernel.py
index c1cb862468..180e915264 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -397,11 +397,13 @@ def test_mips64el_malta_5KEc_cpio(self):
         :avocado: tags=3Dendian:little
         :avocado: tags=3Dslowness:high
         """
-        kernel_url =3D ('https://github.com/philmd/qemu-testing-blob/'
-                      'raw/9ad2df38/mips/malta/mips64el/'
-                      'vmlinux-3.19.3.mtoman.20150408')
+        # to run this test locally, download the following asset and regis=
ter
+        # it manually to the avocado cache with:
+        #   $(BUILD_DIR)/tests/venv/bin/avocado assets register \
+        #   vmlinux-3.19.3.mtoman.20150408 <path to the file>
+        kernel_name =3D 'vmlinux-3.19.3.mtoman.20150408'
         kernel_hash =3D '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
-        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel_h=
ash)
+        kernel_path =3D self.fetch_asset(kernel_name, asset_hash=3Dkernel_=
hash)
         initrd_url =3D ('https://github.com/groeck/linux-build-test/'
                       'raw/8584a59e/rootfs/'
                       'mipsel64/rootfs.mipsel64r1.cpio.gz')

What do you think?

ps. WARNING, above code not tested.

> >>           kernel_hash =3D '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
> >>           kernel_path =3D self.fetch_asset(kernel_url,
> >> asset_hash=3Dkernel_hash)
> >> diff --git a/tests/acceptance/replay_kernel.py
> >> b/tests/acceptance/replay_kernel.py
> >> index c1cb8624683..efdd4233bc2 100644
> >> --- a/tests/acceptance/replay_kernel.py
> >> +++ b/tests/acceptance/replay_kernel.py
> >> @@ -397,8 +397,8 @@ def test_mips64el_malta_5KEc_cpio(self):
> >>           :avocado: tags=3Dendian:little
> >>           :avocado: tags=3Dslowness:high
> >>           """
> >> -        kernel_url =3D ('https://github.com/philmd/qemu-testing-blob/=
'
> >> -                      'raw/9ad2df38/mips/malta/mips64el/'
> >> +        kernel_url =3D ('http://mipsfedora.imgtec.com/development/22/=
'
> >> +                      'mips64el/images/20150601/'
> >>                         'vmlinux-3.19.3.mtoman.20150408')
> >>           kernel_hash =3D '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
> >>           kernel_path =3D self.fetch_asset(kernel_url,
> >> asset_hash=3Dkernel_hash)
> >
>


