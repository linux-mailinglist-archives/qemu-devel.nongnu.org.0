Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333E538943A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:57:40 +0200 (CEST)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPVq-0000sY-UJ
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljPHj-0007jo-VT
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:43:05 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:45863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljPHb-0001NR-6r
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:43:03 -0400
Received: by mail-ua1-x92e.google.com with SMTP id 20so4636148uaf.12
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 09:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w+QKaYSYXvS8N8BUF7VXThPiChr0N+nP5zSmKVVlc7w=;
 b=y38KBNrH589jNCgQAcpHosHqJYbbACv033jDifrW/DFLwxIY5dZHwIE77vMio+ApCk
 vDvGQT/Dd1xiqb3ISoDOaewT9YVZ90vVXhqXIdE6j0NkOxVJ3X+lJ3xwkXUGTooZTsg+
 Fqy99lJf2YUjs83vOJZD3osZzuGl+x/j0ZFV94+khn6m/a9KuRIEFdX7lLyBWJ7golCW
 6YFm4PB83JvM1r/7E+Ku8WMOrgCR7gZePSovuCeIQQnTNR733w1mExcNXcpdruymTI1U
 Un6I9JfRwwE5ftoFkVQCLp4uApWYXTNZHMzMkqHptBDLyJ0OiHF+aOc3dQXOX04O+BzB
 XMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w+QKaYSYXvS8N8BUF7VXThPiChr0N+nP5zSmKVVlc7w=;
 b=sWlRsCENHPkZpiTf9nsVy1VoTvg90CUtneR9+ElxpM14A/a3LLd5kNErMGIj2iFRhf
 cXnfb7nMuu6bQKG48SIIwQOYLUjaYXd76mH48Y0w9JSddXga/E6KU0qdn6h8kCXsfqst
 W8M8QSBZBz+0f6vjaeJxiyN2lz+yHBevllXV+GpcjoPHOSgvjz9w0qEGH7AsL8LNJ0R0
 qBNofCEgKQLrjrYI/YiEut6rpMix4sEJ2gGt5ois7b/G3tNhpy86a5Z2Msff0zRgLXio
 1FIN6/QUhpgykKuA14D+NkgsUo4jDsvSU73YHcoaDiPmYCHXnVGd/XJmJ3F41BbeN+BZ
 lvYQ==
X-Gm-Message-State: AOAM531Qpz2EhfZAvU2+6k5oBHZhEs6nNvxFDv7eJeWTTV0xETzjpYt3
 xIcbkFGvlphvgF6uvyzg0u/iUw==
X-Google-Smtp-Source: ABdhPJw0X3Wf1GIJVC1f4JdhformnzAxjt3/mzijiTHxNzLJ+DS0KsADTxckT0mjh9Qa42Hri0e0Lg==
X-Received: by 2002:ab0:6cac:: with SMTP id j12mr451946uaa.34.1621442574069;
 Wed, 19 May 2021 09:42:54 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id d12sm29252vsc.8.2021.05.19.09.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 09:42:53 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] tests/tcg/x86_64: add vsyscall smoke test
To: Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210519045738.1335210-1-iii@linux.ibm.com>
 <20210519045738.1335210-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a2aef95-dbe1-28dd-8b78-15520f6e9553@linaro.org>
Date: Wed, 19 May 2021 11:42:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519045738.1335210-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 11:57 PM, Ilya Leoshkevich wrote:
> Having a small test will prevent trivial regressions in the future.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   tests/tcg/x86_64/Makefile.target |  6 +++++-
>   tests/tcg/x86_64/vsyscall.c      | 12 ++++++++++++
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/x86_64/vsyscall.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

