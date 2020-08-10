Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE28240516
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 13:14:40 +0200 (CEST)
Received: from localhost ([::1]:49416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k55lH-000532-3Q
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 07:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k55jt-0004L1-Cj
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 07:13:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39542
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k55jq-0008Gu-Tq
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 07:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597057988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQaWuwsKY1CkB3RoWdMj8nWtPsmvygs0LzEasqRc1dM=;
 b=P+4lBt4eEnXDnRCrj1d28j1EL1xwwAXd/r9+nipxS38B7HKHI/9c0HSBDE9gP0rNlY08h5
 JEaZM3UjmFCpsYP7H29U3cjmL4OscejP3yrfw0n45S6tLbbo75yUCyEXjKb0XOC6h0WKhh
 +Ym3cda/kWX31Npr+mUBL3JmDpa00no=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-mm46pGTAMN2I0UaPNrlzWQ-1; Mon, 10 Aug 2020 07:13:07 -0400
X-MC-Unique: mm46pGTAMN2I0UaPNrlzWQ-1
Received: by mail-wr1-f71.google.com with SMTP id b8so4099737wrr.2
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 04:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mQaWuwsKY1CkB3RoWdMj8nWtPsmvygs0LzEasqRc1dM=;
 b=QtdDE32vOTHru/hGItd3GAjActji/Mk2bMYupAefdW4QEgSN75dbbkGjAjvGkHMqs8
 LK5HGlDABSTrB3hrH/XsUfVsFGwNiYOkqmw0I4nIgEnFdnj5lk1WZskhQvAcyvRtYSLy
 56F0TCzmQdHg48O6wOjfqjeRxTYeUSJf4YZIbSCpUdZ7yB7iLnJak8dKTasedSUSREd3
 uzxFqRShCUc5Ho5sPLpjZynnOw+wQ78PBq9wXmQA7FsDedEZWh+AjP2Rx1qaztkvNNUI
 YlHFynslJeI3GxBHFxvmZlyCom9wAKHbxarv0lcZjOHIZWpK0ScotfCxyJ04j1zhYMT1
 BcNQ==
X-Gm-Message-State: AOAM532gKXpalpq3EjMTBTG8qsi9gJfZbmSQF2yb3BrtbT7j+SSLou1w
 mglyyANbFKX+ef1aVJJaeeWD4bvPzgqUTRbrCwLvYHqxYiNipv5StpgU4CDK2tTvFE4dsr4zL/U
 amzKvUB3WQdE+alw=
X-Received: by 2002:a7b:c20a:: with SMTP id x10mr26744249wmi.177.1597057986115; 
 Mon, 10 Aug 2020 04:13:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwERIwF5qhuWeBWmiY43T3PQLMru1sZFOI+cR4jLjXRJPXY7EyWV4pVYbFqQlzxsbeRUr09tA==
X-Received: by 2002:a7b:c20a:: with SMTP id x10mr26744230wmi.177.1597057985868; 
 Mon, 10 Aug 2020 04:13:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d6c:f50:4462:5103?
 ([2001:b07:6468:f312:5d6c:f50:4462:5103])
 by smtp.gmail.com with ESMTPSA id s131sm21427151wme.17.2020.08.10.04.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 04:13:05 -0700 (PDT)
Subject: Re: [PATCH] acceptance: update asset hashes for the Bionic aarch64
 installer
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200809223741.56570-1-pbonzini@redhat.com>
 <13b3586c-4d0e-76bc-4716-b6ee88e9686a@redhat.com>
 <06ed9cc7-2204-395c-2395-d5c750c75635@redhat.com>
 <606d1faa-1920-de51-9197-95b79466331d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d6a41c8b-24b4-2c1f-3bdc-95a95aef12f3@redhat.com>
Date: Mon, 10 Aug 2020 13:13:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <606d1faa-1920-de51-9197-95b79466331d@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 05:06:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/20 11:35, Philippe Mathieu-Daudé wrote:
>> That seems overkill but yeah the tests should have used
>> 20101020ubuntu543.15 instead of current.  I think this should get into rc4.
> As our CI is not yet gating, I don't think this justifies delaying the
> release (except if there is a critical bugfix on the list).

It is not gating, but it means that acceptance test for 5.1.0 will be
broken forever for everyone that attempts to run them.

Paolo

> Maybe it is acceptable to simply merge the CI test fixes before the
> release tag, as no code/binary is affected...
> 


