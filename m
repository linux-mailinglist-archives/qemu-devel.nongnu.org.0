Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BC0597443
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:39:33 +0200 (CEST)
Received: from localhost ([::1]:53752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOM4q-00056c-EN
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOLpa-000431-O4
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:23:46 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:40927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOLpZ-0006c1-3l
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:23:46 -0400
Received: by mail-oi1-x231.google.com with SMTP id c185so15888754oia.7
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=UMUQlkvf8Y34M/EiDu6OS4H2Y05UQ0bt4ZMnAycGklM=;
 b=XLc/fHta1eVU0yunEq8Vt1wULlhhZ+qDjZodsb+XuoUaJk/5/8HDnMnMaVNlVLg2N4
 YPEzc2cR6EtNw3AH1hHiWAnu05HPNym3qb+MK7dqHszdssk0K0DprARprnQbFgaX8rbM
 G+XI4H7LC8ltcYrGh8IKmxJgistYwPtZMa9wvaq/eoiWeOg0YKUuW23uHRM4SJZfLZG7
 22opGsOUbcRL4r5fYdtz5y1w4Z9fjt3fFgRwnR2uKzFejab7OnVgSRPIzua3D93CxZQs
 kXYEfPGOpB9ulJBjAiBgP7QLShexzcnYJ52cMFBaP7ak2ykr5BAOf+3MwcWZIkUqvbaq
 S8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UMUQlkvf8Y34M/EiDu6OS4H2Y05UQ0bt4ZMnAycGklM=;
 b=QAWbS1PpCKW5H6OpSytD9scWSCwmqv+H2QXoV9mUGpztj5YVod1kkO56dWcIfMHjKR
 TPRxIOwGeYkHMJfICVpdMmSLbo+cOkR6bmabaw3sygGyctrylK0HpVAECTh2+QMwsaDz
 6P1RRCIHYm7FAPXXozlfOjtwA11g6pF4/znHMwG4bM1lfHZCROsE0O11mX1MRURMouOH
 J6wik5fHTIcrv5ym4B+Pb6hlMxr/C578Ba9dTWBUUbKNaBOEFCZF+2i3zFv37FjjYq2j
 ZdpQvLRufO+0/fjKp1DhZkjKfjD02LAXXYJOLP23B08J9F0WvHP9VY0NW4TnxhOr1i1M
 irmQ==
X-Gm-Message-State: ACgBeo0Q8FbMnmY8NsFXcgR/e1HVjRlQbANs3PkEOccDxpQIJql3R0PI
 8zR/HBEyHnXb+pF/I/RyuSyqKQ==
X-Google-Smtp-Source: AA6agR7F0VsSpuNdHr2HGogVckWhqDIixwV2MMgvQrv7Mwomj5U7Q1Ix6ijA9xQSxXch+R4WmR8f/w==
X-Received: by 2002:a05:6808:23d5:b0:344:a85b:b5bf with SMTP id
 bq21-20020a05680823d500b00344a85bb5bfmr1787321oib.260.1660753423621; 
 Wed, 17 Aug 2022 09:23:43 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80f5:5571:5caf:c046:6d11:3902?
 ([2605:ef80:80f5:5571:5caf:c046:6d11:3902])
 by smtp.gmail.com with ESMTPSA id
 x35-20020a05683040a300b00638ae0350bdsm1879522ott.0.2022.08.17.09.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 09:23:43 -0700 (PDT)
Message-ID: <edbf4340-a3d9-e2b3-939c-1b882e5c57a9@linaro.org>
Date: Wed, 17 Aug 2022 11:23:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 0/4] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220817150506.592862-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220817150506.592862-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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

On 8/17/22 10:05, Ilya Leoshkevich wrote:
> Hi,
> 
> I noticed that when we get a SEGV due to jumping to non-readable
> memory, sometimes si_addr and program counter in siginfo_t are slightly
> off. I tracked this down to the assumption that translators stop before
> the end of a page, while in reality they may stop right after it.
> 
> Patch 1 fixes an invalidation issue, which may prevent SEGV from
> happening altogether.
> Patches 2-3 fix the main issue on x86_64 and s390x. Many other
> architectures have fixed-size instructions and are not affected.
> Patch 4 adds tests.
> 
> Note: this series depends on [1].

Hah.  I was just thinking that I should queue your patch set to tcg-next-7.2, and then 
rebase my stuff off of that.  It would ensure that I have your test cases in tree so that 
I don't keep regressing them on you.  :-)

I'll cherry pick the one patch you're depending on.


r~

