Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD0B440E87
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 14:06:19 +0100 (CET)
Received: from localhost ([::1]:55804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhAXS-0007Pl-0e
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 09:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhAWF-0006Ae-1B
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 09:05:03 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:33291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhAWC-0001YR-Qr
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 09:05:02 -0400
Received: by mail-io1-xd33.google.com with SMTP id z144so17281545iof.0
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 06:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LWK/wNTWPvUWO9M8XNgJTUHzjuvvKYkuh7n3obn1iuA=;
 b=olrveU0QBLwWpSS6fRyw7RhHtMzvDuZGAzwusLLiyRBwJALINJNVbN8RWCvdVuUQEa
 88tjPY9EgEdTdjGTk5CnCH0wLIA00RtcXH+cABSwxEttkazt5I9E4EkL6Wm+saMpixlK
 PyhTmvYmTPp+j/7KSnbWlKRqfPjWl8b3djbLV0th8cJqhZj4Cot7euBjg518ByGHLfrL
 OU4l9X+2PDtijKrqFRm/R4SqjHK2+hGm1HMb8MhUv8hFAbONQE6pEpZdMQ6gp9Q3Ceqn
 lB/dqs13HRcJh62tytCq+ztLDokiFbIbrk1VQMG7HTsTuq35Ri/mlv43x2dVaaqp9C75
 quyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LWK/wNTWPvUWO9M8XNgJTUHzjuvvKYkuh7n3obn1iuA=;
 b=unM2hW+Pm5D/nQ7jx4/FhRF2azwSy9JiI3nJtq8b29s1fUu5bqXCetounUu3FN0J5Z
 /KPbwdbnFqEyKH2949ZJsbSwNq436bEgUbmR03L7VgCtSMEWQRHmBc8+Y+sbVi5CeexJ
 9rGYjyRcxRs42guWe72jwguokNwWvozZn862A9nezz/yY1aUNSCDx2tF0f72Tafollr1
 CN4fwnmmlAlVOzIEMF6/nB9YkRcyIBBl4X8wrXydkxKtOOevogPy96IzMHOGWQTIsEo6
 rqojgchYCOqMR5FTemh8DRcmh6K+vHORj6KXSYaGYwIgCN7clcncwRjs+TZj4417KrvU
 GY8Q==
X-Gm-Message-State: AOAM531AkeQWZH3onKI3tIGgdvaOOAPa6VZ3vh1sdsWhV5K74chMZhti
 t3uL7xzHFpjjLwYtsNkeuRlTCg==
X-Google-Smtp-Source: ABdhPJyzoAVeXZ4soH94smolGDy/cea8CRZ/Is2YCHROVNiaogGipeVwxI6WNYe+c99tYxYrcLpOJw==
X-Received: by 2002:a02:cf1b:: with SMTP id q27mr16978938jar.93.1635685498342; 
 Sun, 31 Oct 2021 06:04:58 -0700 (PDT)
Received: from ?IPv6:2607:fb90:8067:2de0:4407:203:e794:8e1f?
 ([2607:fb90:8067:2de0:4407:203:e794:8e1f])
 by smtp.gmail.com with ESMTPSA id o10sm6037176ilc.56.2021.10.31.06.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 06:04:57 -0700 (PDT)
Subject: Re: [PATCH v6 00/66] user-only: Cleanup SIGSEGV and SIGBUS handling
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <802858e6-1d20-be0b-d29e-b4bfc966767c@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d206063-86fb-9a4b-5268-554f13e3c11d@linaro.org>
Date: Sun, 31 Oct 2021 06:04:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <802858e6-1d20-be0b-d29e-b4bfc966767c@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd33.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/31/21 3:30 AM, Philippe Mathieu-Daudé wrote:
> I could look at these, but unfortunately don't have enough time
> for the rest. Would it help to merge the 60 first patches for
> this release and delay the prctl() ones for the next dev window?

It would.  The first 60 are perhaps more tcg-ish than linux-user-ish.
Barring objections, I'll prepare a PR for these in a day or two.


r~

