Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE363E353
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 23:21:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0VSM-0007gi-E9; Wed, 30 Nov 2022 17:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VSJ-0007ey-3q
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:21:27 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VSH-0004YY-GN
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:21:26 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 k2-20020a17090a4c8200b002187cce2f92so3373429pjh.2
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 14:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YpbyKZHhQ+9GyRDwLBJbbvlydq6rJO+OfPJ1I1x7DhI=;
 b=eubBTdlaS5BWEX7YANUBgahUWHOUiYoOfFIFPujvn+Z0Dkr6+GMgyQKKEJFtDpOAed
 bH53nnJ+6Fw1Idv6Ca2r8QdfzgyMq9Qgpdiy6AZwGPhmhzL2cF6HF4xV1YXnhTeQ+aCg
 tbGesxFQx8SDXuZU2c390qgbQ+iPJFgMGge0RwLrG4UYglw1Ux5zQ+78FK0a2lvPr2rF
 XgHdDeWT9tVTU9QiBe+kuWb48olTuFTnhXwRzRCZpb03XqM2Z36mGy7RlZQp0wwWxZmN
 oNmPk/UtsMnUXtwAPYnQL2+6etV/KEakDMpaEg3GevHkc7b99HfpzKmFpdUT7tR8NW5S
 M6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YpbyKZHhQ+9GyRDwLBJbbvlydq6rJO+OfPJ1I1x7DhI=;
 b=WqxlTSEHG/hNrp7zX997m+rnKY6yUZURt6fKTX/ByXdluVo6+OlFq8TvrubbfcAq7+
 /Idve+9qIqtj4yncj8yooArNTX+FQw8DeVfDUII501eVE/1Xx+xZjZNmuZ9bOPzlcbIe
 LJKhzoOUHKQtPny6Yq/3OmAx/3+WXYAfPGCz3+uhlJ4BL5jX+SUVgO4eqaaexD4CmmE5
 ++XECE2HYDqjxIhOhIsN4MYO8nvMhucPEtFTKB7ShpBPB1xJP0WK8tfUQU1nZS+IrIGz
 bNCdx5kPxlOV2EeKvHAUb7YLGuA04nyfWE8ky9RBwbN/E6Z5uG8vAyDJvgPj9KfGMR1I
 gEFw==
X-Gm-Message-State: ANoB5pkwtd2PYoaVHuBIvmwW8GN/np21xwKMcE/8lV1r6OOQfqn12DU2
 7OwIl2ZSGQLWy7XBr/zu4gjwAjVtqXaxiw==
X-Google-Smtp-Source: AA0mqf62+WXnwqJ7CHhUR4CbBcCJ2iU3GNiCYGwDDLI8zelel0EoXjZ13+QfrTFJbxwcEHGZCaVl5A==
X-Received: by 2002:a17:902:ecd2:b0:189:5f79:6ac2 with SMTP id
 a18-20020a170902ecd200b001895f796ac2mr31969194plh.132.1669846884097; 
 Wed, 30 Nov 2022 14:21:24 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a170903044100b0017f5ad327casm1980408plb.103.2022.11.30.14.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 14:21:23 -0800 (PST)
Message-ID: <419a37dc-46b5-57fa-7f02-6b8f11d90b46@linaro.org>
Date: Wed, 30 Nov 2022 14:21:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 0/5] cpu: Move target-independent code to common
 code
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>
References: <20221130153519.46190-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221130153519.46190-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/30/22 07:35, Paolo Bonzini wrote:
> Queued, thanks.

I think at least two patches are broken.


r~


