Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC0D4D7ACB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 07:27:19 +0100 (CET)
Received: from localhost ([::1]:47166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTeAn-0006MT-Uq
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 02:27:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nTe8G-0004Qz-Tf
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 02:24:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nTe8E-0002FS-G3
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 02:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647239075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Z5WWfBSf5eaaGbZO8/yTp39Lv7XafhTAv4YklOLmMA=;
 b=Lkzt+NUJomdx4r/JXvgoKK3a8KaXpKBHayZaHLgIsUKZ/ntjPKqq0OUYLnZXO4V8EenMEj
 AqagWcMOpME6pdhKUWkwdpRj+KP6ah+vd4g7g7zMOMGMuPnkt+GujWyHXMLbdMLp9awtGq
 X3b7JVPwIoJgh4nxIYPtjBU/KacH5J0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-gdxVFmxpOoiP_wZvR79lew-1; Mon, 14 Mar 2022 02:24:30 -0400
X-MC-Unique: gdxVFmxpOoiP_wZvR79lew-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ECD33C11A00;
 Mon, 14 Mar 2022 06:24:30 +0000 (UTC)
Received: from [10.72.12.179] (ovpn-12-179.pek2.redhat.com [10.72.12.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D5B95E3A23;
 Mon, 14 Mar 2022 06:24:25 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] hw/arm/virt: Fix CPU's default NUMA node ID
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
References: <20220303031152.145960-1-gshan@redhat.com>
Message-ID: <eec5ab0f-fcc1-cbd3-988c-e654ddb4932e@redhat.com>
Date: Mon, 14 Mar 2022 14:24:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220303031152.145960-1-gshan@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 3/3/22 11:11 AM, Gavin Shan wrote:
> When the CPU-to-NUMA association isn't provided by user, the default NUMA
> node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
> Unfortunately, the default NUMA node ID breaks socket boundary and leads to
> the broken CPU topology warning message in Linux guest. This series intends
> to fix the issue.
> 
> PATCH[1/3]: Fixes the broken CPU topology by considering the socket boundary
>              when the default NUMA node ID is calculated.
> PATCH[2/3]: Use the existing CPU topology to build PPTT table. However, the
>              cluster ID has to be calculated dynamically because there is no
>              corresponding information in CPU instance properties.
> PATCH[3/3]: Take thread ID as the ACPI processor ID in MDAT and SRAT tables.
> 
> Changelog
> =========
> v2:
>     * Populate the CPU topology in virt_possible_cpu_arch_ids() so that it
>       can be reused in virt_get_default_cpu_node_id()                          (Igor)
>     * Added PATCH[2/3] to use the existing CPU topology when PPTT table
>       is built                                                                 (Igor)
>     * Added PATCH[3/3] to take thread ID as ACPI processor ID in MADT and
>       SRAT table                                                               (Gavin)
> 

Kindly ping. Could you help to review when you have free cycles? :)

Thanks,
Gavin


