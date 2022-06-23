Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC5B557D96
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:13:09 +0200 (CEST)
Received: from localhost ([::1]:48300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4NZy-0001VE-8w
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4NYX-0008Na-GU
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:11:37 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4NYV-000576-NA
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:11:37 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o18so11220395plg.2
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tl0URfyotT5WVcOThX6e27/o2VoiAJcILioCasnB8lA=;
 b=Lc9Qt5xY/8RLn3UnG27UdzQ09wjO8pWmNWvLZ+Fnf2mi6vMQV4cLfoJVwv5RmPgup2
 OioG0htEnhuYB01jO4Mq74j3BkPydwpYLm1bNhhCeF7qHORXHtdzvjqMZ854a1+mjWBg
 +DOgSYdO5l0Y0CckoqFUjo9srp4+MqWi2ykYNpzRxXSaT337ERzs/1AGScemnVxTA/dV
 q39hJhleZVTl3ISzNTxyBBB0hCytVe6NzdH8qsdtdrKpXc3Y1IvlKqzbz9kKGffgCyh3
 S+r0meDcc9WRt1zgiLzPhIYGSwvm+75rpfJOzdJNUTTxi99hX5QxIpC+2375L+n4OGRm
 7B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tl0URfyotT5WVcOThX6e27/o2VoiAJcILioCasnB8lA=;
 b=NpdBAUUw5NPegCiDsrgD/AP/16E0z3L/xtIBdMQuRqJ20uJT1dUqsl5y4uMbduHyTk
 /Ks53qhWpia3i884IbKhYb3DFIMSc9Y67CPH/j/1JgBXD08+h7jE1FPDvBaOgxAS5OrB
 Q+Lc8EoCvkZ8HoFxRfD/N2mucZswSY8YivFlwqPYwcbPpduKdH20xadMBRiB0hPipq7Q
 0m48ASq4G5K76yKIMEj5NMzeTdWpkFk597fwJR0YopfQJ1Jc4GPb+TUlvf2M4O+ciefz
 ZOuUcvPh4kDX5i8iuXAeXt5iCBI3VI1xFa5+SFjYjXWTqiKe3g0Du0R+i6eIoQ/PSwWM
 ++Dw==
X-Gm-Message-State: AJIora8vwx5VNrVTVdAAwuEZAi2Dm8VZJs98LGTqIOpLlLdVrKSvju3u
 aj5sC4dvsGgXLzVohTMDD+Dj6xwgUqdDcg==
X-Google-Smtp-Source: AGRyM1suR5n+FBYoOIGxQntxsW2qzD2E2ywlGwSSzhXcdE90HHInmKyXU8jOO37ELHSNn9HLpjidvQ==
X-Received: by 2002:a17:902:dac8:b0:16a:4bc2:ebc5 with SMTP id
 q8-20020a170902dac800b0016a4bc2ebc5mr7610674plx.19.1655993493430; 
 Thu, 23 Jun 2022 07:11:33 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:393f:6246:99c5:ff8a?
 ([2602:ae:1543:f001:393f:6246:99c5:ff8a])
 by smtp.gmail.com with ESMTPSA id
 nr15-20020a17090b240f00b001ec98cc43e4sm1883559pjb.49.2022.06.23.07.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 07:11:30 -0700 (PDT)
Message-ID: <8342feca-4ce5-3364-c7e1-630e6b727e45@linaro.org>
Date: Thu, 23 Jun 2022 07:11:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 29/53] semihosting: Split out semihost_sys_read
Content-Language: en-US
To: Luc Michel <lmichel@kalray.eu>
Cc: qemu-devel@nongnu.org
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-30-richard.henderson@linaro.org>
 <20220622192555.GH28991@ws2101.lin.mbt.kalray.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220622192555.GH28991@ws2101.lin.mbt.kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/22/22 12:25, Luc Michel wrote:
>> +static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
>> +{
>> +    /* Recover the original length from the third argument. */
>> +    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
>> +    target_ulong args = common_semi_arg(cs, 1);
>> +    target_ulong arg2;
>> +    GET_ARG(2);
>> +
>> +    if (err) {
>> + do_fault:
> Leftover label?

No, the compiler would have warned.  It's used by GET_ARG.

r~

