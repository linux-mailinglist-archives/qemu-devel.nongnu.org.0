Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFCA59700D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 15:40:31 +0200 (CEST)
Received: from localhost ([::1]:60170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJHa-000476-Dc
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 09:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOJFo-0002dJ-NI
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 09:38:40 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOJFn-0001nJ-04
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 09:38:40 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-10ec41637b3so15157319fac.4
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 06:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Ev9b8hjBlruSFd2g/Y6g2hGpFtXaqoom5r/MLyWcBSY=;
 b=DadOmMaomY+qory4tRt0YQPJzzcAoNDC6dQ7eLO1gPNxQf3x0hKtGLrsQrK43ghT6B
 BAedJiF6mBnfFpkd+2IqQEd6s8ZL3w7wbPb9F4b7rgXlx1c1rGyynVyMc0x89eAZm2M4
 GmyNrKX4eu9n9DwC9xttGPbvUOrlkky3pCSpu5DBP8Z0aNSb6CblgGczWhnfnmac2bXe
 jhtqQo//njUwudnLJwWoMmrLZRLUzvGyJqAu6C0HFUY0IQWrqqvBm6rtbCoo8ejKeUrc
 Pm7CXxXfcmOCSiseBx5zK43Kb5jDv6HRPjVd4et5PJJwKPN07QdXIkvrP33L+gVfssX6
 JIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Ev9b8hjBlruSFd2g/Y6g2hGpFtXaqoom5r/MLyWcBSY=;
 b=RqZmn4wtzpU8aD1ErrzHP3K0Rzn+56e8XQ+mAk2BJggll46qvS3ahGDZGMgqFuGB6E
 SQ6YMDIlc+MeVOZOxTTtC2z2VOzETylRvDR40m5DWJ3Mmgi4H2QMaa3HTuQyf+tsqd2l
 bGtoNrThdHZAB5QymlqHK1PfJ4DjFf68SRJRYcj5/6B66gOR5sNXzQh5Bx2/WArKVrj1
 I4WxUPhp5h+/Xpj0uV4LsVXsBkd3zF1Wscbao1uAxAA0dazD7z094WFGNXwBZQZ7TExO
 sCN8z9AbN4exkSgyRGvt/TDBK/bYAY2y2ynI/ItmC/GUnoi62/2zY+bh2D8K6rMxC4Lu
 UrVg==
X-Gm-Message-State: ACgBeo3BXoygm1B7nf6EcxOkFJ2rqI7WKRdDDvIR1Cdl9+Hia1+44oG1
 jEtisjpFHLk9YD5kYNyihdbyNQ==
X-Google-Smtp-Source: AA6agR73Y1EMtHyodT0xSC4JD+FZgLZEj3nsVdV+Wp5oCnGqqW4N0GIgphBj9FE0x8Ixnl1ZSKm8wA==
X-Received: by 2002:a05:6870:585:b0:11c:43a:5bb5 with SMTP id
 m5-20020a056870058500b0011c043a5bb5mr1622758oap.89.1660743517555; 
 Wed, 17 Aug 2022 06:38:37 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80f2:9412:75e8:df77:dd33:d368?
 ([2605:ef80:80f2:9412:75e8:df77:dd33:d368])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056830168d00b006370b948974sm3349552otr.32.2022.08.17.06.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 06:38:37 -0700 (PDT)
Message-ID: <fbccc410-3599-9e31-82e7-a9a20caf8d53@linaro.org>
Date: Wed, 17 Aug 2022 08:38:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.2 14/21] accel/tcg: Hoist get_page_addr_code out of
 tb_lookup
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
 <20220812180806.2128593-15-richard.henderson@linaro.org>
 <15f8efa3aae897569383305155315d03ee5b70e3.camel@linux.ibm.com>
 <a67bc498-5155-cc40-9640-81db22b2b37a@linaro.org>
 <0727c2600d0c16caf43689a9c3abf5ca2017f28f.camel@linux.ibm.com>
 <cc2cab12-2dda-25db-5696-fe13971db467@linaro.org>
 <f8a922e90a624453bd86ea0438b3562cc4b809a6.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f8a922e90a624453bd86ea0438b3562cc4b809a6.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
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

On 8/17/22 08:27, Ilya Leoshkevich wrote:
> On Wed, 2022-08-17 at 08:15 -0500, Richard Henderson wrote:
>> On 8/17/22 06:08, Ilya Leoshkevich wrote:
>>> @@ -2243,6 +2250,13 @@ void page_set_flags(target_ulong start,
>>> target_ulong end, int flags)
>>>                (flags & PAGE_WRITE) &&
>>>                p->first_tb) {
>>>                tb_invalidate_phys_page(addr, 0);
>>> +        } else {
>>> +            TranslationBlock *tb;
>>> +            int n;
>>> +
>>> +            PAGE_FOR_EACH_TB(p, tb, n) {
>>> +                cpu_tb_jmp_cache_remove(tb);
>>> +            }
>>>            }
>>
>> Here you would use tb_jmp_cache_clear_page(), which should be moved
>> out of cputlb.c.
> 
> That was actually the first thing I tried.
> 
> Unfortunately tb_jmp_cache_clear_page() relies on
> tb_jmp_cache_hash_func() returning the same top bits for addresses on
> the same page.  This is not the case for qemu-user: there this property
> was traded for better hashing with quite impressive performance
> improvements (6f1653180f570).

Oh my.  Well, we could

(1) revert that patch because the premise is wrong,
(2) go with your per-tb clearing,
(3) clear the whole thing with cpu_tb_jmp_cache_clear

Ideally we'd have some benchmark numbers to inform the choice...


r~

