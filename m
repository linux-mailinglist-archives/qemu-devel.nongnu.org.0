Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086CE69C7FE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:53:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2rL-0008R4-SN; Mon, 20 Feb 2023 04:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pU2rJ-0008KE-26
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:53:21 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pU2rF-0005VL-Ii
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:53:20 -0500
Received: by mail-pf1-x42e.google.com with SMTP id g12so260068pfi.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Owayq2s68AJQfmmpNib8R/1S+PlujMxO1nhTg4VMAi8=;
 b=ylZVt25MyqBZZTsWvr11JwLaZeN7tQ0dXwDO2WeSWGMA1IYj1Yln46hjOe3UPApD/H
 pTRrErtXThyLFrJI5hA3oli+qSYNNRc0ufUAGXxAN35oLACP5phdULnAEgSWaOBtLZUH
 IXET8v+MybIH+Adxx60rmVkC6hbNUDrk/D1jaQ4ExABa0ZbMVAQZFV80HzZpiTqmLOf1
 N2WkiJch8M/UsRJ1spWPZ1SMB7gyvWxP07z29TUtA2W3L9ygv+Dv9VUXkPvwaFXDAXSx
 D8TafqzRw3CLg2fmToU97BX1lEoXRtmP+yVrrxtd+qlTIPAJ1wmSJp5fHrhrw5FykcDe
 blnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Owayq2s68AJQfmmpNib8R/1S+PlujMxO1nhTg4VMAi8=;
 b=xfZUI0fTrZx+wpuxgEVUBVDT0SoAASfjMKAq+1UPtoXqIjcZja0XXeH6/xsNGkp9s/
 npiBO0smFTuzIZAKHaWyPNMfBH49zg38L7uR+opP6ubQJGaJUrQ4gg1ghUqt0QFKz7Sm
 vkkXVaZZV6qSzn2QD5gUoqgk+E8QNGNbXlEPwCnJpeNuTSoWGBjJBpZz4rofgRpUVyfE
 iVuER/V4d0LQF2et8kXr06bLRNHxFJHtY5DtYCIWYZYq/MZlgrU3dL5tVh7eV5p36p9q
 D8CCV2QFIpLnL4MicLRNX6JtH9dZi5vYXUBNJilgwoQyWfN0ZXrwy4BDfWX/NVN6qScE
 zPrg==
X-Gm-Message-State: AO0yUKXLhA6SQyLOQU4jA2vFcSyv2KC05O55Zi4P86OT1yZVPsexE/u/
 0yUHlIxQ1MS06chDmUQDMN/YLg==
X-Google-Smtp-Source: AK7set+/6bfbdhTonVTEG3bzdDjFNpZQzJhSpv3nHVWugdEe47OSJBdeePjOuip8UJtzjd6PoX0BOg==
X-Received: by 2002:aa7:9407:0:b0:5a9:ea47:cd00 with SMTP id
 x7-20020aa79407000000b005a9ea47cd00mr704949pfo.17.1676886792139; 
 Mon, 20 Feb 2023 01:53:12 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a62e113000000b005a8dc935ec1sm7300811pfh.62.2023.02.20.01.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 01:53:11 -0800 (PST)
Message-ID: <fe9a4f13-5bca-f386-1eb5-d1a02a487c40@bytedance.com>
Date: Mon, 20 Feb 2023 17:53:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <877cwizqvy.fsf@secure.mitica>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <877cwizqvy.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi, Juan

