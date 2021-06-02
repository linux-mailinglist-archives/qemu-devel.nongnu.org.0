Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326933986F3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:50:32 +0200 (CEST)
Received: from localhost ([::1]:52552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOSF-0007o4-8u
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loOQL-0006FL-6f
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:48:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loOQF-0004dO-PY
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622630903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4d+N5hSTUJBk3b5rNPJNcq/N8hJwu9KhEYYd83L8j8=;
 b=Nl6S2PJdGDu/GLv62rUvYHfG5nOMdNBHl3/Iplu9qh9vKHpKRq2PEgaFHaqAVrDctzURDr
 8ZlonwN+VT6wHvZSnBAGG556Gyxf1bIBoaW7rLWAv2iEN9tsqzG3FW4vh1VaM8nKCYeb8c
 nZVB4+bv6hmihLZPt3FuB3zpkzAyN9g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-rogMlJsyP4yFsKfVfpxXww-1; Wed, 02 Jun 2021 06:48:21 -0400
X-MC-Unique: rogMlJsyP4yFsKfVfpxXww-1
Received: by mail-ej1-f69.google.com with SMTP id
 jy19-20020a1709077633b02903eb7acdb38cso490456ejc.14
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 03:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W4d+N5hSTUJBk3b5rNPJNcq/N8hJwu9KhEYYd83L8j8=;
 b=J1kVGfhMQf6QAoN2eHv6ePbtF6b8vp880956IPqDrPQ30FIIiNDTpPVVEW8OKzFXRP
 vwzvTeNnC5EpAwOfipzNLCDUK12APk6vZN37hwmmRhvN2v/N2Z7JlRpg5ujz96ZYgurv
 nJ1hAivKR9P11qVIctK/SZU6zkw909pYCAqQ09Qu913cn++NVDciP/hQhl8hX2AcEZ3+
 4ysTi45BfXjRWYRrB7w6U6I6NriVSoRvKmQ+ZWbvoUC01t7KYrjiZ2llBcfQqxlxRQr7
 bQBokezH7A6dZHsFHhtUC65pv77YOw9ipBT1z8fdfFm5Nd6j+6e19zbD212xOJK1v92Y
 JStQ==
X-Gm-Message-State: AOAM531VK8iFqTwOzns6TNmQuEQEiG7bR8DWK1JR5wdtUAytCWl9LQT/
 Furl7rZV0OB0siNNkrT2CdW/WPFZpp9Z/hl0glxDUQ6nk9gzD0onUPwEthvOfs0msE2lEwwH3w/
 4m2NrEDKeZRPcL+E=
X-Received: by 2002:aa7:d0d4:: with SMTP id u20mr31625665edo.228.1622630900287; 
 Wed, 02 Jun 2021 03:48:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn6y/v7hS3WgMuIEL6X1PGmb0SdB2TcpUqGR2iHAUm98v3JjKgACvdssyI0ei4O7Bpp4yb/g==
X-Received: by 2002:aa7:d0d4:: with SMTP id u20mr31625649edo.228.1622630900119; 
 Wed, 02 Jun 2021 03:48:20 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l11sm8396436ejd.103.2021.06.02.03.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 03:48:19 -0700 (PDT)
Subject: Re: [PATCH] target/i386/sev: Ensure sev_fw_errlist is sync with
 update-linux-headers
To: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20210219180131.2061072-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <665ebe97-fbe2-2273-0a02-1a94351c1e1c@redhat.com>
Date: Wed, 2 Jun 2021 12:48:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210219180131.2061072-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch was supposed to go via Eduardo's tree but he
missed it, can it go via qemu-trivial instead?

On 2/19/21 7:01 PM, Philippe Mathieu-Daudé wrote:
> Ensure sev_fw_errlist[] is updated after running
> the update-linux-headers.sh script.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Based-on: <20210218151633.215374-1-ckuehl@redhat.com>
> ---
>  target/i386/sev.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 37690ae809c..92c69a23769 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -87,7 +87,7 @@ typedef struct __attribute__((__packed__)) SevInfoBlock {
>  static SevGuestState *sev_guest;
>  static Error *sev_mig_blocker;
>  
> -static const char *const sev_fw_errlist[] = {
> +static const char *const sev_fw_errlist[SEV_RET_MAX] = {
>      [SEV_RET_SUCCESS]                = "",
>      [SEV_RET_INVALID_PLATFORM_STATE] = "Platform state is invalid",
>      [SEV_RET_INVALID_GUEST_STATE]    = "Guest state is invalid",
> @@ -114,6 +114,8 @@ static const char *const sev_fw_errlist[] = {
>      [SEV_RET_RESOURCE_LIMIT]         = "Required firmware resource depleted",
>      [SEV_RET_SECURE_DATA_INVALID]    = "Part-specific integrity check failure",
>  };
> +/* Ensure sev_fw_errlist[] is updated after running update-linux-headers.sh */
> +QEMU_BUILD_BUG_ON(SEV_RET_SECURE_DATA_INVALID + 1 != SEV_RET_MAX);
>  
>  #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
>  
> @@ -160,6 +162,7 @@ fw_error_to_str(int code)
>      if (code < 0 || code >= SEV_FW_MAX_ERROR) {
>          return "unknown error";
>      }
> +    assert(sev_fw_errlist[code]);
>  
>      return sev_fw_errlist[code];
>  }
> 


