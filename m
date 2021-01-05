Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFBF2EB13C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:21:03 +0100 (CET)
Received: from localhost ([::1]:55862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwq10-0001iB-BB
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwpeC-0002Ub-Rr
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:57:28 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwpe7-0001lf-0h
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:57:28 -0500
Received: by mail-pf1-x42a.google.com with SMTP id w6so99972pfu.1
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 08:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SdzCTufMU/bzoYXi1+Gdiyus7+QsOrE6iZAkjW8J0pg=;
 b=oLehd5xqMnoSq90d1rpzIFDAcULumMe/zlIrtqY3z5tcc99iB+mL78pON4f59YZBOL
 /Us43JDFpT6TXAqNIKJ61gdhLfv2Halfw/U8fLmP728VOUjj/LO4oVFh9JYT9g4W9QGI
 6a10UWwSvTmcP49VZlMQc1rqhBwSfKhhPkD2M2p0Cp8rwHWyfzGAD+PlazcuvxbARi4B
 0UG3OEDhjdlwAuYBLg+5Th1FqeHYqrU+RteU26aO6L/z+szZlJt1RN/l7MIblIE1qDrN
 HCWJFEAKnN/FD3zilzdkx21S28IfmSSL9YYVuBd8UR7hmW4zZeVQvUJcERqVl/rq64/x
 HNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SdzCTufMU/bzoYXi1+Gdiyus7+QsOrE6iZAkjW8J0pg=;
 b=IYpHWJyMKNbewLrmYHUzqhr/JcJWCEmuAjt+twgW/xRnXsIB3wH3ttPi1B/l+tGKD/
 aUPzwDhkFHXnL+sLu1lXjJELX+Y12HPVx+ikWflbJAsrWPH5sg/VFWmzeGDpcc5FCAUe
 RfBSDKlGMsTM639leLTyNZ5NPzEJ5575F0U+7CSHmboX4qFN06zNJGG7CBo8w0ETeHyy
 P76NqLkVWrMq/7IWV3YRzAwOkCK8ZMYSaFGB4jy23RidoNeYidK+Dn2zuOaVcE8CZqB9
 fUucPhdOBkngKk0A8OxEu6250wVoJzVa5kK8NJf4jrhYsTR3j39cImPBfdk0VMDqJ3JB
 STrw==
X-Gm-Message-State: AOAM531QXVnGUR/26qvczupxDOVD8FgQQ7S1IrC8ycWMfNwS9beRVULK
 mVDFVT1BoKzzUZqlWGR0C6JhDIB98Dg28Q==
X-Google-Smtp-Source: ABdhPJyDe0IRCGgHXi6yPvHl3hiK1i4lCC7vNAUgRx87GdSJAAFwPxY9IJtdC2Q5dqumMCX/+mNA9g==
X-Received: by 2002:a63:1626:: with SMTP id w38mr261818pgl.278.1609865841037; 
 Tue, 05 Jan 2021 08:57:21 -0800 (PST)
Received: from [10.25.18.45] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a141sm156169pfa.189.2021.01.05.08.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 08:57:20 -0800 (PST)
Subject: Re: [PATCH v4 19/43] accel/tcg: Support split-wx for darwin/iOS with
 vm_remap
To: Joelle van Dyne <j@getutm.app>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-20-richard.henderson@linaro.org>
 <CA+E+eSAuz8F2Xvw=h7xhYbrMnVhpRWrpEraV=QpQRfPsCuDgAA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38f4d215-2f23-64bf-96a8-f6500566e2d5@linaro.org>
Date: Tue, 5 Jan 2021 06:57:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+E+eSAuz8F2Xvw=h7xhYbrMnVhpRWrpEraV=QpQRfPsCuDgAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.249,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 8:02 PM, Joelle van Dyne wrote:
> Guarding MAP_JIT with
> 
> if (!splitwx) {
>     flags |= MAP_JIT;
> }
> 
> is better because MAP_JIT tells the kernel that we want a RWX mapping
> which is not the case. On iOS, special entitlements are needed for
> MAP_JIT.

Thanks, fixed.


r~

