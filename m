Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63BD310D23
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:26:42 +0100 (CET)
Received: from localhost ([::1]:45890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l830L-0006mP-Uy
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82tC-0005t1-O6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:19:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82t7-0000tX-FW
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612538350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqTAOZK9CE1PPCXsSwtDn6iyqomK+bZghLCsoaPe4GY=;
 b=ce1eEf/3R/Ns3iSeAqi6iZ8TvAsbHOAQLJpwYc1XOyu6Fzz+cdeTzUPmmVt39RMH2a75tR
 R9XoqctnKBJBaV7Z7F2SExJxZl2uUONHUDVnG6uxdvGbEPwcOSkBCsgVfNNcqmxQybB1Xp
 sPJUgOtFW6i/N1QV8DTgjIeQR5T9sOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-mRrzRsjhPtaIPrTZP-vPsA-1; Fri, 05 Feb 2021 10:19:07 -0500
X-MC-Unique: mRrzRsjhPtaIPrTZP-vPsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFE24100A8EC;
 Fri,  5 Feb 2021 15:19:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 694C219C47;
 Fri,  5 Feb 2021 15:19:03 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:19:00 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 8/9] hw/arm/virt: Restrict 32-bit CPUs to TCG
Message-ID: <20210205151900.7rqsv6evey6erfqh@kamzik.brq.redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-9-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-9-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 03:43:44PM +0100, Philippe Mathieu-Daudé wrote:
> Support for ARMv7 has been dropped in commit 82bf7ae84ce
> ("target/arm: Remove KVM support for 32-bit Arm hosts").
> Restrict the 32-bit CPUs to --enable-tcg builds.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/virt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f5e4a6ec914..ab6300650f9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -197,8 +197,10 @@ static const int a15irqmap[] = {
>  };
>  
>  static const char *valid_cpus[] = {
> +#ifdef CONFIG_TCG
>      ARM_CPU_TYPE_NAME("cortex-a7"),
>      ARM_CPU_TYPE_NAME("cortex-a15"),
> +#endif /* CONFIG_TCG */
>  #ifdef TARGET_AARCH64
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
> -- 
> 2.26.2
>

So this filters the cpus out of KVM only builds, which seems
reasonable to do. Of course, if the build is for both KVM and
TCG, then the cpus won't be filtered out and we'll have to rely
on the runtime checks to error out if one where to try a 32-bit
cpu with KVM. But that's fine too, so

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


