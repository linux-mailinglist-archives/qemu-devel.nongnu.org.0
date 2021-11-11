Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0350744D5DC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:34:21 +0100 (CET)
Received: from localhost ([::1]:60686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8LU-0005Os-5H
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:34:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml8Ji-0002fR-3c
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:32:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml8Je-00061w-3T
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636630345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2DYFdATKRdIwFFml0rGSqNsMJfK/HkRRQM8yFuK1+k=;
 b=XnoKlNgK5MXnsmAP8zkGVryD7cN6kQXPB9UykQERE5KWODW5Z+UbMfKOUI+J4+Bgx4s6Cd
 zd7sJ2i2Bai+0K9GC2RBsakQs8ujHmE8WcQjE3uXo5b084bvw1IT1yP8oenR4B6GIFfgQW
 rkaH+jnqb1ahYPtRYkPGDAd3yQJ6H/4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-whLxhLM-PU6dWYlv4YfncA-1; Thu, 11 Nov 2021 06:32:24 -0500
X-MC-Unique: whLxhLM-PU6dWYlv4YfncA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso964123wrw.10
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+2DYFdATKRdIwFFml0rGSqNsMJfK/HkRRQM8yFuK1+k=;
 b=FjNE2qdPTFtr3kwabY+/WGCkWC7TOuL2ipIXiCkofWu+fXDFp90dmBi9dt4IGS//Cm
 bLq4R/fI1IetZIXX5uby9qXetngfp64ZPAbyt+lljov10gj4hq1Fh4bnu7mk9twpfSIA
 mvqZUYTFVEur8dYa/FleRhX+2NIzp349MqLMu1B0Fi9+WDLq7aU7bSkbwtBrFZdjR9xA
 hiyGVRQz36/8Kg309uh9H+3qVxXj5e55tH9M9oyoMjbdfGU4Mb5adolzq72Unalc7czT
 2XxmNkob7Uvq/jJXLUYB+QE26P+81y1M7N5QVrtlX3Pe7u97didOZB0Q3Vh5XEFpIc3E
 PtvA==
X-Gm-Message-State: AOAM533OHDvSw4mIxA4lyanGVYL0l2q35itm21AAJbcEZZFV03XVMDaV
 JPKRNIR1iZ/S40b3pqswzdK3MMnJCQJRPH+r4MR3chAbVontEndl2crCbiLGxdxSy3idfp3PazL
 rRrBY+Vgm9Y7jAZA=
X-Received: by 2002:a05:6000:11c3:: with SMTP id
 i3mr8150135wrx.426.1636630343134; 
 Thu, 11 Nov 2021 03:32:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze2t6cL/XpyPvGWeael++ArLKy5RGdL/9HRHE+1gueGr02T2QqTtXbxJ4xjPHTisd7MWmB4Q==
X-Received: by 2002:a05:6000:11c3:: with SMTP id
 i3mr8150117wrx.426.1636630342976; 
 Thu, 11 Nov 2021 03:32:22 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 126sm8238964wmz.28.2021.11.11.03.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:32:22 -0800 (PST)
Message-ID: <aeb26fb1-8d3a-48f3-7b5f-b6996ab8b3ba@redhat.com>
Date: Thu, 11 Nov 2021 12:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/5] virtio-gpu: do not byteswap padding
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-2-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211111110604.207376-2-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: mlevitsk@redhat.com, cohuck@redhat.com, alex.bennee@linaro.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 12:06, Paolo Bonzini wrote:
> In Linux 5.16, the padding of struct virtio_gpu_ctrl_hdr has become a
> single-byte field followed by a uint8_t[3] array of padding bytes,
> and virtio_gpu_ctrl_hdr_bswap does not compile anymore.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/hw/virtio/virtio-gpu-bswap.h | 1 -
>  1 file changed, 1 deletion(-)

:)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


