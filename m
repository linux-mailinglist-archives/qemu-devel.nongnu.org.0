Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5819333E0B8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:42:40 +0100 (CET)
Received: from localhost ([::1]:49502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHSZ-0001Dk-CC
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lMHQ5-0008An-Pw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lMHPn-0005rg-0t
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615930784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YSLlLW7dXraOmx390+NJO81+fSbkdsoo1mMbg7KetZw=;
 b=RdQ6h1337ZK5d0o3y0JV3dq9YIGDwGNndLlCGISNRLXj/8k9WHK+eEfyEXI3Ehy6yBXFw0
 9l+rZbw2SQDQSswRt7PTAOE6PpyV93RfZFxrsGolJAffWkFKJL+yrBdu+D5INXKEWHTSOG
 W1qGa41gX9XwTTSZVqTJib52kkQudxA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-hCwbiXnnPeq_1S8-V72bjg-1; Tue, 16 Mar 2021 17:39:40 -0400
X-MC-Unique: hCwbiXnnPeq_1S8-V72bjg-1
Received: by mail-qv1-f71.google.com with SMTP id h12so26294773qvm.9
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YSLlLW7dXraOmx390+NJO81+fSbkdsoo1mMbg7KetZw=;
 b=TN4cADRmXYcp4h0eAp7DhQxbS0VyOMzpg2eP5I4hxb94aDuEVJMVmjU8XlIuI61vLh
 VjJnYtif26PZrQjZ/z5uGJuhKXQq1rjProhVW1UICLS4cB6oHdj2T90fGsvkF0/5NRMK
 l1w8drKm+xrWz6/Vm8N041rbOQjTgaNSkMKVLvPMo9fnRxqOehaT0bmTZ5G3M9bMFunC
 KvDgvim5QoOFS/Ab8Aaj6UoxqIQHBXXjGRUVWdpI2vWc9QjCynnNZsqgT7xDBKV1LEW2
 IaeW1qrnCBNTw1YUxUFLu8Eq4MAvm1t05zo1cvJ5Q0CF0PWCDWamN3ShePGHxkJ1I5TZ
 ZVYA==
X-Gm-Message-State: AOAM531kkHeYAYlCO1Hh4/8WzJUOiELb6vGUK4zx/djHOz5tRvxkIKq3
 ErsbDtiyt0sIP4h8RTEpGu3tMVjkY2bWh1dkouadvrLCb0ZBoU5DPeGYzw+NsrRi/habcUANZVN
 D54vKoj5TC8lOouM=
X-Received: by 2002:a05:620a:e10:: with SMTP id
 y16mr1164367qkm.375.1615930780250; 
 Tue, 16 Mar 2021 14:39:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOgCFNnhgurg/Lmx2mSK2ea8y2jIYAFQzYP5RIGMRBGfX4JvO/BmeCTBKfTYaPhurj9kBRtw==
X-Received: by 2002:a05:620a:e10:: with SMTP id
 y16mr1164349qkm.375.1615930780045; 
 Tue, 16 Mar 2021 14:39:40 -0700 (PDT)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id y1sm15743421qki.9.2021.03.16.14.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 14:39:39 -0700 (PDT)
Date: Tue, 16 Mar 2021 17:39:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v4 2/2] migration/ram: Optimize ram_save_host_page()
Message-ID: <20210316213937.GG395976@xz-x1>
References: <20210316125716.1243-1-jiangkunkun@huawei.com>
 <20210316125716.1243-3-jiangkunkun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210316125716.1243-3-jiangkunkun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 08:57:16PM +0800, Kunkun Jiang wrote:
> Starting from pss->page, ram_save_host_page() will check every page
> and send the dirty pages up to the end of the current host page or
> the boundary of used_length of the block. If the host page size is
> a huge page, the step "check" will take a lot of time.
> 
> It will improve performance to use migration_bitmap_find_dirty().
> 
> Tested on Kunpeng 920; VM parameters: 1U 4G (page size 1G)
> The time of ram_save_host_page() in the last round of ram saving:
> before optimize: 9250us		after optimize: 34us
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


