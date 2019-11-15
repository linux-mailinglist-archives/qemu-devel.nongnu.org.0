Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE57FE455
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 18:51:02 +0100 (CET)
Received: from localhost ([::1]:43752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVfkL-0003e7-JS
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 12:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iVffa-0001J6-GY
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 12:46:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iVffY-00013N-Ai
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 12:46:05 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45278)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iVffY-00012S-2p
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 12:46:04 -0500
Received: by mail-wr1-x442.google.com with SMTP id z10so11867129wrs.12
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 09:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GB26p23NpMsoYf1/kDVcl4ibJNLTXkt3fjxxNjfTZmo=;
 b=iky6z/8lBSzZ1XZEfLue2pjp9FbG7rE6yiTEbyVMU+wikLNGndG0+rxllzqktrrxH8
 07WJy6lTWBuzsfGXa8EyXmlkzXQhWtVQXkjHbZOyb6jAvAJahfQnbg2xi1Me2v9M0CAP
 7uf5iwoFnXnhimJ051mivsBYPdprMvGIbTokhxPfHptu7hEfflE8Sr98sSf0cw8w6zR2
 SbDPKDNwu2lCzmzotkTfdYZRWBxt4ddmo1dnEnLTR72+hP6/AwzK8U/E97u3hqIZro6O
 AMI2wyaOYw1Ao16I6JU/3doeGbn3bx3BkE+ouJNJnXWYjJfDUeI6VAcvjGiqqhegK1I7
 sJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GB26p23NpMsoYf1/kDVcl4ibJNLTXkt3fjxxNjfTZmo=;
 b=lfgHHhdAj+bWwfFqR/tARP6U2yB1++GmFreLmKMUXDveW5r9kj7zoSCcgGTmsy8Q1y
 AMhfHL/Ta+9IiH46sz3lTrvL2hiKqS5w6YVocy+pirV3d7guX+LbornmaGzUj0+/TlHy
 l7q81cpH7kPAIolcT4MeqR0G6786NCgFTYG1RCjiY9TqUnGW4VKpRpZKA8IJU2rOtwDR
 US9vxvfM17oz7aEQecW3syU4WPWVXJ5urZiqQmBwE1JwpyHvIZemNgQ3X+Mqin1WXpJc
 /ZAq4J1sb5j7k92zPgPfuEgDKxe5CNts/1g6b0TjuFMJhWW46HQaqaiOkJ+W3uJgG6aE
 uKpw==
X-Gm-Message-State: APjAAAUqxRPivHvJG358qSa3V9E1h9AOx4g1uVUrzcklaN32tDmO4zNr
 ClBmo8nOpm9IRypsctSrLMIVjw==
X-Google-Smtp-Source: APXvYqzCzgOuhulQaMbfhEiXMNJldXSKA6UETdB95uMpFtQecGpP0guNFWrxaCMhjqXDg+aRbw/H8w==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr16199330wrj.21.1573839962684; 
 Fri, 15 Nov 2019 09:46:02 -0800 (PST)
Received: from [192.168.8.102] (56.red-213-99-189.dynamicip.rima-tde.net.
 [213.99.189.56])
 by smtp.gmail.com with ESMTPSA id c9sm9808523wmb.42.2019.11.15.09.45.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Nov 2019 09:46:01 -0800 (PST)
Subject: Re: [PATCH] target/arm: Clean up arm_cpu_vq_map_next_smaller asserts
To: Andrew Jones <drjones@redhat.com>
References: <20191115131623.322-1-richard.henderson@linaro.org>
 <20191115160630.ofkre7rp5gszbpcd@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <989b6a18-9391-7351-74f5-9cd012f6aaa2@linaro.org>
Date: Fri, 15 Nov 2019 18:45:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115160630.ofkre7rp5gszbpcd@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/19 5:06 PM, Andrew Jones wrote:
>>      bitnum = find_last_bit(cpu->sve_vq_map, vq - 1);
>> -    return bitnum == vq - 1 ? 0 : bitnum + 1;
>> +
>> +    /* We always have vq == 1 present in sve_vq_map.  */
> 
> This is true with TCG and 99.9999% likely to be true with KVM...

Eh?  It's required by the spec that 128-bit vectors are always supported.


> Maybe we should just remove this function and put the
> find_last_bit() call and all input/output validation directly in
> sve_zcr_get_valid_len() ?

But that makes sense all on its own, so we don't do quite so much +1/-1 faffing
about.


r~

