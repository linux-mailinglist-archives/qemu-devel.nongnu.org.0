Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07867402E4E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 20:22:25 +0200 (CEST)
Received: from localhost ([::1]:39010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfjj-0001FO-Lb
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 14:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNfhT-0007lh-Aq
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNfhQ-0002BZ-Ti
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631038799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcSyQIgx//K9BaRn9QJBHTH7OBXlVpIS+PAq7bopPUk=;
 b=JbajKqTmDsP+62TJa2AWwH6WznyScOmolUsFHIaHAdgTWtJeoz7LzmzEUOrHoVsKoz9c5q
 YWQ2kaGdJUdDElgf3fg61tlQVggTr6429HbEZBiO0XXuS7knOD8si4Lv9dCpZ1dsSPKSSD
 0l9HMP//sJH/moO0X7CAr+piwDN8RfU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-T1wtbDdBNhuIziuT6oi3vw-1; Tue, 07 Sep 2021 14:19:57 -0400
X-MC-Unique: T1wtbDdBNhuIziuT6oi3vw-1
Received: by mail-wm1-f70.google.com with SMTP id
 x10-20020a7bc76a000000b002f8cba3fd65so1339911wmk.2
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 11:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mcSyQIgx//K9BaRn9QJBHTH7OBXlVpIS+PAq7bopPUk=;
 b=Hh9K8u8yZ5GPWQvhSxqLlhqkny3rpD5PY3JDurul1NN5Pnc7BRv1dL0LoIDgEEe7JT
 o9D8/LOq+LEygMrS8woK04SZWVzo8AxOq14v/I6R6WPdNVEBA+SNQ1c1GDn64VoOKDto
 yL5Zzol+1EnL00ZE5cnZtnheUnnlQy8/H3xWZ1aKWZzZv2iLPAjp+3k/UwCgww4nGqVT
 SsHLDgY01OA14UfhN4L6aLhh3703QvOdYEMLBXAyBPt/COegRfW/bSUdjOXidEU/pl8r
 dHpb+0cDGSwJDAezDxqg6J0IKCid3mNZjet8yEvVf+Oz0+AA4vJIJJ0PQ9g3A/ysXCsu
 gBOg==
X-Gm-Message-State: AOAM532BGU2y6yhDNU9rPOrHlJitULtLvKBHIQQ4WJvXouKyBUdV+0mU
 3yXgGTD/wQSwzfPibDRq8+g4b5LUn2u0uU4jvPH5plKc96ulA9iA77uwAuif1LpORk3Ju+Tarat
 q00syKe9NEfBFGJ7hKWZIxm826A/Xp9Djb27BGCUlehVj+pZWp6we36F5ILLp6UHM
X-Received: by 2002:a05:6000:128d:: with SMTP id
 f13mr20056833wrx.244.1631038796121; 
 Tue, 07 Sep 2021 11:19:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRGk2g5aoU5bwkffQGNAj3cv2TgVosWK/KUVN2I07+gp164BIyjYDAlq3fe/jujOxkSVDhLw==
X-Received: by 2002:a05:6000:128d:: with SMTP id
 f13mr20056807wrx.244.1631038795794; 
 Tue, 07 Sep 2021 11:19:55 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id a5sm3103254wmm.44.2021.09.07.11.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 11:19:55 -0700 (PDT)
Subject: Re: [PATCH] fw_cfg: add etc/msr_feature_control
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210907170935.210428-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f9c001a8-b81c-c559-7ba9-437827594f29@redhat.com>
Date: Tue, 7 Sep 2021 20:19:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907170935.210428-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 7:09 PM, Paolo Bonzini wrote:
> The file already existed, but nobody had noticed the warning until now.
> Add it at the bottom, since that is where unknown files go in legacy mode.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/nvram/fw_cfg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 9b8dcca4ea..c06b30de11 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -878,6 +878,7 @@ static struct {
>      { "etc/tpm/log", 150 },
>      { "etc/acpi/rsdp", 160 },
>      { "bootorder", 170 },
> +    { "etc/msr_feature_control", 180 },

Fixes: 217f1b4a721 ("target-i386: Publish advised value of
MSR_IA32_FEATURE_CONTROL via fw_cfg")
?


