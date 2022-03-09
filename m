Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CA14D32B4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 17:09:37 +0100 (CET)
Received: from localhost ([::1]:45048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRysa-0007KK-AD
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 11:09:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRyqh-0006Dw-OW
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 11:07:39 -0500
Received: from [2a00:1450:4864:20::62b] (port=42518
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRyqf-0008Q9-Sm
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 11:07:39 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hw13so5799131ejc.9
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 08:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JhTbsBFeuz1yNj9VrkAVs92SOvrGJICTmIfy8SI73Hk=;
 b=nhDZ3U2OYvTs3ZM5duqCECrBwGogpRiLekHukVAwaM5fk5eFjeFPyy2L3sjmjKKglt
 09wg7oaBIn/FKM8KcIXXqiHPLPdnPWkp7+pWizymPcCi6YK6qt3Wwhzx1F+iM5kT0/xD
 FE5C0UbvPlcgJQJrdR+iYTUCayudOpB0C90l9Ry0TQsZmWXoGW0VgeiNVSu50OoeYn+n
 RFJr3lLvReELU0ku5q21IhMTR2TZQQiv2DAyMMlCx8sbW9y4FeN5WL8hR2V/OLuf30Zs
 aXwxHi8t0oaziaJGkDsKVTT7E67xtYF+DTyG55A6k5E0macwu4GoRaAeK68+mwV6cJaF
 5Lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JhTbsBFeuz1yNj9VrkAVs92SOvrGJICTmIfy8SI73Hk=;
 b=UGrAJYg9yPgdhv+nOMW/3/gzgKfmcawpkL7cTSZPXc4c8B2368LLNzOOR9Aw1IgRSM
 /8RTEzL7J+J/B6Kiz65Uz210/EBzYnkdhqhxpun0qkFmjxy0Goj9dDSuH8i0X72E6Nf/
 qvjMUHKM00IDcTOD0iDv+LpXYLFMCMGapKoCLzKgzjbpTLoWPE+ar81u5HOL0H2qPbSb
 iaK9G5YS76CUgyi+GV1bSE+SCau4XnFhUQ3ddjumey1OCzixwWeUvKdMSjsLDlbZ/V+P
 u0nzGPnEADgVW7LfpJwfX1TjnnNeAyVW8wvRUF28/sGHa0DGJOntX6XHZP9QE4m+5yXc
 DTjA==
X-Gm-Message-State: AOAM533MBd4RZd94LR9cxOGcLmQQo05Gz9h9B9k7y9vudhQjB1sG9CzV
 puGmbN+H3dYnIWPr6pvfHy8=
X-Google-Smtp-Source: ABdhPJwusY3Sz6Q/Ntau3OC4n0xj37QlQba+YPvDjJ2kUy9YlWfzYmqaltjnwX60+uFbnCWvagM/VA==
X-Received: by 2002:a17:907:168a:b0:6da:9177:9fdd with SMTP id
 hc10-20020a170907168a00b006da91779fddmr399235ejc.757.1646842051998; 
 Wed, 09 Mar 2022 08:07:31 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 gj18-20020a170907741200b006da82539c83sm910875ejc.73.2022.03.09.08.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 08:07:31 -0800 (PST)
Message-ID: <e45024ca-2845-527d-fe14-b3675532d944@redhat.com>
Date: Wed, 9 Mar 2022 17:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 00/23] QEMU changes for 7.0 soft freeze
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220307181633.596898-1-pbonzini@redhat.com>
 <e6d0fc5a-c1be-41b7-239c-c5db02f21cf1@redhat.com>
 <06fed507-e09f-b62a-30cc-046fcdd80760@redhat.com>
 <391c0c77-3072-2299-f675-6e214110002e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <391c0c77-3072-2299-f675-6e214110002e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/22 10:46, Thomas Huth wrote:
>>
>> That one also drops the progress report of non-failed tests, so I'm 
>> not sure it's an improvement.
> 
> That only works here anyway if I don't run "make check" with the "-jX" 
> option ... which I hardly do, since it then takes forever to finish the 
> testing. So at least for me that's not really a reason.

The point of having a separate "make check-block" was to have the 
progress report ("--verbose --num-processes 1" gives the progress 
report, the same with --print-errorlogs doesn't).

> Ok ... could you maybe ask the meson folks to include the fix in the upcoming stable releases?

Did it, hopefully will be in 0.61.3.

> ... the meson master branch has been switched to Python 3.7 already,
> but AFAIU we still target Python 3.6 in QEMU, so I'm not sure whether
> we will be able to jump on the next main release with QEMU... we
> might need to stick with a 0.61.x release for a while in the future?
3.6 was EOL'd in December, so I expect that QEMU will bump the 
requirement sometime this year too.

Paolo

