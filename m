Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F392489457
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:54:32 +0100 (CET)
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qRh-0001hU-Sw
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:54:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qLF-0004C6-Cz
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:47:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qLC-0006g8-Vy
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641804466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhJh5aCdkDLT7s5aeXna3G6nrfUYOGVsK+FAdDNKH8c=;
 b=Tb28aOXRTxVWEgM8Td0KLN0JZedny+K8jrKplhzkUCf03HnWmDZ2BsWmYT0VbAVNTj0IXk
 u79pe1ISSWXKDwPQdQXAJ6nvBzzT09QigyuKsoDZcl9cbjJBp7eIfEQp9SyTFNfsa31RYU
 OvT2q7yDAKAn60JyZ2sbu80ieFs9zAI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-Q4bg_sCrMj-3ZtMkNHfcpg-1; Mon, 10 Jan 2022 03:47:45 -0500
X-MC-Unique: Q4bg_sCrMj-3ZtMkNHfcpg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z10-20020a05640235ca00b003f8efab3342so9551031edc.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 00:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mhJh5aCdkDLT7s5aeXna3G6nrfUYOGVsK+FAdDNKH8c=;
 b=GPdYCgaJFmKJinBdTzu1Tm8k/zZ32JnIyqaRQUTByvvbZVSLRCVp+tjkH3ABC+jtJz
 SvhsF7IfeZOaaYsJ08IrR0X5empmKAkBchJ4CDlBYujHbYy11tORusXZAFVQjQ4NNCwg
 9MR7/j9BB/FQGuIiTV1k6h3Fw6JG/1OxN/UkdXTP2disnpKjC5eO1wAepWmuYcvLaWDk
 ZxuYeAlsdxHQ089fibZ8os3EVEF4b0bUNROLB+ghgb94xd9EuQkvFgqVOHobTb48COwu
 0z9lYacnhtiyhpK+aPyWx7lQkEl8xFWHRY8kOFzxrwQRHxX2C9+63w6qaoJRv1zhzK1Q
 74mA==
X-Gm-Message-State: AOAM533HGM1A5EiWjeVkdEzpQgHh8kfSW38/dgYtM58TMv7WPOM6/U8E
 774rXn/igMjlTfvhZi1eVomh9RfLRJyPfsuGkinJM8C6K4sJpr0xg+YB0RfEXsbXsM5Mw3WU3P5
 GzK/PxrWFYKmrGcY=
X-Received: by 2002:a17:906:cc84:: with SMTP id
 oq4mr57055276ejb.736.1641804464139; 
 Mon, 10 Jan 2022 00:47:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfjWcdDoQ7GMCkOoNdvxS8tdbEBAx94kkAS9nPaWNvu5LP/VmT5dgT9ImztEBqHKWHnJF+Ug==
X-Received: by 2002:a17:906:cc84:: with SMTP id
 oq4mr57055268ejb.736.1641804463961; 
 Mon, 10 Jan 2022 00:47:43 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id r3sm2168642ejr.79.2022.01.10.00.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:47:43 -0800 (PST)
Message-ID: <8cdcb7a6-f866-6983-a63d-702f0e2ac354@redhat.com>
Date: Mon, 10 Jan 2022 09:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 7/9] hw/dma: Fix format string issues using dma_addr_t
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-8-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220104085431.2122999-8-f4bug@amsat.org>
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.01.22 09:54, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/ide/ahci.c        | 2 +-
>  hw/rdma/trace-events | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> index 205dfdc6622..6c727dd0c08 100644
> --- a/hw/ide/ahci.c
> +++ b/hw/ide/ahci.c
> @@ -1159,7 +1159,7 @@ static void process_ncq_command(AHCIState *s, int port, const uint8_t *cmd_fis,
>      ahci_populate_sglist(ad, &ncq_tfs->sglist, ncq_tfs->cmdh, size, 0);
>  
>      if (ncq_tfs->sglist.size < size) {
> -        error_report("ahci: PRDT length for NCQ command (0x%zx) "
> +        error_report("ahci: PRDT length for NCQ command (0x" DMA_ADDR_FMT ") "
>                       "is smaller than the requested size (0x%zx)",
>                       ncq_tfs->sglist.size, size);
>          ncq_err(ncq_tfs);
> diff --git a/hw/rdma/trace-events b/hw/rdma/trace-events
> index 9accb149734..c23175120e1 100644
> --- a/hw/rdma/trace-events
> +++ b/hw/rdma/trace-events
> @@ -27,5 +27,5 @@ rdma_rm_alloc_qp(uint32_t rm_qpn, uint32_t backend_qpn, uint8_t qp_type) "rm_qpn
>  rdma_rm_modify_qp(uint32_t qpn, uint32_t attr_mask, int qp_state, uint8_t sgid_idx) "qpn=0x%x, attr_mask=0x%x, qp_state=%d, sgid_idx=%d"
>  
>  # rdma_utils.c
> -rdma_pci_dma_map(uint64_t addr, void *vaddr, uint64_t len) "0x%"PRIx64" -> %p (len=%" PRId64")"
> +rdma_pci_dma_map(uint64_t addr, void *vaddr, uint64_t len) "0x%"PRIx64" -> %p (len=%" PRIu64")"
>  rdma_pci_dma_unmap(void *vaddr) "%p"

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


