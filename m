Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A766A3B052E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:50:14 +0200 (CEST)
Received: from localhost ([::1]:50230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfr3-0002Hk-HL
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvfoe-0000iO-H2
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:47:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvfob-00086Q-Qa
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624366060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kj1RYKEBmGYOylU/HrUvOgAoaX4ZnxEb7gqHWp+zzOQ=;
 b=PZUcke4yt5qnSmdtO9fCwIQd/CNeEiq4buLH/NgqVFJsuuz/32oDRGWDCJOc1Xezi/yRMg
 elCwKV4WcDzr0X+kIOLwk1BiqXwSaZWTXA17aGRpG12aIFGeceU9vCDqqqS1v3Od20s8tp
 +oFTqarUjo7sieBY38te/xpjnwnbl0U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-vwY8K1jkPbaZ474ihxwoLQ-1; Tue, 22 Jun 2021 08:47:39 -0400
X-MC-Unique: vwY8K1jkPbaZ474ihxwoLQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m6-20020a7bce060000b02901d2a0c361bfso687600wmc.4
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 05:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kj1RYKEBmGYOylU/HrUvOgAoaX4ZnxEb7gqHWp+zzOQ=;
 b=juM6Gfo5ZY29QKwGLEw/5wdWgoDteZgWUZtYuV0v+EF/5yT786E56s13MkcFPLk4mo
 zSATPftqWXhHG8wjLdXO4e/sjjpWk1Pz5WcxrLvpv+0HE0IPI0QHsEEXTxZeVcH1yBbI
 7Xj7nfPwGroTmuhaaSwRO9jp1p/rQq82/GYvUsNjh770pTGLD8yLW68dm4WmeF+da5ha
 G4pMLD5JZbIEJwXtRgoKPImWdyQaP5wfEWEf970EA4k7CcUT9/LSbpdEv6VgweQZLxUR
 CxbT4aEFoUzk5Q3nISkwfTzV3WRcjP32mh9xYbvY7Cs1j/ontAlh7WDVKyS6uPp1s+po
 lJNA==
X-Gm-Message-State: AOAM53097yq6AFZIWZOcJ5oNhoBzS92Std/NZL5XZKI300cAMmhdPXBZ
 Z1IZAKZN8AA7uBbAJwbefqG/yfZF9oKUyj3rLZsnTSYHrh7VPI+iexxT5zLqgPF0hiuUiEF2Qmq
 IIiwn4mkAoelFX98=
X-Received: by 2002:a1c:1f54:: with SMTP id f81mr4015555wmf.121.1624366058370; 
 Tue, 22 Jun 2021 05:47:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqSUHmx0Sd2XKNs9Hca/cTNyz8Zprc8nletyL27kZVqufnU16hs61lyt1h8//erFGS6f3eng==
X-Received: by 2002:a1c:1f54:: with SMTP id f81mr4015530wmf.121.1624366058128; 
 Tue, 22 Jun 2021 05:47:38 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o2sm14724224wrp.53.2021.06.22.05.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 05:47:37 -0700 (PDT)
Subject: Re: [PATCH] hw/i386/pc: Document pc_system_ovmf_table_find
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210622124419.3008278-1-dovmurik@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <838caecc-6d4a-6257-147e-fbef4148f679@redhat.com>
Date: Tue, 22 Jun 2021 14:47:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622124419.3008278-1-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 2:44 PM, Dov Murik wrote:
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>  hw/i386/pc_sysfw.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index 6ce37a2b05..e8d20cb83f 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -176,6 +176,20 @@ static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>      ovmf_table += tot_len;
>  }
>  
> +/**
> + * pc_system_ovmf_table_find - Find the data associated with an entry in OVMF's
> + * reset vector GUIDed table.
> + *
> + * @entry: GUID string of the entry to lookup
> + * @data: Filled with a pointer to the entry's value (if not NULL)
> + * @data_len: Filled with the length of the entry's value (if not NULL). Pass
> + *            NULL here if the length of data is known.
> + *
> + * Note that this function must be called after the OVMF table was found and
> + * copied by pc_system_parse_ovmf_flash().

What about replacing this comment by:

  assert(ovmf_table && ovmf_table_len);

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks!

> + *
> + * Return: true if the entry was found in the OVMF table; false otherwise.
> + */
>  bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
>                                 int *data_len)
>  {
> 


