Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D55E4A5969
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 10:44:18 +0100 (CET)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEphx-00026d-C0
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 04:44:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEpPO-0000hD-CI
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEpPM-000402-Nh
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643707504;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFrQtaYxyufLSVgOBhAqVb0F+Vs3jj0XRIX2scnsb24=;
 b=DhEK56F3usa36cwZHusq24UUi3wJGa4Rh654tRPwhBENd0tffFhJHcEwo1E1jcnGu9Aeo/
 vGd/Hd8b1uW51mHN+5QnNg/8e0+nZl5X7ERapUeegICjnOfvjWApM5ZDlCMEecewKKgAwu
 gQ86FdEhQYe7orZ3wZkMgocLGdLPOlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-S3OIshy2Pde-QlXb-jyRXw-1; Tue, 01 Feb 2022 04:25:00 -0500
X-MC-Unique: S3OIshy2Pde-QlXb-jyRXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35C6E8144E0;
 Tue,  1 Feb 2022 09:24:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2B6710840C8;
 Tue,  1 Feb 2022 09:24:34 +0000 (UTC)
Date: Tue, 1 Feb 2022 09:24:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 1/2] hw/i386: Attach CPUs to machine
Message-ID: <Yfj8UHW77tC5R2ZI@redhat.com>
References: <20220131233507.334174-1-f4bug@amsat.org>
 <20220131233507.334174-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220131233507.334174-2-f4bug@amsat.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc libvir-list since this will (intentionally) break compatibility
with current libvirt code that looks for "/machine/unattached/device[0]"
in the assumption it is the first CPU.

On Tue, Feb 01, 2022 at 12:35:06AM +0100, Philippe Mathieu-Daudé wrote:
> Previously CPUs were exposed in the QOM tree at a path
> 
>   /machine/unattached/device[nn]
> 
> where the 'nn' of the first CPU is usually zero, but can
> vary depending on what devices were already created.
> 
> With this change the CPUs are now at
> 
>   /machine/cpu[nn]
> 
> where the 'nn' of the first CPU is always zero.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i386/x86.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index b84840a1bb9..50bf249c700 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -108,6 +108,7 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
>  {
>      Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
>  
> +    object_property_add_child(OBJECT(x86ms), "cpu[*]", OBJECT(cpu));
>      if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
>          goto out;
>      }
> -- 
> 2.34.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


