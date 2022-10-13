Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4765FDBA5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:53:55 +0200 (CEST)
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyen-000083-KZ
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiyAJ-0004km-OL
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:22:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiyAB-0003ft-9I
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665667332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Np/xKXltzXPRoyGoqjxon73Wso5Ilyk/NloINlOdpl0=;
 b=RsG9iAJP05E7ukfTbW4dpkkeTzfYT+Gg5bdF3ym+Rdc/64O4UYT3kTVnwkrDqlFG9J2ApT
 pBlFbwz4FhG/dx+ibwfi/nFOuw8qsVdY0s/dMGf6XcCUjubgx5WxKQ2j7bscP/EYmHDlvl
 GZVKZkf2KVx0PsvdgcF0qopYAkRoaws=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-Xrqy1dHtMWyCF85zoo10WQ-1; Thu, 13 Oct 2022 09:22:11 -0400
X-MC-Unique: Xrqy1dHtMWyCF85zoo10WQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c3-20020a7bc843000000b003b486fc6a40so822702wml.7
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 06:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Np/xKXltzXPRoyGoqjxon73Wso5Ilyk/NloINlOdpl0=;
 b=w4PN2OvDmcBdNBwGMl8GScJagLquc1cezZ5L0Jg0uw6PsBSp0YQWbN95WTclwmYPnY
 GCIE2CoUYiKUU0ro8jxGALsNtTTOsmu2iWUz1Km1hac0ODE5WJ892UNSD1srcka7ZKbJ
 v9nN4wbDMVoCA/ALFkp3cPHQrfDeqDbWfoqvVWI/A8L9FwSIr95KcvzXM0QPud9t5DiH
 Qi0jlKVDEtArmeHEGUD9KxfiM3ywct1LRP4kf5CbfAWg08PVFWyvnhOu/CWnLOhaHXjG
 dfUXGxvEzV5zgNTAXHmq1UC2GVmD8igsGBRMZRNUIWpvdLfGtWKPl/TdiznOFc+5lEv+
 BuGA==
X-Gm-Message-State: ACrzQf0Es99Pkj6ZpuzckbLraZPp/AiDfc0LaG5+ODX+6swnHkLZ/7wY
 vtZlsfBDvA7CXOwCmy8HZwUUE5ocK9m/YBpCsEkcwPaERs/yCDAlumnnEkdzjQQz0VQ/Lok7mQJ
 wOdYBglOOtqFXjL4=
X-Received: by 2002:a5d:6ac3:0:b0:22e:657f:2e54 with SMTP id
 u3-20020a5d6ac3000000b0022e657f2e54mr22381594wrw.73.1665667330530; 
 Thu, 13 Oct 2022 06:22:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6aVznmZ0I0KtaxkOYpmw5P7CS87aTQGXssjZIvQv0UwJ6Tyd3a9OGWQ157Yxn/Y4uxAobhmw==
X-Received: by 2002:a5d:6ac3:0:b0:22e:657f:2e54 with SMTP id
 u3-20020a5d6ac3000000b0022e657f2e54mr22381567wrw.73.1665667330251; 
 Thu, 13 Oct 2022 06:22:10 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b003a2f2bb72d5sm6550770wmp.45.2022.10.13.06.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 06:22:09 -0700 (PDT)
Date: Thu, 13 Oct 2022 14:22:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH 1/4] qapi, i386/sev: Change the reduced-phys-bits value
 from 5 to 1
Message-ID: <Y0gQ/3Vx7Y8KOhQH@work-vm>
References: <cover.1664550870.git.thomas.lendacky@amd.com>
 <cb96d8e09154533af4b4e6988469bc0b32390b65.1664550870.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb96d8e09154533af4b4e6988469bc0b32390b65.1664550870.git.thomas.lendacky@amd.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tom Lendacky (thomas.lendacky@amd.com) wrote:
> A guest only ever experiences, at most, 1 bit of reduced physical
> addressing. Change the query-sev-capabilities json comment to use 1.
> 
> Fixes: 31dd67f684 ("sev/i386: qmp: add query-sev-capabilities command")
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  qapi/misc-target.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 4944c0528f..398fd09f25 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -172,7 +172,7 @@
>  # -> { "execute": "query-sev-capabilities" }
>  # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
>  #                  "cpu0-id": "2lvmGwo+...61iEinw==",
> -#                  "cbitpos": 47, "reduced-phys-bits": 5}}
> +#                  "cbitpos": 47, "reduced-phys-bits": 1}}
>  #
>  ##
>  { 'command': 'query-sev-capabilities', 'returns': 'SevCapability',
> -- 
> 2.37.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


