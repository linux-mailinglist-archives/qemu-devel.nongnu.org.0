Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB46048944B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:52:44 +0100 (CET)
Received: from localhost ([::1]:40214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qPz-0006Mv-RI
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:52:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qIu-0001Ia-Vw
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:45:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qIt-00068t-Au
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641804322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GsSOMtTzhC03Dq8Ri8WrmnCyB1kxLRzrvgvBgMqhsLo=;
 b=WlA9QGxyROM4y/kcYUUa8VMN/BwTUUbcsCNJQagXcAtIH3syUUCnQXe9fbP2FJiG8kHsA+
 a57rzp3faMjhcaPNkBh8FLoBkAFPp1rbMpuASY/uXY3ZPDvnHhZUTxjjVWURLlRQnrMEC+
 g7gKkCKm8JKK1KtBfSWyuoYW5fJCJ+g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-3DaiDPv-NQ6uBNdvIb3_7g-1; Mon, 10 Jan 2022 03:45:21 -0500
X-MC-Unique: 3DaiDPv-NQ6uBNdvIb3_7g-1
Received: by mail-ed1-f70.google.com with SMTP id
 q15-20020a056402518f00b003f87abf9c37so9519237edd.15
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 00:45:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GsSOMtTzhC03Dq8Ri8WrmnCyB1kxLRzrvgvBgMqhsLo=;
 b=rD5G4ubj2NLtElO8KtFtRIM5FFgxvHKG1+dvJ0e34EhmxFcHocee1SwtCKlSIcUBPY
 40Puh9yUZRs617DM0On8Sty4tAfdYw3BReCWsOwaB76PPUaWwV/BHu+YNOYAGiQBch/3
 BKM01eRcnDdDTq5H0RqU5CrPMr+IqDvH9vGmFDUR3Z4AstBG5cPeB1hjWqMYYueeMRe4
 Mlc6z4ObE4QZ+NdRR454fiiiW5fmEw8fPs9OCBoPB5ju3jF5h+tNy5vAKAQ+eC7J+nP1
 3U4xexS2aJAP6rHQmj9YLUgyzCmm0O/B1ftX4CSgO7SLlsXnvdZ7IZNMW5zaSODmh0H5
 wSXw==
X-Gm-Message-State: AOAM531DzSA6FudW+lBT/pE8r+RmRefKyVQ9oJcp2hP/JARraip3gQbH
 KqK0ihaGWDOTOcDAtjfI7IO1tjytZafecTWZrLaAnTUKxlf5OBMaorS4f9b+MnPU+BtZRiNyvhB
 2Ec3MykNOezBuur8=
X-Received: by 2002:a05:6402:524d:: with SMTP id
 t13mr74011983edd.336.1641804320157; 
 Mon, 10 Jan 2022 00:45:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAt+vUDYr0OdnUpLIhZxrS9uebOO4mmT829o08BtMjR8CpAKMKxFxHel2HswiGLFutLu7D8A==
X-Received: by 2002:a05:6402:524d:: with SMTP id
 t13mr74011967edd.336.1641804320005; 
 Mon, 10 Jan 2022 00:45:20 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id oz31sm2150743ejc.35.2022.01.10.00.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:45:19 -0800 (PST)
Message-ID: <9896a730-e717-b98b-5dd8-6f2034418242@redhat.com>
Date: Mon, 10 Jan 2022 09:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/9] hw/dma: Remove CONFIG_USER_ONLY check
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-5-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220104085431.2122999-5-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.01.22 09:54, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> DMA API should not be included in user-mode emulation.
> If so, build should fail. Remove the CONFIG_USER_ONLY check.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/sysemu/dma.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index b3faef41b2f..0db2478a506 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -31,8 +31,6 @@ struct QEMUSGList {
>      AddressSpace *as;
>  };
>  
> -#ifndef CONFIG_USER_ONLY
> -
>  /*
>   * When an IOMMU is present, bus addresses become distinct from
>   * CPU/memory physical addresses and may be a different size.  Because
> @@ -288,7 +286,6 @@ void qemu_sglist_init(QEMUSGList *qsg, DeviceState *dev, int alloc_hint,
>                        AddressSpace *as);
>  void qemu_sglist_add(QEMUSGList *qsg, dma_addr_t base, dma_addr_t len);
>  void qemu_sglist_destroy(QEMUSGList *qsg);
> -#endif
>  
>  typedef BlockAIOCB *DMAIOFunc(int64_t offset, QEMUIOVector *iov,
>                                BlockCompletionFunc *cb, void *cb_opaque,

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


