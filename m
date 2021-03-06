Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAC932F77D
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 02:30:01 +0100 (CET)
Received: from localhost ([::1]:39924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lILlX-0005Cr-UW
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 20:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lILjN-0004ek-Uf
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 20:27:45 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lILjM-0002j4-8p
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 20:27:45 -0500
Received: by mail-pf1-x42a.google.com with SMTP id t29so3249541pfg.11
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 17:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bext7Uzqjj9nVzO96fA6YlKGegXrH8woj2XV53BabsQ=;
 b=gdB5h4po7ZluvwV2kF5QJP8Ylqy/7dL3gLiSdrrvziiKOJBxixsydTsbCOzJ52GD6x
 8lJfOdxLxlR7yQVau3lZqY20XgsFDFQNgrssVMqxYnNMlW9QzQby82aFqseOdhV4QRcY
 aFj71S2CcNEDJsAQyH8O2PBSxb1hkjYh+dCs+i6NRwin9atyB9K6pxrLTUbbzii+4gLT
 I6wElfn28Y3+X+kpCh8Dxyuu03JktSYPGdcdfIpF3VXTHbHFsylzhjGtYZgpPlq1o70/
 OrdqyiNhZnSn8RCmWMO/7EvS7TNzGyJph9PngclklX2qI/zlYApmiduEK6xKAhb8DhfV
 wGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bext7Uzqjj9nVzO96fA6YlKGegXrH8woj2XV53BabsQ=;
 b=iEIvik5tw2/M5OfyHbiXw9uiYrJt7XfHlhm68VvUQRpsr0hwnR2j3q8aXkCtN5J9p+
 oY9oJOgwNmEFJQswhMNhL0w+lcrlizQ9b6Xf2PCMhPnD9ByC+JKQ02Vmp1i2Wr2cMSyA
 V7Sn6ZycRT3+a4gMeia0ojQe8RC5w9iKSZD8ffrvFSZJ5q3pr862HeMPGpLkKmDYV2aV
 aG0LXdO72tJxTJ4Dqe8+drGcn1ge3gMa+sc+Yh7oCjKuAiN4gEZKbgDtgE47K+Mh1ZI+
 Sn98yNSqT844fEVQ3/w1ReG/k06HropzbCnJfWoJhXmUYgUYZmdFnpjXtuhPFvN732+y
 64uw==
X-Gm-Message-State: AOAM531QDBDBEfLlQul4jTsgS4wHgpV9xFgifZyzdnzmt0jvJUAzJ1sm
 tjKffpjxFzAkQaAOg7ckHbLnsQ==
X-Google-Smtp-Source: ABdhPJwtruxrMsd78onEUZY7MNf2zEcXOEKxZbX+KwMhtsWChlJBZ26cBa+vB9MkLztyZc63cYqq7w==
X-Received: by 2002:a63:ee04:: with SMTP id e4mr11077549pgi.446.1614994060320; 
 Fri, 05 Mar 2021 17:27:40 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w26sm1423803pge.23.2021.03.05.17.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 17:27:39 -0800 (PST)
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
To: Keith Packard <keithp@keithp.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com>
 <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
 <877dmlgnrf.fsf@keithp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91d57887-8a5b-a837-6027-3fc2c38c48c7@linaro.org>
Date: Fri, 5 Mar 2021 17:27:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <877dmlgnrf.fsf@keithp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bug 1915925 <1915925@bugs.launchpad.net>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 3:54 PM, Keith Packard via wrote:
> I don't know of any implementation in hardware or software that supports
> modifying this value. I'm not sure we need to support this in the
> semihosting code for qemu as I'm pretty sure getting qemu to support
> dynamic XLEN values would be a large project

I think it would be fairly trivial, now.  We have riscv_cpu_is_32bit (which 
checks misa, not xlen, fwiw).  It's not examined in cpu_get_tb_cpu_state(), but 
it is many other places.

> (a project which I don't
> personally feel would offer much value).

Now that's a different story.  I'll take no position there.

However!  We do have a function, that can be made into a TCG hook, which could 
then be queried by semihosting/.


r~

