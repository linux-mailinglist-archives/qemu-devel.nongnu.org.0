Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5974DD722
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 10:33:37 +0100 (CET)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV8zH-00024o-VB
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 05:33:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nV8wN-0001Gd-Ou
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 05:30:35 -0400
Received: from [2607:f8b0:4864:20::530] (port=41935
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nV8wI-0003sz-1c
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 05:30:31 -0400
Received: by mail-pg1-x530.google.com with SMTP id o26so4676522pgb.8
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 02:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=e5y54u5pZwrdL6sv6KkQ+RUDBZk8q4Tgzh1oIOsWKi4=;
 b=M76fbSPswMwUkvke4CAQ5mAoIztPycsQVSeiNhgRtRaOKBS+waeU1VEtVPW2PYzKCX
 TLNeWOzvWt/PvA8g42xbLS43fysvVScX/5SYOC3gBfwIVo04Q2/tMlA3An8fDe3mlwTB
 KAVVqrxeC/GfJXf+7488NlnSFhYo3mHs0FC0wAuY7PPjjl6j0jDMXtx3mlw9UChDmQMc
 fG+1vKhMBcxK6zDQ/lkrCpGMRU+xacIWP8BfSppW6pIGForVs2YX86aFBYa/upJq72hP
 M9608/5Dwx2QfFHfryMxq0tbEHiKguY7UvKyGvJ1ujUKTQMHSsmxAA3RMSyojKoIg7Qr
 gmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e5y54u5pZwrdL6sv6KkQ+RUDBZk8q4Tgzh1oIOsWKi4=;
 b=Wj2IzGlRRBZiW2+uKg6xCBFJhs4nxMmJfFwLXq33xclP1nFoIdBelIaE60gTaWXxdY
 maX+GwUpqIRV0NRVmjcY/pGO1hBmmgC6oUo93VUK/4sWuAlOSWL8t0EPr6SjMoHpzKrz
 G52EU60hCOSQ5X138BbQVK88FmTOuGU00rtwewNotM6Uwt4+4hDEjiJbB7mZIXearR5A
 xBpi7xVbA8C5mfkga/boRPdojQIslV0yWhQoT8fPzQCUDT6r48GqlqRyXDUB2mghpAM2
 Hd8nogTjnVZYeTsu/HiIREPczKM+L05kkXLFwts3tUX/8ysCuWDWQPxFsiHXM7NE/wd7
 VQZA==
X-Gm-Message-State: AOAM531XijfIpJyv5+xjHzSnz79mSJxGYgBuw0H4DWOEp+KrGgjQyXzu
 joehMjEaaY9yQNFMxZeAzOw=
X-Google-Smtp-Source: ABdhPJyPFW+DRB2h5pvBA2Ep8B4wD2QaZv0ajihVg54GnQ/ew1IgwRwULa9YkSCVdClEim9GPmaN4Q==
X-Received: by 2002:a05:6a00:2450:b0:4f7:bf07:c063 with SMTP id
 d16-20020a056a00245000b004f7bf07c063mr9251672pfj.51.1647595828460; 
 Fri, 18 Mar 2022 02:30:28 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 z22-20020aa78896000000b004f7b0e1b16asm9526438pfe.38.2022.03.18.02.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 02:30:27 -0700 (PDT)
Message-ID: <691be87c-6bac-cdb7-28f9-009735a94c28@gmail.com>
Date: Fri, 18 Mar 2022 18:30:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v22 0/7] Add vmnet.framework based network backend
Content-Language: en-US
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>,
 qemu-devel@nongnu.org
References: <20220317172839.28984-1-Vladislav.Yaroshchuk@jetbrains.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220317172839.28984-1-Vladislav.Yaroshchuk@jetbrains.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, dirty@apple.com, f4bug@amsat.org,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com, roman@roolebo.dev,
 hsp.cat7@gmail.com, hello@adns.io, qemu_oss@crudebyte.com, eblake@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Thank you for this great work!

