Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21957344681
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:04:39 +0100 (CET)
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLAc-0006Kr-2w
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOKzD-0002Rb-Tb
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:52:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOKzA-0007fB-TK
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616421166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dGP98kQWiZGfst49MhglqNO0U2eFh/vHHyhyYm7sC4=;
 b=ECbgaRZxtmqGxIz0MSt1vL0lWhSym63TWe79flFFdCyOCx+3hNd57z8dGHELa6wYYqFD7R
 +wlHFil/LeUHsK16BdC1WA6GwQhJYnw+ZAEoGwcXB4VlA7P0XwAJjNWKPoZQZGFF2BtCVD
 11BAJLvtF3UNBesvvoPLzeIJfXNbXHk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-xBdxRjKVOUi_-6lHAAVEVA-1; Mon, 22 Mar 2021 09:52:44 -0400
X-MC-Unique: xBdxRjKVOUi_-6lHAAVEVA-1
Received: by mail-wr1-f70.google.com with SMTP id o11so10058839wrc.4
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3dGP98kQWiZGfst49MhglqNO0U2eFh/vHHyhyYm7sC4=;
 b=O7jyJz51m0QooVvf+LywDxzNUGVNa17ZrMsbZaxz7McW/KaXrTkZ1JYDZ6W7H0xWv5
 PnSe8U5OqUDNi4XE1UVJvnrS2ADMXGK1H4td1p3w8snU7IGSjXzD5qFIMGtwZ4u6MxxV
 MDL2NG+uLzCbNKmKGxypI6vj1vm4VF8ke23VkpRmKPSkuiYA7wJEdvNcqmCYX/uMzB8p
 7+Ded/YKdUn3BdL0J3O6NnXor5GhSMVp8WbUXnESAl1am9wPl1I2bVrYPJi6tbmZ8jFE
 Xq0gjnRDKARlZgoXgOOIu5kAdHhNrSx0ZEx4/gURBqAnFs+0mpirPvXp4KiPekIFTR7G
 7P+Q==
X-Gm-Message-State: AOAM530qZHX2Si3QWgWrxWdvyAjsCDyf5mO0YAG8Pna8niFN08gJkv8n
 3krChFsL5waMyiSPDV1yG+Es0XkYUkx1mclALMCjWgul8Hi+9EziVJ/rHrvdP/WT4wojii8mBmu
 eoejFqaTS2Bj39Lc=
X-Received: by 2002:adf:b1c9:: with SMTP id r9mr18812416wra.51.1616421163614; 
 Mon, 22 Mar 2021 06:52:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMxQit7kRSkmymk9hlRon7S2MXCadC7YMlSFTCYneCgddA/mWB00teKkZBMgt+zMwFu4dIyw==
X-Received: by 2002:adf:b1c9:: with SMTP id r9mr18812400wra.51.1616421163351; 
 Mon, 22 Mar 2021 06:52:43 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id c2sm16609540wme.15.2021.03.22.06.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:52:42 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:52:40 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] optionrom/pvh: use memcmp() to find the RSDP signature
Message-ID: <20210322135240.jvq2rydpapohh7uh@steredhat>
References: <20210322114834.166798-1-sgarzare@redhat.com>
 <38e9c458-f931-1fa7-3070-8c2d90b543de@redhat.com>
MIME-Version: 1.0
In-Reply-To: <38e9c458-f931-1fa7-3070-8c2d90b543de@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 02:15:26PM +0100, Philippe Mathieu-Daudé wrote:
>On 3/22/21 12:48 PM, Stefano Garzarella wrote:
>> New versions of gcc report a potential error and there may be alignment
>> issues using uint64_t pointer to check the RSDP signature:
>>
>>     gcc 10.2.1 "cc (Alpine 10.2.1_pre2) 10.2.1 20210313" reports:
>>
>>     pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
>>     pc-bios/optionrom/pvh_main.c:61:21: warning: comparison is always false
>>     due to limited range of data type [-Wtype-limits]
>>        61 |         if (*rsdp_p == RSDP_SIGNATURE) {
>>           |                     ^~
>>
>> Let's use memcmp() to get more readable code and avoid these issues.
>> Since pvh optionrom is baremetal, we use the compiler's __builtin_memcmp.
>>
>> Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  pc-bios/optionrom/pvh_main.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/pc-bios/optionrom/pvh_main.c b/pc-bios/optionrom/pvh_main.c
>> index 28e79d7fc4..12202e38c2 100644
>> --- a/pc-bios/optionrom/pvh_main.c
>> +++ b/pc-bios/optionrom/pvh_main.c
>> @@ -27,7 +27,8 @@ asm (".code32"); /* this code will be executed in protected mode */
>>  #include "optrom_fw_cfg.h"
>>  #include "../../include/hw/xen/start_info.h"
>>
>> -#define RSDP_SIGNATURE          0x2052545020445352LL /* "RSD PTR " */
>> +#define RSDP_SIGNATURE          "RSD PTR "
>> +#define RSDP_SIGNATURE_SIZE     8
>>  #define RSDP_AREA_ADDR          0x000E0000
>>  #define RSDP_AREA_SIZE          0x00020000
>>  #define EBDA_BASE_ADDR          0x0000040E
>> @@ -53,12 +54,14 @@ static uint8_t cmdline_buffer[CMDLINE_BUFSIZE];
>>  /* Search RSDP signature. */
>>  static uintptr_t search_rsdp(uint32_t start_addr, uint32_t end_addr)
>>  {
>> -    uint64_t *rsdp_p;
>> +    char rsdp_signature[RSDP_SIGNATURE_SIZE] = RSDP_SIGNATURE;
>
>static const?

I'll fix in v2.

And I'll check better clang because gitlab CI [1] is failing:

     ld: pvh_main.o: in function `search_rsdp':
     /builds/sgarzarella/qemu/pc-bios/optionrom/pvh_main.c:63: undefined 
     reference to `memcmp'
     ld: /builds/sgarzarella/qemu/pc-bios/optionrom/pvh_main.c:63: 
     undefined reference to `memcmp'


Thanks,
Stefano

[1] https://gitlab.com/sgarzarella/qemu/-/jobs/1117036403#L385


