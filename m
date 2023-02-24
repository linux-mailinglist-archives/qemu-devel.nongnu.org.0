Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01746A16D6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:01:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVS4T-0004lX-HK; Fri, 24 Feb 2023 02:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVS4R-0004l5-Lu
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:00:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVS4Q-0001aw-6b
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677222041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Dzc6aqRerhAGgR/qOZDZvideDub/28q0m9kswVVsVM=;
 b=QF1sCl49k90DTIC2IcePPiQMEF6YpGNjhnprW5uyQDL+KLr9otvh4DSPDOukVe2rAEljml
 KFSuW3FkYF1jQJwEOqIF9HIEhPop5DL3p57GghY6JEwWOhlf+qtB1ZGEmkf8IeIIlzjiVu
 aNNeDixNJRpzg9hfmeWp6Pwm31lktak=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495--cPIXH8AMiOoPEh_FdSvRw-1; Fri, 24 Feb 2023 02:00:39 -0500
X-MC-Unique: -cPIXH8AMiOoPEh_FdSvRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so837170wms.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Dzc6aqRerhAGgR/qOZDZvideDub/28q0m9kswVVsVM=;
 b=C1rDd0tyWADcHXEm7ga56135G0pEQrVWn7dkeCDSQmrkbvs+BqpCXrexIUikFtYtOq
 5njIeRGqlkPL+OAefZ+vNDLFPR28a4rN/gujfFAJcjgTl/HGGy2SBNlN0AvjLqTI69lz
 b9WbdKbBQyTTJDzUCH5eEJe1x8WDNM1ApnId9m/OThn+fDkGD0mTCZalH8TJnjHcTSvU
 47RNSkmqncO7g/sTv1vyJa6/SOtgsGGn6kHcYpPyc/7OqUSRyZxeCG/RkmtjiFZoASXo
 C9g6ftTaADktq3FelqpmTg1zkfX0J4BE+SZo9/l29P29eet5dPK0qs1rtRcMHzqDF61m
 4v0A==
X-Gm-Message-State: AO0yUKXn7R2FXlqVZVl0Q6Om3gB4PaGaADQslWHTMMassoIIfx+Y/OMS
 iLRNJyBeQ77/ygSOf6LL18E1cEb+EoZFIRgQGvPI12PLQfnsHyTaf4eEkPf1yH8V5YRHfE/K2VR
 r2QkCw3rjtz/knKtHxDmWWoE=
X-Received: by 2002:a05:600c:713:b0:3dc:4b87:a570 with SMTP id
 i19-20020a05600c071300b003dc4b87a570mr5136899wmn.35.1677222038710; 
 Thu, 23 Feb 2023 23:00:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+1niUG+8gVYiOIo2ICgs7Acre2pO0wqk/qy64cvq9KDojvwj6ethaZHyJK7kE7rMYNq6vrlQ==
X-Received: by 2002:a05:600c:713:b0:3dc:4b87:a570 with SMTP id
 i19-20020a05600c071300b003dc4b87a570mr5136886wmn.35.1677222038444; 
 Thu, 23 Feb 2023 23:00:38 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 o18-20020a5d4752000000b002c3f9404c45sm11091279wrs.7.2023.02.23.23.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:00:37 -0800 (PST)
Message-ID: <52fa1fab-845c-0a2d-bf4d-4ce1a752e3e7@redhat.com>
Date: Fri, 24 Feb 2023 08:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 1/7] dump: Replace tswapN() -> cpu_to_dumpN()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230223231755.81633-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/02/2023 00.17, Philippe Mathieu-Daudé wrote:
> All uses of tswap in that file are wrong, and should be using
> cpu_to_dumpN, which correctly tests the endianness of the output.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   dump/dump.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 279b07f09b..7101169ecb 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -907,13 +907,13 @@ static void get_note_sizes(DumpState *s, const void *note,
>       if (dump_is_64bit(s)) {
>           const Elf64_Nhdr *hdr = note;
>           note_head_sz = sizeof(Elf64_Nhdr);
> -        name_sz = tswap64(hdr->n_namesz);
> -        desc_sz = tswap64(hdr->n_descsz);
> +        name_sz = cpu_to_dump64(s, hdr->n_namesz);
> +        desc_sz = cpu_to_dump64(s, hdr->n_descsz);
>       } else {
>           const Elf32_Nhdr *hdr = note;
>           note_head_sz = sizeof(Elf32_Nhdr);
> -        name_sz = tswap32(hdr->n_namesz);
> -        desc_sz = tswap32(hdr->n_descsz);
> +        name_sz = cpu_to_dump32(s, hdr->n_namesz);
> +        desc_sz = cpu_to_dump32(s, hdr->n_descsz);
>       }

Those tswaps looked suspiciuous indeed.

Reviewed-by: Thomas Huth <thuth@redhat.com>



