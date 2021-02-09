Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9605314B6F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:24:03 +0100 (CET)
Received: from localhost ([::1]:46494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9PFa-0002ul-MI
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l9PCO-0000Rg-3x
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 04:20:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l9PCM-00086l-8S
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 04:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612862439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rMNWEiTlY0WcuekZDfpEumRfa2b6tdG+4sJrDMSFvo0=;
 b=MIKeYFNNdKj8FXSj5I6xyQJHQnRQxhrHgKCdFvov0uRp+Aj1A+VKXYQQyznLHb63vZGIbm
 gwd3f5oJcvaIFF+lKFDVxYzqLxw3jeeo5aPDOMmfOYEaRpGGkJDkkxgxHQdHDhbtC8HuKQ
 p3xDOhuWu9I1905+vlSwh36D0Jmud5w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-MKHCyeAhMMGK3dz9U1ojRQ-1; Tue, 09 Feb 2021 04:20:36 -0500
X-MC-Unique: MKHCyeAhMMGK3dz9U1ojRQ-1
Received: by mail-wr1-f71.google.com with SMTP id w11so9435852wrp.6
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 01:20:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rMNWEiTlY0WcuekZDfpEumRfa2b6tdG+4sJrDMSFvo0=;
 b=AZ4B9et0JL5LWYH5TjcTKhfp/45hnvdMLqpuqbnxZpSV3ACjP/i0fQh8ae6iKfs6lV
 7NQCeW6ZkaoM4sp7mnZXbjjLeUCmGNvnjzyz09NdlfSqG6G+BPPyOG6S6JWziSgE+uAl
 NMlv4TgA2d/VbxSumo0voLbsRG1CjgVyCHTU/l57QbDMSHru066lXKQQ23yOf6lDz5HB
 r48YsSVpHYaxmLGNe2TjssUBHFl6ghrSsxKCy3vmhSfanN+AGwwLhFkiFp1PM20DPgv6
 ly6YEb0xydRsMPeoI7duJ5iCcuG+3Cla2ik+5ZI+MvP3T4r6SeFuObD9o+lfVBzHWlBj
 riwQ==
X-Gm-Message-State: AOAM530lguDHdseLnIyStvk2+AyMJt6LQ0NvLZFUJsKUGMeSmSfdxvOj
 tGfeDXMZZdhckmHobVd23CNTR42DM1cM5T8glm7wnX9s9fkpJp7tSPf7r87tJWCRFWgEnZKePIx
 QAx3W5OKmJzTbH1xGTVa8zudQf3djhuWVg0xt5hHESri/ZycCJG8r4ti0CHYgchEGXdI=
X-Received: by 2002:a1c:6002:: with SMTP id u2mr2417811wmb.83.1612862434956;
 Tue, 09 Feb 2021 01:20:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzURDECY4W2RVCwPjwAT3aUACymhl6HcXAPIMI2A3IZ+ITXIzYwTV77ZVC8ldzOk8113ral1A==
X-Received: by 2002:a1c:6002:: with SMTP id u2mr2417791wmb.83.1612862434684;
 Tue, 09 Feb 2021 01:20:34 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x4sm225119wrn.64.2021.02.09.01.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 01:20:33 -0800 (PST)
Subject: Re: [PATCH] util/cutils: Skip "." when looking for next directory
 component
To: Stefan Weil <sw@weilnetz.de>
References: <20210208205752.2488774-1-sw@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3b5af712-5d28-c54f-f23b-62ba568622f8@redhat.com>
Date: Tue, 9 Feb 2021 10:20:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208205752.2488774-1-sw@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/21 21:57, Stefan Weil wrote:
> When looking for the next directory component, a "." component is now skipped.
> 
> This fixes the path(s) used for firmware lookup for the prefix == bindir case
> which is standard for QEMU on Windows and where the internally
> used bindir value ends with "/.".
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> This patch is required for Windows to get the firmware access right,
> but would also be needed for Linux with --bindir=/usr/local which
> currently results in a search path like /usr/local/../share/qemu-firmware.
> 
> I noticed that qemu-firmware is not used during the installation.
> What is the purpose of that extra search path?
> 
> Stefan
> 
>   util/cutils.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index 0b5073b330..70c7d6efbd 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -916,7 +916,8 @@ static inline bool starts_with_prefix(const char *dir)
>   static inline const char *next_component(const char *dir, int *p_len)
>   {
>       int len;
> -    while (*dir && G_IS_DIR_SEPARATOR(*dir)) {
> +    while ((*dir && G_IS_DIR_SEPARATOR(*dir)) ||
> +           (*dir == '.' && (G_IS_DIR_SEPARATOR(dir[1]) || dir[1] == '\0'))) {
>           dir++;
>       }
>       len = 0;
> 

Queued, thanks.

Paolo


