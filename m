Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1A949074E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 12:50:11 +0100 (CET)
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9QWY-0004kR-0i
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 06:50:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9QUg-0003L0-VK
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 06:48:15 -0500
Received: from [2a00:1450:4864:20::333] (port=46060
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9QUf-000107-I8
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 06:48:14 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so22044779wme.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 03:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oEWKl2rs/VU5bUkXr78FDq/VGZMQu/FeLw+/4KD+8xs=;
 b=TYSPNWfuTjTmOl3Oq0iDGhsFtUDdMciSPAx6Ks0XTPkkfRVe8Be79q4gSrnpre/R7P
 OkiX8ZzQE+iZVfkeT7DdMnbqKnv+BKiIbKZSNCjwBS7Iyu+M93DR/5vYk0OIcrUVcOUv
 0HQuPsn/6Nr/Vx+uDUYRw5AcZsAh37YdFEAzdbblKqrl9hJglIG3f9SVfgj5+EwSpT0/
 oq7ib9HxyYhGYpmBGABsTTtt/7Akuq94J0nx1xuKpivU5apNUdYbpGPJMcA+Db41HLbM
 ggBwO5t2K9lxjRu4BA7YKuGP7YQN0XT+p1HGMI4VPKyCF0cNLMpmwxenCoxETbGaTrVz
 XWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oEWKl2rs/VU5bUkXr78FDq/VGZMQu/FeLw+/4KD+8xs=;
 b=NFiMwfkFfO6UeNIIFug/ibcbxk2aYgh/9BobKvrfpUn5f4QID5zeTmAyFFGXA2xH7+
 pdinRrOwKRpn7dlWmVdqF+P5aMK3WXzUn3FmScE0PGqsKA+ivfkP/kJFoaF25562BAWK
 DokeRhsXMGymVd2dU2dOZZxgX/gFdq7gm2Ad2A1Zxy4KoitX7Jb4ozV67vEbD8ML/nfJ
 RMAGjj+v/iCM1h3Aw0WyjuRgEt3MlT1u75cuxevtlTNIcamNlqdfKy2dfvfIiCRkbOYZ
 01DWlt8NN7dvSQFIaEnqSAGPCdTXd4OoteZyXoPrIclbR49ED8Oe1qmBHZYaDJLg2OVr
 uTmA==
X-Gm-Message-State: AOAM530xTxpNEfYEHmuFPXXDq5qFg02JwQvntF4ZECkCXFpKCtiju+k3
 dXzA+puIziWodO+muMDuJsg=
X-Google-Smtp-Source: ABdhPJxaBTPJVfKjCFixyXfqnF/fGtid1juIEg3tvuxRezrgR/Ki1EsToGLNxsxkKTju4AMCNyDCGQ==
X-Received: by 2002:a7b:cb8a:: with SMTP id m10mr27341492wmi.165.1642420092123; 
 Mon, 17 Jan 2022 03:48:12 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id z17sm13489819wrh.87.2022.01.17.03.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 03:48:11 -0800 (PST)
Message-ID: <c1a8eba5-b1a1-bbcf-c237-23e16ce88475@redhat.com>
Date: Mon, 17 Jan 2022 12:48:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 2/2] hw/i386/sgx: Attach SGX-EPC to its memory backend
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220116235331.103977-1-f4bug@amsat.org>
 <20220116235331.103977-3-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220116235331.103977-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/22 00:53, Philippe Mathieu-Daudé via wrote:
> We have one SGX-EPC address/size/node per memory backend,
> make it child of the backend in the QOM composition tree.
> 
> Cc: Yang Zhong <yang.zhong@intel.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/i386/sgx.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index 5de5dd08936..6362e5e9d02 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -300,6 +300,9 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>           /* set the memdev link with memory backend */
>           object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
>                                 &error_fatal);
> +        object_property_add_child(OBJECT(list->value->memdev), "sgx-epc",
> +                                  OBJECT(obj));
> +
>           /* set the numa node property for sgx epc object */
>           object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
>                                &error_fatal);

I don't think this is a good idea; only list->value->memdev should add 
something below itself in the tree.

However, I think obj can be added under the machine itself as 
/machine/sgx-epc-device[*].

Paolo

