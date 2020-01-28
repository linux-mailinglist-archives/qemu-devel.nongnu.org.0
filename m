Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E014C0EA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 20:26:30 +0100 (CET)
Received: from localhost ([::1]:36066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwWVJ-0000Gg-6h
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 14:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58025)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iwVcw-0005sc-6V
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 13:30:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iwVcv-0003TT-0M
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 13:30:17 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46786)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iwVcu-0003ON-Hr
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 13:30:16 -0500
Received: by mail-pg1-x533.google.com with SMTP id z124so7431191pgb.13
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 10:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gu28XqLqTSlFdE/kBPSen0vEHfYvKF+hY1ehdI/UZtU=;
 b=lgMBg+o8dOqTTqj6lQYzIYzVxJEGEzsAAMDUsaT7evvZRQXaG7MmrijIjc9ShV1UHn
 peWxZYxDRfBNFbynYOGUptHxFceQwl6816mGl/aCWY3tz3/pLHeX+9qIqJSpPz4pzw7E
 Ap9mvSVi1iNGVX5HNJqzo89AFZM6dmkzXsmlXGkCiDhiYjb71Gli+ClB+OC4+j9iLVgA
 24dQ0zBOFcTgPXU9Lams4a1zvyphPcewuSxLWWqX2vFYapPE3ZxdrdRS8/eqDg1f+Wbx
 JfN6+Vht549DfbmSza0TdnWmVmb1mwy7PV61jFRahdCecnypuoV8RXgs6GKYVtmLb/D0
 N0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gu28XqLqTSlFdE/kBPSen0vEHfYvKF+hY1ehdI/UZtU=;
 b=GNvrZKSPF4zTbWz1a0HV8iUpAZQ1oWm3tvWqpLbhRhdt0FRWskt8bKnJnhBFOS4EpW
 Fo7QL2Joi4fc50ybffPEb7yc4ECAulVtIxOeN7n+nxIDMT0PENKR8p1g7JdeeyzkB8uV
 3vZquQYf6RtEpn9IVOJOhuAB2o0SMbqGM7LnG9gzW/+XKYWnn7rbhzXE7oEcvQxMSZWY
 lCwL6jO3o+/Ch81BopQQuxxA3IraVweIEflXiH8ePatuIcEObohZphF4yw/lJb8zzmsp
 4x1WMxyFnJwOL4bZriPWlc7cHs+otsvyrjR8fwpmY6Zf5qPEgaDY0jP0d+7hqMMgCkzq
 NT8g==
X-Gm-Message-State: APjAAAWVq+cgkF1z01G1dzjdzqzp+77Mh2O3hCbjjwVq0RBoA5Kke9Cq
 MtIdvTQH/9XJVcoKM3ZrrR2SoLiwptk=
X-Google-Smtp-Source: APXvYqwGJ6Zc0MAd/KcEDaDa1pkbDJQy2NNVRZke8aNtydbAB2OwMCJJ8oXtupfO364XKfgVJgy5xQ==
X-Received: by 2002:a65:5786:: with SMTP id b6mr26586444pgr.316.1580236214615; 
 Tue, 28 Jan 2020 10:30:14 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 w3sm20337041pgj.48.2020.01.28.10.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 10:30:13 -0800 (PST)
Subject: Re: Performance hit in qemu-system-ppc
To: Howard Spoelstra <hsp.cat7@gmail.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
References: <CABLmASG93Fz-=XR45Z7pcaUkF8De3EdZbS_=901w_vhYUPiuXg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <331cc94e-38d0-9259-337a-ce759ed8edba@linaro.org>
Date: Tue, 28 Jan 2020 10:30:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CABLmASG93Fz-=XR45Z7pcaUkF8De3EdZbS_=901w_vhYUPiuXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::533
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/20 3:30 PM, Howard Spoelstra wrote:
> I noticed a considerable (~20%) slowdown in the cpu performance of qemu-system-ppc.

ENOINFO.

For what test case?  This should not have been on any hot path.


r~

