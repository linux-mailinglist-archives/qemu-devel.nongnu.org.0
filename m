Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA739CA9C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:07:06 +0200 (CEST)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpbdR-0005D9-8h
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbch-0004MM-Dp; Sat, 05 Jun 2021 15:06:19 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:39101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbcf-000273-L4; Sat, 05 Jun 2021 15:06:19 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N79ly-1lJY8f1N6q-017XlF; Sat, 05 Jun 2021 21:06:13 +0200
Subject: Re: [PATCH v2] hw/virtio: Document *_should_notify() are called
 within rcu_read_lock()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210523094040.3516968-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <73f33b9b-618f-4d92-416f-80ab07ee9bb0@vivier.eu>
Date: Sat, 5 Jun 2021 21:06:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210523094040.3516968-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2NSbKMrqwkUQDlkck3VO2miBcaPscQQPyk9ZHwwvbow24VHv/sT
 Ks7tkXcXvXgAaQV7x5Lpl7Yp7uYZBPwVgfvYaQHLhjzWvHbniIN8HNodPIjViK116iF2y1U
 gBdhfx0UNjgY2M8QgTFVneMpMNUKXpp2NaleVKgRHEtQQBR0eIEqUeZxFDcAD/5zO/lyIFE
 1eshsXhYveu9UqQ31jFJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UdCBM/zbgV8=:7EQ+CNGqdSCM9rA3VcywTX
 v5XjgmWkycttjVT4xqgDdiRjOOx42qk2lHx1VpuFR42ybNZxGpV9IWFXXp2OjkpasdO0RCZR+
 rhFQvgdx1EI4SYGxR4uPy88/MjiDQ43upGQK7L++a3vR/XA/4r4ewXBGIQb3AeEMUKPE9AC8b
 d7PnKdfgcr6shL5Q44ur7A1CbM28++9U0E9lEJlJxlbiNVqAmyrOsa6EsAsV9Ozb3+NMmYwms
 yXRSproc2ivDe0yzb3KX/BkyO14Qqk+zlH1+TLwKwOayqahLG3ZybdbIjKIxqLv7V8Cv4lYSx
 oooyM0w4UsvZBxyvWRuCTU3Vz4iS3RjfgJ6xBFqWzszRGLbO+7iLMdQwJvvVlIl06NhgM+zXx
 fqESscO/TTwgyjlCqcZMsMA6fXYUnvuWSAhY8wDwYwa2rUogwpJITLWP4dAP21cK8Puhg9U5x
 dZicd+G2WaLx9/KfLalkJExIRoimiF0Udviy+5lvPxF/Px6r27tAxkeJdZ8u6vABvedVCAnda
 d6Ec0olC39SMFcMpWHkGw0=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/05/2021 à 11:40, Philippe Mathieu-Daudé a écrit :
> Such comments make reviewing this file somehow easier.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: only one space before end of comment (mst)
> ---
>  hw/virtio/virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index e02544b2df7..130e3568409 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2449,6 +2449,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
>      }
>  }
>  
> +/* Called within rcu_read_lock(). */
>  static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      uint16_t old, new;
> @@ -2485,6 +2486,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
>      return vring_need_event(off, new, old);
>  }
>  
> +/* Called within rcu_read_lock(). */
>  static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      VRingPackedDescEvent e;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

