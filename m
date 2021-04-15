Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5344F3609A6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:42:39 +0200 (CEST)
Received: from localhost ([::1]:56280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1KQ-0007LM-Dc
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1Hw-0006Jn-Qc
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:40:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1Ht-0004hR-KZ
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618490400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GC4eVE2HUThrXgLYgdbcbUsn7gwXFfFZOmtaLVD0gAA=;
 b=hE9xu2KqV+1NF9u4GwfuwID8FZH1mRk/l6Qr+Zu073wzZJ/snJLZ9fK1jZnmI/+xvwjcEA
 vhuSG8Tk5b+ECNLKDqiZUelA74ZHPIfc18xLhF9ib+tGDDYSxoRfOTK+9+5wzPx2edjfnx
 w2nybnAd4+0wB2Vzxg2iD+aOhplt/KI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-7XqGKx1qMf69QJI0-nbfxQ-1; Thu, 15 Apr 2021 08:39:59 -0400
X-MC-Unique: 7XqGKx1qMf69QJI0-nbfxQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v20-20020a5d59140000b02901028c7a1f7dso2700652wrd.18
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 05:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GC4eVE2HUThrXgLYgdbcbUsn7gwXFfFZOmtaLVD0gAA=;
 b=Jv7TQ6Vm5m7WRjduY8yBRsFoX3X7dx0ysE9BgPbIJuZihHbVcVWtagkiCEkbDvzuhi
 EUTDW1INV8angpQhcJ0PTBqMI0Xd3x6/z3HOI4H7sPsCXPW66Bttx5ZwECFbk8d2xxMB
 rvwlSf+qrUcIywbxRv96HFLcva130r9RKvVzXpsKKzKW0gNRK/s75hvFxlrPiPisF0O6
 vr5lDEo+oUKnHPev2ZRgT/L2pwo0tHz3Kb2zGBlGxLwzIdA+7lZ+MyS6XayO6CODE74q
 uH0IqcsU79PYx4tFSuU5YAdRwk/vq8ik5heNGMwfYXYRTXhnQa4sB6czxFbM+/QhSROO
 rEjw==
X-Gm-Message-State: AOAM531lQ0xTCpblpobzIas3ooQU/xsaLGjBwy2SHGVu2VvQG15Ut0Bq
 kz73lFqLVl9ZSf5NYfW/3jGMVyrVetMg4hveNjBavyO9QhrYAZZAtUO8cjYObHe6Zppz4VtF5QB
 XYMLVaLf6lHhvKGY=
X-Received: by 2002:adf:dd51:: with SMTP id u17mr3249801wrm.32.1618490397976; 
 Thu, 15 Apr 2021 05:39:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQVdKl3yHX46lxmmi8t54N5Ahkh2UrFvGjR1KDGfDP0MKuVeuo8EQoxLsmolAkaCRcIPT8FQ==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr3249779wrm.32.1618490397827; 
 Thu, 15 Apr 2021 05:39:57 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g13sm3478424wrr.9.2021.04.15.05.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 05:39:57 -0700 (PDT)
Subject: Re: [PATCH 1/2] qdev: Separate implementations of qdev_get_machine()
 for user and system
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-2-groug@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <25ab34ad-0950-65f0-6cb2-d3f7a4a86744@redhat.com>
Date: Thu, 15 Apr 2021 14:39:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409160339.500167-2-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 6:03 PM, Greg Kurz wrote:
> Despite its simple name and common usage of "getting a pointer to
> the machine" in system-mode emulation, qdev_get_machine() has some
> subtilities.
> 
> First, it can be called when running user-mode emulation : this is
> because user-mode partly relies on qdev to instantiate its CPU
> model.
> 
> Second, but not least, it has a side-effect : if it cannot find an
> object at "/machine" in the QOM tree, it creates a dummy "container"
> object and put it there. A simple check on the type returned by
> qdev_get_machine() allows user-mode to run the common qdev code,
> skipping the parts that only make sense for system-mode.
> 
> This side-effect turns out to complicate the use of qdev_get_machine()
> for the system-mode case though. Most notably, qdev_get_machine() must
> not be called before the machine object is added to the QOM tree by
> qemu_create_machine(), otherwise the existing dummy "container" object
> would cause qemu_create_machine() to fail with something like :
> 
> Unexpected error in object_property_try_add() at ../../qom/object.c:1223:
> qemu-system-ppc64: attempt to add duplicate property 'machine' to
>  object (type 'container')
> Aborted (core dumped)
> 
> This situation doesn't exist in the current code base, mostly because
> of preventive fixing of some "latent bugs" in QEMU 4.0 (see 1a3ec8c1564
> and e2fb3fbbf9c for details).
> 
> A new kind of breakage was spotted very recently though :
> 
> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> /home/thuth/devel/qemu/include/hw/boards.h:24:
>  MACHINE: Object 0x5635bd53af10 is not an instance of type machine
> Aborted (core dumped)
> 
> This comes from the change 3df261b6676b in QEMU 5.0. It unwillingly
> added a new condition for qdev_get_machine() to be called too early,
> breaking MACHINE(qdev_get_machine()) in generic cpu-core code this
> time.
> 
> In order to avoid further subtle breakages like this, change the
> implentation of qdev_get_machine() to:
> - keep the existing behaviour of creating the dummy "container"
>   object for the user-mode case only ;
> - abort() if the machine doesn't exist yet in the QOM tree for
>   the system-mode case. This gives a precise hint to developpers
>   that calling qdev_get_machine() too early is a programming bug.
> 
> This is achieved with a new do_qdev_get_machine() function called
> from qdev_get_machine(), with different implementations for system
> and user mode.
> 
> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> qemu-system-ppc64: ../../hw/core/machine.c:1290:
>  qdev_get_machine: Assertion `machine != NULL' failed.
> Aborted (core dumped)
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/core/machine.c        | 14 ++++++++++++++
>  hw/core/qdev.c           |  2 +-
>  include/hw/qdev-core.h   |  1 +
>  stubs/meson.build        |  1 +
>  stubs/qdev-get-machine.c | 11 +++++++++++
>  5 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 stubs/qdev-get-machine.c
...

> diff --git a/stubs/meson.build b/stubs/meson.build
> index be6f6d609e58..b99ee2b33e94 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -54,3 +54,4 @@ if have_system
>  else
>    stub_ss.add(files('qdev.c'))
>  endif
> +stub_ss.add(files('qdev-get-machine.c'))

Adding this as a stub looks suspicious...
Why not add it in to user_ss in hw/core/meson.build?
Maybe name the new file hw/core/qdev-user.c?

-- >8 --
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -24,6 +24,8 @@
 common_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
 common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))

+user_ss.add(files('qdev-user.c'))
+
 softmmu_ss.add(files(
   'fw-path-provider.c',
   'loader.c',
---

Thanks,

Phil.


