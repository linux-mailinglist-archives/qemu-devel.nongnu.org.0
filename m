Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E3B4C105B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:35:18 +0100 (CET)
Received: from localhost ([::1]:47974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMozN-0002RB-Ad
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:35:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMoFU-0000bQ-MD
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:47:52 -0500
Received: from [2a00:1450:4864:20::634] (port=38892
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMoFT-0008Rn-44
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:47:52 -0500
Received: by mail-ej1-x634.google.com with SMTP id r13so28090950ejd.5
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c36kTk5zf1a+UWL/uQH112pFJ6iLpdREukza2koxiaA=;
 b=ocSTLNGhJpPxLpC8EDTrbpkEPLCEiSKn74UmlnDnQ7xWmhWj3wM62f/M7UTb3ocfaf
 LOuDYRK3LOJ/PGXcs9SUSeYAeTGBkpC5xiwNLE43sDcM4aN6qQ9FUwzEvVTyRiQNtMqY
 U8VPbxXe5ojvmUgoqxQcqKRgXfLm8CFj3lxizN1+Kt9KNdA8nue4Oj6e13g0iL4Kjxih
 TfhBZdL+PyGhF3P/+UKukJcPYT8TP2GqpnavD+seFbexyPiRb6Io/mibW3fiPDF0pchF
 z3hS+cKXE86I7qR9P3+kMvMI60V66bYx1UXbwyPsUJhCB4mRR3Ouy1TLE9D6RHhtOSxu
 je4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c36kTk5zf1a+UWL/uQH112pFJ6iLpdREukza2koxiaA=;
 b=A4n4U7GvOFJiKNlHkla5SRHVOTDdWcjOOZdkuGF3qf2erlaDpMsvsbMDXwJgZPKB3M
 I2bjrSLF2RUVkvcaybq0DNBFC4brHhsm/JcTUDdiUjH+bTbQLtOkFm3QylvR9gG37X9j
 /nEu00hhIzBpm3xPQplp/yl7CW7mTm/NG5WWrJegdUe7aBKfm0T42u/bpF6QEiONqZyl
 iaublQAmRQ3adjuzRFFBneTapWt4x2MPMGzoAN7/EqOopyiNtyIYvwWQ+j8t/N32ONFc
 E+Ffgz5BWR2NcMX3HCd1A5rlk6k+mLY38bytaXoUI6vrkwuHsqX4PbXiDJkHkbo1Uv4m
 Eolg==
X-Gm-Message-State: AOAM532nB3HNNi8oBj+1WPehupV5ucH1CtYneu2oPr/Vl0s5iYJP794o
 Urdzhalz4lhOAR2inonRmqE=
X-Google-Smtp-Source: ABdhPJxOpT0Oe6FjtU4UCLm4EUG8DogbiJhAvCroa7vHBiMAn2hldz8Q9hdg7RbIe/UI8RiNoP5Jgw==
X-Received: by 2002:a17:907:2954:b0:6cf:7634:c6b7 with SMTP id
 et20-20020a170907295400b006cf7634c6b7mr21801131ejc.683.1645609669063; 
 Wed, 23 Feb 2022 01:47:49 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id fn5sm7191652ejc.179.2022.02.23.01.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 01:47:48 -0800 (PST)
Message-ID: <c3bffd7c-0f03-b843-befc-d22b83bb010e@redhat.com>
Date: Wed, 23 Feb 2022 10:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] vmxcap: Add 5-level EPT bit
Content-Language: en-US
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
References: <20220221145316.576138-1-vkuznets@redhat.com>
 <20220221145316.576138-2-vkuznets@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220221145316.576138-2-vkuznets@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/22 15:53, Vitaly Kuznetsov wrote:
> 5-level EPT is present in Icelake Server CPUs and is supported by QEMU
> ('vmx-page-walk-5').
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>   scripts/kvm/vmxcap | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/kvm/vmxcap b/scripts/kvm/vmxcap
> index 6fe66d5f5753..f140040104bf 100755
> --- a/scripts/kvm/vmxcap
> +++ b/scripts/kvm/vmxcap
> @@ -249,6 +249,7 @@ controls = [
>           bits = {
>               0: 'Execute-only EPT translations',
>               6: 'Page-walk length 4',
> +            7: 'Page-walk length 5',
>               8: 'Paging-structure memory type UC',
>               14: 'Paging-structure memory type WB',
>               16: '2MB EPT pages',

Queued both, thanks.

Paolo

