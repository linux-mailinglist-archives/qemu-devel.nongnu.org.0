Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DB86F41A7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:32:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnIK-0006cI-MT; Tue, 02 May 2023 06:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptnII-0006c7-0W
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:31:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptnIG-0008Ot-5P
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:31:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f315712406so162307985e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683023493; x=1685615493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8/OVV9I4CIDysJmE9VIK4NDj31K2RbqXxjAjbiILTlY=;
 b=m8Y8qqzzqYxUWi1aTlgz4ydsT9vkvFFKO+ECBfMJsmY3cBqqOIcAJWSBKseWLaWROU
 Yqh3djAZWMdLia/sSyinDQYU9NgWf8KDJoAHo3jzta8jCcwJpgJqqE+8CzkXcsmzADs+
 d8dB0jHLimTzd5NXdwYWXBTToSim3urYbttkM5YjZPSglROrBVq1GbrDJCotmlXjWKX3
 07nvH6d5bKQq3Zsc4Q1OUAQNNaoHzZYa2Xsxe/6cF+CkysycgDSV/cO3dnfngCguIPkE
 am9kLkcGOe3HJpWK12HQJ+3z9dPZ6khlQZ36ZmLnbBZo10xqruCDJdIrLbmR4bWT0A/F
 JkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023493; x=1685615493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8/OVV9I4CIDysJmE9VIK4NDj31K2RbqXxjAjbiILTlY=;
 b=hucTlooP9yaTts6VhZINjkF0kKp5Mwh+6fnMTrjD8PbO6A1NVdgLy0ac0/OFKQ7ToC
 DZwzE7lR29nr2U+eSDzImBmmAafF79gHNnsy92WC/oUcX8RALAT3Tk+GqSZfcZf14NZX
 MeSSzXCha1ek5eYnksSNivVaO9zeX1FxbE3FVnOPtz85WspNazRFMaIT+E/IdIM7d75Z
 g95FnSP9qYB+mRzZPcSy/ZPvPBYmLrzpBcyfkd84TyDJVqqOhbk+0e4Sw6aHQWLtFRbc
 GhoAISH4+eCAXoe5fl0tbJtJR8yWR5i+6Frg9KjM6NMSmg/6l9u63SkcW+jsIwZ/jfiH
 J1sg==
X-Gm-Message-State: AC+VfDw9AcbD1nrwt9aP9pKuekoRnj53zeBlbTTuGjbr5zQamHmT78UZ
 YQPbiunfEXxoCHDTosQvosjuAw==
X-Google-Smtp-Source: ACHHUZ53Op+6jIHoIakWyLhXOFIP4tpZR+lYSdZVWZwhaZj/+r7eONAyT54U3MynvKtchhezj2l16Q==
X-Received: by 2002:a05:600c:1c22:b0:3f1:7a31:2c86 with SMTP id
 j34-20020a05600c1c2200b003f17a312c86mr15689941wms.16.1683023493382; 
 Tue, 02 May 2023 03:31:33 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b003f0a6a1f969sm38867069wmo.46.2023.05.02.03.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 03:31:33 -0700 (PDT)
Message-ID: <7a985d36-92fb-ceaf-0f53-2c607a8625df@linaro.org>
Date: Tue, 2 May 2023 11:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] migration/xbzrle: Use __attribute__((target)) for avx512
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, peterx@redhat.com, leobras@redhat.com,
 pbonzini@redhat.com
References: <20230501210555.289806-1-richard.henderson@linaro.org>
 <87fs8fus1e.fsf@secure.mitica>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87fs8fus1e.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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

On 5/2/23 08:11, Juan Quintela wrote:
> Richard Henderson <richard.henderson@linaro.org> wrote:
>> Use the attribute, which is supported by clang, instead of
>> the #pragma, which is not supported and, for some reason,
>> also not detected by the meson probe, so we fail by -Werror.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 

Queued to tcg-next.


r~

