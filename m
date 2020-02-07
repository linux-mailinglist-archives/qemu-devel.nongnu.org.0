Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73C15578E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 13:23:03 +0100 (CET)
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j02f0-0005pz-N6
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 07:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j02eD-0005Qo-1R
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:22:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j02eA-0005fx-63
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:22:11 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53932)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j02e9-0005et-Rh
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:22:10 -0500
Received: by mail-wm1-x344.google.com with SMTP id s10so2368907wmh.3
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 04:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=OftdxfQlAeSnJgNiJiKDjISsXkO4hfJ1ehxDVrJOXGM=;
 b=hGPTNN4bEGc5ZS7xcaw1gO9xggpi8ch1i4ith3f7nzZf8s6nHqr8Gpm9rqY+zFSW67
 okqMpPouSYnhGT4hxPYZEoFSgr6g5sbkuAx7ADuRB4Ch0+30nGHpjYcKREfSsnUsKfwi
 6qtsc/QimZ3YpU7GainqRGbOx9IA9fOnddjevocy2MQBXHWfbj7HIgizNZP7qboxp4eN
 RUxBYKx7+RigZqE7tY9Sb+Y3j4tdinP4D9f3EET3QtDDp62mAqIdoRwBA/3ZqQxouhWI
 npFcFf/lG3QwUh3zKADXYCol9nIYT8MfuOt2NBeja5w8A5iR87gyXcWqp2dIb3Y8f3QF
 6i2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=OftdxfQlAeSnJgNiJiKDjISsXkO4hfJ1ehxDVrJOXGM=;
 b=Xd8LgdVJxbLC0MP1eXzHZ8eOlbrFMTDRaQyhSvTS5tETW99C6W6bPucfREphuiLMeO
 43gTfIKHObucjJqRkxHuHI2QS9yMv9aoDGw3/HkQSZ/XWeLVkfT1O+Aby3nUz78s8Vdz
 XsNUsUFnfFf+rs1USFx+XeohH68TyS+VAstKd8VF7DmE5ut90lYUIboq7/hkvp/D0t69
 SjYIhhsFWIB8oiV5YtBY0vbBn6Cgzf7RoalWygRdK+a79WAr97yoP3fAkHrnMdrk/rU+
 QY8J28+ed1OMvkQDGkpWZL03SpfoeWHw8VMB+2Jy9mzrBDhRNHyYxfoAk2WPOnDRHKux
 zgpA==
X-Gm-Message-State: APjAAAXihQmZsU2ZCYT3SI1nZM1CFgUldOSEJIXuw9GlXfbaFFyVbhNL
 rxQRj1qw2eDcnkX1Gr4UjQBR8A==
X-Google-Smtp-Source: APXvYqwzIKAWflGdu0hl5H5C9IrbwYvJZ2Qo4181C6QXFq1b+o3yXmYcET0fm4a1hKcqFXyczLoi9g==
X-Received: by 2002:a1c:e488:: with SMTP id b130mr3999642wmh.108.1581078128220; 
 Fri, 07 Feb 2020 04:22:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g7sm3158247wrq.21.2020.02.07.04.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 04:22:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DBB381FF87;
 Fri,  7 Feb 2020 12:22:05 +0000 (GMT)
References: <20200205212920.467-1-robert.foley@linaro.org>
 <20200205212920.467-6-robert.foley@linaro.org>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Robert Foley <robert.foley@linaro.org>
Subject: Re: [PATCH v1 05/14] tests/vm: Added gen_cloud_init_iso() to basevm.py
In-reply-to: <20200205212920.467-6-robert.foley@linaro.org>
Date: Fri, 07 Feb 2020 12:22:05 +0000
Message-ID: <87h8027fki.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: fam@euphon.net, peter.puhov@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Robert Foley <robert.foley@linaro.org> writes:

