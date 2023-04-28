Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7988B6F20D1
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 00:33:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psWe0-00009B-7c; Fri, 28 Apr 2023 18:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWdy-00008E-4a
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:32:46 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWdw-00064Z-9S
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:32:45 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so151197f8f.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 15:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682721162; x=1685313162;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O8L0o1sAlxY6lrvihDvAAf8F9qY4OxJ51gZwJAMl8MM=;
 b=wjZtAWpe2rXb0QPbB8GX3s0lvweu0Ibya7k0DWbGUU3P8fzuzmosvNFJkHJ4c0mPif
 b2ATjXtjXyzozy12gTToQ9+e9oXokhzIZKcZvJfldKeKejb9nt5atiUXO1hPY9PEn18J
 pqtalMDj7bVCaFF+Xil+E3e2rt3zvc7sCV9d/XrSDr7TslLtAqhKAjMsgHnw4GAvwyAP
 yVdNwtqpZtt2BchoVXi6EEsO3JWze+4LzZH5xy0AjmXd1iB2HETe/JrAmIxDY6GThCIB
 ho5vCKCzDSHsHfVzXvjIrfbboW6lSfp8Zlk90QtHWQofmuwwJv70U6j2cf4opx9BaLdY
 WAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682721162; x=1685313162;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O8L0o1sAlxY6lrvihDvAAf8F9qY4OxJ51gZwJAMl8MM=;
 b=JHZ/Q1hfEO2GynK2Y1daLJMou0lAUvtybLqyMXDTNRjjlUH+5bTjaWjrKCxu2Egya4
 vOA5ZYBmqfyW45fMug4IzdyQkQAb6n8Zf3EILIdX+B6pWh+sUqzRgtWxdCpWTvwbonl5
 PEb+aQbnatRYeBa+QS4kGAF+gp0PjRhMBy/5YXn9fOGru6hmzGpp1yCSHXtG6YI+WQqh
 ccDqf43OatA9nehMD+wlPQu4OxklFcICM0s8TuRuLMh/L81et7nNxlKcinkmX7dfBC62
 v0ZdUVKjD8RXh++u6Fmh0SNINJmHh6ww6YgiCenQsmm2x0EgS8H3/YiBz6AnDz/J20d0
 v05A==
X-Gm-Message-State: AC+VfDzPzUQndct1aftDPbrFPZezcYyMBj63BtdoLELIIhJ58Rt9a6vT
 uNf+79Ak3QL1gQTFNYcLHnRO7Q==
X-Google-Smtp-Source: ACHHUZ5C4D+3gTAx4ICr9zTxHJaaTEv2bP5RuQ/h7mn70+TcT4vTSAu3JOglWG4uVZb7K3nEFwRdTg==
X-Received: by 2002:a5d:6291:0:b0:2f7:f6e:566 with SMTP id
 k17-20020a5d6291000000b002f70f6e0566mr5344739wru.31.1682721162670; 
 Fri, 28 Apr 2023 15:32:42 -0700 (PDT)
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net.
 [88.28.19.47]) by smtp.gmail.com with ESMTPSA id
 w6-20020adfee46000000b002f0442a2d3asm22072998wro.48.2023.04.28.15.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 15:32:42 -0700 (PDT)
Message-ID: <d3e7cb83-27ba-b2e0-ac5e-73956725d22c@linaro.org>
Date: Fri, 28 Apr 2023 23:32:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v11 08/13] tests/qtest: Fix tests when no KVM or TCG are
 present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-9-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426180013.14814-9-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/4/23 20:00, Fabiano Rosas wrote:
> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.
> 
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
> 
> Skip tests that crash or hang in the above scenario. Do not include
> any test cases if TCG and KVM are missing.
> 
> Make sure that calls to qtest_has_accel are placed after g_test_init
> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
> printed before other messages") to avoid TAP parsing errors.
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/bios-tables-test.c | 11 +++++++++--
>   tests/qtest/boot-serial-test.c |  5 +++++
>   tests/qtest/migration-test.c   |  9 ++++++++-
>   tests/qtest/pxe-test.c         |  8 +++++++-
>   tests/qtest/vmgenid-test.c     |  9 +++++++--
>   5 files changed, 36 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


