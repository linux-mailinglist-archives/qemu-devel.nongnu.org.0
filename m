Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358B4344909
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:17:44 +0100 (CET)
Received: from localhost ([::1]:42564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMJL-00032F-AQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1lOM5m-0005oa-Gx; Mon, 22 Mar 2021 11:03:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1lOM5g-0007ve-Ry; Mon, 22 Mar 2021 11:03:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id e9so17406814wrw.10;
 Mon, 22 Mar 2021 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FyP9CipjvFpnfIqIEbRW3KkKZKHL4tdWtHw8eenVhOs=;
 b=ngsJbkSbB68/BK8rR8NN4PR8UYpk7qy0aweAHGnrs3lvNHF+79dWdjGn5dfdnzKv1q
 187iK4judF55K+6+yw7N3pPYUvpkWLd+iYyLk/ytKZUl3GM67n0/AW7MBb406TA+RU31
 wLT5Dqox1/LyC9NKW7I6QCYZgEzHiD8kqMRI+FPdypGgB4B6R1K1RnV9JefMwBhmbh7O
 e3sGwZmtXgnz+YznGhSoihqT60QPiDXBru1Bb9esXsS/V5j6v7VUv6KuEOtv5k0AP4OR
 cMV7aX0bL5Qn1TuJYPa6vYb3+4X0oyiEsX3Vb32luXEhu0VzgIrB4A/ccwNaPGH0tNXl
 FcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:subject:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FyP9CipjvFpnfIqIEbRW3KkKZKHL4tdWtHw8eenVhOs=;
 b=DWUupUzFNW3maChyvhUTClWD2Ara/Y8lmTOlu2fmSXvl+Mg+CudRknoXe3HJV2sGCZ
 C9cfS/AlpRQrHjO+VfHVDXbypfD4hEfomB5z4Ijs2hn41IyPyzT44DEHZvLhjEEwP/r7
 2k6WxINaeL7hc93ghXogShqIJOyD4f53vThkAGYJ9TQlaQpmeaPy9KYZD4s50ZvEcUN3
 kfPkepcEspYA5kfwfJYkhQd3rrgGm4EJLMlX4mdB+tskx/uoyQ9vcQ7hJoG5i5Dx4QGz
 DP7MB2aP6wvN5YMPrBskg/quLR3nhTG+CnMMPOog+ysPB4+LonjPXuqdY+uO634mtOUF
 C7qQ==
X-Gm-Message-State: AOAM532hdTxehlNzn5pZ+GsvywRhlVXiLQPeF9kdP8kTe7DRlb39ha4m
 5rptz/3guG2OikezASc9N+/QeQhB8G3H1Q==
X-Google-Smtp-Source: ABdhPJwl+Akc0f4Vw6dmZAHeDuIS90Prg7ispLruT5TEXhAJEajQoiQ3XN64LU46pmJxRWSgR67SSQ==
X-Received: by 2002:adf:fd48:: with SMTP id h8mr18745163wrs.229.1616425413226; 
 Mon, 22 Mar 2021 08:03:33 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id h20sm16581667wmm.19.2021.03.22.08.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 08:03:32 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20210308143232.83388-1-anthony.perard@citrix.com>
Message-ID: <b15e2f65-7e4d-b129-d5e1-a69667c5ee5c@xen.org>
Date: Mon, 22 Mar 2021 15:03:31 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210308143232.83388-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2021 14:32, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> Whenever a Xen block device is detach via xenstore, the image
> associated with it remained open by the backend QEMU and an error is
> logged:
>      qemu-system-i386: failed to destroy drive: Node xvdz-qcow2 is in use
> 
> This happened since object_unparent() doesn't immediately frees the
> object and thus keep a reference to the node we are trying to free.
> The reference is hold by the "drive" property and the call
> xen_block_drive_destroy() fails.
> 
> In order to fix that, we call drain_call_rcu() to run the callback
> setup by bus_remove_child() via object_unparent().
> 
> Fixes: 2d24a6466154 ("device-core: use RCU for list of children of a bus")
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> CCing people whom introduced/reviewed the change to use RCU to give
> them a chance to say if the change is fine.
> ---
>   hw/block/xen-block.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index a3b69e27096f..fe5f828e2d25 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -972,6 +972,15 @@ static void xen_block_device_destroy(XenBackendInstance *backend,
>   
>       object_unparent(OBJECT(xendev));
>   
> +    /*
> +     * Drall all pending RCU callbacks as object_unparent() frees `xendev'

s/Drall/Drain ?

> +     * in a RCU callback.
> +     * And due to the property "drive" still existing in `xendev', we
> +     * cann't destroy the XenBlockDrive associated with `xendev' with

s/cann't/can't

With those fixed...

Reviewed-by: Paul Durrant <paul@xen.org>

> +     * xen_block_drive_destroy() below.
> +     */
> +    drain_call_rcu();
> +
>       if (iothread) {
>           xen_block_iothread_destroy(iothread, errp);
>           if (*errp) {
> 


