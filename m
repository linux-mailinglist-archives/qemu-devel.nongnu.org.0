Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C3A55A2DF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 22:41:03 +0200 (CEST)
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4q6w-0000L6-5q
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 16:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4q4X-0007FU-8o
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 16:38:33 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4q4V-0005Iy-9y
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 16:38:32 -0400
Received: by mail-pf1-x433.google.com with SMTP id p14so3504039pfh.6
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 13:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CzVDwK9J/H1bFllsuSomglUxDzUgdrD59eWAHVbr5Kw=;
 b=pUwBXk3UUFPqz7TxkM/hbbiL1SBxTyKkCZdBn9/KX0ux6OOX4L/Sr+eatFJZKE1E4z
 ymIpYKkiQJcVFQ0rAd1GFdmUOSk64tXucSIWQM6USvKi48l6K3FVeF3ILPRVeDAEdy5u
 aJm8csqqA5ODv+P6sUTHDe7MEq09VsyJG/ODIqLUZhp2Xvtg/kpHqr0W7g10C+kDYYR/
 0WNaXaXo/m+bmS0GEgmA2E8ewGHeE3RnRzYUZkS64EORuGT20QcAIC3T0ppX65AOiu81
 iMh7n9OysgTa/fP4BRlBYU69ycdv5r+ADvIPt1aax1+Q66ffHrk1HehkOR70Jdnj9IN/
 Z/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CzVDwK9J/H1bFllsuSomglUxDzUgdrD59eWAHVbr5Kw=;
 b=0k3gJY6iageJ+dOx47qJ6LakQDg0lENmR+14b3CK4tDHN8q6Dq3/dUjqLh4oKJftCB
 WW4paXbzsvdrU9/jPIir0xTC3HjGMhXil7wqUMo8RswWknNlpe5FaHW+mZNKgCytbO+W
 +2E034a/1DvDsy/Cm5Ha/z/6xTFj96OziLAmU2cS+pLmQvCkw4l4oeLI1nW+DSNnAtzb
 uBouTOe6RfsNwuu9QiLDH+8FdM3RzbWVomwgXPoGy6GSTfqfLJW76xJMpzSh8lA1vGaH
 Pq5TDJ9t1XfE8K79BOCNT+EoWHdvzY/QH9AaxqIeLB3oRaxgpltCra2VNmXS+ko5/IKI
 ehZA==
X-Gm-Message-State: AJIora8GAYtdcV4BC4BZEQ0wk4OJsLkNzVyspG3VQgnbLgCGoGQFi37u
 P7CDRPd0WPp3g460tqPiJK8wwQ==
X-Google-Smtp-Source: AGRyM1ttHAryqMN0tWtMccN8cDfi+2RqP+PqOUtftnAk25v9e1UTjGDIyT5iMo7mTcCxBX5mjs9cMw==
X-Received: by 2002:a63:784a:0:b0:408:c36e:db35 with SMTP id
 t71-20020a63784a000000b00408c36edb35mr588570pgc.484.1656103109805; 
 Fri, 24 Jun 2022 13:38:29 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:b25a:9949:8352:ec5d?
 ([2602:ae:1543:f001:b25a:9949:8352:ec5d])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a63f110000000b003fc5b1db26fsm2020559pgi.52.2022.06.24.13.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 13:38:29 -0700 (PDT)
