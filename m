Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E42B359F
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 16:04:36 +0100 (CET)
Received: from localhost ([::1]:47522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keJZz-0002Fk-11
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 10:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keJYd-0001g5-VD
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 10:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keJYb-0002An-57
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 10:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605452587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZNerx0NuasBF/VoD3sPh+wO1jzxvpgrEpggJesm+1A=;
 b=Arv0OkwWaKMqn52Wxi/clnCSsG1vxm5dTZlIFrggDO8sLvCqjnT2yCZg3KgrKr+d0mh4tE
 HIyOurcgYvk88K6IbBl3s5ySfaRz4aphX7qxw0RcGm25mlUIyZYX6TpnhXpY9BBIenyPkY
 L2DQGawQ5irngVxaDWT40NIXwKw4XRA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-5ktPhUBIMPCfSRavE8hQwQ-1; Sun, 15 Nov 2020 10:03:06 -0500
X-MC-Unique: 5ktPhUBIMPCfSRavE8hQwQ-1
Received: by mail-wr1-f70.google.com with SMTP id 67so9383678wra.2
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 07:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9ZNerx0NuasBF/VoD3sPh+wO1jzxvpgrEpggJesm+1A=;
 b=Rm5hB94+laGaGHribLeaADcUmol6b+A5TIZV5TxgyXeDT9UPpzxfKzT3/mhWgeoyVC
 ReaBd8dNcbJ2g1umLpGPgOdPR7KdUUo/CINTug3ETqRz9zs15IUnV/0njKX10dpLvKDq
 4j9nOb8rn/vMsSUOnPjS/ve6WyjMW2fWCU6dQVaOY9uOa5hncp4bwcNyfo3Uxcmglvz8
 rksZWWpVlP0TTydVsPUoDESBflsgeBy7LH7ska2sNIGnB8bp6AuJyUe3dea4LIDz33q+
 bjxl0HaEO2xJUtiwSx96fpyyzJhQ76FO6Sytk5AQlCMrPmHmJXVUU5eixERbqcZ/5SGg
 TuuQ==
X-Gm-Message-State: AOAM532Lt2bRpH+IH+bvJfMgB40pNQmkotFtDBj9GoTINk/rRSr9ftbr
 FWJ2Dd6LhYf/fteHMe9CW1eaBTO6nqVmxHbQYDAr6hv8M9OzVfv2YDbOypswgQTQ8QuEqbZegKY
 xu5yOSiz1TVnvvSg=
X-Received: by 2002:a1c:23cf:: with SMTP id j198mr11103050wmj.6.1605452585036; 
 Sun, 15 Nov 2020 07:03:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKaU+OOSUTFi1TX0E4onGfSoazqyVlZ4WyTDQncgt3CQLJ7gesHe1pcj3/63/eT9hmRNwncA==
X-Received: by 2002:a1c:23cf:: with SMTP id j198mr11103026wmj.6.1605452584773; 
 Sun, 15 Nov 2020 07:03:04 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id f23sm15924999wmb.43.2020.11.15.07.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Nov 2020 07:03:03 -0800 (PST)
Subject: Re: [RFC] vfio-pci/migration: Dirty logging of the Memory BAR region?
To: Zenghui Yu <yuzenghui@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <fd18627a-e012-1af8-9d9f-9ae8a1415258@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2825e816-9ade-07f9-19e3-ccfd57ffb568@redhat.com>
Date: Sun, 15 Nov 2020 16:03:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <fd18627a-e012-1af8-9d9f-9ae8a1415258@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 10:03:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: wanghaibin.wang@huawei.com, Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/11/20 15:31, Zenghui Yu wrote:
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 71951fe4dc..0958db1a08 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1806,7 +1806,10 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
>   uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
>   {
>       uint8_t mask = mr->dirty_log_mask;
> -    if (global_dirty_log && (mr->ram_block || 
> memory_region_is_iommu(mr))) {
> +    RAMBlock *rb = mr->ram_block;
> +
> +    if (global_dirty_log && ((rb && qemu_ram_is_migratable(rb)) ||
> +                             memory_region_is_iommu(mr))) {
>           mask |= (1 << DIRTY_MEMORY_MIGRATION);
>       }
>       return mask;

Yes, this makes sense.  Please send it as a patch, thanks!

Paolo


