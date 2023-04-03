Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7466A6D513B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 21:21:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjPjc-00009o-OE; Mon, 03 Apr 2023 15:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjPjb-00009P-7e
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:20:55 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjPjZ-0002Rp-MX
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:20:55 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c18so29052199ple.11
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 12:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680549652;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v8Vi+yDhyvfX2iy+C2AxwMu82CjZ6iE+ENcKnxVjC8E=;
 b=bOF3tEOGNQu/NXCgGUzPi5oHfcKsqk8rvWcCJBQ9LqY7FkRLNjkOUGEIa5ChUOUZSr
 IT0n/LQB7iKToh5AcXxcIPpGyyR8iqBg4d9QHCeuHcDlMi0izKYjxmwe9IJRUeGool8/
 drPPyiAnACzSuT15E+M8dBE/qbTFPBVwsMD1sH0+LdjhiilA2NTFSygu+ElhCiXGQ52i
 t9/03x+/iRIN17iDi9BSqMy8/1nZ31ybZWlTyDpv8fmhlZQZiRKAiOlHJI2OZ2cTixj0
 lWdscqCISnr5czt7xucSYEkvUTNjQ1R8HyXHrmzBb8+FmLAC07FyPuMuwcT0wv0Dytcv
 xOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680549652;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v8Vi+yDhyvfX2iy+C2AxwMu82CjZ6iE+ENcKnxVjC8E=;
 b=jFWuk62twoVY+jrrjrXdOqlV4vzsEjhMWtmnRJ0YfO/lRwyX/k+85+LeDu0k21wI0C
 BAb4NrEVNrmFbWuj+3XZBxnbyDkgDLPEf0ju1KWq+NeAmRbdSffe0LXenhXyDAy+dpii
 DPtRLgr4cj4sWbNnhPlU1DzzAMaGuX48pDMY3QdLDeaLc4zUmA4SYNBDEYKVrE0fYrJI
 746hEvThG8oaKrEinFGBDmXeWxtxX6QF3FI58/0lMHjjtqiOzxmYUMIz1jT2TTo2gcA0
 qwXQ8qDEAeptU4goXexDSs5SPaHPa4Wr15xj1DNXXg0lpGmmHK73uNkN2vsuc3R5gPOM
 lmqg==
X-Gm-Message-State: AAQBX9dUH3tlTzBmKmBXGKH8jX563YLYgMrMqeedO3XpAPfedsSsv80F
 LAYgFpGBpRoKI0H9mCiL7lMHHQ==
X-Google-Smtp-Source: AKy350ZP/glo+qvIm4LxmzlJSW1mSVrgtqsXsb3lCURhRujnxieUjbTUEBh0PyfzdjDpRseJJGvLgg==
X-Received: by 2002:a17:902:e5d1:b0:19e:4bc3:b1ef with SMTP id
 u17-20020a170902e5d100b0019e4bc3b1efmr73863plf.64.1680549651999; 
 Mon, 03 Apr 2023 12:20:51 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 jb21-20020a170903259500b001a042f532cfsm7020707plb.27.2023.04.03.12.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 12:20:51 -0700 (PDT)
Message-ID: <b6ddd9af-ca2f-d8db-f5c3-a1656da961cc@linaro.org>
Date: Mon, 3 Apr 2023 12:20:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 05/10] bsd-user: Add '-one-insn-per-tb' option
 equivalent to '-singlestep'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230403144637.2949366-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 4/3/23 07:46, Peter Maydell wrote:
> The '-singlestep' option is confusing, because it doesn't actually
> have anything to do with single-stepping the CPU. What it does do
> is force TCG emulation to put one guest instruction in each TB,
> which can be useful in some situations.
> 
> Create a new command line argument -one-insn-per-tb, so we can
> document that -singlestep is just a deprecated synonym for it,
> and eventually perhaps drop it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> NB: not even compile tested!
> ---
>   docs/user/main.rst | 7 ++++++-
>   bsd-user/main.c    | 5 +++--
>   2 files changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

