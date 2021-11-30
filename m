Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ACC4636C2
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 15:33:15 +0100 (CET)
Received: from localhost ([::1]:39776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms4C2-0007lP-0Z
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 09:33:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ms4Ag-000745-PP
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 09:31:50 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:49758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ms4Af-0002tb-9T
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 09:31:50 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BAFAA21891;
 Tue, 30 Nov 2021 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638282706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVtoXBVkQ9Xw+ey2nMV2LfetsgCvTR/zMDM+QqN30p8=;
 b=RdCi7RE+jEq0f4OgOLiJKX8p7R17BH08oNr4aDCuMjKISfRR9oftQ3/rkDmZLcyJxT7KrF
 w/8cH4jXgL9rBvaqILk8BES7z+aLRix1loRILK+5a+lXzIpigaFeOCKVO6/93c4UaDBILl
 8ptmEOY7VevkDRFXCO66g8eGPxs91Ik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638282706;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVtoXBVkQ9Xw+ey2nMV2LfetsgCvTR/zMDM+QqN30p8=;
 b=+lqnKHWnmeDIh5Y7LMyV1I9MPnd5eiLQNgZy6+2gYNeqiHx6clViRLsodo7HTnyHLziCWW
 tL/OI4wCTFuAkiCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 68E9E13D4E;
 Tue, 30 Nov 2021 14:31:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v3i4F9I1pmHLOQAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 30 Nov 2021 14:31:46 +0000
Subject: Re: [PATCH 2/2] intel_iommu: Fix irqchip / X2APIC configuration checks
To: David Woodhouse <dwmw2@infradead.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
References: <20210723112921.12637-1-cfontana@suse.de>
 <1102c315addf2f2fffc49222ab5be118e7ae9b0f.camel@amazon.co.uk>
 <f5910284-14ca-8796-4e64-38fef246bd19@suse.de>
 <e57e2119df69ac190cdd763b7ac8d5894b110839.camel@infradead.org>
 <b613015e-3285-8d30-292f-6bf9816b1912@suse.de>
 <d579bf46d0babc9eece1dc3e8ec63c43b311b022.camel@infradead.org>
 <483ebe21-2972-90c0-bc9a-ce922518632d@suse.de>
 <bdd861f68aa1533b2ea752c6509c03ca7b9f0279.camel@infradead.org>
 <93efa230-fb6b-fdc7-a696-c555676da2b4@suse.de>
 <d437972602decfeb392b08563589952358bdd510.camel@infradead.org>
 <9990ade1-ccfa-a712-94c0-1667f5b3094f@suse.de>
 <41878a65209a3e1fc00bdafd216004c9f71b90fa.camel@infradead.org>
 <26e2621ab6cef4d8c3e944dc9ebb6d2d0d5e9d2d.camel@infradead.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <0d92bf34-1025-ad91-ae02-7417fe9fa284@suse.de>
Date: Tue, 30 Nov 2021 15:31:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <26e2621ab6cef4d8c3e944dc9ebb6d2d0d5e9d2d.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "alxndr@bu.edu" <alxndr@bu.edu>, "philmd@redhat.com" <philmd@redhat.com>,
 "lovemrd@gmail.com" <lovemrd@gmail.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acked-by: Claudio Fontana <cfontana@suse.de>

I'll try to find time tonight to give you a tested by.

Ciao,

Claudio

On 11/30/21 2:42 PM, David Woodhouse wrote:
> We don't need to check kvm_enable_x2apic(). It's perfectly OK to support
> interrupt remapping even if we can't address CPUs above 254. Kind of
> pointless, but still functional.
> 
> The check on kvm_enable_x2apic() needs to happen *anyway* in order to
> allow CPUs above 254 even without an IOMMU, so allow that to happen
> elsewhere.
> 
> However, we do require the *split* irqchip in order to rewrite I/OAPIC
> destinations. So fix that check while we're here.
> 
> Signed-off-by: David Woodhouse <dwmw2@infradead.org>
> ---
>  hw/i386/intel_iommu.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 294499ee20..b0439d0fbf 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3746,15 +3746,10 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
>                                                ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>      }
>      if (s->intr_eim == ON_OFF_AUTO_ON && !s->buggy_eim) {
> -        if (!kvm_irqchip_in_kernel()) {
> +        if (!kvm_irqchip_is_split()) {
>              error_setg(errp, "eim=on requires accel=kvm,kernel-irqchip=split");
>              return false;
>          }
> -        if (!kvm_enable_x2apic()) {
> -            error_setg(errp, "eim=on requires support on the KVM side"
> -                             "(X2APIC_API, first shipped in v4.7)");
> -            return false;
> -        }
>      }
>  
>      /* Currently only address widths supported are 39 and 48 bits */
> 


