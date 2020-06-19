Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D102A201D5F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 23:57:00 +0200 (CEST)
Received: from localhost ([::1]:53434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmP0N-00031P-V8
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 17:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmOxl-0000fN-62
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 17:54:17 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:37840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmOxj-0002EZ-Cb
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 17:54:16 -0400
Received: by mail-pj1-x1042.google.com with SMTP id m2so4882443pjv.2
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 14:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lrCE18KrqPFoGxz6NK9hNrOP6ueYxcWC2s7nldkyFJ0=;
 b=XdaUCCpUpsAI0novJ+YESCbQ6ezNhKqWHB+hTKGnmPSgIC8/HTWrFVytNTBCxFppnl
 aDgU5+ESGCnVCSFSYofvuIHfZMsnlJJq20HUlMmganT7oRftW5T2WNc1Mq532+r+wngv
 jbuyx/C8T9oYO0pwGnu1/XE0wBe13xvjQrOtqjyK5fNQDgF1XbrATz8ecPi/qTmtgzzU
 qIwmqtnsPvD08RO0A9lFbbp8IYdODOHxuu9clf1pkxWkFiMdxcziG5JYXW3UiwscrPNc
 /aQGsP8f3n+Wtj+HR8ecrztZNNjCe1jObsiW0LsIw6c8sgWwWRDSo/56hPRBpoifw/qO
 iLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lrCE18KrqPFoGxz6NK9hNrOP6ueYxcWC2s7nldkyFJ0=;
 b=n/uztUgyYO/FgbH2TLTo1kIteDLSDpNd/G4ebcKY72WeB69U+19j8BdTvzgj0QBqrY
 gHHEqu00WM6Dg0Bw1EdQpSiJj0BsreR8yOdkMCEzD+aGpbbODQJ9lsOnNUpmpFWxuTJE
 cGruztVU8NcrJjuSI/CTXjI2MxT97iJjgw3HzKuaV+NuPpF4tpkgNWd+IzQ1qlC8JT45
 rdkHAzoGNzMxzqIzqsSGqKUF8x7JVj+G0xegDhxfM0/EKhrSayQAoSCPJaDEFNL+acl3
 PoUKb0cEzaMxJviqdt0uE8wZj+/XcqsWqVF0exijSl4be9B1e+kQny9i5kpZD+QW0Akv
 UFfg==
X-Gm-Message-State: AOAM532vfi8rbS1qdUO68rxD3i3O8CnPCkPEIfGHBl2RpWpteBb6Xlb7
 s/4PuO4R+eCKXWas+Og0czvn/Q==
X-Google-Smtp-Source: ABdhPJzHB3+Z9Z1nc2/EmSB7Zk2NAU3xin46KldKaeenBmck8UlnkeHjuLqWbkQV5seZcA1TY2w5CA==
X-Received: by 2002:a17:90a:a106:: with SMTP id
 s6mr5827656pjp.211.1592603653800; 
 Fri, 19 Jun 2020 14:54:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z24sm6878989pfk.29.2020.06.19.14.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 14:54:12 -0700 (PDT)
Subject: Re: [PATCH] qga: Use gethostname() instead of g_get_host_name()
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <8e73f685e10c684eb5e2c88c2185504d26f024fc.1592296355.git.mprivozn@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dae9555b-f9f1-37d1-5c42-f64bf448d73e@linaro.org>
Date: Fri, 19 Jun 2020 14:54:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8e73f685e10c684eb5e2c88c2185504d26f024fc.1592296355.git.mprivozn@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: vfeenstr@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/20 1:34 AM, Michal Privoznik wrote:
> +#ifndef G_OS_WIN32

Nit: positive tests are easier to reason with and extend than negative tests.
I would reverse these two blocks and use a positive test for windows.

Also, CONFIG_WIN32 is what we use elsewhere for this test.


r~

