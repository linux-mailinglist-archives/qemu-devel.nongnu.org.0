Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95DB534EFF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:17:48 +0200 (CEST)
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCR2-0004uY-22
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nuBof-0006h5-Dl
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:38:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nuBoc-00012c-3A
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653565084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCnF/gVngT7MgubpfwTRTV0NWAk6kyLJ5Jkn1ZKwUfg=;
 b=aiQHyznTTyCmhyheNtru7/z5gGUJN+W5486h0NAuahILW5yEDVE53O3ti3XD0mcB8qIqk7
 I+d40NgVPDoHYj1EUIJbYjbuGnWli6Ezc83AguXnbTEEhK1GPwQXweNc5T/jxp0dDbvLlj
 OcYTnNzuktpvDNQN8X8Ntv7lkq3tgTg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-glDikZnNPyCE-bIQij5ipw-1; Thu, 26 May 2022 07:37:59 -0400
X-MC-Unique: glDikZnNPyCE-bIQij5ipw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0629D1C0518B;
 Thu, 26 May 2022 11:37:59 +0000 (UTC)
Received: from [10.72.12.91] (ovpn-12-91.pek2.redhat.com [10.72.12.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C34BC2166B29;
 Thu, 26 May 2022 11:37:50 +0000 (UTC)
Subject: Re: [PATCH 0/3] hw/acpi/aml-build: Fix {socket, cluster, core} IDs in
 PPTT
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, drjones@redhat.com, 
 wangyanan55@huawei.com, Jonathan.Cameron@Huawei.com,
 peter.maydell@linaro.org, berrange@redhat.com, thuth@redhat.com,
 eduardo@habkost.net, lvivier@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com
References: <20220518092141.1050852-1-gshan@redhat.com>
Message-ID: <5719fb28-0ab8-d8f8-c2c3-2e600451d6d8@redhat.com>
Date: Thu, 26 May 2022 19:37:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220518092141.1050852-1-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor, Yanan and maintainers,

On 5/18/22 5:21 PM, Gavin Shan wrote:
> The {socket, cluster, core} IDs detected from Linux guest aren't
> matching with what have been provided in PPTT. The flag used for
> 'ACPI Processor ID valid' is missed for {socket, cluster, core}
> nodes. In this case, Linux guest takes the offset between the
> node and PPTT header as the corresponding IDs, as the following
> logs show.
> 
> 
>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64    \
>    -accel kvm -machine virt,gic-version=host -cpu host       \
>    -smp 8,sockets=2,clusters=2,cores=2,threads=1
>      :
>      
>    # cd /sys/devices/system/cpu
>    # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
>      36  36  36  36  36  36  36  36
>      336 336 336 336 336 336 336 336
>    # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
>      56  56  56  56  196 196 196 196
>      356 356 356 356 496 496 496 496
>    # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
>      76  76  136 136 216 216 276 276
>      376 376 436 436 516 516 576 576
> 
> This fixes the issue by setting 'ACPI Processor ID valid' flag for
> {socket, cluster, core} nodes. With this applied, the IDs are exactly
> what have been provided in PPTT. I also checked the PPTT table on my
> host, where the 'ACPI Processor ID valid' is set for cluster/core nodes,
> but missed from socket nodes.
> 
>    host# pwd
>    /sys/devices/system/cpu
>    host# cat cpu0/topology/physical_package_id; \
>          cat cpu0/topology/cluster_id;          \
>          cat cpu0/topology/core_id
>    36 0 0
> 
> Gavin Shan (3):
>    tests/acpi/virt: Allow PPTT ACPI table changes
>    hw/acpi/aml-build: Fix {socket, cluster, core} IDs in PPTT
>    tests/acpi/virt: Update PPTT ACPI table
> 
>   hw/acpi/aml-build.c       |   9 ++++++---
>   tests/data/acpi/virt/PPTT | Bin 96 -> 96 bytes
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 

Could you help to review this tiny series? Thanks in advance.

Thanks,
Gavin