On 2022/03/18 2:28, Vladislav Yaroshchuk wrote:
> macOS provides networking API for VMs called 'vmnet.framework':
> https://developer.apple.com/documentation/vmnet
> 
> We can provide its support as the new QEMU network backends which
> represent three different vmnet.framework interface usage modes:
> 
>    * `vmnet-shared`:
>      allows the guest to communicate with other guests in shared mode and
>      also with external network (Internet) via NAT. Has (macOS-provided)
>      DHCP server; subnet mask and IP range can be configured;
> 
>    * `vmnet-host`:
>      allows the guest to communicate with other guests in host mode.
>      By default has enabled DHCP as `vmnet-shared`, but providing
>      network unique id (uuid) can make `vmnet-host` interfaces isolated
>      from each other and also disables DHCP.
> 
>    * `vmnet-bridged`:
>      bridges the guest with a physical network interface.
> 
> This backends cannot work on macOS Catalina 10.15 cause we use
> vmnet.framework API provided only with macOS 11 and newer. Seems
> that it is not a problem, because QEMU guarantees to work on two most
> recent versions of macOS which now are Big Sur (11) and Monterey (12).
> 
> Also, we have one inconvenient restriction: vmnet.framework interfaces
> can create only privileged user:
> `$ sudo qemu-system-x86_64 -nic vmnet-shared`
> 
> Attempt of `vmnet-*` netdev creation being unprivileged user fails with
> vmnet's 'general failure'.
> 
> This happens because vmnet.framework requires `com.apple.vm.networking`
> entitlement which is: "restricted to developers of virtualization software.
> To request this entitlement, contact your Apple representative." as Apple
> documentation says:
> https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_vm_networking
> 
> One more note: we still have quite useful but not supported
> 'vmnet.framework' features as creating port forwarding rules, IPv6
> NAT prefix specifying and so on.
> 
> Nevertheless, new backends work fine and tested within `qemu-system-x86-64`
> on macOS Bir Sur 11.5.2 host with such nic models:
>    * e1000-82545em
>    * virtio-net-pci
>    * vmxnet3
> 
> The guests were:
>    * macOS 10.15.7
>    * Ubuntu Bionic (server cloudimg)
> 
> 
> This series partially reuses patches by Phillip Tennen:
> https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> So I included them signed-off line into one of the commit messages and
> also here.
> 
> v1 -> v2:
>   Since v1 minor typos were fixed, patches rebased onto latest master,
>   redundant changes removed (small commits squashed)
> v2 -> v3:
>   - QAPI style fixes
>   - Typos fixes in comments
>   - `#include`'s updated to be in sync with recent master
> v3 -> v4:
>   - Support vmnet interfaces isolation feature
>   - Support vmnet-host network uuid setting feature
>   - Refactored sources a bit
> v4 -> v5:
>   - Missed 6.2 boat, now 7.0 candidate
>   - Fix qapi netdev descriptions and styles
>     (@subnetmask -> @subnet-mask)
>   - Support vmnet-shared IPv6 prefix setting feature
> v5 -> v6
>   - provide detailed commit messages for commits of
>     many changes
>   - rename properties @dhcpstart and @dhcpend to
>     @start-address and @end-address
>   - improve qapi documentation about isolation
>     features (@isolated, @net-uuid)
> v6 -> v7:
>   - update MAINTAINERS list
> v7 -> v8
>   - QAPI code style fixes
> v8 -> v9
>   - Fix building on Linux: add missing qapi
>     `'if': 'CONFIG_VMNET'` statement to Netdev union
> v9 -> v10
>   - Disable vmnet feature for macOS < 11.0: add
>     vmnet.framework API probe into meson.build.
>     This fixes QEMU building on macOS < 11.0:
>     https://patchew.org/QEMU/20220110034000.20221-1-jasowang@redhat.com/
> v10 -> v11
>   - Enable vmnet for macOS 10.15 with subset of available
>     features. Disable vmnet for macOS < 10.15.
>   - Fix typos
> v11 -> v12
>   - use more general macOS version check with
>     MAC_OS_VERSION_11_0 instead of manual
>     definition creating.
> v12 -> v13
>   - fix incorrect macOS version bound while
>     'feature available since 11.0' check.
>     Use MAC_OS_X_VERSION_MIN_REQUIRED instead of
>     MAC_OS_X_VERSION_MAX_ALLOWED.
> v13 -> v14
>   - fix memory leaks
>   - get rid of direct global mutex taking while resending
>     packets from vmnet to QEMU, schedule a bottom half
>     instead (it can be a thing to discuss, maybe exists a
>     better way to perform the packets transfer)
>   - update hmp commands
>   - a bit refactor everything
>   - change the email from which patches are being
>     submitted, same to email in MAINTAINERS list
>   - P.S. sorry for so late reply
> v14 -> v15
>   - restore --enable-vdi and --disable-vdi
>     mistakenly dropped in previous series
> v15 -> v16
>   - common: complete sending pending packets when
>     QEMU is ready, refactor, fix memory leaks
>   - QAPI: change version to 7.1 (cause 7.0 feature freeze
>     happened). This is the only change in QAPI, Markus Armbruster,
>     please confirm if you can (decided to drop your Acked-by due
>     to this change)
>   - vmnet-bridged: extend "supported ifnames" message buffer len
>   - fix behaviour dependence on debug (add "return -1" after
>     assert_not_reached)
>   - use PRIu64 for proper printing
>   - NOTE: This version of patch series may be one the last
>     I submit - JetBrains has suspended operations in
>     Russia indefinitely due to all the awful things happened
>     the last weeks. I may leave this company and loose the
>     ability to work on vmnet support :(
>     It will be perfect if someone can handle my unfinished work,
>     if something required to fix/improve is found.
>     Because of this, MAINTAINERS list update is dropped
> v16 -> v17
>   - host: move network_uuid to local variable
>   - common: refactor, add documentation
>   - common/send (vmnet->qemu): read new packets after QEMU
>     send_cb invoked
>   - common/receive (qemu->vmnet): drop redundant vmnet
>     status checks
>   - restore dropped commit messaged from the previous series
> v17 -> v18
>   - use VmnetState struct for all three operation modes
>   - drop send_enabled flag
>   - do not unregister vmnet event callback on cleanup,
>     let vmnet.framework do everything itself while interface
>     destruction
> v18 -> v19
>   - use positive pointers values to describe unsent packets
>     window of VmnetState buffer
> v19 -> v20
>   - vmnet-host: minor but required refactor
> v20 -> v21
>   - vmnet-bridged: dynamically allocate valid ifnames list
>   - QAPI schema: add `Markus Armbruster <armbru@redhat.com>`'s acked-by
> v21 -> v22
>   - common: fix if_desc memory leak
> 
> Vladislav Yaroshchuk (7):
>    net/vmnet: add vmnet dependency and customizable option
>    net/vmnet: add vmnet backends to qapi/net
>    net/vmnet: implement shared mode (vmnet-shared)
>    net/vmnet: implement host mode (vmnet-host)
>    net/vmnet: implement bridged mode (vmnet-bridged)
>    net/vmnet: update qemu-options.hx
>    net/vmnet: update hmp-commands.hx
> 
>   hmp-commands.hx               |   6 +-
>   meson.build                   |  16 +-
>   meson_options.txt             |   2 +
>   net/clients.h                 |  11 +
>   net/meson.build               |   7 +
>   net/net.c                     |  10 +
>   net/vmnet-bridged.m           | 152 ++++++++++++++
>   net/vmnet-common.m            | 378 ++++++++++++++++++++++++++++++++++
>   net/vmnet-host.c              | 128 ++++++++++++
>   net/vmnet-shared.c            | 114 ++++++++++
>   net/vmnet_int.h               |  63 ++++++
>   qapi/net.json                 | 133 +++++++++++-
>   qemu-options.hx               |  25 +++
>   scripts/meson-buildoptions.sh |   1 +
>   14 files changed, 1042 insertions(+), 4 deletions(-)
>   create mode 100644 net/vmnet-bridged.m
>   create mode 100644 net/vmnet-common.m
>   create mode 100644 net/vmnet-host.c
>   create mode 100644 net/vmnet-shared.c
>   create mode 100644 net/vmnet_int.h
> 


