Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0736A2E0871
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:00:06 +0100 (CET)
Received: from localhost ([::1]:52682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kreSb-0007IW-4E
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:00:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kreRp-0006sj-11
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 04:59:17 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kreRn-0007f7-BG
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 04:59:16 -0500
Received: by mail-ej1-x635.google.com with SMTP id x16so17437720ejj.7
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 01:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VsUxI1QlApAo/TnutrYYYrA8Iu4FJbp2BbIY2wF95Qo=;
 b=nIeDoHq+XIDbeLpmRg6cyY7iuY4aJN3zDos+XJlx+oNC6w+odvHtCf7ksB8D+9EJXt
 HzbZqjNs6r6/BMO4SaisrSuwMruN9sh08WFDsHEXbGHsO4gVZcHM24wD5zhj5ymsp0iB
 l0bwkXoijZUJJnPw7+L6rPcK+vmZnk0XhtK9JqrBa1AljXPb2dglerzliEETOI+dsh4x
 3QMP/C+tWpE+Bf1O7XTB0+qSzS2Whmlsi+qQom28kxnCWa6cM6YQ3LKitYM6Kz2nmDPN
 d3mokShZZXuz0v7nVwX2pKzJhTqmeBaV9MrNaAeE6nW47KZHKebQRysKQ7J9/df3MMJ+
 q7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VsUxI1QlApAo/TnutrYYYrA8Iu4FJbp2BbIY2wF95Qo=;
 b=j2K61SONIppS3Glazji4AqNshoW+ImQbWAh7kQmQr8cLatTp5uES0Yj26asMcXJbvH
 UY+M1UL3qEiK4eTBzDNsr3d7JhE7POIloLEOjtBVkb/icGZScWrliu1faoBcn9oslimR
 CgCqXgN+janEdwTM5dr4fjEVuEH6psCkqprki065j149GAFKydXgd3JvpttjTbXCGWB3
 tJmqaySrx34ENJudkPPBL+XQywprlxKI1oMU9p667tdS6ALeUfbPsHuYoQ1A0hdqjL//
 twkEp6AErK7ej482f4XcR/X/4aSHp4EIf68wWtIGrg+6JcAdIMiOsFsesiEjIGEo46fI
 02eA==
X-Gm-Message-State: AOAM532H0SuvdLSdYyb3NX+6syW3nyLX0y29wI4ZlnDvq/OmU0rq65C/
 LsqjsAzvwgO2xkH1X+2MXR/5ncpMOxk=
X-Google-Smtp-Source: ABdhPJyd29xEu5+VT2KFMnx8RfVvpNEjgP/Te3rS9Qf6fpYStYd8Ugp97/Zq4gJzIZP0BYSVYd9EWw==
X-Received: by 2002:a17:906:39d5:: with SMTP id
 i21mr18470823eje.339.1608631153713; 
 Tue, 22 Dec 2020 01:59:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id s5sm10178957eju.98.2020.12.22.01.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 01:59:13 -0800 (PST)
Subject: Re: [PATCH 00/20] Immutable QString, and also one JSON writer less
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201211171152.146877-1-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <75457428-0e2d-58d2-57b2-ec0677f02bef@redhat.com>
Date: Tue, 22 Dec 2020 10:59:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211171152.146877-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.233,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 18:11, Markus Armbruster wrote:
> Based-on: <20201210161452.2813491-1-armbru@redhat.com>
> 
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
> Cc: qemu-block@nongnu.org

Looks good, my only comment was on conflicts with other pending series.

Paolo

> Markus Armbruster (20):
>    hmp: Simplify how qmp_human_monitor_command() gets output
>    monitor: Use GString instead of QString for output buffer
>    qobject: Make qobject_to_json_pretty() take a pretty argument
>    qobject: Use GString instead of QString to accumulate JSON
>    qobject: Change qobject_to_json()'s value to GString
>    Revert "qstring: add qstring_free()"
>    hw/rdma: Replace QList by GQueue
>    qobject: Move internals to qobject-internal.h
>    qmp: Fix tracing of non-string command IDs
>    block: Avoid qobject_get_try_str()
>    Revert "qobject: let object_property_get_str() use new API"
>    qobject: Drop qobject_get_try_str()
>    qobject: Drop qstring_get_try_str()
>    qobject: Factor quoted_str() out of to_json()
>    qobject: Factor JSON writer out of qobject_to_json()
>    migration: Replace migration's JSON writer by the general one
>    json: Use GString instead of QString to accumulate strings
>    keyval: Use GString to accumulate value strings
>    block: Use GString instead of QString to build filenames
>    qobject: Make QString immutable
> 
>   hw/rdma/rdma_backend_defs.h        |   2 +-
>   hw/rdma/rdma_utils.h               |  15 +-
>   include/migration/vmstate.h        |   7 +-
>   include/qapi/qmp/json-writer.h     |  35 ++++
>   include/qapi/qmp/qbool.h           |   2 -
>   include/qapi/qmp/qdict.h           |   2 -
>   include/qapi/qmp/qjson.h           |   4 +-
>   include/qapi/qmp/qlist.h           |   2 -
>   include/qapi/qmp/qnull.h           |   2 -
>   include/qapi/qmp/qnum.h            |   3 -
>   include/qapi/qmp/qobject.h         |   9 +-
>   include/qapi/qmp/qstring.h         |  14 +-
>   include/qemu/typedefs.h            |   4 +-
>   migration/qjson.h                  |  29 ----
>   monitor/monitor-internal.h         |   2 +-
>   qobject/qobject-internal.h         |  39 +++++
>   block.c                            |  23 +--
>   block/rbd.c                        |   2 +-
>   hw/display/virtio-gpu.c            |   2 +-
>   hw/intc/s390_flic_kvm.c            |   2 +-
>   hw/nvram/eeprom93xx.c              |   2 +-
>   hw/nvram/fw_cfg.c                  |   2 +-
>   hw/pci/msix.c                      |   2 +-
>   hw/pci/pci.c                       |   4 +-
>   hw/pci/shpc.c                      |   2 +-
>   hw/rdma/rdma_backend.c             |  10 +-
>   hw/rdma/rdma_utils.c               |  29 ++--
>   hw/rtc/twl92230.c                  |   2 +-
>   hw/scsi/scsi-bus.c                 |   2 +-
>   hw/usb/redirect.c                  |   7 +-
>   hw/virtio/virtio.c                 |   4 +-
>   migration/qjson.c                  | 114 -------------
>   migration/savevm.c                 |  53 ++++---
>   migration/vmstate-types.c          |  38 ++---
>   migration/vmstate.c                |  52 +++---
>   monitor/misc.c                     |   6 +-
>   monitor/monitor.c                  |  20 +--
>   monitor/qmp.c                      |  46 +++---
>   qemu-img.c                         |  33 ++--
>   qga/main.c                         |  22 +--
>   qobject/json-parser.c              |  30 ++--
>   qobject/json-writer.c              | 247 +++++++++++++++++++++++++++++
>   qobject/qbool.c                    |   1 +
>   qobject/qdict.c                    |   1 +
>   qobject/qjson.c                    | 144 ++++-------------
>   qobject/qlist.c                    |   1 +
>   qobject/qnull.c                    |   1 +
>   qobject/qnum.c                     |   6 +-
>   qobject/qobject.c                  |   1 +
>   qobject/qstring.c                  | 117 +++-----------
>   qom/object.c                       |   9 +-
>   qom/object_interfaces.c            |   4 +-
>   qom/qom-hmp-cmds.c                 |   7 +-
>   target/alpha/machine.c             |   2 +-
>   target/arm/machine.c               |   6 +-
>   target/avr/machine.c               |   4 +-
>   target/hppa/machine.c              |   4 +-
>   target/microblaze/machine.c        |   2 +-
>   target/mips/machine.c              |   4 +-
>   target/openrisc/machine.c          |   2 +-
>   target/ppc/machine.c               |  10 +-
>   target/sparc/machine.c             |   2 +-
>   tests/check-qjson.c                |  67 ++++----
>   tests/check-qobject.c              |   3 +-
>   tests/check-qstring.c              |  16 --
>   tests/qtest/libqtest.c             |  20 ++-
>   tests/test-visitor-serialization.c |   6 +-
>   util/keyval.c                      |  11 +-
>   migration/meson.build              |   1 -
>   qobject/meson.build                |   5 +-
>   70 files changed, 679 insertions(+), 705 deletions(-)
>   create mode 100644 include/qapi/qmp/json-writer.h
>   delete mode 100644 migration/qjson.h
>   create mode 100644 qobject/qobject-internal.h
>   delete mode 100644 migration/qjson.c
>   create mode 100644 qobject/json-writer.c
> 


