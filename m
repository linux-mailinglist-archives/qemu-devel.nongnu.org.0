Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A66D971F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:40:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOuY-00038H-FZ; Thu, 06 Apr 2023 08:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkOuC-00037U-Q4
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:39:56 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkOu7-0007vF-HC
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:39:54 -0400
Received: by mail-ej1-x62d.google.com with SMTP id 11so1029498ejw.0
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680784784; x=1683376784;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iycLXyyaKNlURjvk/xMSQ8w0TknS4goAK7XT0wGeGoA=;
 b=KSmvYJeb6DLthRuVbbGc/EX0Tq/RV9kDOb3pJ13zt4dGE9iUtur7DPMN5aHgqa28CO
 blea1OxwRGeeNwZLRc0EpOY0HloREzQFQKjbjwiYkoHVhGmurRL1OF5OSuYH3vuuf2vi
 YitGoCHythOAMKDm+AEDMuU28U3oWSIvHsmrDVuLJmlBtKqDwQA1sYaohygumojMzOXe
 h3cYkDSI9cvTuqVhVOEyoDUzg2RaMvpW7LAhy8uYYKP4QQaoJdJD5wbqN+8spDwTTMHf
 XfZ/KbL2eryvEW5dIeO0Ko674ysNqscsaIkKX+D+5FnCOcPwdmHOKl7Y5t3MCss3kYye
 x1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680784784; x=1683376784;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iycLXyyaKNlURjvk/xMSQ8w0TknS4goAK7XT0wGeGoA=;
 b=IFH3HnxiOOdUYHkJS29gxJB59hO4z8VMJ9TEyDrnnpP+azH5mCzMx7IPIo7EXgkakS
 iXGuxOI2LcpboOpx0gT9eLXoWrxlHa2NaBIs3Uj7h7vsEXsGQFXBNvfuLeGsyb//19Ew
 UCsOG1bxNxqJ+gygIM74VZn56QNEfmxm5Vid3RUzKU8MOgYHeR8UBFrzcQJQYrII1oJu
 WW0I0eVleeAeTZMcjFZ6kvmLHWh7niqZP3+oUrDiFglQ5w6TmoIaZjDjmk2rmcMkKSUR
 hngh7a3bz6i2bguP+g4P09YPJFuUSIvDQPM8sL2+fxSmE72MfXhFPSwuNmXGCPrrZ+y7
 pi1w==
X-Gm-Message-State: AAQBX9faluJu0aAhO3HhzuRCDkWuvzVZzCUJw9fRFF4g004T4RulWXC0
 pkoxyjN3g0NDk2BnNLi0jN3HbVMwlPIX+ZwHPLwS3g==
X-Google-Smtp-Source: AKy350aOn2aTVlmJyFIs5Qv8It9JyfM2X6Imk+gGt0ESygCtCgwNUUCxpiLE9X3Scx6iFvMHyUDEiD4kbESVR0v/DA0=
X-Received: by 2002:a17:907:3f15:b0:947:f389:58ca with SMTP id
 hq21-20020a1709073f1500b00947f38958camr3540146ejc.2.1680784784683; Thu, 06
 Apr 2023 05:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_7+5tK+rM6dBgozNJmMmL7fU3MHLuvzJtb7-zWK4rMTQ@mail.gmail.com>
 <4521ce29-1d11-f253-7a7d-342f6bd9e6b0@redhat.com>
 <CAFEAcA_HVpYajJ5yP7+eYKNhKggtNjgFyQ_V3WqSPf4dGL=zKQ@mail.gmail.com>
 <3b5cc225-50e8-e56d-3fa8-da052a515beb@linux.ibm.com>
 <CAFEAcA_Uh+20w1gnCBXe6Go9WqkUu+SUeRtsrrbwEO4j48OjGQ@mail.gmail.com>
 <149e9342-b48b-0871-ee4d-96c6f1d3f198@linux.ibm.com>
 <CAFEAcA_SgAZmv8YpaR0v7iU1oMdNTAMcrcYWaqGPzHDxjSP=wQ@mail.gmail.com>
 <c974308f-42a1-9163-5c4f-54bda7050ee8@linux.ibm.com>
 <2e529c06-199f-6d5a-a75b-5b88aae44b2c@redhat.com>
In-Reply-To: <2e529c06-199f-6d5a-a75b-5b88aae44b2c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 13:39:33 +0100
Message-ID: <CAFEAcA_mUb+2gXDzMoD+rOvN9y5tvPyp4QXNtPGkk0bzg1t5vA@mail.gmail.com>
Subject: Re: s390 private runner CI job timing out
To: Thomas Huth <thuth@redhat.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 6 Apr 2023 at 13:30, Thomas Huth <thuth@redhat.com> wrote:
> The thing is: it shouldn't take that long to build QEMU and run the tests
> here, theoretically. Some days ago, the job was finishing in 39 minutes:
>
>   https://gitlab.com/qemu-project/qemu/-/jobs/3973481571
>
> The recent run took 74 minutes:
>
>   https://gitlab.com/qemu-project/qemu/-/jobs/4066136770
>
> That's almost a factor of two! So there is definitely something strange
> going on.

So that 39 minute run was about 22 minutes compile, 17 minutes test.
The 74 minute run was 45 minutes compile, 30 minutes test.
The number of compile steps in meson was pretty much the same
(10379 vs 10384) in each case. So the most plausible conclusion
seems like "the VM mysteriously got slower by nearly a factor of 2",
given that the slowdown seems to affect the compile and test
stages about equally.

The VM has been up for 44 days, so we can rule out "rebooted into
a new kernel with some kind of perf bug".

thanks
-- PMM

