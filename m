Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DDD4368A2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 19:04:26 +0200 (CEST)
Received: from localhost ([::1]:40424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdbUP-0002zS-HA
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 13:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdbSK-00023m-9C
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 13:02:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdbSB-0006Fp-PP
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 13:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634835726;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIEcyY+72hdd64fnbUJnyNNG6Hc1AqFo1+h3b55i4GU=;
 b=V3Lo6z3Z+8l6ji4yWsfS7RlOvVLfefz1RjSh+B05kYHk7Y1wq2yXxmyPT1iNXmMQ/okxR1
 8QpHzUKRJwozgK1/YRQKvrETdpTAmnFeGc9zfSjAtLRSj54VYk4V3Byl7XM2K4u/zsfrO7
 tR2ex8tMT2ySLBsxe/yxKzissYO602s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-vInVRFJOOVGv5pYBAfKAJg-1; Thu, 21 Oct 2021 13:02:05 -0400
X-MC-Unique: vInVRFJOOVGv5pYBAfKAJg-1
Received: by mail-wm1-f69.google.com with SMTP id
 s3-20020a1ca903000000b0032326edebe1so129703wme.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 10:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=OIEcyY+72hdd64fnbUJnyNNG6Hc1AqFo1+h3b55i4GU=;
 b=Dw4w566xModpD5kG3rXZ5nv0PGcmivwS1N4b3/g33vwPXPD+78gQuTN1xQBBJK9rGR
 fG2jif8NB4xVTa/1k/loxcsu2UdLEFswYEgsWnXJIVzFhbWT3hhs4cOashgs4wVcJopI
 M+yv4gszbL9Nu3XHsmGqDVdcPIohohBo85LMQ758H7cZBY6jH7B29ZYYhE03CRGNEWSD
 JESdEoHSk+1clROSZhVFswoWAEgQeDCfxtxhzrRhL3K5G/hb0A4w7xIl7F6+UxXdFD6a
 0ZtI+bUFfHprGJGsLusJs0uBOMhZlO/2vYDeAU5CmKKTIm+V/y/9juAZc62ClyKP3a4W
 Jxpg==
X-Gm-Message-State: AOAM5311jxj6GadCMV1cCAExtA3QNdV6VD5HeHpJ4SJ/bVBzsNfyn57W
 VQ55o6Y1nrGCtWeGLhGbpT3MP4AEg5PJ2Q+Nv0gPGo2qh+X1q36UMZA/ZaBGG1nT+SR1KpGqpaW
 Vi4bWoS8c5kvDifk=
X-Received: by 2002:adf:9b97:: with SMTP id d23mr8420208wrc.53.1634835723756; 
 Thu, 21 Oct 2021 10:02:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9kym66qpoFSoQOn0Ut2iZfQ7odXkCL86fCJnzU25iVKGLCWoMSDDnU0qsjLzDFXAu4+waZQ==
X-Received: by 2002:adf:9b97:: with SMTP id d23mr8420172wrc.53.1634835723508; 
 Thu, 21 Oct 2021 10:02:03 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id j1sm6278670wrd.28.2021.10.21.10.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 10:02:02 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] vfio/common: Add trace point when a MMIO RAM
 section less than PAGE_SIZE
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210914015326.1494-1-jiangkunkun@huawei.com>
 <20210914015326.1494-3-jiangkunkun@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <4ff1afe8-2bff-985f-85cc-9ec68ed77a1b@redhat.com>
Date: Thu, 21 Oct 2021 19:02:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210914015326.1494-3-jiangkunkun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.867, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: wanghaibin.wang@huawei.com, tangnianyao@huawei.com, ganqixin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kunkun,

On 9/14/21 3:53 AM, Kunkun Jiang wrote:
> The MSI-X structures of some devices and other non-MSI-X structures
> are in the same BAR. They may share one host page, especially in the
may be in the same bar?
> case of large page granularity, such as 64K.
>
> For example, MSIX-Table size of 82599 NIC is 0x30 and the offset in
> Bar 3(size 64KB) is 0x0. If host page size is 64KB.
remove the '.'
In that case wouldn't the symptom be the same with a 4kB page?
> vfio_listener_region_add() will be called to map the remaining range
> (0x30-0xffff). And it will return early at
> 'int128_ge((int128_make64(iova), llend))' and hasn't any message.
s/and hasn't any message /without any message
> Let's add a trace point to informed users like commit 5c08600547c0
s/informed/inform
> ("vfio: Use a trace point when a RAM section cannot be DMA mapped")
> did.
>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  hw/vfio/common.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 8728d4d5c2..2fc6213c0f 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -892,6 +892,13 @@ static void vfio_listener_region_add(MemoryListener *listener,
>      llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
>  
>      if (int128_ge(int128_make64(iova), llend)) {
> +        if (memory_region_is_ram_device(section->mr)) {
> +            trace_vfio_listener_region_add_no_dma_map(
> +                memory_region_name(section->mr),
> +                section->offset_within_address_space,
> +                int128_getlo(section->size),
> +                qemu_real_host_page_size);
> +        }
>          return;
>      }
>      end = int128_get64(int128_sub(llend, int128_one()));
Thanks

Eric


