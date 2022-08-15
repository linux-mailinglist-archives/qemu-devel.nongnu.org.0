Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E095933B5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 18:58:51 +0200 (CEST)
Received: from localhost ([::1]:32996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNdQQ-00068M-IR
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 12:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNd9b-0006wu-Fq
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 12:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNd9V-00007B-R0
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 12:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660581679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NR98/kZ7Krvw3RgPI8zkYdEIx996ywYJoRNniqLcJ84=;
 b=giEhruUcYL6udBh8lNLeG8rx/IfdkcBaysQo1PMH4LQtmXk1KoH2WerThbdcUxjXrkW3VG
 ESf+9bvihE+eDF4H/ZKJyIcfbCMUS21lHqCi1aJUFMsHDwKa7pueQxLhGbf3kwtmSxrAWp
 ahl3H7U0H6jFfmyJH2V/T6rMuDQxerI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-459-lj3uIBAFPKqaE54ADz-h7g-1; Mon, 15 Aug 2022 12:41:16 -0400
X-MC-Unique: lj3uIBAFPKqaE54ADz-h7g-1
Received: by mail-wm1-f71.google.com with SMTP id
 v64-20020a1cac43000000b003a4bea31b4dso8890894wme.3
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 09:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NR98/kZ7Krvw3RgPI8zkYdEIx996ywYJoRNniqLcJ84=;
 b=DZ4Eq/w4tIoB/sjHwMNW2BBGiYc70Lh3nKxNxocPSXLrUYaEuOWEV8/w5iGq/VQchF
 LVMzx7fAfEtV5Q2vdX4mRvA2swr3QClLc8wFCoTVSqc0Rd35rQEPodzwemSJ366JwJoZ
 UHKJu4G42tP1lQHIc82iEszXHXwTSyYBOia93RUIsiyOhoqiJvGlZk/us27S3MiZ8nkF
 kDPa3qVMXieOkUG7nt9PCE6aTfRCU7DX4ZtfMdgp4p5MqVMF5UWMFWZgBsa8N0jncSRW
 PFQDo1VYPFGjoDyMS45XiztBC0XzTRXL+M3QcZERLdSYxEK255pYifE2EKSHfOEbFqa6
 ux7Q==
X-Gm-Message-State: ACgBeo32yNKtM/Ptob6WBX2xdHgYtPqIFIoHdBGdIDEkZkkSn7c8Z/Ea
 vNDbAbBZ4IYcp3PtI4cIMh9bhdR5sVQlGWOo1Q7DSEtUe8isr0UTH6gDVsbzG7yPLPZ2B+Z2DNT
 dKNEx0/G7ix1vUTo=
X-Received: by 2002:a05:6000:1549:b0:220:71a4:58b6 with SMTP id
 9-20020a056000154900b0022071a458b6mr9239801wry.67.1660581675219; 
 Mon, 15 Aug 2022 09:41:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6reb6nQk18Chg3kRuanQoB1vMtUWO1PLnlaOUJaLEVV1AQ5ymTP/1FKIvyOBHlJrt8N6eN7g==
X-Received: by 2002:a05:6000:1549:b0:220:71a4:58b6 with SMTP id
 9-20020a056000154900b0022071a458b6mr9239785wry.67.1660581674988; 
 Mon, 15 Aug 2022 09:41:14 -0700 (PDT)
Received: from [192.168.8.103] (tmo-096-168.customers.d1-online.com.
 [80.187.96.168]) by smtp.gmail.com with ESMTPSA id
 n127-20020a1c2785000000b003a5c7a942edsm10270331wmn.28.2022.08.15.09.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 09:41:14 -0700 (PDT)
Message-ID: <89382fa3-b541-3544-e682-3bf63902d9b6@redhat.com>
Date: Mon, 15 Aug 2022 18:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 04/20] disas/nanomips: Remove helper methods from class
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-5-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220815072629.12865-5-milica.lazarevic@syrmia.com>
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
> Helper methods from NMD class like NMD::renumber_registers,
> NMD::decode_gpr_gpr4... etc. are removed from the class. They're now
> declared global static functions.
> 
> Following helper methods have been deleted because they're not used by
> the nanomips disassembler:
> - NMD::encode_msbd_from_pos_and_size,
> - NMD::encode_s_from_s_hi,
> - NMD::neg_copy
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 322 +++++++++++++++++++++------------------------
>   disas/nanomips.h   | 144 --------------------
>   2 files changed, 151 insertions(+), 315 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


