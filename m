Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08866C45CD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:10:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peuTR-00042h-C6; Wed, 22 Mar 2023 05:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peuTO-00042H-3D
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:09:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peuTM-0006qF-8F
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679476170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1y82SZaeMajyTJK8Nls7BI/cIxj75CE1L5ZVsohRrUI=;
 b=OtxrKKGID6ssL6HEizoafkLuB6THfy3VP4aTUS7PDQ8Oh3MgvRWMHyaAgz4W4+ccevmR0n
 XryKKCzeKSvqLWFZz8PMrjiCyFS1rU3ADRIufZMij5060bm6n+aIyol7Fxho4TW6jxK8sV
 TAl96/pi1peqLcnSNHXyf0S+ablZ6jA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-HVgrDtAXMsW0t_FbLPIeng-1; Wed, 22 Mar 2023 05:09:28 -0400
X-MC-Unique: HVgrDtAXMsW0t_FbLPIeng-1
Received: by mail-qt1-f200.google.com with SMTP id
 u22-20020a05622a011600b003dfd61e8594so5995955qtw.15
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 02:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679476168;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1y82SZaeMajyTJK8Nls7BI/cIxj75CE1L5ZVsohRrUI=;
 b=wdwOPQE00x5N6nH5zbmSdvyX2k97XNX1oDBops2eUkhpUcW1eV+6R4/jsE1XwhrAl1
 +mny2lBGBnLm53FNbkiETbkLynJupoSxAdaYjxxgOnG1dUeY9bd51mDGtztPudSRpPPk
 mmVUjbuO5oR9ClCymMkj4ox0wmD3i8lSQQVPUrNG2yTJS7jVWNy7AEtmwW4LYUn0+MqR
 ml1KQ8NFYHzu20OIqs9BejIqjMxJ8Zj7G619vfMH2FF34pKuUsQqTf1KMIJD27YgEEGL
 2i06UQE7+owzWcxBIUxy83dQkb5amBeRh0PBaOubuz61WKhmOOSIYnXTP0LaSf0RlU9W
 h/QA==
X-Gm-Message-State: AO0yUKVoiRzJjYn+bmjx5XmfFw+yVzkc1SUlHIJUySjhhv6JQbvjHBBa
 c8iMlBWFLgPUVX2hQaljp7u/JDzwkMvnggly2MPhiRMk1rK/kVpyiUQAUPvWUfkjJK+NZXDA7mE
 5Uo45n6L2zevohkzlrS4e3NZ+Mg==
X-Received: by 2002:a05:6214:2a81:b0:5ad:367:29fa with SMTP id
 jr1-20020a0562142a8100b005ad036729famr4617017qvb.31.1679476168354; 
 Wed, 22 Mar 2023 02:09:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Vabf7QhfqN52fBFFAInKiRgTM2o1F9LrRy9gUTFCjZUTjqP0lsdlM9V8hKCL26JLrSP1Hgw==
X-Received: by 2002:a05:6214:2a81:b0:5ad:367:29fa with SMTP id
 jr1-20020a0562142a8100b005ad036729famr4617004qvb.31.1679476168093; 
 Wed, 22 Mar 2023 02:09:28 -0700 (PDT)
Received: from [192.168.8.106] (tmo-102-206.customers.d1-online.com.
 [80.187.102.206]) by smtp.gmail.com with ESMTPSA id
 c23-20020a379a17000000b007436d0e9408sm5922087qke.127.2023.03.22.02.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 02:09:27 -0700 (PDT)
