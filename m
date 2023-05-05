Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9BB6F7E95
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 10:20:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puqeD-0007Cw-SV; Fri, 05 May 2023 04:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puqeB-0007Cm-Bk
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:18:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puqe9-0007rj-T7
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683274712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQqauCR4oeB9iJr7KlIXvJS9JCYwMo5ayMoqT5CXjPM=;
 b=G/OMej7pR/ksJ+1Asy0Wz697F9IvWRenWS/4rNE7ntiJG9/otrDpLqsl7+iFNZXl5zg4bO
 qcZlkO6PyyVBAE+S4JKKtx9hQPH0GSioIb0CFkxtFCGWB1QOZQWRo85BOrM2J5qukx9N6F
 3XeGFnLUVYN94Sb5jWPnQsmN+p5e8ks=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-oKl2GfDNMzaEWE9O1ejlhQ-1; Fri, 05 May 2023 04:18:31 -0400
X-MC-Unique: oKl2GfDNMzaEWE9O1ejlhQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50c9582877cso2210091a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 01:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683274710; x=1685866710;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yQqauCR4oeB9iJr7KlIXvJS9JCYwMo5ayMoqT5CXjPM=;
 b=j4kt3s9/XHJTmaWuY1nOA66O+xiBzjvdHUnZeBEql9rDjD7wM2SGy7Me++b5M9YN50
 TCekWTgTzNiWuf4HbjNvsKanF9Q0DAW/stmTBTbpYfUPuhxr+loFPgkMR55zxUvp2Bd9
 ZFzINzbK5FiWiYykvlmjmqqv8AjX69wO+fNT7bnN6Of4c+9DtrLqh1t13PZJ54XtA0Di
 38/DGKh0nO8YNOhN7jok2NT9UXob3DaV7skl0NBggf8SLr/CaZoK6kVc+LpQ6wkeeJ69
 ke3aL7iA3l1TRm/d/iMjCa6yeX6QNEd/P2FOV1UM8UQg5yXdlaVgoksv3UKRmsMcsmdu
 XCMw==
X-Gm-Message-State: AC+VfDxnEBe2QED2gh0k7BdmvTBhAG2zAIs3FIsFbAZSmpbhFBSJjZMA
 83lwSPOtNIESRNizcK2zPv3Ak/VtxKVklSPYaXFpkltmjq4VOIIRlrrbMquaNfFNdIzZwJvBwls
 h6ikxQW15UgXsqpo=
X-Received: by 2002:a17:907:704:b0:95f:969e:dc5a with SMTP id
 xb4-20020a170907070400b0095f969edc5amr1071685ejb.30.1683274710528; 
 Fri, 05 May 2023 01:18:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qTl++FhCyxI/AvOc1y64oCRlUvIAwN3R05p3HDxzp5/PO9NWWZQT11zdoShJdA8K6sHZLJA==
X-Received: by 2002:a17:907:704:b0:95f:969e:dc5a with SMTP id
 xb4-20020a170907070400b0095f969edc5amr1071664ejb.30.1683274710124; 
 Fri, 05 May 2023 01:18:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 jt21-20020a170906ca1500b0095707b7dd04sm635250ejb.42.2023.05.05.01.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 01:18:29 -0700 (PDT)
Message-ID: <cbae8ce4-675f-6ffb-dd19-7011f2535fed@redhat.com>
Date: Fri, 5 May 2023 10:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG for
 semihosting
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-2-farosas@suse.de>
 <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
 <CAFEAcA9y0tZVCSz93ziHkwYaM_whaEnCko2=Zzyb=BGFySJyRg@mail.gmail.com>
 <CABgObfbBTUUAOmvKz9U2Esi3rmdYmbhw3uR5iouFYUwFGoG32Q@mail.gmail.com>
 <875y98cktj.fsf@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <875y98cktj.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/4/23 15:01, Fabiano Rosas wrote:
> ...
> # This config exists just so we can make SEMIHOSTING default when TCG
> # is selected without also changing it for other architectures.
> config ARM_SEMIHOSTING
>      bool
>      default y if TCG && ARM
>      select ARM_COMPATIBLE_SEMIHOSTING

This can be replaced by "imply ARM_COMPATIBLE_SEMIHOSTING if TCG" placed 
under "config ARM" (and also RISCV32/RISCV64)".

Paolo


