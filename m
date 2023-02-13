Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A25694B34
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:32:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRaoL-0001gz-KS; Mon, 13 Feb 2023 10:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRaoF-0001gn-Lj
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:32:03 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRaoD-0006SJ-U6
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:32:03 -0500
Received: by mail-wr1-x42a.google.com with SMTP id by3so11343217wrb.10
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 07:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OYuKrJD7G/M4nWFmv0j+CKRAK52yHQNqI3M1SZS+h7I=;
 b=brtVBe74kpl4j0Mod2haiHLvtTF4PNbLVYoqYAAweER+LTSI+5BOF+C3dCUqk9wG5E
 lg43zNO8LKY/xbrx6jD/rzo3Hp5MVFMvWRIejhXU/Z+Mvxz8cQzy5gXb3Cmcs2PkF8Xw
 7nyzKw40b3xCF2eabaoY3I8igc8qpOcgf/fLZzrmuLXokxP2GWFzlWhFUYQo+Y7ClTME
 R337BBoi572aNRq1p3Fkc+JIDiiemV52ME9LVjNnvVMIw+WySumH2CXxtcXr8LzT6ScS
 WXTwPFe4NGTCG+2+EgS+ntiU4HhvV6f6E67dgXwl3Igc0kTRDWUFE8ntHb07Q/dIDHka
 3a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OYuKrJD7G/M4nWFmv0j+CKRAK52yHQNqI3M1SZS+h7I=;
 b=g/UnZCHRS3y5Q/rgo14M1EsVE4u4NCqShUiQcy/PEDp9kDkzowka2lA5t7goDOxBtU
 n3MrW8FRb9OmuJeJ8tVsMsNLSdS8p5+HlzhoZwRoQ9prmoRDjOQ9LwZITNMPkf9I/ft/
 B1ZYmIJ0PrOBsg9I8q2icagcgLLcIihKMnA8MQkaf5iST1bORyWVq4CfBCl5pyIAmFyD
 7HCGGReNyyHdaD1uehVrYqE6G1qF4JlCZ9+0fUEEPLqqFJQPtsQUSWwWdIJpD4DV6Ys6
 FnnC3MYcWoNaPazX7LIGQepmfKq6pebOt+mk6C5GQFCI91dZypMDFcZ3yBDr5oGsc9+W
 nWMg==
X-Gm-Message-State: AO0yUKXg4FZxE2YQeQX/Mt+gu/C8MGLkCsf2Jl63ImWZln75l7uxFh3Y
 +M/um8Rm1rvcHzIz10q6MB0=
X-Google-Smtp-Source: AK7set8tcZtkZgBJfviPJiijpf/jgXSyRRYZipCTkYOoVFQ1BwWR16LZztk+fexRhEiooKfsxy6L5Q==
X-Received: by 2002:a5d:6b4b:0:b0:2c3:ed18:2e96 with SMTP id
 x11-20020a5d6b4b000000b002c3ed182e96mr21563242wrw.13.1676302319915; 
 Mon, 13 Feb 2023 07:31:59 -0800 (PST)
Received: from [192.168.12.67] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 k6-20020adfe8c6000000b002c55551e6e9sm3989925wrn.108.2023.02.13.07.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 07:31:59 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <28fc143f-2de8-b893-0abf-210b4c34a7f7@xen.org>
Date: Mon, 13 Feb 2023 15:31:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 44/59] hw/xen: Support mapping grant frames
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-45-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-45-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_gnttab.c  | 74 ++++++++++++++++++++++++++++++++++++++-
>   hw/i386/kvm/xen_overlay.c |  2 +-
>   hw/i386/kvm/xen_overlay.h |  2 ++
>   3 files changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
> index ef8857e50c..cd8c3ae60d 100644
> --- a/hw/i386/kvm/xen_gnttab.c
> +++ b/hw/i386/kvm/xen_gnttab.c
> @@ -37,13 +37,27 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenGnttabState, XEN_GNTTAB)
>   #define XEN_PAGE_SHIFT 12
>   #define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
>   
> +#define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_t))
> +#define ENTRIES_PER_FRAME_V2 (XEN_PAGE_SIZE / sizeof(grant_entry_v2_t))
> +
>   struct XenGnttabState {
>       /*< private >*/
>       SysBusDevice busdev;
>       /*< public >*/
>   
> +    QemuMutex gnt_lock;
> +
>       uint32_t nr_frames;
>       uint32_t max_frames;
> +
> +    union {
> +        grant_entry_v1_t *v1;
> +        grant_entry_v2_t *v2;
> +    } entries;
> +

If you want to have v2 support, don't you need status frames too?

   Paul

> +    MemoryRegion gnt_frames;
> +    MemoryRegion *gnt_aliases;
> +    uint64_t *gnt_frame_gpas;
>   };
>   


