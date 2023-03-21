Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FA56C33C4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:12:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecic-0001Wp-T9; Tue, 21 Mar 2023 10:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pecia-0001Wh-48
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:12:04 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peciY-0007ez-I9
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:12:03 -0400
Received: by mail-ed1-x530.google.com with SMTP id x3so60159417edb.10
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 07:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679407920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jk4+9vFmens7LgYOXkDFDnR7zEu/42wV5eJkW7qMZBg=;
 b=F/UHiZknBSW1TyBCldBWwOWwUu8gMWtR5xfWdf+ide+7UYDthifh00Oxb6sQtVzPmK
 chDv2+NZZ4dMIa9htGGr6DA0BH39ciPzJev3v8B3LLhAKqb6UNQMcG3F09Ni+VJmQ83l
 EZFuRH+QTrPXlgUUsnPF9UEFTJmBPUuHoAYesqt+Nl2xgaJS95N0SmdIodPmjLTeEaSq
 jyKO7cQEOu6aI0A+s5IBRUMgH7bvwySVb71td5hRMu0kF5grHQc9bOhnmEil7xNwCvBC
 v+eo1eMV3Ac84WqAX4ynEutsBUN/5l2dg4ubh6/sAjm4T26PHeV1SwuKbUWi/+hbCitV
 Iy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679407920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jk4+9vFmens7LgYOXkDFDnR7zEu/42wV5eJkW7qMZBg=;
 b=rDiEy9n+MGoaSNXOLn6/V6GVuZuVsU81TL9naCaEftj0EGry9Djh6ilKrWygT73diI
 2TWO38H94N1JGfG16qEx7eu9JiwPr1AVQodqReaHAF8+JmgGVyAhIRrgdWDrLCRcSjrS
 tef/veb5D7DqsDa12R+SkKJ7+Fx//V2KuLPk2T5J09zVIj6cs0QBuFEFQDzxSvcgyVC6
 89gvJlMtYOHgutLPe5fhmu+G5An2PrUmagAieo94T630swVou1voLUDc8KvJwcWnSz+D
 YG0BMGjv9jN4Tho3GZ9FkAGgtS9mRsF5by71/jzuNkBZoXLsWxJ9wnmw1MzVCaakAyGL
 bUvw==
X-Gm-Message-State: AO0yUKWVZE7iPOgIZY3GlBT+wN+awzKJBPOn/TUi948S8P7OWn/OQTKc
 KM1p+4JQUf70gCS+fWMQ1Hh/DQ==
X-Google-Smtp-Source: AK7set8mlDJxpkHxHvjmHtO4hNIYVmQ2zDgyYhQ2rsYv5Gk6eNFrGU6sCy5clB2hXPZiEwa1mCgDDQ==
X-Received: by 2002:aa7:d3c1:0:b0:4fe:9bba:1d65 with SMTP id
 o1-20020aa7d3c1000000b004fe9bba1d65mr3306540edr.21.1679407920639; 
 Tue, 21 Mar 2023 07:12:00 -0700 (PDT)
Received: from [192.168.69.115] (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr.
 [176.184.22.219]) by smtp.gmail.com with ESMTPSA id
 i3-20020a508703000000b004fbd365fb33sm6423765edb.38.2023.03.21.07.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 07:12:00 -0700 (PDT)
Message-ID: <57fb1481-4e91-9120-186a-2383833665bd@linaro.org>
Date: Tue, 21 Mar 2023 15:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v4 0/9] improvement to Python detection, preparation for
 dropping 3.6
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com, berrange@redhat.com
References: <20230222143752.466090-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222143752.466090-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/2/23 15:37, Paolo Bonzini wrote:
> This is my take on John's patches to improve Python detection and to
> prepare for dropping Python 3.6 support.
> 
> The main change with respect to John's work is that lcitool is updated
> and the container images for CI can install Sphinx via pip; this
> way documentation is still built on the CentOS 8 jobs.
> 
> A smaller change is that patch "configure: Look for auxiliary Python
> installations" will only look at the $PYTHON variable if it is set,
> without falling back to a PATH search.
> 
> This series includes the final patch to drop support for Python 3.6,
> but it makes sense even without it.
> 
> Paolo
> 
> Supersedes: <20230221012456.2607692-1-jsnow@redhat.com>

FWIW:

Different patches 1 & 2 have been merged 2 days after you posted
this series (merge commit c3aeccc0ab):
- commit aef633e765 ("python: support pylint 2.16")
- commit 6832189fd7 ("python: drop pipenv")

Patch 3 clashes with commit 1b1be8d3cc ("meson: stop
looking for 'sphinx-build-3'")

> John Snow (5):
>    python: support pylint 2.16
>    python: drop pipenv
>    meson: prefer 'sphinx-build' to 'sphinx-build-3'
>    configure: Look for auxiliary Python installations
>    configure: Add courtesy hint to Python version failure message
> 
> Paolo Bonzini (5):
>    configure: protect against escaping venv when running Meson
>    lcitool: update submodule
>    docs/devel: update and clarify lcitool instructions
>    ci, docker: update CentOS and OpenSUSE Python to non-EOL versions
>    Python: Drop support for Python 3.6


