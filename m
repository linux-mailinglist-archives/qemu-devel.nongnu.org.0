Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4474131CE97
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:03:38 +0100 (CET)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3lB-0007v5-AJ
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lC3MK-0005Tu-K6
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:37:58 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lC3MF-0005jf-76
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:37:56 -0500
Received: by mail-wm1-x329.google.com with SMTP id o24so15037626wmh.5
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IiZMMmDEUlg1qcsqy6O19rA4afDs6VNsgTDdkOz+bro=;
 b=btzcdzCzxKMfQigtr1Dx8m1j3iAtihX7UXxbSnc1pB4empJFAwruL6lKC5Rnnpq3OF
 B2To/iy5/N/RybYllPXH13v2/lEvswXmArCxXQPfk1CldwB0fXDGjtcOce2DDzLBtKjN
 RYYpmB7h7lhCvEXgioP5IXx/bw3BOQDqmG6P0VrP7je0uJX8D/Hji5U4x6mOJ1WL5zJw
 KWU+06N8p7gRPnGsz2sCYkWs+7t+GKpjeHLVDjvH0/c7lQwZ7Wifil0fblqe8HZZHbNb
 VDVDYdsQhiQpMC/s5Fc7TV7jZnazB7CHY0zfGArIlVHjTb5FbLG1AX11I09syzlcUQxJ
 FjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IiZMMmDEUlg1qcsqy6O19rA4afDs6VNsgTDdkOz+bro=;
 b=Rv+wdY+Ct62CJiwNu8S9oX20x5OaLKWnGX9TKiJXRsrKNF2cPq5iG6xrEx4u6T4OfE
 /yYTH3ul8zvbNl3uPQ7RwV7oAcBafIypQRpAPHTBfl0BoOV1RU3hlMJB6CpAvWN+hEQA
 V0DvP+pzADoce+GCL6GHMDyfw+giI4sUbK6BlPvio7OiBRUmvTSWl8UTsywplWH1v8fd
 GdbkLI6Na7Y7eN0V11cLZzUJcO5qV8GUkgIuUPljobgqYSNWpWQBc0LY9487PeI9bc6j
 NKJblVGRaC79III87PcmkNFqqFp2S6HgHEFaM4uzgfr/cHXE94wxUF1NSozDEyxET4Bh
 ZohQ==
X-Gm-Message-State: AOAM532kKFA4FqL6LMmQlxtNw32K0EHaCoeCApsK/dBxyPW8rZszsv0W
 SGcXxG/Xsn4rO4TMFG6CAAg7rxmyKXp3B45S
X-Google-Smtp-Source: ABdhPJyd8B1xWPfeWaLVU747PylK2cl9lNpDm7UzfYIGqDKRJK4hVR1XbgIp8PNLJ2yhtd9OTxxzRg==
X-Received: by 2002:a05:600c:4c19:: with SMTP id
 d25mr3980294wmp.181.1613493438676; 
 Tue, 16 Feb 2021 08:37:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w16sm15088203wrk.38.2021.02.16.08.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:37:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 98C3B1FF7E;
 Tue, 16 Feb 2021 16:37:16 +0000 (GMT)
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
 <20210204105232.834642-21-marcandre.lureau@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 20/20] tests: add some virtio-gpu & vhost-user-gpu
 acceptance test
Date: Tue, 16 Feb 2021 16:34:06 +0000
In-reply-to: <20210204105232.834642-21-marcandre.lureau@redhat.com>
Message-ID: <87ft1wt1dv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Cleber Rosa <crosa@redhat.com>, kraxel@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This will check virtio/vhost-user-vga & virgl are correctly initialized
> by the Linux kernel on an egl-headless display.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/acceptance/virtio-gpu.py | 161 +++++++++++++++++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 tests/acceptance/virtio-gpu.py

