Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48BD3FB7CE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 16:21:33 +0200 (CEST)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKiAE-0003Do-Th
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 10:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mKi7J-0000LD-LB
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 10:18:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mKi7H-0002MU-43
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 10:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630333106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oblSH1oT4EgBngN4YaKm0pUdA0pCNQgBGUYq2VwmbaM=;
 b=ZjD74xKGTxPKCAG74ewTev8x/dPP+fU5oqROg2Mgq7A8I2GU4fgXtS/SFx6qKUYIBTeeAM
 9KD+FM2JF2GY0fqLZCg43I0HIYhP+Cr7Fyu11Prpar69d/fn08eKmK+jZ8R+2mNG/EU+Ln
 6eUdo2/hPcyd6uN0W+i5CpZU0zMb4Gc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-Kc3Zq6N5OAiL579gQIUobw-1; Mon, 30 Aug 2021 10:18:06 -0400
X-MC-Unique: Kc3Zq6N5OAiL579gQIUobw-1
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so40879wmj.6
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 07:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oblSH1oT4EgBngN4YaKm0pUdA0pCNQgBGUYq2VwmbaM=;
 b=YE9xSW3eoRnUS34hWfvgmP8eS31ZXBYIsy4+SB2LfoAwpBnw8zS+wtulzqUk+0JeEI
 y+HFqp7fWe2E2whHH77v7KRYFrJR9Vvt2wjg8hwAWKhXlbRrFHDq+smyJMWkvkDQhC0m
 YSc7syGeLi+QTOHIAANKcGbYP+CycdOiSQRSJgmdOkUfqCd6A9v3ZpDjp+4zO7mdcASN
 uDqVvY+94fz8Jjqr3BJ/L/48/ptpmFiLSGMDoaSlaNW/HvMujjpUQaoK66oA9wFEKrt2
 pD4egxDpCDORjcu+2XQMODhKheCnLWPBbFxfoSZ/wLR2yiDPlZSsVhjympctxpE900xF
 4hug==
X-Gm-Message-State: AOAM533jz2OMniRtuEg6L+63T8CvFbLuNvXnwHoJCqA2G5zrn+ID7EOI
 hMUq/FVto3Eq8LxFjTbygragtTFFFYFCKdTFCG+oECHmywO/ioG08SLD/JHvd9RJ0VFMDD0fign
 Q6FQ9nMPM20yZnRs=
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr26715042wrw.16.1630333085208; 
 Mon, 30 Aug 2021 07:18:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2GQDliXvVW6/fDvymqUw1v9nEaTd344muOKc88ToZe3tWRdJj7cDbChfW1OALEyf2yre0DA==
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr26715011wrw.16.1630333085006; 
 Mon, 30 Aug 2021 07:18:05 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id q13sm15424573wrv.79.2021.08.30.07.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 07:18:04 -0700 (PDT)
Subject: Re: [PATCH v2 01/23] MAINTAINERS: Add Connor Kuehl as reviewer for
 AMD SEV
To: qemu-devel@nongnu.org, Connor Kuehl <ckuehl@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-2-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <980f9ccb-39d7-23ec-4aa8-830e93dd0ff2@redhat.com>
Date: Mon, 30 Aug 2021 16:18:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616204328.2611406-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 10:43 PM, Philippe Mathieu-Daudé wrote:
> From: Connor Kuehl <ckuehl@redhat.com>
> 
> It may not be appropriate for me to take over as a maintainer at this time,
> but I would consider myself familiar with AMD SEV and what this code is
> meant to be doing as part of a VMM for launching SEV-protected guests.
> 
> To that end, I would be happy to volunteer as a reviewer for SEV-related
> changes so that I am CC'd on them and can help share the review burden with
> whoever does maintain this code.
> 
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-Id: <20210608192537.103584-1-ckuehl@redhat.com>
> [PMD: Cover more files]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccdb81c9f62..fbfaaa54721 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2937,6 +2937,13 @@ F: hw/core/clock-vmstate.c
>  F: hw/core/qdev-clock.c
>  F: docs/devel/clocks.rst
>  
> +AMD Secure Encrypted Virtualization (SEV)
> +R: Connor Kuehl <ckuehl@redhat.com>

Is this patch still valid?

> +F: docs/amd-memory-encryption.txt
> +F: accel/kvm/sev-stub.c
> +F: target/i386/sev*
> +F: include/sysemu/sev.h
> +
>  Usermode Emulation
>  ------------------
>  Overall usermode emulation
> 


