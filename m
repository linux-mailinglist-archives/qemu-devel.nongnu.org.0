Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA355331D0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 21:38:45 +0200 (CEST)
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntaMe-000380-EU
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 15:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ntaKd-0001gH-Bd
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:36:39 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:45802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ntaKZ-0005dk-C4
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:36:37 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id B6F6D2E1176
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 22:25:31 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 HqvnsUR5KK-PVLSSEFA; Tue, 24 May 2022 22:25:31 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1653420331; bh=Fkhayupn/+FYvM4GQUGmpoFmRwi/NI6k4+mJAdOrGvo=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=x4i/Uo/MQZ74au329Mlyn0XBJd4F9ZjOnPPirZldOm61Mvy6yFj9X78QxOauc494q
 kgpTFgFEl10ug8zBPZIdmBLbVCu2Tay3TVjtCEIPOCtgjitVrHa5+THq3lkAmlclO9
 Pxa4c9XWEJAwc5GLqx7c/wq+/Z/0ygNsSZF5proc=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPV6:2a02:6b8:b081:b6b7::1:23] (unknown
 [2a02:6b8:b081:b6b7::1:23])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 a5DXWVGOyu-PVJqLObS; Tue, 24 May 2022 22:25:31 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <074d418c-99de-a827-a896-a97555a990a4@yandex-team.ru>
Date: Tue, 24 May 2022 22:25:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/4] virtio: forward errors into
 qdev_report_runtime_error()
Content-Language: en-US
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru
References: <165296995578.196133.16183155555450040914.stgit@buzz>
 <165296996264.196133.14408996533965098582.stgit@buzz>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <165296996264.196133.14408996533965098582.stgit@buzz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 5/19/22 17:19, Konstantin Khlebnikov wrote:
> Repalce virtio_error() with macro which forms structured Error and
> reports it as device runtime-error in addition to present actions.
> 
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> ---
>   hw/virtio/virtio.c         |    9 +++------
>   include/hw/virtio/virtio.h |   10 +++++++++-
>   2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 5d607aeaa0..638d779bf2 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3642,13 +3642,10 @@ void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name)
>       vdev->bus_name = g_strdup(bus_name);
>   }
>   
> -void G_GNUC_PRINTF(2, 3) virtio_error(VirtIODevice *vdev, const char *fmt, ...)
> +void virtio_fatal_error(VirtIODevice *vdev, Error *err)
>   {
> -    va_list ap;
> -
> -    va_start(ap, fmt);
> -    error_vreport(fmt, ap);
> -    va_end(ap);
> +    qdev_report_runtime_error(&vdev->parent_obj, err);
> +    error_report_err(err);
>   
>       if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>           vdev->status = vdev->status | VIRTIO_CONFIG_S_NEEDS_RESET;
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index db1c0ddf6b..a165e35b0b 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -16,6 +16,7 @@
>   
>   #include "exec/memory.h"
>   #include "hw/qdev-core.h"
> +#include "qapi/error.h"
>   #include "net/net.h"
>   #include "migration/vmstate.h"
>   #include "qemu/event_notifier.h"
> @@ -172,7 +173,14 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
>   
>   void virtio_cleanup(VirtIODevice *vdev);
>   
> -void virtio_error(VirtIODevice *vdev, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
> +#define virtio_error(vdev, fmt, ...) {              \
> +    Error *_err = NULL;                             \
> +    error_setg(&_err, (fmt), ## __VA_ARGS__);       \
> +    virtio_fatal_error(vdev, _err);                 \
> +} while (0)
> +
> +/* Reports and frees error, breaks device */
> +void virtio_fatal_error(VirtIODevice *vdev, Error *err);
>   
>   /* Set the child bus name. */
>   void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name);
> 

Hmm. So we create temporary Error object just to pass it to qdev_report_runtime_error..

I think we can avoid introducing this intermediate Error object together with new macro:
just convert argument list to string with help of g_strdup_vprintf() in original virtio_error(), error_report this string and pass to qdev_report_runtime_error() (which should be simplified to get just a string).

-- 
Best regards,
Vladimir

