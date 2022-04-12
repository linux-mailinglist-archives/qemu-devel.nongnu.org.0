Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B524FE237
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 15:21:24 +0200 (CEST)
Received: from localhost ([::1]:57524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neGSR-00015d-Ge
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 09:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1neGOl-0007eu-IE
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 09:17:35 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:39864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1neGOj-00061O-6C
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 09:17:35 -0400
Received: by mail-lf1-x133.google.com with SMTP id y32so32156975lfa.6
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 06:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7Jl1tieL0MJ5zIjgMU/hzMXvaLH19binu67cZbZ5rjM=;
 b=p3m8EK97eww+zS+2ng1IIufvY5PHrWGADTmj9x7enmwNuhcm0OSaYlx79sMXqFXUvI
 jStBnAB76oBeL8MpPuYNzAp5mdq+zx6284/E6Gjw4B8FrYkQ+wdix/dtkX5VAoT+xHpx
 meJxHzujsCDrmBIVtHCovKa13NxKiO8fE01E7rcUvETFDb32Id96SF+4z2C6XRjfFyej
 YP9ghB3r271HJI87LyohLvsRWfXvr41KQFKrgpUlqKpz9lXdCW88CDiP7o2w1yMksUbz
 c/TvR+l9/hEzE+aPiquY8CgkbfKdgvOs7UDizCAxlEn6daw8zuros6XycApQh6VMxbTW
 HFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Jl1tieL0MJ5zIjgMU/hzMXvaLH19binu67cZbZ5rjM=;
 b=gHNqUVrYR0P5WSPFyYcdXYBBpTUCBhhELOtwPcRex+uK6hz+sLoMme7wcPtmuMtlpR
 a7rn2aM3Enfc6lepVjuXy11bO87xvv+nEwEBUeJcKIvHRORiTKy2TSEJRsSQwUF9Gkje
 iClvVgqu1BWK2na1EnZsjLBw3o5Zve9Ri70ETYvcisgJ6+dsrCBPtBfFnslz9prjT8wU
 QChNd1+hcDd+v7TJaihRwA6ySaOl4VI89NeyLrlN/+fBDZjaWXvgs7kG4p9v8QBxN2DS
 ZldB6IphuVjOemefpqalPF+468Xoux/+6kZIUNmNv9AefrhchdT3WEk1QoUg8UmPJLAX
 5z6g==
X-Gm-Message-State: AOAM532CrCATdytByNMTTWYlh9KUd2PRKOSz62bFNjtoYc08vogfqL0i
 5k7iJrokIMWNI9GiVFZPXhGRvw==
X-Google-Smtp-Source: ABdhPJz+fXzNyWdGFcs8zy/cjzVowOX1f4uoz+JMKJlEWRtMGMGnCC+2tsrpKVyscabzlM5MNvEbJw==
X-Received: by 2002:a05:6512:3054:b0:44b:4bb:3441 with SMTP id
 b20-20020a056512305400b0044b04bb3441mr25411468lfb.57.1649769448833; 
 Tue, 12 Apr 2022 06:17:28 -0700 (PDT)
Received: from [192.168.100.5] ([185.215.60.161])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a056512311300b0046b92bec151sm1071667lfb.112.2022.04.12.06.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 06:17:28 -0700 (PDT)
Message-ID: <0622d8a9-7c46-26bf-0b56-99cc66f6ac0b@openvz.org>
Date: Tue, 12 Apr 2022 16:17:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 for 7.1 1/1] block: add 'force' parameter to
 'blockdev-change-medium' command
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20220412095048.231030-1-den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
In-Reply-To: <20220412095048.231030-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.04.2022 12:50, Denis V. Lunev wrote:
> 'blockdev-change-medium' is a convinient wrapper for the following
> sequence of commands:
>   * blockdev-open-tray
>   * blockdev-remove-medium
>   * blockdev-insert-medium
>   * blockdev-close-tray
> and should be used f.e. to change ISO image inside the CD-ROM tray.
> Though the guest could lock the tray and some linux guests like
> CentOS 8.5 actually does that. In this case the execution if this
> command results in the error like the following:
>    Device 'scsi0-0-1-0' is locked and force was not specified,
>    wait for tray to open and try again.
>
> This situation is could be resolved 'blockdev-open-tray' by passing
> flag 'force' inside. Thus is seems reasonable to add the same
> capability for 'blockdev-change-medium' too.
>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> CC: Eric Blake <eblake@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block/qapi-sysemu.c |  3 ++-
>   hmp-commands.hx     | 11 +++++++----
>   monitor/hmp-cmds.c  |  4 +++-
>   qapi/block.json     |  6 ++++++
>   ui/cocoa.m          |  1 +
>   5 files changed, 19 insertions(+), 6 deletions(-)
>
> Changes from v1:
> - added kludge to Objective C code
> - simplified a bit call of do_open_tray() (thanks, Vova!)
> - added record to hmp-command.hx
>
> diff --git a/block/qapi-sysemu.c b/block/qapi-sysemu.c
> index 8498402ad4..680c7ee342 100644
> --- a/block/qapi-sysemu.c
> +++ b/block/qapi-sysemu.c
> @@ -318,6 +318,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
>                                   bool has_id, const char *id,
>                                   const char *filename,
>                                   bool has_format, const char *format,
> +                                bool has_force, bool force,
>                                   bool has_read_only,
>                                   BlockdevChangeReadOnlyMode read_only,
>                                   Error **errp)
> @@ -380,7 +381,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
>   
>       rc = do_open_tray(has_device ? device : NULL,
>                         has_id ? id : NULL,
> -                      false, &err);
> +                      force, &err);
>       if (rc && rc != -ENOSYS) {
>           error_propagate(errp, err);
>           goto fail;
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8476277aa9..6ec593ea08 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -202,9 +202,9 @@ ERST
>   
>       {
>           .name       = "change",
> -        .args_type  = "device:B,target:F,arg:s?,read-only-mode:s?",
> -        .params     = "device filename [format [read-only-mode]]",
> -        .help       = "change a removable medium, optional format",
> +        .args_type  = "device:B,force:-f,target:F,arg:s?,read-only-mode:s?",
> +        .params     = "device [-f] filename [format [read-only-mode]]",
> +        .help       = "change a removable medium, optional format, use -f to force the operation",
>           .cmd        = hmp_change,
>       },
>   
> @@ -212,11 +212,14 @@ SRST
>   ``change`` *device* *setting*
>     Change the configuration of a device.
>   
> -  ``change`` *diskdevice* *filename* [*format* [*read-only-mode*]]
> +  ``change`` *diskdevice* [-f] *filename* [*format* [*read-only-mode*]]
>       Change the medium for a removable disk device to point to *filename*. eg::
>   
>         (qemu) change ide1-cd0 /path/to/some.iso
>   
> +    ``-f``
> +      forces the operation even if the guest has locked the tray.
> +
>       *format* is optional.
>   
>       *read-only-mode* may be used to change the read-only status of the device.
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 634968498b..d8b98bed6c 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1472,6 +1472,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>       const char *target = qdict_get_str(qdict, "target");
>       const char *arg = qdict_get_try_str(qdict, "arg");
>       const char *read_only = qdict_get_try_str(qdict, "read-only-mode");
> +    bool force = qdict_get_try_bool(qdict, "force", false);
>       BlockdevChangeReadOnlyMode read_only_mode = 0;
>       Error *err = NULL;
>   
> @@ -1508,7 +1509,8 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>           }
>   
>           qmp_blockdev_change_medium(true, device, false, NULL, target,
> -                                   !!arg, arg, !!read_only, read_only_mode,
> +                                   !!arg, arg, true, force,
> +                                   !!read_only, read_only_mode,
>                                      &err);
>       }
>   
> diff --git a/qapi/block.json b/qapi/block.json
> index 82fcf2c914..3f100d4887 100644
> --- a/qapi/block.json
> +++ b/qapi/block.json
> @@ -326,6 +326,11 @@
>   # @read-only-mode: change the read-only mode of the device; defaults
>   #                  to 'retain'
>   #
> +# @force: if false (the default), an eject request through blockdev-open-tray
> +#         will be sent to the guest if it has locked the tray (and the tray
> +#         will not be opened immediately); if true, the tray will be opened
> +#         regardless of whether it is locked. (since 7.1)
> +#
>   # Features:
>   # @deprecated: Member @device is deprecated.  Use @id instead.
>   #
> @@ -367,6 +372,7 @@
>               '*id': 'str',
>               'filename': 'str',
>               '*format': 'str',
> +            '*force': 'bool',
>               '*read-only-mode': 'BlockdevChangeReadOnlyMode' } }
>   
>   
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index c4e5468f9e..a931174397 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1529,6 +1529,7 @@ - (void)changeDeviceMedia:(id)sender
>                                          false, NULL,
>                                          [file cStringUsingEncoding:
>                                                    NSASCIIStringEncoding],
> +                                       true, false,
>                                          true, "raw",

The addition should go here, after format options. With that fixed:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

>                                          false, 0,
>                                          &err);


