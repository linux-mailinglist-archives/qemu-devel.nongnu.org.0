Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9715AD304
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:48:43 +0200 (CEST)
Received: from localhost ([::1]:36212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBWs-0000yk-Qm
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAjr-0006cW-TQ
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:58:03 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAjq-0006MZ-8S
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:58:03 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f15so6290642wrw.3
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=/ZR5+n/kOnkTvHrZMeBpu73GzoPSS73HyeEGCzMAi4M=;
 b=fKKkuuAvnhQAzYcbPHrh7nvqbCdOo8JmFGvoRf3pvzgdnDVmVm1ciwVFuwHV9IvkR/
 p8toGzB8YZS+Lzx8/U+l2cRe8MVL0Qy26Gc8HvkTqmaFchITe08mAUtDHFwTeLwx/qxn
 f3TjSIOe8kY2T+E/KWqdgxR7NK23lXnXXNqS6LIuAJ/Y3N3W6uX9NvNUfE+28Tfpy05S
 5PY6Syoo32wlM+7DpZckyuguZ4Tf1NNnyou5GkSVxyKe7ejd3JbzaqshmdOjIoBDoyPk
 FJKLetfTR4noeJz/TVeYcviDaMedaf0iUwsxZEWbliOExjhGfLlS5QgRQlZGV4mWvfAY
 Lywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=/ZR5+n/kOnkTvHrZMeBpu73GzoPSS73HyeEGCzMAi4M=;
 b=qVUy4/LiDH0uW/zPETa21MxKCS/N6YPZ8US9+8T4xrIsACgELs2Ashvq8L2PT4Of6c
 cmqtRUtj4CYQN18zJvU+1k9kslMEv9p0CijKOHaFD/LsnQfGr5CPqsceUj/AS9YUv8gZ
 rKaBZdeEplZWGneRyUDC5Pc1fkIL8EtNo0mKA4kiss+xJMToiACATffVWb68a39Z7DCs
 F8UWgyzSwoEj7Hh4tRb+zYG6q+I23SpV120Mc7803qKRD0QdPuycc0uvpJ3z0lafREWE
 +OOSqcoeVAsPR/g8pVvatfXqj7NNNSd7qY/nCwXiXNx05RkQ5XpZwqRY0JBlZoumlI6P
 1BVA==
X-Gm-Message-State: ACgBeo2sjB3rwekrOO4xBd2ggQ1Yg0DWJmuj3DRsldtORTEON5jg+3pg
 K21Uqk6SQBbRqHvWiGuXTbdYkA==
X-Google-Smtp-Source: AA6agR6JRfwPNiywyrQJjdothZ625aiTuuLYmQQ2zjqSQCcSY5vkb6eDXcAGJTcgh6W0XRfzlQAD1Q==
X-Received: by 2002:a5d:6987:0:b0:228:623e:2dc5 with SMTP id
 g7-20020a5d6987000000b00228623e2dc5mr5241765wru.574.1662379080670; 
 Mon, 05 Sep 2022 04:58:00 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6d42000000b00226f0a00348sm8624127wri.111.2022.09.05.04.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:58:00 -0700 (PDT)
Message-ID: <4e4aa20e-a3c9-bb3a-4962-3906d16034d8@linaro.org>
Date: Mon, 5 Sep 2022 12:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 19/20] disas/nanomips: Add struct keyword
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-20-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-20-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> Changed the type of the table parameter in Disassemble function:
> - from const Pool *
> - to const struct Pool *
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   disas/nanomips.cpp | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index ab54456c2e..7315484464 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -635,7 +635,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
>    *      disassembly string  - on error will constain error string
>    */
>   static int Disassemble(const uint16 *data, char *dis,
> -                       TABLE_ENTRY_TYPE *type, const Pool *table,
> +                       TABLE_ENTRY_TYPE *type, const struct Pool *table,
>                          int table_size, struct Dis_info *info)
>   {
>       for (int i = 0; i < table_size; i++) {

No, this means you're missing a typedef to comply with coding style.


r~

