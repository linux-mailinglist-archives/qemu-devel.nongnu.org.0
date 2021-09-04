Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F49400A71
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 11:28:50 +0200 (CEST)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMRyj-0006hf-CE
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 05:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRxg-00060c-E8
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 05:27:44 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRxf-0003wq-1w
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 05:27:44 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q11so2032457wrr.9
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 02:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Gt1TDtSZM7gt/wnudm/wl/AI4VyRb6Gkw/xszNFW0A=;
 b=Yi7bDBM0Xkv74Q5vkQqVA7wmKMBJed04bt+NViKsQ/RlklaYW4z6PmGMfYxR1fBEZD
 AK6kjf3SM/K5Iml823bRQtlokFoTGnBcRQerXgr0HtMlGc9y4RxSO4AUpWoD60l+57Fv
 fqjT3Sp9xz/KVs7aWRpP8hpFfSLJX86XJLeYEodgKD0guBxaWSPkpmxXJQLfkOt+cEsh
 YadMJVRz6MfGo2TdRCVBxB1+Yodt07k6z7j2CnX/YXc6WH9pgWXo+bIDcOMU2+PpkRJm
 A1scL7IpkVCG1sfQDkPMmG2qNKJRQhhpqh7kM3P8IqFoFES5AkBO5NP9X3tq9jEEr+3Y
 dtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Gt1TDtSZM7gt/wnudm/wl/AI4VyRb6Gkw/xszNFW0A=;
 b=Fxr/Ya6VAxCg8EvWfbqcN6WudVAxNbNOqvo/dltB6TpARBshsXEmFYt4//97h4HiQ0
 UYjRuwwA2tGqk1594TyeLGisX1i+eWOGkJilDkt/KRH9BBpZ5XmxFHLFNtDBWGixrFoM
 phwFQ8xsqQrVhIc2NyifcAcenD73+FBUPaznyT/QYdSBx/fIjZNwtS2cD6JJTBbNyLfR
 Lvlol0E5oP9Er0Q8g0KDHZQgk2ncdjoDogdSea1kwxsgpslr1dY2c25mMZvGqbJWQlUW
 Xa7wan4J2G3jn90pW+Y45UwJgG7LcDiXoacmFxPVfTZSKU5VmHutBruGRsuZeI2cHwiy
 C/Tg==
X-Gm-Message-State: AOAM532V3XwDVcJ4YLYqo6gRC614fhJRdAcVrlERbTn4oI91PB2ThENJ
 zGCnqYwzMHwqAROeFuPx4dHJ1A==
X-Google-Smtp-Source: ABdhPJxUvp+i2/cjPcXX8yze2XD71Ele4X6Fzo8G8bI6MOfqPsiVu6sYwdqPizeYwydTrb6tQc4aBw==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr3112360wrj.270.1630747661327; 
 Sat, 04 Sep 2021 02:27:41 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id h8sm1563422wmb.35.2021.09.04.02.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 02:27:40 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] memory: Have 'info mtree' remove duplicated
 Address Space information
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210901161943.4174212-1-philmd@redhat.com>
 <20210901161943.4174212-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e06ec1a-6159-6eda-514d-4f62951a6905@linaro.org>
Date: Sat, 4 Sep 2021 11:27:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901161943.4174212-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 6:19 PM, Philippe Mathieu-Daudé wrote:
> @@ -3282,6 +3282,59 @@ static void mtree_info_flatview(bool dispatch_tree, bool owner)
>       /* Free */
>       g_hash_table_foreach_remove(views, mtree_info_flatview_free, 0);
>       g_hash_table_unref(views);
> +
> +    return;
> +}

Bogus.

> +    return g_strcmp0(as_a->name, as_b->name);
> +}
> +static void mtree_print_as_name(gpointer data, gpointer user_data)

Mind the missing vertical whitespace.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

