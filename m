Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E48326530
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:03:37 +0100 (CET)
Received: from localhost ([::1]:38176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFfaa-00063W-UI
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfYN-0004sv-L8
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:01:21 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfY7-0004QP-Jp
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:01:15 -0500
Received: by mail-pl1-x629.google.com with SMTP id d11so5517476plo.8
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 08:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wYfiXOnByAVnor7YFcTcvRC0kTpFWiFu1SZjgXJcwRM=;
 b=qerGzWvWRYTdCJt+ISBNnLOmprmgP2a8rO3+J9KT0KHgT3723yIUY/D/yZ6/p3VuIm
 7RVisWEAe/8yw05/fN0PWyxrvkDkBeMzKiiwTrlbReQPP4tqFZRLYzwf1kPePNBDJ55+
 wXKUucIoDnpeQ23FdLSqhsajeX63b8XjudURnXU+cKJ2QhYW20eHXIWSraiiE6iv4d1I
 lgvVsjtgkTQ4cuSS1H+W9xdrDd/EUdoaOCrRjcWGkuxg9zJ45Cv4I8MO/hhGolYAx7Os
 6Dnf3oCukA8+Z1ZYl1/kMG92r1r2hJlp7ojyKYmxxj4ULh/ATY6qfLZTvb4aVP9e2Dss
 mk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wYfiXOnByAVnor7YFcTcvRC0kTpFWiFu1SZjgXJcwRM=;
 b=sw2NS65fZI2BdOXberrYC3EguYKFKmSQ6XUOjjIffCN5va3JCmiRR0BiJcpjyTAHeP
 is6g6qYSKpiieYkv1bdjv9njEHJT9DaDriofHIZ2ulLdCXE4CtpiQOvBJ+cOInMlMvqi
 jJknCg9iUUM8aRHuh4p1Dn8V7DLdORuWFkJlQnZHfS++kkJgXvLjUMwgDHeD5Qnpqw5P
 RtQZ3AW5day9QpTP6Dt+B+kqvWoF5QFpvSdTk1EUo1poBw4LosHlxt1yOVx/kAwEIap6
 Osa3gnCS0EpXonp0uus7uSeuYoCpu9yLBRovI1E+TjgmfEhMlL0JxDArfKX0Npr3LcCz
 crZw==
X-Gm-Message-State: AOAM530TRRHqc3wXpAlIc9P50Ovowl8lkpxPVJrlUzAmRcqcbCkYMLef
 jG1yJXo4JukW1MzoR3hrNzBOBMM6TDCaFA==
X-Google-Smtp-Source: ABdhPJzBVhq3828nByHI/fJPp3kZzZyWV/VsgrutP6IkuFS78g3WQQsXw1WX/UDR6C5X4bbEavbBXA==
X-Received: by 2002:a17:90a:bd90:: with SMTP id
 z16mr4137535pjr.123.1614355261772; 
 Fri, 26 Feb 2021 08:01:01 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id j20sm7864514pfh.31.2021.02.26.08.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 08:01:01 -0800 (PST)
Subject: Re: [PATCH v24 16/18] target/i386: gdbstub: introduce aux functions
 to read/write CS64 regs
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210226094939.11087-1-cfontana@suse.de>
 <20210226094939.11087-17-cfontana@suse.de>
 <2bee4ef2-4704-a0e3-4fd0-1fe66d8952d7@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3988eac-998c-4677-8fda-a3b9af734033@linaro.org>
Date: Fri, 26 Feb 2021 08:00:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2bee4ef2-4704-a0e3-4fd0-1fe66d8952d7@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 2/26/21 1:58 AM, Claudio Fontana wrote:
> Could we have a target "i386" (not TARGET_X86_64) for which HF_CS64_MASK gets set?

No.  Without TARGET_X86_64, we cannot enter 64-bit mode.


r~

