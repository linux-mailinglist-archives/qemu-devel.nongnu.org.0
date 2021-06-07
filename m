Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5899939DE7D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:17:27 +0200 (CEST)
Received: from localhost ([::1]:45608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqG4E-0006Ig-Bt
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqG2s-0004uh-7U; Mon, 07 Jun 2021 10:16:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqG2m-0006Fn-5a; Mon, 07 Jun 2021 10:16:02 -0400
Received: by mail-wr1-x429.google.com with SMTP id m18so17824528wrv.2;
 Mon, 07 Jun 2021 07:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YtQJfGb+IT7PLwFV+zwXPptFdHS4Zb8JLUEsvjgh0rY=;
 b=V5Cttaks95lMos0XX8vbXK99L20xLwqyb40NlKDzfsGYG5CfazbX8SNXtRVHvQ/FNQ
 pQmAbsCersX4M2dKtgL2o1G5K4KJ1gfAD7y3xdKKrxmoPj9m7KgthRoY4G1hYHGCT+uU
 FsvEkUNasTAyW9hW0ghYUkdJgo3s+RnIO49MgBwbzyOZ2oQX5bi+xSUcntW1t3C7fHfb
 4HUUCblfjbDxnP/Lyd5hdfvH8Q4YpbphMYuUQ9BC1z89hFHtP5lsUDvbJIpa6f4sLOBA
 Xk/p127Oi2TAPwiv+Bdr29meTJAtbfCaAJ7zYpz+CcMuJyxDlN+CW6b2ED8BlsC+ic+9
 gnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YtQJfGb+IT7PLwFV+zwXPptFdHS4Zb8JLUEsvjgh0rY=;
 b=gsz1Aiuv2yDwFDQWA3LIgfWeiZADJt1+WGlTU3Ir1BxxxjsiaDHbKrRy5QxL442UZX
 cWbDqGaj76HDtetka8iZAPOmHXY24LE5MDtffQtMob1zMoVql/8EvqV6Ii82JARR3i4s
 SwRp3jHsq6TGRV+1doa3R3O+av5tf2YCeZHwRNeD9+1jY2YhdHXoEYuc6VIjDnTY+4vb
 Pxndf8ggWo/sQCIIF6Q3TiKyIwijsoEr2Bf5BpOHtYDBFb37GKFyVnaz+v+tdtl8jgkg
 +aTC0/m64uDhKpCdZbawTleyvRDhkgCP6VHah0+dsMmPfD7TLGiuzZOWu5Z/QwVgHZMI
 Ie6A==
X-Gm-Message-State: AOAM533Uti94ovqSXweu+uwPa3E/fOaw1a/AQWc5q+h34r5ndx74enoV
 Hz+Gy8vP9dU6sm3Q5ONUrms=
X-Google-Smtp-Source: ABdhPJxnuleyCMMdjwu3dTdKc/1ip/k9eHTjAmhya9Zek9+eWAtZOz2nn6obs+XRxN6A/1iJTg0g1g==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr17032300wrv.371.1623075353026; 
 Mon, 07 Jun 2021 07:15:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id u7sm12378129wrt.18.2021.06.07.07.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 07:15:52 -0700 (PDT)
Subject: Re: [PATCH] block: add more commands to preconfig mode
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
References: <20210511153949.506200-1-pbonzini@redhat.com>
Message-ID: <4bec1b40-72f7-3270-40e0-2dfcfe9836fc@redhat.com>
Date: Mon, 7 Jun 2021 16:15:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511153949.506200-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/21 17:39, Paolo Bonzini wrote:
> Most block device commands do not require a fully constructed machine.
> Allow running them before machine initialization has concluded.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hmp-commands.hx        |  14 +++++
>   qapi/block-core.json   | 117 +++++++++++++++++++++++++++--------------
>   qapi/block-export.json |  21 +++++---
>   qapi/block.json        |   6 ++-
>   4 files changed, 110 insertions(+), 48 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 146a13c896..901a50ebd1 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -78,6 +78,7 @@ ERST
>           .help       = "resize a block image",
>           .cmd        = hmp_block_resize,
>           .coroutine  = true,
> +        .flags      = "p",
>       },
>   
>   SRST
> @@ -94,6 +95,7 @@ ERST
>           .params     = "device [speed [base]]",
>           .help       = "copy data from a backing file into a block device",
>           .cmd        = hmp_block_stream,
> +        .flags      = "p",
>       },
>   
>   SRST
> @@ -107,6 +109,7 @@ ERST
>           .params     = "device speed",
>           .help       = "set maximum speed for a background block operation",
>           .cmd        = hmp_block_job_set_speed,
> +        .flags      = "p",
>       },
>   
>   SRST
> @@ -122,6 +125,7 @@ ERST
>                         "\n\t\t\t if you want to abort the operation immediately"
>                         "\n\t\t\t instead of keep running until data is in sync)",
>           .cmd        = hmp_block_job_cancel,
> +        .flags      = "p",
>       },
>   
>   SRST
> @@ -135,6 +139,7 @@ ERST
>           .params     = "device",
>           .help       = "stop an active background block operation",
>           .cmd        = hmp_block_job_complete,
> +        .flags      = "p",
>       },
>   
>   SRST
> @@ -149,6 +154,7 @@ ERST
>           .params     = "device",
>           .help       = "pause an active background block operation",
>           .cmd        = hmp_block_job_pause,
> +        .flags      = "p",
>       },
>   
>   SRST
> @@ -162,6 +168,7 @@ ERST
>           .params     = "device",
>           .help       = "resume a paused background block operation",
>           .cmd        = hmp_block_job_resume,
> +        .flags      = "p",
>       },
>   
>   SRST
> @@ -1396,6 +1403,7 @@ ERST
>           .params     = "nbd_server_start [-a] [-w] host:port",
>           .help       = "serve block devices on the given host and port",
>           .cmd        = hmp_nbd_server_start,
> +        .flags      = "p",
>       },
>   SRST
>   ``nbd_server_start`` *host*:*port*
> @@ -1411,6 +1419,7 @@ ERST
>           .params     = "nbd_server_add [-w] device [name]",
>           .help       = "export a block device via NBD",
>           .cmd        = hmp_nbd_server_add,
> +        .flags      = "p",
>       },
>   SRST
>   ``nbd_server_add`` *device* [ *name* ]
> @@ -1426,6 +1435,7 @@ ERST
>           .params     = "nbd_server_remove [-f] name",
>           .help       = "remove an export previously exposed via NBD",
>           .cmd        = hmp_nbd_server_remove,
> +        .flags      = "p",
>       },
>   SRST
>   ``nbd_server_remove [-f]`` *name*
> @@ -1442,6 +1452,7 @@ ERST
>           .params     = "nbd_server_stop",
>           .help       = "stop serving block devices using the NBD protocol",
>           .cmd        = hmp_nbd_server_stop,
> +        .flags      = "p",
>       },
>   SRST
>   ``nbd_server_stop``
> @@ -1471,6 +1482,7 @@ ERST
>           .params     = "getfd name",
>           .help       = "receive a file descriptor via SCM rights and assign it a name",
>           .cmd        = hmp_getfd,
> +        .flags      = "p",
>       },
>   
>   SRST
> @@ -1486,6 +1498,7 @@ ERST
>           .params     = "closefd name",
>           .help       = "close a file descriptor previously passed via SCM rights",
>           .cmd        = hmp_closefd,
> +        .flags      = "p",
>       },
>   
>   SRST
> @@ -1501,6 +1514,7 @@ ERST
>           .params     = "device bps bps_rd bps_wr iops iops_rd iops_wr",
>           .help       = "change I/O throttle limits for a block drive",
>           .cmd        = hmp_block_set_io_throttle,
> +        .flags      = "p",
>       },
>   
>   SRST
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 6d227924d0..8bbc06ac86 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -680,7 +680,8 @@
>   #    }
>   #
>   ##
> -{ 'command': 'query-block', 'returns': ['BlockInfo'] }
> +{ 'command': 'query-block', 'returns': ['BlockInfo'],
> +  'allow-preconfig': true }
>   
>   
>   ##
> @@ -1056,7 +1057,8 @@
>   ##
>   { 'command': 'query-blockstats',
>     'data': { '*query-nodes': 'bool' },
> -  'returns': ['BlockStats'] }
> +  'returns': ['BlockStats'],
> +  'allow-preconfig': true }
>   
>   ##
>   # @BlockdevOnError:
> @@ -1205,7 +1207,8 @@
>   #
>   # Since: 1.1
>   ##
> -{ 'command': 'query-block-jobs', 'returns': ['BlockJobInfo'] }
> +{ 'command': 'query-block-jobs', 'returns': ['BlockJobInfo'],
> +  'allow-preconfig': true }
>   
>   ##
>   # @block_resize:
> @@ -1236,7 +1239,8 @@
>     'data': { '*device': 'str',
>               '*node-name': 'str',
>               'size': 'int' },
> -  'coroutine': true }
> +  'coroutine': true,
> +  'allow-preconfig': true }
>   
>   ##
>   # @NewImageMode:
> @@ -1447,7 +1451,8 @@
>   #
>   ##
>   { 'command': 'blockdev-snapshot-sync',
> -  'data': 'BlockdevSnapshotSync' }
> +  'data': 'BlockdevSnapshotSync',
> +  'allow-preconfig': true }
>   
>   
>   ##
> @@ -1489,7 +1494,8 @@
>   ##
>   { 'command': 'blockdev-snapshot',
>     'data': 'BlockdevSnapshot',
> -  'features': [ 'allow-write-only-overlay' ] }
> +  'features': [ 'allow-write-only-overlay' ],
> +  'allow-preconfig': true }
>   
>   ##
>   # @change-backing-file:
> @@ -1521,7 +1527,8 @@
>   ##
>   { 'command': 'change-backing-file',
>     'data': { 'device': 'str', 'image-node-name': 'str',
> -            'backing-file': 'str' } }
> +            'backing-file': 'str' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-commit:
> @@ -1631,7 +1638,8 @@
>               '*backing-file': 'str', '*speed': 'int',
>               '*on-error': 'BlockdevOnError',
>               '*filter-node-name': 'str',
> -            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
> +            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @drive-backup:
> @@ -1657,7 +1665,8 @@
>   #
>   ##
>   { 'command': 'drive-backup', 'boxed': true,
> -  'data': 'DriveBackup' }
> +  'data': 'DriveBackup',
> +  'allow-preconfig': true }
>   
>   ##
>   # @blockdev-backup:
> @@ -1682,7 +1691,8 @@
>   #
>   ##
>   { 'command': 'blockdev-backup', 'boxed': true,
> -  'data': 'BlockdevBackup' }
> +  'data': 'BlockdevBackup',
> +  'allow-preconfig': true }
>   
>   
>   ##
> @@ -1748,7 +1758,8 @@
>   ##
>   { 'command': 'query-named-block-nodes',
>     'returns': [ 'BlockDeviceInfo' ],
> -  'data': { '*flat': 'bool' } }
> +  'data': { '*flat': 'bool' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @XDbgBlockGraphNodeType:
> @@ -1856,7 +1867,8 @@
>   #
>   # Since: 4.0
>   ##
> -{ 'command': 'x-debug-query-block-graph', 'returns': 'XDbgBlockGraph' }
> +{ 'command': 'x-debug-query-block-graph', 'returns': 'XDbgBlockGraph',
> +  'allow-preconfig': true }
>   
>   ##
>   # @drive-mirror:
> @@ -1884,7 +1896,8 @@
>   #
>   ##
>   { 'command': 'drive-mirror', 'boxed': true,
> -  'data': 'DriveMirror' }
> +  'data': 'DriveMirror',
> +  'allow-preconfig': true }
>   
>   ##
>   # @DriveMirror:
> @@ -2055,7 +2068,8 @@
>   #
>   ##
>   { 'command': 'block-dirty-bitmap-add',
> -  'data': 'BlockDirtyBitmapAdd' }
> +  'data': 'BlockDirtyBitmapAdd',
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-dirty-bitmap-remove:
> @@ -2079,7 +2093,8 @@
>   #
>   ##
>   { 'command': 'block-dirty-bitmap-remove',
> -  'data': 'BlockDirtyBitmap' }
> +  'data': 'BlockDirtyBitmap',
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-dirty-bitmap-clear:
> @@ -2102,7 +2117,8 @@
>   #
>   ##
>   { 'command': 'block-dirty-bitmap-clear',
> -  'data': 'BlockDirtyBitmap' }
> +  'data': 'BlockDirtyBitmap',
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-dirty-bitmap-enable:
> @@ -2123,7 +2139,8 @@
>   #
>   ##
>   { 'command': 'block-dirty-bitmap-enable',
> -  'data': 'BlockDirtyBitmap' }
> +  'data': 'BlockDirtyBitmap',
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-dirty-bitmap-disable:
> @@ -2144,7 +2161,8 @@
>   #
>   ##
>   { 'command': 'block-dirty-bitmap-disable',
> -  'data': 'BlockDirtyBitmap' }
> +  'data': 'BlockDirtyBitmap',
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-dirty-bitmap-merge:
> @@ -2176,7 +2194,8 @@
>   #
>   ##
>   { 'command': 'block-dirty-bitmap-merge',
> -  'data': 'BlockDirtyBitmapMerge' }
> +  'data': 'BlockDirtyBitmapMerge',
> +  'allow-preconfig': true }
>   
>   ##
>   # @BlockDirtyBitmapSha256:
> @@ -2203,7 +2222,8 @@
>   # Since: 2.10
>   ##
>   { 'command': 'x-debug-block-dirty-bitmap-sha256',
> -  'data': 'BlockDirtyBitmap', 'returns': 'BlockDirtyBitmapSha256' }
> +  'data': 'BlockDirtyBitmap', 'returns': 'BlockDirtyBitmapSha256',
> +  'allow-preconfig': true }
>   
>   ##
>   # @blockdev-mirror:
> @@ -2288,7 +2308,8 @@
>               '*on-target-error': 'BlockdevOnError',
>               '*filter-node-name': 'str',
>               '*copy-mode': 'MirrorCopyMode',
> -            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
> +            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @BlockIOThrottle:
> @@ -2560,7 +2581,8 @@
>               '*base-node': 'str', '*backing-file': 'str', '*bottom': 'str',
>               '*speed': 'int', '*on-error': 'BlockdevOnError',
>               '*filter-node-name': 'str',
> -            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
> +            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-job-set-speed:
> @@ -2584,7 +2606,8 @@
>   # Since: 1.1
>   ##
>   { 'command': 'block-job-set-speed',
> -  'data': { 'device': 'str', 'speed': 'int' } }
> +  'data': { 'device': 'str', 'speed': 'int' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-job-cancel:
> @@ -2623,7 +2646,8 @@
>   #
>   # Since: 1.1
>   ##
> -{ 'command': 'block-job-cancel', 'data': { 'device': 'str', '*force': 'bool' } }
> +{ 'command': 'block-job-cancel', 'data': { 'device': 'str', '*force': 'bool' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-job-pause:
> @@ -2647,7 +2671,8 @@
>   #
>   # Since: 1.3
>   ##
> -{ 'command': 'block-job-pause', 'data': { 'device': 'str' } }
> +{ 'command': 'block-job-pause', 'data': { 'device': 'str' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-job-resume:
> @@ -2669,7 +2694,8 @@
>   #
>   # Since: 1.3
>   ##
> -{ 'command': 'block-job-resume', 'data': { 'device': 'str' } }
> +{ 'command': 'block-job-resume', 'data': { 'device': 'str' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-job-complete:
> @@ -2697,7 +2723,8 @@
>   #
>   # Since: 1.3
>   ##
> -{ 'command': 'block-job-complete', 'data': { 'device': 'str' } }
> +{ 'command': 'block-job-complete', 'data': { 'device': 'str' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-job-dismiss:
> @@ -2717,7 +2744,8 @@
>   #
>   # Since: 2.12
>   ##
> -{ 'command': 'block-job-dismiss', 'data': { 'id': 'str' } }
> +{ 'command': 'block-job-dismiss', 'data': { 'id': 'str' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-job-finalize:
> @@ -2735,7 +2763,8 @@
>   #
>   # Since: 2.12
>   ##
> -{ 'command': 'block-job-finalize', 'data': { 'id': 'str' } }
> +{ 'command': 'block-job-finalize', 'data': { 'id': 'str' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @BlockdevDiscardOptions:
> @@ -4127,7 +4156,8 @@
>   # <- { "return": {} }
>   #
>   ##
> -{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true }
> +{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true,
> +  'allow-preconfig': true }
>   
>   ##
>   # @x-blockdev-reopen:
> @@ -4169,7 +4199,8 @@
>   # Since: 4.0
>   ##
>   { 'command': 'x-blockdev-reopen',
> -  'data': 'BlockdevOptions', 'boxed': true }
> +  'data': 'BlockdevOptions', 'boxed': true,
> +  'allow-preconfig': true }
>   
>   ##
>   # @blockdev-del:
> @@ -4202,7 +4233,8 @@
>   # <- { "return": {} }
>   #
>   ##
> -{ 'command': 'blockdev-del', 'data': { 'node-name': 'str' } }
> +{ 'command': 'blockdev-del', 'data': { 'node-name': 'str' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @BlockdevCreateOptionsFile:
> @@ -4709,7 +4741,8 @@
>   ##
>   { 'command': 'blockdev-create',
>     'data': { 'job-id': 'str',
> -            'options': 'BlockdevCreateOptions' } }
> +            'options': 'BlockdevCreateOptions' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @BlockdevAmendOptionsLUKS:
> @@ -4777,7 +4810,8 @@
>     'data': { 'job-id': 'str',
>               'node-name': 'str',
>               'options': 'BlockdevAmendOptions',
> -            '*force': 'bool' } }
> +            '*force': 'bool' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @BlockErrorAction:
> @@ -5128,7 +5162,8 @@
>   #
>   ##
>   { 'command': 'block-set-write-threshold',
> -  'data': { 'node-name': 'str', 'write-threshold': 'uint64' } }
> +  'data': { 'node-name': 'str', 'write-threshold': 'uint64' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @x-blockdev-change:
> @@ -5186,7 +5221,8 @@
>   { 'command': 'x-blockdev-change',
>     'data' : { 'parent': 'str',
>                '*child': 'str',
> -             '*node': 'str' } }
> +             '*node': 'str' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @x-blockdev-set-iothread:
> @@ -5226,7 +5262,8 @@
>   { 'command': 'x-blockdev-set-iothread',
>     'data' : { 'node-name': 'str',
>                'iothread': 'StrOrNull',
> -             '*force': 'bool' } }
> +             '*force': 'bool' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @QuorumOpType:
> @@ -5358,7 +5395,8 @@
>   #
>   ##
>   { 'command': 'blockdev-snapshot-internal-sync',
> -  'data': 'BlockdevSnapshotInternal' }
> +  'data': 'BlockdevSnapshotInternal',
> +  'allow-preconfig': true }
>   
>   ##
>   # @blockdev-snapshot-delete-internal-sync:
> @@ -5405,4 +5443,5 @@
>   ##
>   { 'command': 'blockdev-snapshot-delete-internal-sync',
>     'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
> -  'returns': 'SnapshotInfo' }
> +  'returns': 'SnapshotInfo',
> +  'allow-preconfig': true }
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index e819e70cac..c03bc9da2f 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -60,7 +60,8 @@
>     'data': { 'addr': 'SocketAddressLegacy',
>               '*tls-creds': 'str',
>               '*tls-authz': 'str',
> -            '*max-connections': 'uint32' } }
> +            '*max-connections': 'uint32' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @BlockExportOptionsNbdBase:
> @@ -177,7 +178,8 @@
>   # Since: 1.3
>   ##
>   { 'command': 'nbd-server-add',
> -  'data': 'NbdServerAddOptions', 'boxed': true, 'features': ['deprecated'] }
> +  'data': 'NbdServerAddOptions', 'boxed': true, 'features': ['deprecated'],
> +  'allow-preconfig': true }
>   
>   ##
>   # @BlockExportRemoveMode:
> @@ -222,7 +224,8 @@
>   ##
>   { 'command': 'nbd-server-remove',
>     'data': {'name': 'str', '*mode': 'BlockExportRemoveMode'},
> -  'features': ['deprecated'] }
> +  'features': ['deprecated'],
> +  'allow-preconfig': true }
>   
>   ##
>   # @nbd-server-stop:
> @@ -232,7 +235,8 @@
>   #
>   # Since: 1.3
>   ##
> -{ 'command': 'nbd-server-stop' }
> +{ 'command': 'nbd-server-stop',
> +  'allow-preconfig': true }
>   
>   ##
>   # @BlockExportType:
> @@ -301,7 +305,8 @@
>   # Since: 5.2
>   ##
>   { 'command': 'block-export-add',
> -  'data': 'BlockExportOptions', 'boxed': true }
> +  'data': 'BlockExportOptions', 'boxed': true,
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-export-del:
> @@ -321,7 +326,8 @@
>   # Since: 5.2
>   ##
>   { 'command': 'block-export-del',
> -  'data': { 'id': 'str', '*mode': 'BlockExportRemoveMode' } }
> +  'data': { 'id': 'str', '*mode': 'BlockExportRemoveMode' },
> +  'allow-preconfig': true }
>   
>   ##
>   # @BLOCK_EXPORT_DELETED:
> @@ -365,4 +371,5 @@
>   #
>   # Since: 5.2
>   ##
> -{ 'command': 'query-block-exports', 'returns': ['BlockExportInfo'] }
> +{ 'command': 'query-block-exports', 'returns': ['BlockExportInfo'],
> +  'allow-preconfig': true }
> diff --git a/qapi/block.json b/qapi/block.json
> index 82fcf2c914..cc500df865 100644
> --- a/qapi/block.json
> +++ b/qapi/block.json
> @@ -493,7 +493,8 @@
>   # <- { "return": {} }
>   ##
>   { 'command': 'block_set_io_throttle', 'boxed': true,
> -  'data': 'BlockIOThrottle' }
> +  'data': 'BlockIOThrottle',
> +  'allow-preconfig': true }
>   
>   ##
>   # @block-latency-histogram-set:
> @@ -569,4 +570,5 @@
>              '*boundaries': ['uint64'],
>              '*boundaries-read': ['uint64'],
>              '*boundaries-write': ['uint64'],
> -           '*boundaries-flush': ['uint64'] } }
> +           '*boundaries-flush': ['uint64'] },
> +  'allow-preconfig': true }
> 

Ping.

Paolo

