Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5DA313DEB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:44:40 +0100 (CET)
Received: from localhost ([::1]:60298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BWZ-0005nl-NV
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l95CC-0000sE-AX
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:59:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l95C4-0004sH-Qp
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612785543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPq9iJcGNRB3jNQOel4g/lp4WAVgaHh/eLPTN67K0pk=;
 b=UAjWZ6glOn7d4W+ABU/Nc0klbde77vGedNnBm8cKdqttPQI4wzarQmVe/fb8OhPFV4zNYn
 jhcE+p9gHyY3VuR+hZZx7JcWs4MZdTZ0ePnYjp946Yet6UYWwwiCxDvmEi8ITZxpkr6EhE
 HQGnRmKNx7A2BLKoVwWZsYnkATaqC3o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-86meza4NMS2pCDNc5guzgQ-1; Mon, 08 Feb 2021 06:59:00 -0500
X-MC-Unique: 86meza4NMS2pCDNc5guzgQ-1
Received: by mail-wr1-f72.google.com with SMTP id n18so12893873wrm.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NPq9iJcGNRB3jNQOel4g/lp4WAVgaHh/eLPTN67K0pk=;
 b=un2K6ya0maSvVuZiE7z3Kb9bD+HyScPoVaXdE3NtnX9s7Ow4Xnu11IoHSMa7Hx5/wR
 ECrG4FOeTz79IoWxqplXRjBSjyOMmmY5k+v5u313wMlCqnshEt8oiL7IuTRRDpPDIaUc
 iQaJhGf1fAS16WaGC4ViPbzFe1JRdxOWIsPamgkX2RiRZ8zTnXYNvQXxOMPQ0gdZ4mXn
 sIdRJYnwXlRibpSerT2Nv4JRm1dPWI2xHiZHU3HYVYurnpqyCvk5gXkHVgxLvPbHIq6V
 7ZEzjeGGFzLvT4HuAT6aGXN0odGVDPCzIUjkWL6L2hqvw1pqcHeHAD3413BRDWad89Yw
 iIVg==
X-Gm-Message-State: AOAM531+PC8hGBVJEyAId4H7e7TLcmfBIRaBlSw0BTvxEVEqHIQ/u/7G
 CeW2nrmyNJLVLOUQi1a7R73QjiiW3WlDrWzHlrl6RiLwjmFFf6MCU10HN4XNFFSckIfMrIkSMEx
 0Vu1YxlhIjuAzNws=
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr19150309wrd.134.1612785538999; 
 Mon, 08 Feb 2021 03:58:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzwY9aoIkMRWOaYo1a692JSX4gTO6dhQyfP94riQUGYc0/PXhZjBASgoE2n50YCMhrygmZoQ==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr19150300wrd.134.1612785538841; 
 Mon, 08 Feb 2021 03:58:58 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s64sm21667913wms.21.2021.02.08.03.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 03:58:58 -0800 (PST)
Subject: Re: [PATCH] hw/net: fsl_etsec: Do not reject short frames
To: Bin Meng <bmeng.cn@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>
References: <1612766465-7639-1-git-send-email-bin.meng@windriver.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c1d6ec7c-bea6-69ac-af5d-11cd9606924f@redhat.com>
Date: Mon, 8 Feb 2021 12:58:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1612766465-7639-1-git-send-email-bin.meng@windriver.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: slirp@lists.freedesktop.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing libSLiRP.

On 2/8/21 7:41 AM, Bin Meng wrote:
> As of today both slirp and tap networking do not pad short frames
> (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
> 
> If eTSEC is programmed to reject short frames, ARP requests will be
> dropped, preventing the guest from becoming visible on the network.
> 
> The same issue was reported on e1000 and vmxenet3 before, see:
> 
> commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
> commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
> 
> Ideally this should be fixed on the slirp/tap networking side to
> pad short frames to the minimum frame length, but I am not sure
> whether that's doable.
> 
> This commit changes to codes to ignore the RCTRL_RSF setting and
> still allow receiving the short frame. The log message is updated
> to mention the reject short frames functionality is unimplemented.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/net/fsl_etsec/rings.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index 121415a..503b4d3 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -502,10 +502,17 @@ ssize_t etsec_rx_ring_write(eTSEC *etsec, const uint8_t *buf, size_t size)
>          return -1;
>      }
>  
> +    /*
> +     * Both slirp and tap networking do not pad short frames
> +     * (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
> +     *
> +     * If eTSEC is programmed to reject short frames, ARP requests
> +     * will be dropped, preventing the guest from becoming visible
> +     * on the network.
> +     */
>      if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
>          /* CRC is not in the packet yet, so short frame is below 60 bytes */
> -        RING_DEBUG("%s: Drop short frame\n", __func__);
> -        return -1;
> +        RING_DEBUG("%s: Drop short frame not implemented\n", __func__);
>      }
>  
>      rx_init_frame(etsec, buf, size);
> 


