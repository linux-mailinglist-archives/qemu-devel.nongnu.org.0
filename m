Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A196559306E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 16:04:23 +0200 (CEST)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNaha-0008IY-A0
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 10:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNad3-0005mV-1R
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 09:59:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNacz-00009S-SZ
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 09:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660571975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jnam0hWAQfM8nn2s327o4NeySnQLnHIFL2IB6HE5IcA=;
 b=dleWRdF52ERPEekes6m8ADcDzY87GOf9f+fiiGlNOCB3ncbRcY2wEGFQVXaXMKaY1Zuep2
 EtyVhjcPN2Qa/goZj0K1BhKs9LpGfewiRPE5cQAsG/pihZat+A5SQtMdDlx60518735uZz
 JFGzCQ0y//YYSqdOei+9NGjDeGDQaLE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-vh3eUT-9NPa4Ahv-6E3NZw-1; Mon, 15 Aug 2022 09:59:34 -0400
X-MC-Unique: vh3eUT-9NPa4Ahv-6E3NZw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d16-20020adfa350000000b00224fe84272aso758977wrb.8
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 06:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=jnam0hWAQfM8nn2s327o4NeySnQLnHIFL2IB6HE5IcA=;
 b=u0hjt99E+2asN+g9IA+8jQEmK3XZj7oiuGYrI5+XgZNd42J2H2A+od/RxrFoO0QRBd
 sbLGQFbW0Ko3Olb3Cynz1p3h8wbIQzceSWBHMRe2O8wqQd+lAHASqwR1rhzPpoaEBm9A
 sAeDsUelnA6C7LumuWZyzFLC2eNDMRHF/5/2/kT8AZ8+fEsCtlvCcAkpY0FNMbSsp4bD
 bKC94Sm24tc5RqhD3Y//wJ4B7o04AUENMjStpAla5FWdN1qUwdZE1np1ws58QpeDsF3p
 jjmD0Wv+cTPA7ProXkJjPpCjAiMLrL2T3q7L/mcCZluFHxlJEAKZH3NfA/w4MoNk+sq1
 hOlA==
X-Gm-Message-State: ACgBeo3vHK8ear6HvQpYdexCoZ4+F2y9yiGhCloHo7faAxlecuox27vv
 2USgGCbZR7j/B00B6MQkWB2jB1CuCpl3IBuFTVh0fJFIUoU1BR8P2fqOqrSOXE8HDf3KXZdeSXN
 SSItK8wIRLD+Syg0=
X-Received: by 2002:a1c:7214:0:b0:3a5:ea1c:c55b with SMTP id
 n20-20020a1c7214000000b003a5ea1cc55bmr4629606wmc.190.1660571973648; 
 Mon, 15 Aug 2022 06:59:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5kLxFMcgQpZu7nELVfyDSsET1QfVHSEM8fiuIYx2OJk6TAtYmw58tYMuTWzBfAK6h2GM3INA==
X-Received: by 2002:a1c:7214:0:b0:3a5:ea1c:c55b with SMTP id
 n20-20020a1c7214000000b003a5ea1cc55bmr4629597wmc.190.1660571973490; 
 Mon, 15 Aug 2022 06:59:33 -0700 (PDT)
Received: from [192.168.8.103] (tmo-096-168.customers.d1-online.com.
 [80.187.96.168]) by smtp.gmail.com with ESMTPSA id
 z6-20020a5d4406000000b0021d70a871cbsm7481201wrq.32.2022.08.15.06.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 06:59:32 -0700 (PDT)
Message-ID: <05f3b7f7-ddfa-4330-1d5d-1ae9cd04da19@redhat.com>
Date: Mon, 15 Aug 2022 15:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 02/20] disas/nanomips: Extract enums out of the NMD class
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-3-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220815072629.12865-3-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/08/2022 09.26, Milica Lazarevic wrote:
> Definitions of enums TABLE_ENTRY_TYPE and TABLE_ATTRIBUTE_TYPE are moved
> out of the NMD class. The main goal is to remove NMD class completely.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp |  8 +++----
>   disas/nanomips.h   | 59 +++++++++++++++++++++++-----------------------
>   2 files changed, 33 insertions(+), 34 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


