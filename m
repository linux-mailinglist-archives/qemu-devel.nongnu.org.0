Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F3309791
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 19:38:25 +0100 (CET)
Received: from localhost ([::1]:45482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5v8a-0008KY-5Q
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 13:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5v6k-0007iD-FL; Sat, 30 Jan 2021 13:36:30 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5v6i-00044L-Nr; Sat, 30 Jan 2021 13:36:30 -0500
Received: by mail-wm1-x32b.google.com with SMTP id e15so9733903wme.0;
 Sat, 30 Jan 2021 10:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1mNh9mlH0J+zMjgMzcqZVDvGumB7ljSHk0DeAaBnlyo=;
 b=WbGzkcuAeKstM9npuwuwjBnsuEZm3r5ywk/P67nlhSNsqQWcxGtIyp/B/UlSUyJqWe
 rWBBL0Hz04hYGcGKDbdlr+Q5TbjmlDYeP5aAaN0R5Ay5zodmCvmp+ggN5wHssG7x7vyD
 3JMGGA5AK75ov59qdcqNoZf8s+vtn2UJxw1pfb79km+kvaVW4eKgDH3lx4Mh0ZHyu1Es
 c8DrTbZ1CxgbbiLIZJsUSSC8Q0FPV6OGKMYCyFML2qBkeE7xTcngCuC6pXhF6fRDpxw8
 rRY35sV+EjjJAipw1mYL04unB71LVdiuXGyJ5HxfzbLH8oo7/z0NEn0QORV5RNgzd6a6
 q3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1mNh9mlH0J+zMjgMzcqZVDvGumB7ljSHk0DeAaBnlyo=;
 b=TnzJAUBfZyY5Akaw9ecHeNrSi0wE6bT0nxX7YYXsTgkdm889qlA2pWBFTyixysf8pO
 ErtgZlPRyv9Bsd4BZPf4tCtInqj1YK8CtlswhMbm3rYmdD1Wfb9xfRpaHSOl5+7W1KAL
 YVlthZOAju5EMVUTKhpWbePlReuuNCOx/JaTW7/pikLUW3ZmgpXU391I5HAtJsdFJRb7
 un3aAUnmvrguDOrLGNQyY1xmuzIGJtFR9sLYd4J1QxArPDSF7ypEpizLOVA/u778zUrj
 1TeJivZf2o3Rf0TEI1/vmiwk0BpMbnlZfNcDlcBDF+9sxk5ASqBxzwCROnPjbFdY7Z+Z
 wIqg==
X-Gm-Message-State: AOAM533pmPXaWcMzeUnJX4+B1tU+CU2P45QjQI2JQQ/+TVOPa+f5/K9z
 A2R3ufxsrNlwzXwDQUBxDX+EfhFot+c=
X-Google-Smtp-Source: ABdhPJyXkcz3LAR4E0+PEoeKblLFblLD+ThxjmdYgyS8ayJSPNpoC+HMjVsKg7NDgRMrHhT3Y4wlJQ==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr8531992wma.76.1612031785730; 
 Sat, 30 Jan 2021 10:36:25 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id y67sm15807411wmg.47.2021.01.30.10.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jan 2021 10:36:24 -0800 (PST)
Subject: Re: [PATCH v5 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
 <20210130015227.4071332-4-f4bug@amsat.org>
 <CAFEAcA8UCFghGDb4oMujek_W_wsyYz+duiQ-d8JyN09NYoff-g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2871f7db-fe0a-51d6-312d-6d05ffa281a3@amsat.org>
Date: Sat, 30 Jan 2021 19:36:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8UCFghGDb4oMujek_W_wsyYz+duiQ-d8JyN09NYoff-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 1/30/21 4:37 PM, Peter Maydell wrote:
> On Sat, 30 Jan 2021 at 01:52, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> KVM requires a cpu based on (at least) the ARMv7 architecture.
> 
> These days it requires ARMv8, because we dropped 32-bit host
> support, and all 64-bit host CPUs are v8.

Oh, this comment is about the target, to justify it is pointless to
include pre-v7 target cpus/machines in a KVM-only binary.

I'll update as:

"KVM requires the target cpu based on (at least) the ARMv7
architecture."

Is that OK?

Thanks,

Phil.

