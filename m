Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B744D97E0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 10:41:30 +0100 (CET)
Received: from localhost ([::1]:36938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU3gH-0006m2-4B
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 05:41:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nU37e-0001p6-BC; Tue, 15 Mar 2022 05:05:42 -0400
Received: from [2a00:1450:4864:20::62e] (port=46021
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nU37Z-0000Ar-V5; Tue, 15 Mar 2022 05:05:41 -0400
Received: by mail-ej1-x62e.google.com with SMTP id qa43so39444274ejc.12;
 Tue, 15 Mar 2022 02:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6V1r530a8YNdLCqRPfoEvxF4oA2ADhoxNK/3hcMRSHY=;
 b=I5MRX6BsWrk5wiARrOX0XN2zXKnY2amHINNuQZY4z/ZOTuRXxZu3Q0Wqg6/Wmmh04N
 GcB15UKEcQSGjZ98knOZuObxpIo3hebjUIuZEXhhAu4dE0nz4fYTVDvmEBenJ9zvEDKL
 P5PzBlhg1CmWRDxu18KWh5N5yE5zZClqUp+6+i7bqSMoldJBqwYCKfzQlVZ64V8L/Zq3
 7Ek1XjatK1FdFCdq6Me6oMccWb+GqRMw0tQzwt6x6MqIwYdJvdkQdFPII+LUK3mnEi+D
 cs2VyfQpwLwV3+NwnY/+mTsSKFsSDP+xR85VOXidSV7hlAGI/ZK1AnB8u+t1Wop7PyUu
 cVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6V1r530a8YNdLCqRPfoEvxF4oA2ADhoxNK/3hcMRSHY=;
 b=j5mRDMbPsFA/3qF6C99y/uPJFNqVCDysWJmqqQ6aAN4OyP5KYfDq8zqRcQR+6pyDP4
 sBVIUwDhQLfu0fUzPrSrI7uvTfhLv1XPoJTlViD6y5glAPMkTj3djh4oH3Utjuijlyk+
 mcTEaeiZ3ZEF4OkLEYXsBAX5AazZg/Osk6e4BGb0Yr7HGvbYOlxqK0AhB+c4a3ZP8juk
 7/5liwCjw2ElBLHOyYAK6qLFjGwuNCnsMxTKloZwN7p7qtw/aT1uxI7tmZeLBh9rxPDr
 uNnEvSSKOouWM3tfCWtyRHBCcOHyWa6ucAMTQ0IpHHiMtwwCXw+Vu68oPUbp40AsHHDD
 QtkA==
X-Gm-Message-State: AOAM531stlve59I9jBGZ4PA6gffaNg/u0+zFMTkQ6pw8k5Jy4S0crj3K
 HjDIKnpYi4ewriuaW3tcguc=
X-Google-Smtp-Source: ABdhPJx4sFDOpWsa+DI4Qeyjnu2qvmonDkkU57KUa7fSR+vJsSPu4aWRcBtnvF4yEOBOIfLxwoeEJg==
X-Received: by 2002:a17:907:168a:b0:6da:9177:9fdd with SMTP id
 hc10-20020a170907168a00b006da91779fddmr21828164ejc.757.1647335135464; 
 Tue, 15 Mar 2022 02:05:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 cn27-20020a0564020cbb00b00418b0c7fbbfsm564546edb.32.2022.03.15.02.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 02:05:34 -0700 (PDT)
Message-ID: <32b0d8eb-e00f-8468-135b-d508b82978ca@redhat.com>
Date: Tue, 15 Mar 2022 10:05:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9y0xQ2O00y1uJ5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yi9y0xQ2O00y1uJ5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: kwolf@redhat.com, hreitz@redhat.com, stefanha@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/22 17:52, Daniel P. Berrangé wrote:
>                  RHEL-8: 10.0.1
>      openSUSE Leap 15.3: 9.0.1
>        Ubuntu LTS 18.04: 6.0.0
>              FreeBSD 12: 8.0.1
>
> Ubuntu 18.04 drops off our list after 7.0 comes out
> 
> OpenSUSE Leap 15.2 was EOL'd by SUSE themselves in Jan 2022,
> We use it as a proxy for SLES, but I think we can required
> SLES 15 sp3.

(FTR, OpenSUSE Leap 15.3 has GCC 10.3.0).

> FreeBSD 12 is something we still support until April 2023,
> but arguably we only care about CLang there.
> 
> NetBSD 9 wasn't listed, but it was reported to required
> GCC 7.4  (commit 3830df5f83b9b52d9496763ce1a50afb9231c998)
> and that is still the latest release of NetBSD.
> 
> So NetBSD is our biggest constraint on requiring GCC 10

Do we care about the BSDs since they have newer compilers (including 
gcc10) available in pkgsrc?  If you go by the base system, then RHEL8 
has 8.5.0 and newer version are only available with packages such as 
gcc-toolset-10 and gcc-toolset-11.

Paolo

