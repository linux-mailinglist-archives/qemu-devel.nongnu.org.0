Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFAF3E340F
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 10:21:01 +0200 (CEST)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCHZk-00056T-Fz
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 04:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCHYn-0004NW-IM
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 04:20:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCHYm-0002c1-20
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 04:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628324399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6uisLw708y5ACXFKEIVUHRhyMfNK2P0NWndEJ7BfEI=;
 b=e4AmWzhv3DXRoTNY5JlJ4d7ojAvSocTnX+zEva1BGXvmjMn+TqWei/W/qCxJIB3nXCguZM
 rN9rweIL6g8WjnbGyKMZ4/JVbUfjefA8uNx6n2qk4/4qh+USGAsHQfKU1+dtiQ7xcQSVci
 i2ghWlVdvaJe2xsAfWyEDnLMfZKsjjg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-Wzs0bxN_PsCqqKx4YpHegA-1; Sat, 07 Aug 2021 04:19:57 -0400
X-MC-Unique: Wzs0bxN_PsCqqKx4YpHegA-1
Received: by mail-wr1-f69.google.com with SMTP id
 l7-20020a5d48070000b0290153b1557952so3924861wrq.16
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 01:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e6uisLw708y5ACXFKEIVUHRhyMfNK2P0NWndEJ7BfEI=;
 b=a/WiQ+BFIxNpT9PQNAl/B95rS5RNxXZXydbkY1SlzY5o6M6FIo8O9rva5tGui8143l
 PYyWRfUzF4Yyk0TdFTxx1CZrhmg5YGRM/0LQJibwuinRH8N02W1GGrGzKuIANkYWelhN
 OpqVhrN9UvY4Zl7cw0uCA6q8Qcpu60X2wCJLVRDtsip/uqfcGhojCEUKwQiTyylHDwXr
 BstfL7snlZeYIWDXzoQ7E3P1Vl8aD7ct4y3bs0X8+ZRP3l4bIufrjNb1i5KCR83tHkea
 gyU3SseYnHqD3IA8gWz88vZjgtiuo8rLwUcwjy61duYltkw4lDiVOB7NdNFn0Ne+J0lT
 OV/A==
X-Gm-Message-State: AOAM532ASJsWynOlLCqypCEZTvylTsoGtn4ylaqGA7GC1usv8BOx3nx6
 MS2gww5GG/Hv/PbnnUfvNsZ4uX1S8uyNBNEgOcqVrAt0GeFD8zxgfy2VUPr5u3PNgNblW7qi38F
 ZZe8hgV+to5+xw7U=
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr14697413wrm.220.1628324396364; 
 Sat, 07 Aug 2021 01:19:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwq610Oe0M4G24sFvwt6lcr83hIAzkyDeHzAiCN/DJMeWs4/bD3ujyX1MwMegKvKQ0ZhUCwJQ==
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr14697403wrm.220.1628324396255; 
 Sat, 07 Aug 2021 01:19:56 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w18sm13151795wrg.68.2021.08.07.01.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 01:19:55 -0700 (PDT)
Subject: Re: [PATCH] vmxnet3: add stub for encapsulation offload
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210806222300.417126-1-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5a2ac0a5-7b1a-c75d-3d61-4ec849c9eb2d@redhat.com>
Date: Sat, 7 Aug 2021 10:19:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806222300.417126-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 12:23 AM, Alexander Bulekov wrote:
> Encapsulation offload (offload mode 1) is a valid mode present in the
> kernel that isn't implemented in QEMU, yet.
> 
> https://lore.kernel.org/lkml/20200528015426.8285-4-doshir@vmware.com/
> 
> Add a stub for this mode, to avoid the guest-triggerable assertion.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/517
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  hw/net/vmxnet3.c | 5 +++++
>  hw/net/vmxnet3.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 41f796a247..62e11d0e3e 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -443,6 +443,11 @@ vmxnet3_setup_tx_offloads(VMXNET3State *s)
>          net_tx_pkt_build_vheader(s->tx_pkt, false, false, 0);
>          break;
>  
> +    case VMXNET3_OM_ENCAP:
> +        VMW_PKPRN("Encapsulation offload requested, but not available\n");
> +        return false;
> +        break;

No need to break if you returned (unreachable).

> +
>      case VMXNET3_OM_CSUM:
>          net_tx_pkt_build_vheader(s->tx_pkt, false, true, 0);
>          VMW_PKPRN("L4 CSO requested\n");
> diff --git a/hw/net/vmxnet3.h b/hw/net/vmxnet3.h
> index 5b3b76ba7a..36a17b82aa 100644
> --- a/hw/net/vmxnet3.h
> +++ b/hw/net/vmxnet3.h
> @@ -273,6 +273,7 @@ struct Vmxnet3_TxDesc {
>  
>  /* TxDesc.OM values */
>  #define VMXNET3_OM_NONE        0
> +#define VMXNET3_OM_ENCAP       1
>  #define VMXNET3_OM_CSUM        2
>  #define VMXNET3_OM_TSO        3
>  
> 


