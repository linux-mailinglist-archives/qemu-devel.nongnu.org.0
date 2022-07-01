Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DFE562D83
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 10:11:42 +0200 (CEST)
Received: from localhost ([::1]:55760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Bkb-0000xr-5i
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 04:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o7Bcm-0005fg-QR
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 04:03:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o7Bcj-00008y-Q9
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 04:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656662612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8GV/psWE7C8PMP0YvCypC3Cung7iMKr8k/7BjBETg8=;
 b=QXGXiPeqXPNbU8bQS3ZQAlfeDVbokka6Y4hU/J0O2OaJqZdj9G+0e1yeqFmsYG89tO0E7z
 aMVWPYwmD9gFUpTYgrI90c8natojlaF/Sw5YFfhd/nkyskjTdnvdmLvhvCez01hkpZ5gi/
 AnvRQG2GBoysgRjfbseDgrLiSUPeZl0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-duKE1oLqPsaT4Gpl51k6kQ-1; Fri, 01 Jul 2022 04:03:31 -0400
X-MC-Unique: duKE1oLqPsaT4Gpl51k6kQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 n8-20020a05640205c800b00434fb0c150cso1222885edx.19
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 01:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f8GV/psWE7C8PMP0YvCypC3Cung7iMKr8k/7BjBETg8=;
 b=NBUHkatYNB2MLtUDxCIRt5BQ+56Q9/ZsAkzsz1iZZ+FPmdPywpTgZ0edl3AvVZZoBY
 +zIGPpVWq3zq8MCBM8y0J8/pVjVccFA+TEdoZbjvmx0E1kH8QjTV9o7K3n3wLI1veT57
 uP+tcqRw40fsOXWqL8K5yKfkMT9RS+jSjCbTRhouJWj/CPJDCmJYuRBO7A74t0XofEfZ
 IYQdXNvcW5+P15/y8brxMmKy1ChEg6GEMf7La9ba3lxDcUyF8JqVAoi1vM3HmI0N2TPv
 /AB1TWi5uE1wKKaESSO0m8X6xw/HTiJFP+rFvccjTf8f7oeOUX+9NRWtPRsPq+A17XeS
 H5vg==
X-Gm-Message-State: AJIora/tI6PJuZ7ISswJBtDtxhL/pFUyuTD5LFvXJGuzh0vCkEeS9BOv
 g9le/33I8drjRy7XYylcfWqLv6YNlu1exJAUmwhsJiV+0noBFkiOKWZ/lWY/TstPuGUGjLoUnxA
 SMHPZW+hvNDAPhJM=
X-Received: by 2002:a17:907:9687:b0:726:3afa:fc7b with SMTP id
 hd7-20020a170907968700b007263afafc7bmr13147209ejc.82.1656662610423; 
 Fri, 01 Jul 2022 01:03:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vekS9pJQCBOMTqSTXFHjG6brVhtmRnPZjWlLDNl+ZFPMFnrSmGdtZJpraRGEh/eCYrXCWtuw==
X-Received: by 2002:a17:907:9687:b0:726:3afa:fc7b with SMTP id
 hd7-20020a170907968700b007263afafc7bmr13147187ejc.82.1656662610228; 
 Fri, 01 Jul 2022 01:03:30 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a056402111100b0042deea0e961sm14706075edv.67.2022.07.01.01.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 01:03:29 -0700 (PDT)
Message-ID: <f7bfad22-4066-f057-cc15-6982d7117944@redhat.com>
Date: Fri, 1 Jul 2022 10:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 01/10] tests/qemu-iotests: hotfix for 307, 223 output
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220616142659.3184115-1-jsnow@redhat.com>
 <20220616142659.3184115-2-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220616142659.3184115-2-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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

On 16.06.22 16:26, John Snow wrote:
> Fixes: 58a6fdcc
> Signed-off-by: John Snow <jsnow@redhat.com>
> Tested-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/223.out | 4 ++--
>   tests/qemu-iotests/307.out | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