> This method was located in both centos and ubuntu.i386.
>
> Signed-off-by: Robert Foley <robert.foley@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/vm/basevm.py   | 40 ++++++++++++++++++++++++++++++++++++++++
>  tests/vm/centos      | 33 +--------------------------------
>  tests/vm/ubuntu.i386 | 37 +------------------------------------
>  3 files changed, 42 insertions(+), 68 deletions(-)
>
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index a29099f6f1..a926211da8 100755
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -346,6 +346,46 @@ class BaseVM(object):
>      def qmp(self, *args, **kwargs):
>          return self._guest.qmp(*args, **kwargs)
>=20=20
> +    def gen_cloud_init_iso(self):
> +        cidir =3D self._tmpdir
> +        mdata =3D open(os.path.join(cidir, "meta-data"), "w")
> +        name =3D self.name.replace(".","-")
> +        mdata.writelines(["instance-id: {}-vm-0\n".format(name),
> +                          "local-hostname: {}-guest\n".format(name)])
> +        mdata.close()
> +        udata =3D open(os.path.join(cidir, "user-data"), "w")
> +        print("guest user:pw {}:{}".format(self._config['guest_user'],
> +                                           self._config['guest_pass']))
> +        udata.writelines(["#cloud-config\n",
> +                          "chpasswd:\n",
> +                          "  list: |\n",
> +                          "    root:%s\n" % self._config['root_pass'],
> +                          "    %s:%s\n" % (self._config['guest_user'],
> +                                           self._config['guest_pass']),
> +                          "  expire: False\n",
> +                          "users:\n",
> +                          "  - name: %s\n" % self._config['guest_user'],
> +                          "    sudo: ALL=3D(ALL) NOPASSWD:ALL\n",
> +                          "    ssh-authorized-keys:\n",
> +                          "    - %s\n" % self._config['ssh_pub_key'],
> +                          "  - name: root\n",
> +                          "    ssh-authorized-keys:\n",
> +                          "    - %s\n" % self._config['ssh_pub_key'],
> +                          "locale: en_US.UTF-8\n"])
> +        proxy =3D os.environ.get("http_proxy")
> +        if not proxy is None:
> +            udata.writelines(["apt:\n",
> +                              "  proxy: %s" % proxy])
> +        udata.close()
> +        subprocess.check_call(["genisoimage", "-output", "cloud-init.iso=
",
> +                               "-volid", "cidata", "-joliet", "-rock",
> +                               "user-data", "meta-data"],
> +                               cwd=3Dcidir,
> +                               stdin=3Dself._devnull, stdout=3Dself._std=
out,
> +                               stderr=3Dself._stdout)
> +
> +        return os.path.join(cidir, "cloud-init.iso")
> +
>  def parse_args(vmcls):
>=20=20
>      def get_default_jobs():
> diff --git a/tests/vm/centos b/tests/vm/centos
> index f2f0befd84..c108bd6799 100755
> --- a/tests/vm/centos
> +++ b/tests/vm/centos
> @@ -31,37 +31,6 @@ class CentosVM(basevm.BaseVM):
>          make docker-test-mingw@fedora  {verbose} J=3D{jobs} NETWORK=3D1;
>      """
>=20=20
> -    def _gen_cloud_init_iso(self):
> -        cidir =3D self._tmpdir
> -        mdata =3D open(os.path.join(cidir, "meta-data"), "w")
> -        mdata.writelines(["instance-id: centos-vm-0\n",
> -                          "local-hostname: centos-guest\n"])
> -        mdata.close()
> -        udata =3D open(os.path.join(cidir, "user-data"), "w")
> -        udata.writelines(["#cloud-config\n",
> -                          "chpasswd:\n",
> -                          "  list: |\n",
> -                          "    root:%s\n" % self.ROOT_PASS,
> -                          "    %s:%s\n" % (self.GUEST_USER, self.GUEST_P=
ASS),
> -                          "  expire: False\n",
> -                          "users:\n",
> -                          "  - name: %s\n" % self.GUEST_USER,
> -                          "    sudo: ALL=3D(ALL) NOPASSWD:ALL\n",
> -                          "    ssh-authorized-keys:\n",
> -                          "    - %s\n" % basevm.SSH_PUB_KEY,
> -                          "  - name: root\n",
> -                          "    ssh-authorized-keys:\n",
> -                          "    - %s\n" % basevm.SSH_PUB_KEY,
> -                          "locale: en_US.UTF-8\n"])
> -        udata.close()
> -        subprocess.check_call(["genisoimage", "-output", "cloud-init.iso=
",
> -                               "-volid", "cidata", "-joliet", "-rock",
> -                               "user-data", "meta-data"],
> -                               cwd=3Dcidir,
> -                               stdin=3Dself._devnull, stdout=3Dself._std=
out,
> -                               stderr=3Dself._stdout)
> -        return os.path.join(cidir, "cloud-init.iso")
> -
>      def build_image(self, img):
>          cimg =3D self._download_with_cache("https://cloud.centos.org/cen=
tos/7/images/CentOS-7-x86_64-GenericCloud-1802.qcow2.xz")
>          img_tmp =3D img + ".tmp"
> @@ -69,7 +38,7 @@ class CentosVM(basevm.BaseVM):
>          subprocess.check_call(["ln", "-f", cimg, img_tmp + ".xz"])
>          subprocess.check_call(["xz", "--keep", "-dvf", img_tmp + ".xz"])
>          self.exec_qemu_img("resize", img_tmp, "50G")
> -        self.boot(img_tmp, extra_args =3D ["-cdrom", self._gen_cloud_ini=
t_iso()])
> +        self.boot(img_tmp, extra_args =3D ["-cdrom", self.gen_cloud_init=
_iso()])
>          self.wait_ssh()
>          self.ssh_root_check("touch /etc/cloud/cloud-init.disabled")
>          self.ssh_root_check("yum update -y")
> diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
> index 3834cd7a8d..7df54ae094 100755
> --- a/tests/vm/ubuntu.i386
> +++ b/tests/vm/ubuntu.i386
> @@ -29,41 +29,6 @@ class UbuntuX86VM(basevm.BaseVM):
>          make --output-sync {target} -j{jobs} {verbose};
>      """
>=20=20
> -    def _gen_cloud_init_iso(self):
> -        cidir =3D self._tmpdir
> -        mdata =3D open(os.path.join(cidir, "meta-data"), "w")
> -        mdata.writelines(["instance-id: ubuntu-vm-0\n",
> -                          "local-hostname: ubuntu-guest\n"])
> -        mdata.close()
> -        udata =3D open(os.path.join(cidir, "user-data"), "w")
> -        udata.writelines(["#cloud-config\n",
> -                          "chpasswd:\n",
> -                          "  list: |\n",
> -                          "    root:%s\n" % self.ROOT_PASS,
> -                          "    %s:%s\n" % (self.GUEST_USER, self.GUEST_P=
ASS),
> -                          "  expire: False\n",
> -                          "users:\n",
> -                          "  - name: %s\n" % self.GUEST_USER,
> -                          "    sudo: ALL=3D(ALL) NOPASSWD:ALL\n",
> -                          "    ssh-authorized-keys:\n",
> -                          "    - %s\n" % basevm.SSH_PUB_KEY,
> -                          "  - name: root\n",
> -                          "    ssh-authorized-keys:\n",
> -                          "    - %s\n" % basevm.SSH_PUB_KEY,
> -                          "locale: en_US.UTF-8\n"])
> -        proxy =3D os.environ.get("http_proxy")
> -        if not proxy is None:
> -            udata.writelines(["apt:\n",
> -                              "  proxy: %s" % proxy])
> -        udata.close()
> -        subprocess.check_call(["genisoimage", "-output", "cloud-init.iso=
",
> -                               "-volid", "cidata", "-joliet", "-rock",
> -                               "user-data", "meta-data"],
> -                               cwd=3Dcidir,
> -                               stdin=3Dself._devnull, stdout=3Dself._std=
out,
> -                               stderr=3Dself._stdout)
> -        return os.path.join(cidir, "cloud-init.iso")
> -
>      def build_image(self, img):
>          cimg =3D self._download_with_cache(
>              "https://cloud-images.ubuntu.com/releases/bionic/release-201=
91114/ubuntu-18.04-server-cloudimg-i386.img",
> @@ -71,7 +36,7 @@ class UbuntuX86VM(basevm.BaseVM):
>          img_tmp =3D img + ".tmp"
>          subprocess.check_call(["cp", "-f", cimg, img_tmp])
>          self.exec_qemu_img("resize", img_tmp, "50G")
> -        self.boot(img_tmp, extra_args =3D ["-cdrom", self._gen_cloud_ini=
t_iso()])
> +        self.boot(img_tmp, extra_args =3D ["-cdrom", self.gen_cloud_init=
_iso()])
>          self.wait_ssh()
>          self.ssh_root_check("touch /etc/cloud/cloud-init.disabled")
>          self.ssh_root_check("apt-get update")


--=20
Alex Benn=C3=A9e