This failed when I got to master:

  2021-02-16 14:33:46,266 qmp              L0255 DEBUG| >>> {'execute': 'qm=
p_capabilities'}
  2021-02-16 14:33:46,441 machine          L0385 DEBUG| Error launching VM
  2021-02-16 14:33:46,441 machine          L0387 DEBUG| Command: './qemu-sy=
stem-x86_64 -display none -vga none -chardev socket,id=3Dmon,path=3D/var/tm=
p/avo_qemu_sock_xy9ndjnm/qemu
  -29492-monitor.sock -mon chardev=3Dmon,mode=3Dcontrol -chardev socket,id=
=3Dconsole,path=3D/var/tmp/avo_qemu_sock_xy9ndjnm/qemu-29492-console.sock,s=
erver=3Don,wait=3Doff -serial chardev:
  console -cpu host -m 2G -machine pc,accel=3Dkvm -device virtio-vga,virgl=
=3Don -display egl-headless -kernel /home/alex.bennee/avocado/data/cache/by=
_location/892ae21f3ae7d04994d8
  1e1c0bf204ecebe555bb/vmlinuz -initrd /home/alex.bennee/avocado/data/cache=
/by_location/892ae21f3ae7d04994d81e1c0bf204ecebe555bb/initrd.img -append pr=
intk.time=3D0 console=3DttyS0
   rdinit=3D/bin/bash'
  2021-02-16 14:33:46,441 machine          L0389 DEBUG| Output: "qemu-syste=
m-x86_64: -device virtio-vga,virgl=3Don: Property 'virtio-vga.virgl' not fo=
und\n"
  2021-02-16 14:33:46,441 stacktrace       L0039 ERROR|

I'm going to assume this is because the beefy server I was building on
didn't have the VirGL headers to enable this feature. In lieu of feature
probing you might have to do what I did for the plugins test:

        try:
            vm.launch()
        except:
            # TODO: probably fails because plugins not enabled but we
            # can't currently probe for the feature.
            self.cancel("TCG Plugins not enabled?")


>
> diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu=
.py
> new file mode 100644
> index 0000000000..211f02932f
> --- /dev/null
> +++ b/tests/acceptance/virtio-gpu.py
> @@ -0,0 +1,161 @@
> +# virtio-gpu tests
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +
> +from avocado_qemu import Test
> +from avocado_qemu import BUILD_DIR
> +from avocado_qemu import wait_for_console_pattern
> +from avocado_qemu import exec_command_and_wait_for_pattern
> +from avocado_qemu import is_readable_executable_file
> +
> +from qemu.accel import kvm_available
> +
> +import os
> +import socket
> +import subprocess
> +
> +
> +ACCEL_NOT_AVAILABLE_FMT =3D "%s accelerator does not seem to be availabl=
e"
> +KVM_NOT_AVAILABLE =3D ACCEL_NOT_AVAILABLE_FMT % "KVM"
> +
> +
> +def pick_default_vug_bin():
> +    relative_path =3D "./contrib/vhost-user-gpu/vhost-user-gpu"
> +    if is_readable_executable_file(relative_path):
> +        return relative_path
> +
> +    bld_dir_path =3D os.path.join(BUILD_DIR, relative_path)
> +    if is_readable_executable_file(bld_dir_path):
> +        return bld_dir_path
> +
> +
> +class VirtioGPUx86(Test):
> +    """
> +    :avocado: tags=3Dvirtio-gpu
> +    """
> +
> +    KERNEL_COMMON_COMMAND_LINE =3D "printk.time=3D0 "
> +    KERNEL_URL =3D (
> +        "https://archives.fedoraproject.org/pub/fedora"
> +        "/linux/releases/33/Everything/x86_64/os/images"
> +        "/pxeboot/vmlinuz"
> +    )
> +    INITRD_URL =3D (
> +        "https://archives.fedoraproject.org/pub/fedora"
> +        "/linux/releases/33/Everything/x86_64/os/images"
> +        "/pxeboot/initrd.img"
> +    )
> +
> +    def wait_for_console_pattern(self, success_message, vm=3DNone):
> +        wait_for_console_pattern(
> +            self,
> +            success_message,
> +            failure_message=3D"Kernel panic - not syncing",
> +            vm=3Dvm,
> +        )
> +
> +    def test_virtio_vga_virgl(self):
> +        """
> +        :avocado: tags=3Darch:x86_64
> +        :avocado: tags=3Ddevice:virtio-vga
> +        """
> +        kernel_command_line =3D (
> +            self.KERNEL_COMMON_COMMAND_LINE + "console=3DttyS0 rdinit=3D=
/bin/bash"
> +        )
> +        # FIXME: should check presence of virtio, virgl etc
> +        if not kvm_available(self.arch, self.qemu_bin):
> +            self.cancel(KVM_NOT_AVAILABLE)
> +
> +        kernel_path =3D self.fetch_asset(self.KERNEL_URL)
> +        initrd_path =3D self.fetch_asset(self.INITRD_URL)
> +
> +        self.vm.set_console()
> +        self.vm.add_args("-cpu", "host")
> +        self.vm.add_args("-m", "2G")
> +        self.vm.add_args("-machine", "pc,accel=3Dkvm")
> +        self.vm.add_args("-device", "virtio-vga,virgl=3Don")
> +        self.vm.add_args("-display", "egl-headless")
> +        self.vm.add_args(
> +            "-kernel",
> +            kernel_path,
> +            "-initrd",
> +            initrd_path,
> +            "-append",
> +            kernel_command_line,
> +        )
> +        self.vm.launch()
> +        self.wait_for_console_pattern("as init process")
> +        exec_command_and_wait_for_pattern(
> +            self, "/usr/sbin/modprobe virtio_gpu", ""
> +        )
> +        self.wait_for_console_pattern("features: +virgl +edid")
> +
> +    def test_vhost_user_vga_virgl(self):
> +        """
> +        :avocado: tags=3Darch:x86_64
> +        :avocado: tags=3Ddevice:vhost-user-vga
> +        """
> +        kernel_command_line =3D (
> +            self.KERNEL_COMMON_COMMAND_LINE + "console=3DttyS0 rdinit=3D=
/bin/bash"
> +        )
> +        # FIXME: should check presence of vhost-user-gpu, virgl, memfd e=
tc
> +        if not kvm_available(self.arch, self.qemu_bin):
> +            self.cancel(KVM_NOT_AVAILABLE)
> +
> +        vug =3D pick_default_vug_bin()
> +        if not vug:
> +            self.cancel("Could not find vhost-user-gpu")
> +
> +        kernel_path =3D self.fetch_asset(self.KERNEL_URL)
> +        initrd_path =3D self.fetch_asset(self.INITRD_URL)
> +
> +        # Create socketpair to connect proxy and remote processes
> +        qemu_sock, vug_sock =3D socket.socketpair(
> +            socket.AF_UNIX, socket.SOCK_STREAM
> +        )
> +        os.set_inheritable(qemu_sock.fileno(), True)
> +        os.set_inheritable(vug_sock.fileno(), True)
> +
> +        self._vug_log_path =3D os.path.join(
> +            self.vm._test_dir, "vhost-user-gpu.log"
> +        )
> +        self._vug_log_file =3D open(self._vug_log_path, "wb")
> +        print(self._vug_log_path)
> +
> +        vugp =3D subprocess.Popen(
> +            [vug, "--virgl", "--fd=3D%d" % vug_sock.fileno()],
> +            stdin=3Dsubprocess.DEVNULL,
> +            stdout=3Dself._vug_log_file,
> +            stderr=3Dsubprocess.STDOUT,
> +            shell=3DFalse,
> +            close_fds=3DFalse,
> +        )
> +
> +        self.vm.set_console()
> +        self.vm.add_args("-cpu", "host")
> +        self.vm.add_args("-m", "2G")
> +        self.vm.add_args("-object", "memory-backend-memfd,id=3Dmem,size=
=3D2G")
> +        self.vm.add_args("-machine", "pc,memory-backend=3Dmem,accel=3Dkv=
m")
> +        self.vm.add_args("-chardev", "socket,id=3Dvug,fd=3D%d" % qemu_so=
ck.fileno())
> +        self.vm.add_args("-device", "vhost-user-vga,chardev=3Dvug")
> +        self.vm.add_args("-display", "egl-headless")
> +        self.vm.add_args(
> +            "-kernel",
> +            kernel_path,
> +            "-initrd",
> +            initrd_path,
> +            "-append",
> +            kernel_command_line,
> +        )
> +        self.vm.launch()
> +        self.wait_for_console_pattern("as init process")
> +        exec_command_and_wait_for_pattern(
> +            self, "/usr/sbin/modprobe virtio_gpu", ""
> +        )
> +        self.wait_for_console_pattern("features: +virgl -edid")
> +        self.vm.shutdown()
> +        qemu_sock.close()
> +        vugp.terminate()
> +        vugp.wait()


--=20
Alex Benn=C3=A9e

