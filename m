Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B30407DE5
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:21:10 +0200 (CEST)
Received: from localhost ([::1]:36938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRI6-0005Rs-1R
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRGc-0004UX-E6
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:19:38 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRGb-0005cd-2p
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:19:38 -0400
Received: by mail-wm1-x332.google.com with SMTP id 140so1372401wma.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ELrfWeweqoxVjJNKAIFvzl2fFfOUOjJUaPbMiP4RxmY=;
 b=MBCght8yrq9wCEOLEi1HYmjKXsRuMp5JPYRD9O1WdYbUOwTfwPY48cKx6SrzDfWN51
 sfYZAceHmMSq0XC9XSsFrDfAIJ6m+DgA+H5rW9jC3QEgRrJKqIHFnUhK/uAqdf6VStx0
 fWF7BR+1qIx07b2w13yvHdA3d9eQSY9u1+m+WkZ5kOywRLbjQzeF09EsL5bVCp0SkVka
 IYO+zDJHSw1WMPOURILAy+nS4bkKQ7QfV6Uw3EEVwrQTmTQQojfBSvmLzfYcM8YFkwgw
 +cvO5ajqnaM70U4L07WyWnQP7J9pt1x+HkI2ThSDH1Geo0VJAHO2EIy03gMUz/3wR3N5
 ChZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ELrfWeweqoxVjJNKAIFvzl2fFfOUOjJUaPbMiP4RxmY=;
 b=LV+k6MlLEhtICSQxkU/favDIyBX8tP84AKKCrYwNGLo175kxBFU7druPT/2Y00RMid
 2BZVkc9S5vIpoDmYRWQmDlN18WPAZKwlH48hHcRJUl7NEeeU+qNJBTSH2UYfGT7mXF0D
 nt4KAyTyGSpBIRHDiG7cwJVdEUchw7zK0HiXqwWj5FgseAcUTILrXPE8VxtV0GDHyoaT
 gV99s74SMJ4VlNaw7w6wTHgjGvRMvAGSm5EkoJwMAivqAwWyIK9JUoRzi8mnSmCFTM7G
 kCBV9zFwDYquST2KnUzP4etStpC4NS8J19WzVVNDuVVLBJBD5ipbcsLkZ/UaDdxdLbV4
 SdBg==
X-Gm-Message-State: AOAM531AquyRLQl6tduR3bS8+OpN0enWbqjmGYFgrK/MxegNM1eSVZo9
 wgk2kt79vzViUfkfAsrGCwE=
X-Google-Smtp-Source: ABdhPJzv4r97w8HyD6FVogVd2QwXxTEtEOmuGZkTykcw0+Cfwv8LlH32HVWa6XhSLs2Uce1KIe+Xpw==
X-Received: by 2002:a7b:cf02:: with SMTP id l2mr1290142wmg.47.1631459975713;
 Sun, 12 Sep 2021 08:19:35 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o12sm4036444wms.15.2021.09.12.08.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 08:19:35 -0700 (PDT)
Subject: Re: [PATCH 08/20] nubus: generate bus error when attempting to access
 empty slots
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-9-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cf2594e6-d0e0-fddc-d143-9049888b574a@amsat.org>
Date: Sun, 12 Sep 2021 17:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
> According to "Designing Cards and Drivers for the Macintosh Family" any attempt
> to access an unimplemented address location on Nubus generates a bus error. MacOS
> uses a custom bus error handler to detect empty Nubus slots, and with the current
> implementation assumes that all slots are occupied as the Nubus transactions
> never fail.
> 
> Switch nubus_slot_ops and nubus_super_slot_ops over to use {read,write}_with_attrs
> and hard-code them to return MEMTX_DECODE_ERROR so that unoccupied Nubus slots
> will generate the expected bus error.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-bus.c | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

