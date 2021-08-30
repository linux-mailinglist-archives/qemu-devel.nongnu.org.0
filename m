Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C33FB708
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 15:36:11 +0200 (CEST)
Received: from localhost ([::1]:48276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKhSM-0000Hb-5w
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 09:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mKhQa-00079D-KR
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 09:34:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mKhQZ-0005K5-2M
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 09:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630330458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wh/Wb7lDYrsB480QD+uiafhPjZ+ojkQP+l82wGeNBlQ=;
 b=gJesq/bKe4BeJo9N7j+PuvkUu16M3mF5gWqWwQWUjObtRqMWU6a9eTbIVhyXNx1Gc4G5uV
 RjGFzoWJHFWVT7pTabi8qOO9WHoxAIjc5eb1BDuX+nf1+jR9GUvuWWoM2B1Ch4wgU/uho5
 ueid4AW6siNslua1C36mWzN0MErC7BU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-leojZatEMGG_JI7uZ58_KQ-1; Mon, 30 Aug 2021 09:34:17 -0400
X-MC-Unique: leojZatEMGG_JI7uZ58_KQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 b8-20020a5d5508000000b001574e8e9237so3332743wrv.16
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 06:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wh/Wb7lDYrsB480QD+uiafhPjZ+ojkQP+l82wGeNBlQ=;
 b=RY+k6THdGgFxbyJIIj7C+Gasl/P37/+o4P4ec8tnSsuEUU0MJ/61qmafebnEJp7COq
 D5iOmhjPKyp0Uc89rBGYqW7eOc9GgDPky3w/Y71I4UYQEymtaw8tkc20TTvWT2uVeZok
 ZTPJbaMxpSrPplaLCyNt9rwpNa4o+Iw0zHaO9r0oor/2+Ef+YoKfvqpzJOUNxYIrZoz0
 Ztx4xMSk+KUW83x3objY9H+Qilw0VfmAiub5gK9XFDxjrJPSkocSLQ9pYqObTAhwhGCt
 yY2Oa12QC5QpunhbZIGQwEkOd/c9aC12Olzl75sWVzeUAPEMcso73o8Msc/Jib8e+Y6r
 kBBA==
X-Gm-Message-State: AOAM532dXb+iMrxUn1eaRjy34wKrKqzabDcGw0S6PymjSS4beKivt4hU
 WLJmXnnJCwmmv5yYxmxiy1Usak6kRx7BT2yFu9YgAaBYcccQ1aFD4eMb0N9tPqe5Y22XJmNL8nL
 Z3ZSwQjtrOs0pj8c=
X-Received: by 2002:a7b:c255:: with SMTP id b21mr21913978wmj.44.1630330455969; 
 Mon, 30 Aug 2021 06:34:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVE5fIMGzamf55JNoBom1vxmno2N9dQIjkbRycK6I4MUDAxLpbomXjAkRkLZ5fq3ZEAjP2Tg==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr21913963wmj.44.1630330455839; 
 Mon, 30 Aug 2021 06:34:15 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id m3sm19652152wrg.45.2021.08.30.06.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 06:34:15 -0700 (PDT)
Subject: Re: [PATCH 2/2] docs: add definitions of terms for CI/testing
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210820210946.291335-1-willianr@redhat.com>
 <20210820210946.291335-3-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <66629452-44dd-865e-1912-c6d89fbf202a@redhat.com>
Date: Mon, 30 Aug 2021 15:34:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820210946.291335-3-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 11:09 PM, Willian Rampazzo wrote:
> To understand the current state of QEMU CI/testing and have a base to
> discuss the plans for the future, it is important to define some usual
> terms. This patch defines the terms for "Automated tests", "Unit
> testing", "Functional testing", "System testing", "Flaky tests",
> "Gating", and "Continuous Integration".
> 
> The first patch was borrowed from
> 20210812180403.4129067-1-berrange@redhat.com.

^ These 2 lines belong to the cover and are irrelevant in this context.

Cc'ing qemu-trivial@ otherwise (patch reviewed).

> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  docs/devel/ci-definitions.rst | 121 ++++++++++++++++++++++++++++++++++
>  docs/devel/ci.rst             |   1 +
>  2 files changed, 122 insertions(+)
>  create mode 100644 docs/devel/ci-definitions.rst


