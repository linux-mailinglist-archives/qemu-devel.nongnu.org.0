Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673446D5D8F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 12:33:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjdx6-0001cl-U5; Tue, 04 Apr 2023 06:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pjdx4-0001bq-B6; Tue, 04 Apr 2023 06:31:46 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pjdx2-0002RW-Er; Tue, 04 Apr 2023 06:31:46 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:2619:0:640:e777:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id D55935E886;
 Tue,  4 Apr 2023 13:21:03 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b435::1:19] (unknown
 [2a02:6b8:b081:b435::1:19])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 1LLcuZ0OneA0-gkOKohdM; Tue, 04 Apr 2023 13:21:02 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1680603662; bh=W3jKLbzYuIENbl/SGK582ctXV7l9XATSPLNUo6BmlXc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=CiJ47sxq1B4izB/nzQ0GrhP6CBOk1oUIxcR6lYBtRz4ix68rbsbSzau97rUi1xRbK
 g1cP+wy8CWMpK4lSbSBK643PIFqdNkHs98wFZAWedZvna0Rqkr0sbX2kivwSsGYXWY
 Uc3zBGLKcb6gHJ/tlfNG33e9TByzUbJ5J1AFdtGM=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <dee2de66-d79e-28ba-f800-dd9ec809da99@yandex-team.ru>
Date: Tue, 4 Apr 2023 13:21:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/2] virtio-scsi: stop using aio_disable_external() during
 unplug
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Fam Zheng <fam@euphon.net>, kwolf@redhat.com,
 qemu-block@nongnu.org
References: <20230323185607.1458987-1-stefanha@redhat.com>
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <20230323185607.1458987-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/23/23 9:56 PM, Stefan Hajnoczi wrote:
> The aio_disable_external() API is a solution for stopping I/O during critical
> sections. The newer BlockDevOps->drained_begin/end/poll() callbacks offer a
> cleaner solution that supports the upcoming multi-queue block layer. This
> series removes aio_disable_external() from the virtio-scsi emulation code.
> 
> Patch 1 is a fix for something I noticed when reading the code.
> 
> Patch 2 replaces aio_disable_external() with functionality for safe hot unplug
> that's mostly already present in the SCSI emulation code.
> 
> Stefan Hajnoczi (2):
>    virtio-scsi: avoid race between unplug and transport event
>    virtio-scsi: stop using aio_disable_external() during unplug
> 
>   hw/scsi/scsi-bus.c    |  3 ++-
>   hw/scsi/scsi-disk.c   |  1 +
>   hw/scsi/virtio-scsi.c | 21 +++++++++------------
>   3 files changed, 12 insertions(+), 13 deletions(-)
> 

For both patches:
Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>

