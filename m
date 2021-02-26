Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F2432647E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 16:09:22 +0100 (CET)
Received: from localhost ([::1]:56762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFek4-0002wu-HJ
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 10:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFeie-0002W9-WE
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:07:53 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFeid-0004c5-Aa
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:07:52 -0500
Received: by mail-pg1-x532.google.com with SMTP id t11so6369174pgu.8
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 07:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qcEaLJWjlRvn5WvH5Ax9VpvYi8YaN9lN6DY2i7rNsWE=;
 b=t3LrEtU6cYW1wiGN1mNJvaIWmemGfqO4Af2o2vpbZ5LGmmktiAxuv6LyxUVbUiT82g
 MVddbnZfB6a36RJFSAuB0XDnds0OQeuDC6NvAQd41PocqvKmxYcvrz99x2R3KHDlP8+5
 SVpHF6nqfpk33FBX9pbc7CV3g8xByrjhOaA2PKpDL8WlM4q6s+naLVnQ7IYlT17ciRmD
 Lw9HAMjAcwYWCyY+GO1q3jJEZbOBRQhnJ+9kSXfdq0U2OuApo65VTikFd95Kr7J4oLsY
 J9HRFufmMKpGU98LJqWSU/dgHb3PqBxJK6WKpIqT6+rDUIk3t9dDoLl+jkEZP9ovspAd
 LFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qcEaLJWjlRvn5WvH5Ax9VpvYi8YaN9lN6DY2i7rNsWE=;
 b=iFVX7Et3au6tOxXROZ52+KuZWIszAC9eCDV7r66gnX5Z1aupSLQO2XuJPg4JhaLk9a
 ZrJxowguy5By+TWigoYSIs2QBy/j1cdOOiOk/r5k5tBdg7ZH3Fo8LmT3Dc7QRYvg/FhT
 COriS97ydXfNxRL/aqBdaNSwKVAn5WAE4NhW0dZ9f99xWAWueUKfah7X9BHmW+tiq8ZX
 1MQzEdND4refnbF852r+jTDx5rUCt1Tg8xNRG/MgTy8jisuAwey4dIqS602SvuXXJYJy
 5qrq5lVkqHOdF1rWO1gQqhdejUJgy2w843WmrX+MutC3X3Q9dtXBKSGJSWukNHy9J4iM
 VVmQ==
X-Gm-Message-State: AOAM5313Kqh3ZeqUe6WV6P4nuVGc75KMhKoyhSU5e5SI9wxxZ6AyWVzf
 dFd2P3dyUyeeXoHQm8D3bd1ME0G63NmpdA==
X-Google-Smtp-Source: ABdhPJxeeyV8zVfMDFfeibNiEijrdRlqIyDBiqNYvJmWzr6vmbL0+9o/TpOSkBORK5k2IGqsimuxow==
X-Received: by 2002:a62:3085:0:b029:1ec:a6b8:6dd2 with SMTP id
 w127-20020a6230850000b02901eca6b86dd2mr3585976pfw.7.1614352069658; 
 Fri, 26 Feb 2021 07:07:49 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id bj9sm8875205pjb.49.2021.02.26.07.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 07:07:49 -0800 (PST)
Subject: Re: [PATCH v22 16/17] i386: gdbstub: only write CR0/CR2/CR3/EFER for
 SOFTMMU
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-17-cfontana@suse.de>
 <c7a4c597-6864-1ce6-b759-d7ec531eea67@linaro.org>
 <efd0679f-5504-dee7-9bcf-8af0c4bed895@suse.de>
 <17092d2c-9f40-5d34-b91e-1324434feb48@linaro.org>
 <870d6e44-da99-d962-2ce5-821c06a2b04d@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <53661a28-c85c-2773-af56-78f09b428924@linaro.org>
Date: Fri, 26 Feb 2021 07:07:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <870d6e44-da99-d962-2ce5-821c06a2b04d@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.349,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 1:22 AM, Claudio Fontana wrote:
>> I should think so, except...  that FORCE_64 makes the previous test useless.  I
>> have no idea what's going on here.
> 
> #ifdef TARGET_X86_64
> #define GDB_FORCE_64 1
> #else
> #define GDB_FORCE_64 0
> #endif
> 
> So for TARGET_X86_64, GDB_FORCE_64 is always 1.
> 
> Maybe the flags is there for when a cpu switches between modes? (32vs64 bit)?

But of course the only cpu that could switch is TARGET_X86_64.
So... as I said, I have no idea what's going on.

> I'll make a conservative patch that does not risk changing the behavior (at least in the intention).

Sure.


r~

