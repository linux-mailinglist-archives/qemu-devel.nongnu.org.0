Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD4F6AE677
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:29:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaBY-0000KT-Ab; Tue, 07 Mar 2023 11:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaBW-0000Jm-Ho
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:29:06 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaBV-0000ab-0i
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:29:06 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h14so12740500wru.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678206543;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c8ddAlTHBUNSR2bNxJW07ioEGpTXoCqR+vwpPP+MbAw=;
 b=jqfLFA4Eo6KW+dzLA5mmFko9S+yhbN343Pj5B74cM5z3miV7pc4udKzMR+7c7t1CxJ
 NcyjUzXsl81EnbHGKnrJjDm/xXczws69lR04kgxH0clbrxAYNOYmN/Pl8/MwGikdoty0
 agymsT/GGuZjPCg5bjqwi2VLyr5w5IadNkbggqXQjXk4mKleQz7zbCLRC6bDN2chaDVF
 m19Z4LlmTA2w7ekPlSIuaciV6SOJ+2sAZTM8pZ3NQJwXz3fN0+/WikqBfhyghQRdKET8
 E4OQPiWX7qMFk5vz0nKXDFBQ9AoFnJ9O4pRtbTnvQJngXkug/Q3NmzpUH15s4Zvw3DOJ
 PMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678206543;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8ddAlTHBUNSR2bNxJW07ioEGpTXoCqR+vwpPP+MbAw=;
 b=d5hgaOcB8xjnymffh0ZvHA+fLdbH0sa+fpgn4wh+6jmRHQfez9si9v7pe/r4M/xvLj
 V0NOv/7O8zewrZdhfcwXh+XanSvVZd2GCZsBmJ2jmzpzMKSnZyvGUMJ/BIkqJ5D6onQd
 oC5I7VCRIFGmnejmd34FBTO++ncobLUX9bwNiPEVviAG4+WtAd2SABTxrBGCoPuqf0Px
 s1y4s6d0NPU4dwypV4nJR7sD9PzSHZANnc/Hour8URgJCAOhlUL7MjJh/k7XulZsnkT9
 3TnubctEilQJ/zs8JE5ME3jZk7xeHmo6EG7RcLbAyA36ptFIaipGa+ZFDW56+6CpLfkL
 qzKw==
X-Gm-Message-State: AO0yUKVJlUECrVjEI/zIAMGzECLcQgnKaODJIxhkK/OIK8dVqBpcnTZx
 SSPrbbMiO146ScumGgxeBzY=
X-Google-Smtp-Source: AK7set+Uykg24wX57cV5HATWYP9Pi3m1/igUgMzlaXoDtRCqnCQ049TPB17XBWPfdk0NGL4xtLeN5w==
X-Received: by 2002:a5d:5548:0:b0:2c7:2cf4:baff with SMTP id
 g8-20020a5d5548000000b002c72cf4baffmr10862293wrw.70.1678206543496; 
 Tue, 07 Mar 2023 08:29:03 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a5d63c2000000b002c8ed82c56csm13295109wrw.116.2023.03.07.08.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:29:03 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8354e562-bbe5-d239-27a8-ed26bf537d5a@xen.org>
Date: Tue, 7 Mar 2023 16:29:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 24/25] hw/xen: Implement soft reset for emulated
 gnttab
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-25-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-25-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This is only part of it; we will also need to get the PV back end drivers
> to tear down their own mappings (or do it for them, but they kind of need
> to stop using the pointers too).
> 
> Some more work on the actual PV back ends and xen-bus code is going to be
> needed to really make soft reset and migration fully functional, and this
> part is the basis for that.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_gnttab.c  | 26 ++++++++++++++++++++++++--
>   hw/i386/kvm/xen_gnttab.h  |  1 +
>   target/i386/kvm/xen-emu.c |  5 +++++
>   3 files changed, 30 insertions(+), 2 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


