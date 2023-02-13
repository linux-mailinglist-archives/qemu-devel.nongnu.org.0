Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFD569473B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:41:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZ5L-00069u-T5; Mon, 13 Feb 2023 08:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRZ5J-00069L-8d
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:41:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRZ5H-00029q-No
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676295690;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lePZeUeDiJKkZXpc5paQK08CVkUShdrgVou8Zzwyzmg=;
 b=fDPy3+PBbQqRSv3SJQW7di5grJDLV6ZK7ht1Tip1JsYh6bDqjZ4iPdUbEjgvIn4d1YPNEM
 Vr+rP5jG95u0BTsY/Hyyq6NYF0MdqrOkMK/O61rKcDhJS+z67b4NEqKoW+jUy/tNTjpnKM
 YC+AJ75YX7ek/9R1a5jyzVI8Uwv0mCM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-wE09DJ26Mt6pAACXtHsoQQ-1; Mon, 13 Feb 2023 08:41:27 -0500
X-MC-Unique: wE09DJ26Mt6pAACXtHsoQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B9D82A59575;
 Mon, 13 Feb 2023 13:41:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F18D2166B26;
 Mon, 13 Feb 2023 13:41:22 +0000 (UTC)
Date: Mon, 13 Feb 2023 13:41:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: Re: [RFC 04/52] i386/WHPX: Fix error message when fail to set
 ProcessorCount
Message-ID: <Y+o9/45iHAn2+eUv@redhat.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-5-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230213095035.158240-5-zhao1.liu@linux.intel.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 13, 2023 at 05:49:47PM +0800, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> 003f230 (machine: Tweak the order of topology members in struct
> CpuTopology) changes the meaning of MachineState.smp.cores from "the
> number of cores in one package" to "the number of cores in one die"
> and doesn't fix other uses of MachineState.smp.cores. And because of
> the introduction of cluster, now smp.cores just means "the number of
> cores in one cluster". This clearly does not fit the semantics here.
> 
> And before this error message, WHvSetPartitionProperty() is called to
> set prop.ProcessorCount.
> 
> So the error message should show the prop.ProcessorCount other than
> "cores per cluster" or "cores per package".
> 
> Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  target/i386/whpx/whpx-all.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This patch and the 3 patches before it all look like basic bug
fixes to current code, not really part of the new hybrid topology
feature work.

As such I'd suggest sending these first four patches as a separate
series, so the bug fixes can be merged fairly quickly. I expect the
rest of the hybrid topology series is going to take a long time to
get agreement on, so no need to delay the easy bug fixes.

> 
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index e738d83e8191..fc349f887e47 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -2613,8 +2613,8 @@ static int whpx_accel_init(MachineState *ms)
>          sizeof(WHV_PARTITION_PROPERTY));
>  
>      if (FAILED(hr)) {
> -        error_report("WHPX: Failed to set partition core count to %d,"
> -                     " hr=%08lx", ms->smp.cores, hr);
> +        error_report("WHPX: Failed to set partition processor count to %d,"
> +                     " hr=%08lx", prop.ProcessorCount, hr);
>          ret = -EINVAL;
>          goto error;
>      }
> -- 
> 2.34.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


