Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C96B320938
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 09:48:55 +0100 (CET)
Received: from localhost ([::1]:54524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDkQA-0008Fi-KY
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 03:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lDkOp-0007dm-2b
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 03:47:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lDkOk-0003Da-LK
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 03:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613897244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sg/+O0YRySZ3phwQQXAcLW8esWuzHEdhPb+1RBWRldk=;
 b=ikzhMgmWI98HXBPcrkKr2ai3iudCO1CHAtTGKJzzoi1+YkIRhWSXkJy5FmkulAHcNpJjOE
 wt8HBo59IdUvQcTBeeR7LT+e2E6iyHlB80LQfPOL/U+DXPDX3fhubuUIJf+x5U6m/hR5NP
 Co28W+9d4m3dgOszg11RtvoVGCMcTCg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-NQjV5GemO6aJxI71xindBQ-1; Sun, 21 Feb 2021 03:47:20 -0500
X-MC-Unique: NQjV5GemO6aJxI71xindBQ-1
Received: by mail-wr1-f72.google.com with SMTP id w11so4562239wrp.6
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 00:47:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sg/+O0YRySZ3phwQQXAcLW8esWuzHEdhPb+1RBWRldk=;
 b=gUtQ5U8YIdnKujiHkM7/W8RPf4LIvEQeE4YI+kW0e6Z4Vyc++9m+bltZRuMWq0ouVj
 C8a3KjnwfKS2WndcfDzoBqsy9+DTLbiYiyQHHvRpHl+GRamP6fovkl1NVqszdyy98JJm
 1cZ4Qs6wEhwpzhEMsNXWhZ5NlsYPiEz59Eix2jKNbbZILpQKXQ+dIp94mpCE3h4J2Dce
 DIfryNNCbIDGvovdQxoHv5MtxnlAZQYZ4z7xNWq/Am1WBW8nRXx0NyvJTTJf1Rg3S2N1
 Xbxv2WVaE0P+b3PZs2JeeA6OSe75afjqEm2Ol8SHGSvjoYjZASIXsgtw6eFrencjn0po
 ouyA==
X-Gm-Message-State: AOAM5334KdPFvs579XXtiWcGiXj/vC4JQwlOIyJNtsUxaEK07fKRvvTl
 U0rK9LAjSut/XjJUqHLnVCSFMotknilgw8Laec/ibgYNZ44jX32c57RF80MmbvRJP/0H3yH1G0w
 4Rijk1GaHksqqLwk=
X-Received: by 2002:a05:600c:19c6:: with SMTP id
 u6mr4803444wmq.65.1613897239149; 
 Sun, 21 Feb 2021 00:47:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTIg+yfs2AzRiX94EbQ72RLhg6gYGTvj4BDTurRdEqZEFbxxDuKjVRLTKX3f2oOxiOxxnOcA==
X-Received: by 2002:a05:600c:19c6:: with SMTP id
 u6mr4803430wmq.65.1613897238997; 
 Sun, 21 Feb 2021 00:47:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o124sm21027063wmo.41.2021.02.21.00.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 00:47:18 -0800 (PST)
Subject: Re: [PATCH] fuzz: fix the pro100 generic-fuzzer config
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210221004717.426903-1-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b4d704ba-a45e-99ba-4bc6-a20b398cd231@redhat.com>
Date: Sun, 21 Feb 2021 09:47:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221004717.426903-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:47 AM, Alexander Bulekov wrote:
> The device-type names for the pro100 network cards, are i8255.. We were
> matching "eepro", which catches the PCI PIO/MMIO regions for those
> devices, however misses the actual PCI device, which we use to map the
> BARs, before fuzzing. Fix that
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 5d599765c4..2454c627ff 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -177,7 +177,7 @@ const generic_fuzz_config predefined_configs[] = {
>          .name = "i82550",
>          .args = "-machine q35 -nodefaults "
>          "-device i82550,netdev=net0 -netdev user,id=net0",
> -        .objects = "eepro*"
> +        .objects = "i8255*"

What about i82562 & i82801?

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