On 2023/2/16 上午3:10, Juan Quintela wrote:
> Chuang Xu <xuchuangxclwt@bytedance.com> wrote:
>> In this version:
> Hi
>
> I had to drop this.  It breaks migration of dbus-vmstate.
>
> .[K144/179 qemu:qtest+qtest-x86_64 / qtest-x86_64/virtio-net-failover             ERROR           5.66s   killed by signal 6 SIGABRT
>>>> G_TEST_DBUS_DAEMON=/mnt/code/qemu/multifd/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-x86_64 MALLOC_PERTURB_=145 /scratch/qemu/multifd/x64/tests/qtest/virtio-net-failover --tap -k
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> stderr:
> qemu-system-x86_64: /mnt/code/qemu/multifd/include/exec/memory.h:1112: address_space_to_flatview: Assertion `(!memory_region_transaction_in_progress() && qemu_mutex_iothread_locked()) || rcu_read_is_locked()' failed.
> Broken pipe
> ../../../../mnt/code/qemu/multifd/tests/qtest/libqtest.c:190: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
>
> (test program exited with status code -6)
>
> TAP parsing error: Too few tests run (expected 23, got 12)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>
> Can you take a look at this?
>
> I reproduced it with "make check" and qemu compiled with the configure
> line attached.
>
> Later, Juan.
>
> configure --enable-trace-backends=log
> 	--prefix=/usr
> 	--sysconfdir=/etc/sysconfig/
> 	--audio-drv-list=pa
> 	--target-list=x86_64-softmmu
> 	--with-coroutine=ucontext
> 	--with-git-submodules=validate
> 	--enable-fdt=system
> 	--enable-alsa
> 	--enable-attr
> 	--enable-auth-pam
> 	--enable-avx2
> 	--enable-avx512f
> 	--enable-bochs
> 	--enable-bpf
> 	--enable-brlapi
> 	--disable-bsd-user
> 	--enable-bzip2
> 	--enable-cap-ng
> 	--disable-capstone
> 	--disable-cfi
> 	--disable-cfi-debug
> 	--enable-cloop
> 	--disable-cocoa
> 	--enable-containers
> 	--disable-coreaudio
> 	--enable-coroutine-pool
> 	--enable-crypto-afalg
> 	--enable-curl
> 	--enable-curses
> 	--enable-dbus-display
> 	--enable-debug-info
> 	--disable-debug-mutex
> 	--disable-debug-stack-usage
> 	--disable-debug-tcg
> 	--enable-dmg
> 	--disable-docs
> 	--disable-dsound
> 	--enable-fdt
> 	--disable-fuse
> 	--disable-fuse-lseek
> 	--disable-fuzzing
> 	--disable-gcov
> 	--enable-gettext
> 	--enable-gio
> 	--enable-glusterfs
> 	--enable-gnutls
> 	--disable-gprof
> 	--enable-gtk
> 	--disable-guest-agent
> 	--disable-guest-agent-msi
> 	--disable-hax
> 	--disable-hvf
> 	--enable-iconv
> 	--enable-install-blobs
> 	--enable-jack
> 	--enable-keyring
> 	--enable-kvm
> 	--enable-l2tpv3
> 	--enable-libdaxctl
> 	--enable-libiscsi
> 	--enable-libnfs
> 	--enable-libpmem
> 	--enable-libssh
> 	--enable-libudev
> 	--enable-libusb
> 	--enable-linux-aio
> 	--enable-linux-io-uring
> 	--disable-linux-user
> 	--enable-live-block-migration
> 	--disable-lto
> 	--disable-lzfse
> 	--enable-lzo
> 	--disable-malloc-trim
> 	--enable-membarrier
> 	--enable-module-upgrades
> 	--enable-modules
> 	--enable-mpath
> 	--enable-multiprocess
> 	--disable-netmap
> 	--enable-nettle
> 	--enable-numa
> 	--disable-nvmm
> 	--enable-opengl
> 	--enable-oss
> 	--enable-pa
> 	--enable-parallels
> 	--enable-pie
> 	--enable-plugins
> 	--enable-png
> 	--disable-profiler
> 	--enable-pvrdma
> 	--enable-qcow1
> 	--enable-qed
> 	--disable-qom-cast-debug
> 	--enable-rbd
> 	--enable-rdma
> 	--enable-replication
> 	--enable-rng-none
> 	--disable-safe-stack
> 	--disable-sanitizers
> 	--enable-stack-protector
> 	--enable-sdl
> 	--enable-sdl-image
> 	--enable-seccomp
> 	--enable-selinux
> 	--enable-slirp
> 	--enable-slirp-smbd
> 	--enable-smartcard
> 	--enable-snappy
> 	--enable-sparse
> 	--enable-spice
> 	--enable-spice-protocol
> 	--enable-system
> 	--enable-tcg
> 	--disable-tcg-interpreter
> 	--disable-tools
> 	--enable-tpm
> 	--disable-tsan
> 	--disable-u2f
> 	--enable-usb-redir
> 	--disable-user
> 	--disable-vde
> 	--enable-vdi
> 	--enable-vhost-crypto
> 	--enable-vhost-kernel
> 	--enable-vhost-net
> 	--enable-vhost-user
> 	--enable-vhost-user-blk-server
> 	--enable-vhost-vdpa
> 	--enable-virglrenderer
> 	--enable-virtfs
> 	--enable-virtiofsd
> 	--enable-vnc
> 	--enable-vnc-jpeg
> 	--enable-vnc-sasl
> 	--enable-vte
> 	--enable-vvfat
> 	--enable-werror
> 	--disable-whpx
> 	--enable-xen
> 	--enable-xen-pci-passthrough
> 	--enable-xkbcommon
> 	--enable-zstd
> 	--disable-gcrypt

I'll fix this error in v6.

In addition to the test mentioned in your email, are there
any other conditions that need to be tested? I hope to have
a full test before I send v6.

Thanks!


