Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C190267F29A
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 01:05:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLYhb-0002eq-20; Fri, 27 Jan 2023 19:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLYhY-0002eE-SF
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:04:13 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLYhX-0001My-DP
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:04:12 -0500
Received: by mail-pl1-x62b.google.com with SMTP id jl3so6538166plb.8
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 16:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4SvC1feFkbBqy7QBIwsr7DmQNEtL+I701d5xBYA4Kl8=;
 b=as0397xBOTkg9YIlJfPvLDrOxcR3GQIJwklYVleFlM6YPKzh4iibDoQpGll4Y1PHML
 0ScKOMg+I6TZnxoMQVVE4oKVudimutX3CLZCI3qefQuo1yLDwLwHHVtLzHjF+ZC/YwZa
 u1HLDtpr92Y4yuyuiv8lMtU7+GsjSuCBn3B8cQB6GLXvq6ExAxLMo6ZIwPTzhQ8oajuq
 BJBVbuk6OO97s8kE0v2VD9bYAD8sKA4t2vDvwm001Eb/EtjDRSh//AblRuAKSRpnLo8q
 oYg3qR4XVCCR0yJnwmBFSJXoI0kt4wiXn58BdD7EhRFGqwhCAw4PfRJfW1VF7LYBodlK
 NCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4SvC1feFkbBqy7QBIwsr7DmQNEtL+I701d5xBYA4Kl8=;
 b=hGuMOTZ7zOdfQbyy56+U7wXSW7Tw0hubYRuSkIa7dsO3AmLIgt8IpOnQZ1LDjX0R0R
 mAY0uPR/ETmRW9QBZdPcraAsSc356IwwacO6gm8XyqAec362OnAktsg4/8781/0/4zCA
 FyxV0RQGf5Azgr8desiQEPiXX4+GjrIQ/BVoWg6Rl3rpo5b+UrbnVzpN1AJJcUQSxJEc
 jzo3LB9jYzF49GTGKiymQFoAtiNeWfvXN9TyIQ7MU/JmGs3TviQrsNAp9BrU+ophzGni
 2EbcFAI3PFJDhdVLOHpvafE5Sb1htBLoUaOOc/b/AS5FXOzDkhl6SP9g4031lI2NXd/h
 6yCw==
X-Gm-Message-State: AO0yUKXpVa49QSPV1pWWkkbJbZ1X8dRloXEb5caECrYXYu4oBbHAmYb9
 iVNNcWLoB9gC8PNZo+iAbH0lww==
X-Google-Smtp-Source: AK7set+gwomdMBVVWS8JBAcitf8EX9TORI/1i+q5YLsBPIM1IFblRySABjH0BTmGf4DPExYlpkLfyQ==
X-Received: by 2002:a17:902:d491:b0:196:2e10:ba5c with SMTP id
 c17-20020a170902d49100b001962e10ba5cmr78935plg.49.1674864248339; 
 Fri, 27 Jan 2023 16:04:08 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 jj4-20020a170903048400b00189743ed3b6sm3423602plb.64.2023.01.27.16.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 16:04:07 -0800 (PST)
Message-ID: <59472544-bea9-1717-6bf8-ee15503f06e2@linaro.org>
Date: Fri, 27 Jan 2023 14:04:03 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 10/16] target/arm/kvm-rme: Add measurement algorithm
 property
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-11-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-11-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> +    object_class_property_add_str(oc, "measurement-algo",
> +                                  rme_get_measurement_algo,
> +                                  rme_set_measurement_algo);
> +    object_class_property_set_description(oc, "measurement-algo",
> +            "Realm measurement algorithm ('sha256', 'sha512')");

Better as object_property_add_enum, so that you don't duplicate parsing.
C.f. NetFilterDirection.


r~

