Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ED9330B03
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:22:43 +0100 (CET)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJD2A-0005cN-Na
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJD16-0005AV-KV
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:21:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJD12-0002Eu-Q5
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:21:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615198890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=scrzUxo85m+CDiKHlYmIIAapU5N8csedqdSXTTiHT4k=;
 b=I5mrqqxjnRWm0awaxZlrZCiMYWYzUnfcj4A0/iXZR+aTWLoFqFG1BYRo7gx15GrUKSCuvn
 HT4hX+0Ejll0/bChn0TACTgPvydUVqr4X03WMbyKHPf/NULz0kbX1mUgkYSRXLiDtlkEzw
 PdbbAok+/IzAhr1OVaP4B3GCPI8IkZE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-qTlaFjaWN-6k5e31ktDJ7A-1; Mon, 08 Mar 2021 05:21:28 -0500
X-MC-Unique: qTlaFjaWN-6k5e31ktDJ7A-1
Received: by mail-ed1-f69.google.com with SMTP id k8so4766566edn.19
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 02:21:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=scrzUxo85m+CDiKHlYmIIAapU5N8csedqdSXTTiHT4k=;
 b=nfZpRWspmAPBV/aWyjfUeWs2o+raJ/bNXFtFkw2IF9YP49YGPsNwlb8b0OaoNXfDdL
 zN1fJvpyCgN2iMrznBGWMbZhg57LraY466KGFi3gRIsynrT/PMs3s7sDjl38ndb9WAhw
 QArWe5GIpRC3XUVZr+2iIkvzY9KnuwZZ/FZpMZGyhOzMVVH6TvyoNYQluxoZL/Kfij5U
 2dn2nFBTxcZanuIhYtUvS/b0l1aYXtJmfTwxrVuVhQtDXJsrD+P22bYuAtZpT7gyruXE
 hnIv4KURWIXEgdLJ3r71Oim5lF/ozcT3YCjqDGLVeDYWG59nWSWreRp3HGccp+WiZHuA
 JIaQ==
X-Gm-Message-State: AOAM530DwHGWOgZoqP1A1PdN1aXleJVUMjYX/7p+tuJx16cfuKVxwdYe
 gCMutw9/ZyS4iiNonRerLXJZyEuENPa5aajYimKtDXtEZBez3bQMFj4j5fx9CSjJFV2k/MfwFBI
 Oat5u01wQsUdrYDM=
X-Received: by 2002:a17:906:1494:: with SMTP id
 x20mr2665366ejc.101.1615198887360; 
 Mon, 08 Mar 2021 02:21:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLtsGE2I0M5WAhrgd1Ejncl2/pmDL6C/0WqfWfUluzAqpfawa7EKrZvKhu4mh8DBQFK99R2g==
X-Received: by 2002:a17:906:1494:: with SMTP id
 x20mr2665354ejc.101.1615198887232; 
 Mon, 08 Mar 2021 02:21:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g21sm6427967ejd.6.2021.03.08.02.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 02:21:26 -0800 (PST)
Subject: Re: [PATCH] target/i386/sev: Ensure sev_fw_errlist is sync with
 update-linux-headers
To: qemu-devel@nongnu.org
References: <20210219180131.2061072-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bb91385d-ce8d-c949-d261-ec5315888b30@redhat.com>
Date: Mon, 8 Mar 2021 11:21:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

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


