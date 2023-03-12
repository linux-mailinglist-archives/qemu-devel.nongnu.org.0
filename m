Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5166B68F6
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 18:51:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbPqo-0006ov-BN; Sun, 12 Mar 2023 13:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1pbPqk-0006oW-Qu
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:51:14 -0400
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1pbPqi-0002nY-TT
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:51:14 -0400
Received: from [192.168.2.203] (109-252-120-116.nat.spd-mgts.ru
 [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C2746602E85;
 Sun, 12 Mar 2023 17:51:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678643467;
 bh=KmjCtilIVAnzFDIKkb0LhxYG2/8Y+tgikUJgYTvlXL0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dr0o+IBtGS07EV9EJYpAoMYT9hxXlWHM6Ydt2PSMk9NGfv0b5QlurpjgaoYcuIrLs
 pbLMXs8hQhwCa6Xmz7Lm6yg2XA1WVMW5fnztnDJ0j4ta1GQezPd0pmTDwT73HiCQsz
 KqnuSlmZcxta79+ciVSgRV9ocBoeCl8KL3GBOgUXOPw6MSHXXkEA6OB2XInhorMDN1
 284Pyc4q3RzXiFv3h0/JSnZI1v4r3p9XNWEFNoqVb3c8JwklWzCM/LRT7fjr74BTwl
 fVhQsk2aSuTc2Hg9wPNjKW5DVACpeh7snyBiYlr+oRz7GnXUb107Oly1CiQTciV0gJ
 9KEJqIXopmlQA==
Message-ID: <68195782-0309-2f81-7f1f-84a7fe7bb05c@collabora.com>
Date: Sun, 12 Mar 2023 20:51:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC QEMU PATCH 08/18] virtio-gpu: Initialize Venus
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-9-ray.huang@amd.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230312092244.451465-9-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab;
 envelope-from=dmitry.osipenko@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/12/23 12:22, Huang Rui wrote:
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> 
> Request Venus when initializing VirGL.
> 
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
>  hw/display/virtio-gpu-virgl.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index fe03dc916f..f5ce206b93 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -803,7 +803,11 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>  {
>      int ret;
>  
> +#ifdef VIRGL_RENDERER_VENUS
> +    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
> +#else
>      ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
> +#endif

Note that Venus now requires VIRGL_RENDERER_RENDER_SERVER flag to be
set. Please test the patches with the latest virglrenderer and etc.

The #ifdef also doesn't allow adding new flags, it should look like:

#ifdef VIRGL_RENDERER_VENUS
    flags |= VIRGL_RENDERER_RENDER_SERVER;
#endif

    ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);

-- 
Best regards,
Dmitry


