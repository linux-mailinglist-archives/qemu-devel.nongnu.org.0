Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37EB60D627
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 23:31:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onRU6-00066N-HT; Tue, 25 Oct 2022 17:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onRU3-00065z-Qd
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 17:29:15 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onRU2-0007iJ-7w
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 17:29:15 -0400
Received: by mail-pj1-x1032.google.com with SMTP id pb15so12081103pjb.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 14:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PSS1n28fiWoIiM1bHNpondwKwuYyNNgR43dKvIWJZ80=;
 b=BuNsoA0EsYo8K+8n1HzoVDClONyZiZCxlMZvqzCvp8LvK+dvTiyvL8X60BrsTaGRYs
 uFrQlvk9RigA7BZ7492T5bTjppVdP0vnaBVw81exwEmWpktsWMd8qEBOILXB2BUTjL1w
 w/uHO/f+KT87WM1krUHEhnGQR1BmroGTeqkQdJggpIerfgbkg4S0GI/cYJKLs8cP/Bp7
 s475PDy11vi3c39La5clGnkEPRavRJsLIs7HbqSzosMi2q3giKAM89t7Jc7P37MSR3/W
 6I2+L1ynKIw5lJFYrEOToqCt5tUfcgoyFlDsLwdA9b+JROmWKjbnu7VRFrl54Ik14084
 o5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PSS1n28fiWoIiM1bHNpondwKwuYyNNgR43dKvIWJZ80=;
 b=Y6QUVQq1O/64UAlUIdrgn0NQuUIJ52KGds6LoVpylsLA5nLTe0jWAAskGVSOwTASNa
 XQTZta/gzRD5VVQ2vDVCqHXFDaak6NE2TKU/Q4aHBwZ0mkMxummLgfRXDIQxDGSRYYjw
 qX4rwUwkfazvjFLXwxKNEtFTfx00Zf4j6ukHq9yOB1oDwQXuYlMDZb+wrR2IV6AakWLC
 ayWE7TgSWOiAFqQJttnkTNu7XVvPrwb2uL7Jrj8XoWe/CH586mjleXfjb91tUnz9HaSn
 R0XYX5tSOA1ErF+MlPk94e+w5GF6k4Dxb8t8ehdgAQfugqhL8k55Kc5ICkKMF2m2TgWN
 9sjA==
X-Gm-Message-State: ACrzQf3Rc6y+GzE32qHtybPbsU3SvmhEPBy95dKaRFPKG3y9REgsFygW
 H6TeBk7UTISU3OQVl47MdKeh7g==
X-Google-Smtp-Source: AMsMyM6P6TSe9W2+ZKossi1+Rpa8PIuT3I4yGB/3qrBTAE0tyrmbpLAojOe95RNxYAsYcQOj+WIB6A==
X-Received: by 2002:a17:90a:8504:b0:212:c1f4:ddf1 with SMTP id
 l4-20020a17090a850400b00212c1f4ddf1mr340962pjn.224.1666733352580; 
 Tue, 25 Oct 2022 14:29:12 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a17090332d000b001865c298588sm1604407plr.258.2022.10.25.14.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 14:29:11 -0700 (PDT)
Message-ID: <ba06b907-4fec-e21d-7bc4-64f92ef8d909@linaro.org>
Date: Wed, 26 Oct 2022 07:29:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 20/24] accel/tcg: Use interval tree for
 TARGET_PAGE_DATA_SIZE
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-21-richard.henderson@linaro.org>
 <87bkpz66h7.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87bkpz66h7.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/26/22 05:30, Alex Bennée wrote:
>>   void *page_get_target_data(target_ulong address)
>>   {
>> -    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
>> -    void *ret = p->target_data;
>> +    IntervalTreeNode *n;
>> +    TargetPageDataNode *t;
>> +    target_ulong page, region;
>> +    bool locked;
>>   
>> -    if (!ret) {
>> -        ret = g_malloc0(TARGET_PAGE_DATA_SIZE);
>> -        p->target_data = ret;
>> +    page = address & TARGET_PAGE_MASK;
>> +    region = address & TBD_MASK;
>> +
>> +    n = interval_tree_iter_first(&targetdata_root, page, page);
>> +    if (n) {
>> +        goto found;
>>       }
>> -    return ret;
>> +
>> +    /*
>> +     * See util/interval-tree.c re lockless lookups: no false positives but
>> +     * there are false negatives.  If we find nothing, retry with the mmap
>> +     * lock acquired.  We also need the lock for the allocation + insert.
>> +     */
>> +    locked = have_mmap_lock();
> 
> Are we expecting to already hold the lock here?

No.  This is called in the middle of a normal load/store instruction, in response to MTE 
being enabled.  We really want to avoid taking a lock if we can.

> 
>> +    if (!locked) {
>> +        mmap_lock();
>> +        n = interval_tree_iter_first(&targetdata_root, page, page);
> 
> So we only search if we haven't got a lock already.

We only search *again* if we haven't got a lock already.  If we had the lock, then the 
first search above produced golden results.  And we must have the lock, acquired just now...

> 
>> +        if (n) {
>> +            mmap_unlock();
>> +            goto found;
>> +        }
>> +    }
>> +
>> +    t = g_new0(TargetPageDataNode, 1);
>> +    n = &t->itree;
>> +    n->start = region;
>> +    n->last = region | ~TBD_MASK;
>> +    interval_tree_insert(n, &targetdata_root);

... for the modification to the data structure.

>> +    if (!locked) {
>> +        mmap_unlock();
>> +    }
> 
> To be honest the mmap_lock safe to use recursively and wrapping the
> locked portion in a LOCK_GUARD would make me happier that we didn't cock
> up unwinding.

Fair.  I was trying to avoid a second interval tree walk if we *did* happen to have the 
lock, but as I said myself above, that's extremely unlikely given the only user.


r~