Message-ID: <fe0a1f7c-4b74-b02b-7b27-82428767bd30@linaro.org>
Date: Fri, 24 Jun 2022 13:38:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL v2 00/20] Block layer patches
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220624154103.185902-1-kwolf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220624154103.185902-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/22 08:40, Kevin Wolf wrote:
> The following changes since commit 3a821c52e1a30ecd9a436f2c67cc66b5628c829f:
> 
>    Merge tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme into staging (2022-06-23 14:52:30 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to 779d82e1d305f2a9cbd7f48cf6555ad58145e04a:
> 
>    vduse-blk: Add name option (2022-06-24 17:07:06 +0200)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - Add vduse-blk export
> - Dirty bitmaps: Fix and improve bitmap merge
> - gluster: correctly set max_pdiscard
> - rbd: report a better error when namespace does not exist
> - aio_wait_kick: add missing memory barrier
> - Code cleanups

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> Emanuele Giuseppe Esposito (1):
>        aio_wait_kick: add missing memory barrier
> 
> Eric Blake (1):
>        nbd: Drop dead code spotted by Coverity
> 
> Fabian Ebner (1):
>        block/gluster: correctly set max_pdiscard
> 
> Stefan Hajnoczi (3):
>        block: drop unused bdrv_co_drain() API
>        block: get rid of blk->guest_block_size
>        qsd: document vduse-blk exports
> 
> Stefano Garzarella (1):
>        block/rbd: report a better error when namespace does not exist
> 
> Vladimir Sementsov-Ogievskiy (3):
>        block: block_dirty_bitmap_merge(): fix error path
>        block: improve block_dirty_bitmap_merge(): don't allocate extra bitmap
>        block: simplify handling of try to merge different sized bitmaps
> 
> Xie Yongji (10):
>        block: Support passing NULL ops to blk_set_dev_ops()
>        block/export: Fix incorrect length passed to vu_queue_push()
>        block/export: Abstract out the logic of virtio-blk I/O process
>        linux-headers: Add vduse.h
>        libvduse: Add VDUSE (vDPA Device in Userspace) library
>        vduse-blk: Implement vduse-blk export
>        vduse-blk: Add vduse-blk resize support
>        libvduse: Add support for reconnecting
>        vduse-blk: Add serial option
>        vduse-blk: Add name option
> 
>   qapi/block-export.json                      |   29 +-
>   docs/tools/qemu-storage-daemon.rst          |   22 +
>   meson_options.txt                           |    4 +
>   block/export/vduse-blk.h                    |   20 +
>   block/export/virtio-blk-handler.h           |   37 +
>   include/block/aio-wait.h                    |    2 +
>   include/block/block-io.h                    |    1 -
>   include/block/block_int-io.h                |    2 +-
>   include/qemu/hbitmap.h                      |   15 +-
>   include/sysemu/block-backend-io.h           |    1 -
>   linux-headers/linux/vduse.h                 |  306 ++++++
>   subprojects/libvduse/include/atomic.h       |    1 +
>   subprojects/libvduse/include/compiler.h     |    1 +
>   subprojects/libvduse/libvduse.h             |  247 +++++
>   block/backup.c                              |    6 +-
>   block/block-backend.c                       |   12 +-
>   block/dirty-bitmap.c                        |   26 +-
>   block/export/export.c                       |    6 +
>   block/export/vduse-blk.c                    |  374 ++++++++
>   block/export/vhost-user-blk-server.c        |  263 +----
>   block/export/virtio-blk-handler.c           |  240 +++++
>   block/gluster.c                             |    2 +-
>   block/io.c                                  |   15 -
>   block/monitor/bitmap-qmp-cmds.c             |   40 +-
>   block/nbd.c                                 |    8 +-
>   block/rbd.c                                 |   24 +
>   hw/block/virtio-blk.c                       |    1 -
>   hw/block/xen-block.c                        |    1 -
>   hw/ide/core.c                               |    1 -
>   hw/scsi/scsi-disk.c                         |    1 -
>   hw/scsi/scsi-generic.c                      |    1 -
>   storage-daemon/qemu-storage-daemon.c        |   10 +
>   subprojects/libvduse/libvduse.c             | 1375 +++++++++++++++++++++++++++
>   util/aio-wait.c                             |   16 +-
>   util/hbitmap.c                              |   25 +-
>   MAINTAINERS                                 |    9 +
>   block/export/meson.build                    |    7 +-
>   meson.build                                 |   34 +
>   scripts/meson-buildoptions.sh               |    7 +
>   scripts/update-linux-headers.sh             |    2 +-
>   subprojects/libvduse/linux-headers/linux    |    1 +
>   subprojects/libvduse/meson.build            |   10 +
>   subprojects/libvduse/standard-headers/linux |    1 +
>   43 files changed, 2852 insertions(+), 354 deletions(-)
>   create mode 100644 block/export/vduse-blk.h
>   create mode 100644 block/export/virtio-blk-handler.h
>   create mode 100644 linux-headers/linux/vduse.h
>   create mode 120000 subprojects/libvduse/include/atomic.h
>   create mode 120000 subprojects/libvduse/include/compiler.h
>   create mode 100644 subprojects/libvduse/libvduse.h
>   create mode 100644 block/export/vduse-blk.c
>   create mode 100644 block/export/virtio-blk-handler.c
>   create mode 100644 subprojects/libvduse/libvduse.c
>   create mode 120000 subprojects/libvduse/linux-headers/linux
>   create mode 100644 subprojects/libvduse/meson.build
>   create mode 120000 subprojects/libvduse/standard-headers/linux
> 
> 


