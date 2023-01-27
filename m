Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46D167EDE5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 19:56:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLTsm-0001OA-1I; Fri, 27 Jan 2023 13:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTsj-0001Nl-H9
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:55:25 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTsh-0006Tv-T5
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:55:25 -0500
Received: by mail-pf1-x42a.google.com with SMTP id i65so3958936pfc.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 10:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=toGjTUhmp9m8OTHR8tBDzkcIZ2BpClSqRB+9Fsb4Eas=;
 b=VQQitSK2p4mCktdHCW8fBdpLCd4tm2T+MSMX2ngZ+91jqVlLDfWGstP10g2S3V4fwu
 nbpkrQoKIqlnfDwEKC7hNRR2sMbrcx1PeTf6TLqPmGpbiscwipf0/H4Iygd8FTPapkun
 hkN8HmK5a7Z8XUsrGOPGUU0sHI8HTlTgvmdx19w4iVnnu5GYZ41Qelmx4dqJx1uBIJvY
 iOHSQxPhtKFTJjY5jnvgdJmGty3Lv3WAgbRkZNfDxRiLanAf6rkqDHNUJJmR2nJhslPx
 puWpkpJ4U7Wz8nWnHjfHdvOIzYFSLXjZlfUBIhSmnwj6TJty+OLoDvT5808bky6pEZOs
 g9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=toGjTUhmp9m8OTHR8tBDzkcIZ2BpClSqRB+9Fsb4Eas=;
 b=UqDxiLj4asFxkU4JjoEAGZuhctWLXgOYBrQHo8kIv4IlAOpnJ10oxeX9wjM+WKFK2e
 IFKupQ0lw+uHkd2lnL75bG2ZJMT8xTlDDqAdgCVa8qvHJwnKKAVTUJMWuo3CJwkb7WEP
 8SGQWUuISYAeMgyZ7SX/EsJz5n+XKHK5ipDg523xSJr5hhuK0Y2b99PXSboAYrEMdP21
 KPjs+GaRg1FUhsS9Uv4vTRoJDRmmxcUtPRkiS8DqqZcY3quV42VSplKE6uWLaMDtiPxF
 3p0r0UtzfNDap5UiCpyMIaTUWe/nT69GkACTvV1nRkGaYfE+m1PTfXBOgKQcEZS3sgFe
 DeFQ==
X-Gm-Message-State: AFqh2kqkBlFbx5aBac7/4/XHP3KUuwGGrtNhbeFNBe5brrsembUX2+DP
 vHlRnObZ0omCaQqySHagLBdnqg==
X-Google-Smtp-Source: AMrXdXtrIf1ZDGrzyQgtJCzA0GycMf04ReWdQULuYfZL4QwpOgN3y6tFvnKI93boOxFeVzAMlJwwAg==
X-Received: by 2002:a05:6a00:26f2:b0:58d:e099:8cb1 with SMTP id
 p50-20020a056a0026f200b0058de0998cb1mr35216600pfw.33.1674845722012; 
 Fri, 27 Jan 2023 10:55:22 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 a23-20020aa79717000000b005898fcb7c1bsm3048246pfg.177.2023.01.27.10.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 10:55:21 -0800 (PST)
Message-ID: <c0571847-2e69-6889-cc40-652e0d3544d8@linaro.org>
Date: Fri, 27 Jan 2023 08:55:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 11/36] tcg/tci: Add TCG_TARGET_CALL_{RET,ARG}_I128
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-12-richard.henderson@linaro.org>
 <87ilgsnkey.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87ilgsnkey.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 04:00, Alex Bennée wrote:
>> +                for (i = s = 0; i < n; ++i) {
> 
> Why the pre-increment for ++i here? It doesn't make a difference surely?

Why not?  It doesn't make a difference.

(Semi-reflexive preference driven by c++, where post-inc operator might (or might not) be 
less efficient, needing to return a copy of the class with the "old" value.  But if you 
don't know, or don't care about the old value, use the pre-inc form.)


r~

