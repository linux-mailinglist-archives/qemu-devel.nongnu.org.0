Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D83D9755
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 23:12:44 +0200 (CEST)
Received: from localhost ([::1]:39396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8qr4-0003kJ-U3
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 17:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8qq3-00033v-PT
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 17:11:40 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8qq2-0005Sj-33
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 17:11:39 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so12115719pjb.3
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 14:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fqpig+pAt9kg/fvDVMJm4O/WBuqg1r88ul5coIPllqA=;
 b=i8jnAiHbvHPkLfQvW56Am0UIspjRAcBGsnX4fzg1Sa0GRqyx43NfKCgf9zPgWRMIjo
 F1UvNFC6XIQluxLbRJgLO0KgMjRDl6fD9Pcz9FUVXLfmcZ3KLjszON/gELxzPNxF4ixk
 gdGfCDlXrk0UUqdhwOHKs62CTREzzBWOMgufKrutEZ/+p3xE+nbKm1Xxww8/IzMKavbp
 3FH448B9cn5GOCKNU1ne9fF4HGjYGjRPk+pOjtS+E2SmShq7bNuwW1xGdL2E735PsqWm
 1r3gaefawxBDnC6JAV+2ckAvELZmVVPtJpezLLAHSZIFHbJN+YoxeJ3uOJJWxuqo+uie
 UwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fqpig+pAt9kg/fvDVMJm4O/WBuqg1r88ul5coIPllqA=;
 b=JtjyT620rHL5j9I7Pf/AZQEqkGrU7WT+rQ2RR7cWmCzHQUeO0FwBhqrVjoxGzZCv33
 CzF/TWkTWVjOwAek+DF3/BAqa3zu8TMEOlIQhLxDV34KPK7VskEPrPvE652713iBEFx6
 g5sG55hVmBPSC4fMQbrKY66qke0T4WXA/wuDnXDzMXe2tgl7uVCswguBj3ZOUKI5RBKK
 deYhE/ZSP1W9a4kiPsFigpTuR8g5NSarMf5KOsc45XdC5jj5aUzlhK2hc1kXZYRfvoBV
 FNM+KGkA7n6jR0hI3obvBSLi7ACpAFJu2EItRLZLiwU4ArM1z0ObNeni3pOHg75NanPf
 F03A==
X-Gm-Message-State: AOAM531iWstJ6unT8OIqnZL5IZosoavVETR08J22piuGJjQfZ78GQHPq
 LcV3ZLqyBYyWpexq1Wa+jfOAag==
X-Google-Smtp-Source: ABdhPJwdj2lAo9VUc8IXmIVQ5V4jvy929LmAofzPp4nx+2N+jrfV7qaXrC9NghLgyBPBLdnf5+e4cQ==
X-Received: by 2002:aa7:93ac:0:b029:32e:4fce:bde1 with SMTP id
 x12-20020aa793ac0000b029032e4fcebde1mr1742981pff.54.1627506695487; 
 Wed, 28 Jul 2021 14:11:35 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604?
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id p3sm949924pfw.171.2021.07.28.14.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 14:11:34 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] tests: migration-test: Add dirty ring test
To: Peter Xu <peterx@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20210615175523.439830-1-peterx@redhat.com>
 <20210615175523.439830-3-peterx@redhat.com>
 <9b93e149-3147-3dca-83ce-474af99ccd2e@twiddle.net> <YQHAJy8lX0vt+yl2@t490s>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0dbbbbe-e1c8-02e0-0455-bb954dd5f79b@linaro.org>
Date: Wed, 28 Jul 2021 11:11:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQHAJy8lX0vt+yl2@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.277,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 10:37 AM, Peter Xu wrote:
> A quick fix attached; would that work for us?

Looks plausible, though perhaps just as easy to list the 5 platforms as just the one:

#if defined(__linux__) && \
     (defined(HOST_X86_64) || \
      defined(HOST_S390X) || \
      ...)
# define HAVE_KVM
#endif


r~