Message-ID: <4e3a1b70-5b84-9d78-bfe2-644f50b77f5c@redhat.com>
Date: Wed, 22 Mar 2023 10:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH 00/47] Patch Round-up for stable 7.2.1
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 08/03/2023 17.57, Michael Tokarev wrote:
> Hello!
> 
> This is my first attempt to perform a stable qemu release.
> Doing it in a way similar to how Michael Roth did it before :)
> But since this is my first attempt, this is an RFC for now.
> 
> The following new patches are queued for QEMU stable v7.2.1:
> 
>    https://gitlab.com/mjt0k/qemu/-/commits/stable-7.2-staging/
> 
> Please respond here or CC qemu-stable@nongnu.org on any additional patches
> you think should (or shouldn't) be included in the release.
> 
> About some of the patches.
> 
> I picked up a few more than minimally necessary so that some of the CI
> tests are fixed. These are the curl forward compat change, two changes
> for tests/, and also "build-sys: fix crlf-ending C code" (fixes build
> failure on msys-win32). The same failures exists on 7.2.0 now, while
> the proposed 7.2.1 passes all tests I've tried so far (will try avocado
> tests too once additional hdd will arrive).
> 
> Two patches ("vdpa: stop all svq on device deletion" and "Revert "hw/i386:
> pass RNG seed via setup_data entry"") required conflict resolution when
> cherry-picking.
> 
> 2 virtio-rng-pci migration fixes makes certain v7.2.0 VMs non-migratable
> to v7.2.1.
> 
> -----------------------------------------------------------------------
> 
> Akihiko Odaki (4):
>    vhost-user-gpio: Configure vhost_dev when connecting
>    vhost-user-i2c: Back up vqs before cleaning up vhost_dev
>    vhost-user-rng: Back up vqs before cleaning up vhost_dev
>    hw/timer/hpet: Fix expiration time overflow
> 
> Alex Bennée (2):
>    target/arm: fix handling of HLT semihosting in system mode
>    tests/tcg: fix unused variable in linux-test
> 
> Anton Johansson (1):
>    block: Handle curl 7.55.0, 7.85.0 version changes
> 
> Carlos López (2):
>    vhost: avoid a potential use of an uninitialized variable in
>      vhost_svq_poll()
>    libvhost-user: check for NULL when allocating a virtqueue element
> 
> Chenyi Qiang (2):
>    virtio-mem: Fix the bitmap index of the section offset
>    virtio-mem: Fix the iterator variable in a vmem->rdl_list loop
> 
> David Hildenbrand (2):
>    migration/ram: Fix error handling in ram_write_tracking_start()
>    migration/ram: Fix populate_read_range()
> 
> Dr. David Alan Gilbert (2):
>    virtio-rng-pci: fix migration compat for vectors
>    virtio-rng-pci: fix transitional migration compat for vectors
> 
> Eugenio Pérez (1):
>    vdpa: stop all svq on device deletion
> 
> Evgeny Iakovlev (1):
>    target/arm: allow writes to SCR_EL3.HXEn bit when FEAT_HCX is enabled
> 
> Guenter Roeck (1):
>    target/sh4: Mask restore of env->flags from tb->flags
> 
> Jason Wang (3):
>    vhost: fix vq dirty bitmap syncing when vIOMMU is enabled
>    intel-iommu: fail MAP notifier without caching mode
>    intel-iommu: fail DEVIOTLB_UNMAP without dt mode
> 
> Julia Suvorova (1):
>    hw/smbios: fix field corruption in type 4 table
> 
> Kevin Wolf (1):
>    qcow2: Fix theoretical corruption in store_bitmap() error path
> 
> Klaus Jensen (2):
>    hw/nvme: fix missing endian conversions for doorbell buffers
>    hw/nvme: fix missing cq eventidx update
> 
> Laszlo Ersek (1):
>    acpi: cpuhp: fix guest-visible maximum access size to the legacy reg
>      block
> 
> Marc-André Lureau (1):
>    build-sys: fix crlf-ending C code
> 
> Michael S. Tsirkin (6):
>    Revert "x86: do not re-randomize RNG seed on snapshot load"
>    Revert "x86: re-initialize RNG seed when selecting kernel"
>    Revert "x86: reinitialize RNG seed on system reboot"
>    Revert "x86: use typedef for SetupData struct"
>    Revert "x86: return modified setup_data only if read as memory, not as
>      file"
>    Revert "hw/i386: pass RNG seed via setup_data entry"
> 
> Paolo Bonzini (4):
>    meson: accept relative symlinks in "meson introspect --installed" data
>    configure: fix GLIB_VERSION for cross-compilation
>    target/i386: fix ADOX followed by ADCX
>    block/iscsi: fix double-free on BUSY or similar statuses
> 
> Richard Henderson (8):
>    target/riscv: Set pc_succ_insn for !rvc illegal insn
>    target/arm: Fix sve_probe_page
>    target/arm: Fix in_debug path in S1_ptw_translate
>    target/arm: Fix physical address resolution for Stage2
>    tests/tcg/i386: Introduce and use reg_t consistently
>    target/i386: Fix BEXTR instruction
>    target/i386: Fix C flag for BLSI, BLSMSK, BLSR
>    target/i386: Fix BZHI instruction
> 
> Stefan Hajnoczi (1):
>    block: fix detect-zeroes= with BDRV_REQ_REGISTERED_BUF
> 
> Yajun Wu (1):
>    chardev/char-socket: set s->listener = NULL in char_socket_finalize

Maybe pick also these patches that mention "CVE" in the description:

  qga/win32: Remove change action from MSI installer
  qga/win32: Use rundll for VSS installation
  hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value
  hw/pvrdma: Protect against buggy or malicious guest driver

 From my s390x perspective, I'd like to suggest the following
patches (if they can be applied cleanly):

  target/s390x/arch_dump: Fix memory corruption in s390x_write_elf64_notes()
  target/s390x: Fix emulation of C(G)HRL
  target/s390x: Fix R[NOX]SBG with T=1
  target/s390x: Fix EXECUTE of relative long instructions

  Thanks,
   Thomas


