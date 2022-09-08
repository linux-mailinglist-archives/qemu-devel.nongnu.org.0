Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163B5B17D7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 10:56:52 +0200 (CEST)
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWDL8-0006FO-VZ
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 04:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWDIe-0003Mh-AT
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:54:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWDIc-0004rP-ID
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:54:15 -0400
Received: by mail-wr1-x435.google.com with SMTP id bz13so21426345wrb.2
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 01:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=8pwS46Wv1qRqhfAGH4Pls5aI26zvRbKecFSkXt1e9Oo=;
 b=e5J85Frmr4SB/e17PGTAJ7y0PqntpZyUmN3Ea97lKIzOu6sK4FRHzeAxeC+kn++Yhc
 PrimHQPVNAABz3anR0qsKuXG1RDl8uY2h5BWFQtcpSgjuf29iW3P5oUpPMlRk9AvDHeT
 qnnl+BqZ0jRxIx+9nbU5GLgM00k3yW2EzM4qsa3yejS5n1zfZR4en0ixNZbAA+hVUVZN
 akYqCKCmy36PtKXHe6UMzw2f0QjVqDkBMDbpd1l2QWMinW9zm/mIWv7CfqPgOEUyf+2p
 R4YOjSqm1WdbHBsXhN3nl8tLI84zTP53dXEElefaxUDFwEjgS8tpta1Fy9rTOptOwlA8
 9BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8pwS46Wv1qRqhfAGH4Pls5aI26zvRbKecFSkXt1e9Oo=;
 b=0V78rxEs8zS9P3vlsNw8rIh/j8dHye+o1TGd/3VkOtaweI1pq4dIkI8TLhYmp0wZOY
 2K0UMHkQ8AklnMoe+FiSd1vxCWs/HExpVID5xrlrNqg4g9iaODeW0Y5XNE23AjHOqGm7
 nPGU0HU45s7s4rjdiywIe9LkEZAnKAqgm60ZBJvBJuTSKzjQYudsjd1ppsCj7xzVmgaB
 JSgaKY8H12a62c3BMLx7pLVL8tR0Rvl4MBeEnGc+tbcOhoWJsNwREDyk6k6vtgcGUIAE
 OaN55J3zyrg+Xb0a0Sr1I6z5wA5HcSJSbRWEogRWnhwqSaOhUcMtXBFnaoBgH0qUlUNZ
 BtPQ==
X-Gm-Message-State: ACgBeo20mb4hTG3aA6a3lKbpBFl5RJ/7LPn8TQIFRCRJCUFmPN/B8gdo
 V8Hf+Nd2fI1CsdeCYiVeb6KUfA==
X-Google-Smtp-Source: AA6agR4pHed+iE3WrrXvUMr8HwWRjRgEdw+AiYBzoP/ttSkcYq0a0sc6oQr9y+pXv0W02EgBKzZY5A==
X-Received: by 2002:a5d:584e:0:b0:227:1004:cb6c with SMTP id
 i14-20020a5d584e000000b002271004cb6cmr4281500wrf.232.1662627253119; 
 Thu, 08 Sep 2022 01:54:13 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c2f8800b003a5ffec0b91sm1960281wmn.30.2022.09.08.01.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 01:54:12 -0700 (PDT)
Message-ID: <55c12b39-9e2f-aa3e-2581-3b5d2520f638@linaro.org>
Date: Thu, 8 Sep 2022 09:54:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] configure: Add -Wno-gnu-variable-sized-type-not-at-end
Content-Language: en-US
To: Chenyi Qiang <chenyi.qiang@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220908080749.32211-1-chenyi.qiang@intel.com>
 <20220908080749.32211-3-chenyi.qiang@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220908080749.32211-3-chenyi.qiang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/8/22 09:07, Chenyi Qiang wrote:
> After updating linux headers to v6.0-rc, clang build on x86 target would
> generate warnings like:
> 
> target/i386/kvm/kvm.c:470:25: error: field 'info' with variable sized
> type 'struct kvm_msrs' not at the end of a struct or class is a GNU
> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>          struct kvm_msrs info;
>                          ^
> target/i386/kvm/kvm.c:1701:27: error: field 'cpuid' with variable sized
> type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU
> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>          struct kvm_cpuid2 cpuid;
>                            ^
> target/i386/kvm/kvm.c:2868:25: error: field 'info' with variable sized
> type 'struct kvm_msrs' not at the end of a struct or class is a GNU
> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>          struct kvm_msrs info;
>                          ^
> 
> Considering that it is OK to use GNU extension in QEMU (e.g. g_auto stuff),
> it is acceptable to turn off this warning, which is only relevant to people
> striving for fully portable C code.
> 
> Suggested-by: Daniel P. Berrangé<berrange@redhat.com>
> Signed-off-by: Chenyi Qiang<chenyi.qiang@intel.com>
> ---
>   configure | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I'm surprised this is on with -std=gnu11, as opposed to -std=c11.


r~

