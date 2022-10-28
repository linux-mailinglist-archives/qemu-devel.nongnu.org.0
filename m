Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539B1610E07
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:00:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMAM-0001ly-Pd; Fri, 28 Oct 2022 06:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooMAH-0001kw-Rq
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:00:38 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooMAF-0004jR-73
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:00:37 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r186-20020a1c44c3000000b003cf4d389c41so3441772wma.3
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 03:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n5waTBe/P2IX6xUSysAn6dJTDTGZ5a/s0G8ajAbQRfI=;
 b=d6kwmgQnOYF56oA9F3xk5+16pQuGS4Rx9QDkFn6+RY4fMC/0Vumd+zzNhnog4wJrMU
 QAR03q2Jc48rhesXBJD2F+GanYegINMu9V6vu21n2w/TbGF2nrObA9soYJm8wHXxA35n
 /Hpvc4Y74voVf9d9zyxbi8Xa7DtLYEBuYRd11C8FtytSVg2GzX/tyVGXjlRUb2YEs6LW
 tKDG/RbyhxAJtxlC29WND0N5MWi46yAkD4Yrp9CJnEclhkFrUkVR7cQVBz/wC6tydG2l
 ZSA2Igahl/Tx3n5gSP0AsYdME1iW1tQCXO0LPAn92/mMJdAnKk9BgQNeIsY3QXWoonQL
 F0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n5waTBe/P2IX6xUSysAn6dJTDTGZ5a/s0G8ajAbQRfI=;
 b=o+nViQB6Hu7T4foYNO5SgyxqiGzX4akgNt5+T4HPh9ewOmfxYE3b1N8OJy0XrXMe3r
 y1L0VkBR8R/SPMFs/I+UGehvw2nekx8htmmIUt9Q02hcmFiVSF6L9aYaTCNMpBevnr0n
 8DHd7NbhGRhyH8ncUi9hFuMxbmW1alpeQeFS6xdJ52ZvZ0O6+e5VvX6j1l3sEQ8ZUDP9
 jj3Hgdt5fqkr38VadntM/J/77+SR9RMFGnp2rMGFHuKR/J2jLVWIyS49GMxaCZfmDHHn
 Lpa/nijAZUZOgzN9lJ83GAxiY5in2iG6wiF2fbv9yGwuTBjkbOWJGoHatdYNO9UqDDnm
 QJjg==
X-Gm-Message-State: ACrzQf3QerUinJur79+XgOl3hLoP+bfIHmrbocXGB0/0j4pgtYpNvW2V
 /TOXx9iz5UmWH+8vJqnrjDJoiAKAKJSvazN1
X-Google-Smtp-Source: AMsMyM6xkEBuJd57CAXlW/m9frhj99nnWaPiaB9yX5s5Nmpt/2ny8bIxTGmiKzQ7FPIyv4PhBKmfQA==
X-Received: by 2002:a5d:6a81:0:b0:236:65a0:e7d9 with SMTP id
 s1-20020a5d6a81000000b0023665a0e7d9mr19464207wru.327.1666951233381; 
 Fri, 28 Oct 2022 03:00:33 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m124-20020a1ca382000000b003c70191f267sm6971719wme.39.2022.10.28.03.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 03:00:31 -0700 (PDT)
Message-ID: <7f7b5739-cebd-f8d3-c3bc-8ba506b8b5b5@linaro.org>
Date: Fri, 28 Oct 2022 12:00:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v5 0/3] tests/docker: update fedora-win[32|64]-cross with
 lcitool
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Daniel P . Berrange" <berrange@redhat.com>
References: <20221028095659.48734-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221028095659.48734-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/22 11:56, Philippe Mathieu-Daudé wrote:
> Hi Alex, in order to review carefully this patch:
> https://lore.kernel.org/qemu-devel/20221027183637.2772968-2-alex.bennee@linaro.org/
> I split it in 3 to convert in trivial patches to review.
> (I kept your S-o-b tag).
> 
> Please consider as a replacement for your testing/next PR.
> 
> Regards,
> 
> Phil.
> 
> Alex Bennée (3):
>    tests/lcitool: Rename non-Debian specific helper
>    tests/lcitool: Refresh to latest libvirt-ci module
>    tests/docker: update fedora-win[32|64]-cross with lcitool

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


