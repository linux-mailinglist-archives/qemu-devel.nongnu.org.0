Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A33493757
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:32:32 +0100 (CET)
Received: from localhost ([::1]:40520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7KR-00074L-Vu
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:32:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA6Yz-000456-6h
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:43:32 -0500
Received: from [2a00:1450:4864:20::330] (port=35658
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA6Yx-0002Vm-Qy
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:43:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso12672595wmj.0
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0Tp4VOh8HmeV6fvEKBevJG3RPraF2LeYf4YqSK+Ams4=;
 b=mTigTHr1WSMAfTU2dvdtz3/VCUQBit9I8PISf+7DXR57UchQttfp77DubnwcHNbcWp
 msfhSEMD4gBt8c5sblVsWYfOu4NZ2SjnPHAF8M7+yHY8eHM6AblthqYQUYTN17FRSUXV
 bkVHCDDmK05Jtfb30tRX0SZhEVnpUjaPqY/0yMKY+Eugh8Y3uGxCxnBH4JDJr3hUOzU9
 zR5F2CmnhgKehYuyl022DKbS/BeSlP8mUik3pAczudMq1MnsmTYoJGdKCOIBZ9jw2Z4s
 rFdh964Rnp9xHwWe8d3gWQfHXj/l9gkPyjxJUPfTDFqiM0/bb9EtmslcM+VNK4H3TGn/
 kHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0Tp4VOh8HmeV6fvEKBevJG3RPraF2LeYf4YqSK+Ams4=;
 b=csNZcO7hPAGMdOmQub0SKUDLhh9DKFr7IoeP2vRMkxQy3fGX+FSnenNdj9Kzqox6H9
 oiHuOd8dOqd19wGN0Deo/gKStiFxYtI3g4CeMViRD611Ai4lZzI21VJnkTK+h/POw4p3
 TK4Uq+37ZzNF2fzjyK0htpnvYggksYdTk3Hn0x5MZ48Tsq8cd2vHDAuE+t8J+prDP5dC
 Uki9D4j/73MfkrXfAjm15gOt7RdM2LdwCpAiNbhp9N57+pjb5+ENQKvXtXEz/5yedLTV
 q2zjyxSmEtzYHBsc34/UruGnfeLumRlJ25yIPs6SH7CtEQ0uADpA6RRXSs7XsCEdQQfZ
 Qfbw==
X-Gm-Message-State: AOAM531ZveOzapD84cAc1G6RN2F5k2li080+kUt6fXX5+YC4BbI9+8Zb
 j1+93RLqPwuDCclvidaxwfE=
X-Google-Smtp-Source: ABdhPJy2RVy8zY7xVw0pde8Wb+6hthwiyziHJaBC7+3XjvfdS1YIK8NgAmFcAmWI96DDA/u2RG9W/g==
X-Received: by 2002:adf:e312:: with SMTP id b18mr22257951wrj.321.1642581805730; 
 Wed, 19 Jan 2022 00:43:25 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id u16sm6093023wmq.23.2022.01.19.00.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 00:43:25 -0800 (PST)
Message-ID: <b0222e34-4b85-c909-3d7d-27536dbd5bf8@redhat.com>
Date: Wed, 19 Jan 2022 09:43:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/3] qmp: Support for querying stats
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
 <20211119195153.11815-2-mark.kanda@oracle.com> <Ya+rLex1djU/1Wc1@redhat.com>
 <ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com>
 <5b2f4acf-29fb-34fd-eee0-341eec163da7@oracle.com>
 <a39efdf3-82f3-9042-8b53-86394d7aa90d@redhat.com>
 <Yea3+t4qtk4iB9jr@redhat.com> <20220118154731.159e4b23@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220118154731.159e4b23@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 15:47, Igor Mammedov wrote:
> and what exactly this CPU ID is,
> may QOM path pointing to VCPU instance would be better?

For x86 it would be the APIC ID but yes, having a QOM path is more 
future proof.  Thanks Igor for noting this.

Paolo

