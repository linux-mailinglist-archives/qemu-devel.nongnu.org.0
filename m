Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB66FF0B7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:53:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4qe-0001vy-Rd; Thu, 11 May 2023 07:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px4qc-0001vc-JK
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:52:38 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px4qa-00085R-WA
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:52:38 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f41d087b3bso57582075e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 04:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683805954; x=1686397954;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PkIgVnduD1qqmEZViIeVIQlRDSqg6qbVEkP8MWFmQEs=;
 b=Xymqfn1CQ+L3rCKmauKzRFPYz5OiATT0vyYSmo/VzgFmXsjTsj4wY6ZpxazDGwHk02
 M+Z3X1c7g6ax1KhIlwe2cXFyFBdFmbgmgkgXGw4ItXswxF/xYy2M0GwtLAorgnW5Yxkf
 h4vzt7t+oky0Kf49H6TeOksTYgX4jGEk1v8WvXw3fuEUvt4767RcUiTkvsSiTjOuX7Va
 Oc7MvbpqDkJtXpnBpQTKViaI9O9/iusMdq1WvahouSbBVm69TvYL2CgM6gGNGuKXGi8A
 U49XfxvE9pYfcpiaySlSJHoReDak/Y4okUogGCxntZYj4VNo0z980dmIxiTiiBH0Yqzj
 c4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683805954; x=1686397954;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PkIgVnduD1qqmEZViIeVIQlRDSqg6qbVEkP8MWFmQEs=;
 b=gVZgFC1QH270WIMcYEqeV2dpx2eJaqQTuzlbYkrPGffK4HpXa8jHq48doKjG6y++e5
 b0SWtf5iahGUUqRjFGxlzmDmjmXpnQ0OMMtZGaN9nPm5BEGlqFGB1tXwVUTuOxLwJpfg
 CnaYH9u6/O91Uz/e3nlOKjmXekrARxq2sqwezVdaw9FQ4sy6LAyjg+8djgV5L59HUyau
 PpiGG5vYefBrjWeG1R+pxUhaMzr3UlwRUSN6B+jsow5OWiZNHzKaDP+g3r8OmmZ9KYut
 gOuNGOyPwJRsZ2y3kN/adID/Jt6DCE0t8xgpMY3orOgCqlq9RDkyuVdXX+JRFAHshno8
 O2vg==
X-Gm-Message-State: AC+VfDy4yuXQFBN3ul/25BO/+ouBSr2usn21BrC6Aaxn0UTYVXCuhjw4
 jdSpBzfUldccIN61Ww1SNUm6KQ==
X-Google-Smtp-Source: ACHHUZ4O1N/GVwfQK23zuPV8u/64k4+ScJcxGZU0sHHcJBG5vl0JCgQL4n/JOT52W9J8yzxad4IzHQ==
X-Received: by 2002:a05:600c:2056:b0:3f4:2bbf:40a with SMTP id
 p22-20020a05600c205600b003f42bbf040amr6258635wmg.37.1683805954321; 
 Thu, 11 May 2023 04:52:34 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a7bc5d7000000b003ee74c25f12sm25471929wmk.35.2023.05.11.04.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 04:52:34 -0700 (PDT)
Message-ID: <21302f37-fc1f-a39c-639d-d9a9ccd3ca9f@linaro.org>
Date: Thu, 11 May 2023 12:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] migration: Make dirtyrate.c target independent
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Andrei Gudkov <gudkov.andrei@huawei.com>,
 Leonardo Bras <leobras@redhat.com>, Chuan Zheng <zhengchuan@huawei.com>,
 Peter Xu <peterx@redhat.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>
References: <20230511092239.14607-1-quintela@redhat.com>
 <20230511092239.14607-4-quintela@redhat.com>
 <858bcc8a-e6bc-c929-d007-723afe2b6562@linaro.org>
 <87ttwj3xbl.fsf@secure.mitica>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87ttwj3xbl.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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

On 5/11/23 12:46, Juan Quintela wrote:
>>> +softmmu_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('dirtyrate.c'))
>>
>> This becomes
>>
>> softmmu_ss.add(files('dirtyrate.c'))
>>
>> the when: is redundant with 'softmmu_ss'.
> 
> It looked weird, but I didn't understand this stuff well enough, so I
> just copyed what was there O:-)
> 
> Is there any documentation about this?  Because what I usually do is
> search for a file that does (more or less) the same that I need and just
> add it to that list.

It's just top-level make^H^H^H^Hmeson.build related.

We have

common_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: [softmmu_ss])

so everything in softmmu_ss is already protected by CONFIG_SOFTMMU.


r~


