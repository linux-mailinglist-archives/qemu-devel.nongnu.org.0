Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3BB47C9AE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:26:17 +0100 (CET)
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzoWP-0006dI-1h
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:26:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoUr-0005nu-Lw
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:24:41 -0500
Received: from [2607:f8b0:4864:20::431] (port=36810
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoUq-00080e-8k
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:24:41 -0500
Received: by mail-pf1-x431.google.com with SMTP id v13so641484pfi.3
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yzQ2PWq4mq66UxC+C0JhNT6tAR8LScN/CSc1FUCfHwI=;
 b=QGw2vDJuMDwODJvTA+JlvjlvUdHiUVaahbZbGOIOE5mWMwzcgrb55AF3k3MmAw9/vY
 UDA+KwnpLpB8XN8WYldYgrH3igWWnIOr7BuadmLyvYAQTg7BZxwucppew0U0GoJ3/lHo
 1T3vv5zJ/0ElEb0yMosihRqgMkmTVBUj9mJtzFQYLKmW1ZdFf9Wf/QWmN0Wjo53WpukS
 sBXgHG8RrWIVhfyOsj6eOGwAgQcfiZ8f5RBW69FAHVrQ3BgcZRUcuQ4KMQ22WihUJ2gE
 I5l9c7/MFyviTsbCgJ02zSOll4igDTvV5OZKWbDDBRzNfOipavfrGBHkPZNspqMtvo5B
 vlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yzQ2PWq4mq66UxC+C0JhNT6tAR8LScN/CSc1FUCfHwI=;
 b=A55jSsrWCnHO0eFIdzKvfiuv4bBLow3+lC9FNfC1i15XQ2F7gPjkTrBdX6K+gm9hpA
 XJyUKw2wd133uQYBrImJH8+UVEsyt34V98wZJj219C4rZXDU+6jLRSSBW3KX7SJHtv9i
 bmAqCODaEMXEOsgLj/ewdfCdx2YG+f7K4yY6dMw/pVYAFyeayQYqJdwv0qTbHII35Gw0
 vQXY/to1kwR2CskIfXUi+ygsaQyNB3BWmRw9yL57h0wmZ4Db3gL2El10ZSNkATDupg8I
 vpHQycPHx/fp65Ct4fVlMv+DKCzThBsOMEhI/w+w7XFbWmT/j7SAs9WXQaVPtEP0PJGu
 vU2A==
X-Gm-Message-State: AOAM530+ugN3wn6aEyxvG+IxLPnF9FNd9+ifkzrFNRDP8UBofB3smGJS
 ScAaCK9o0tYe08Vu4L8C77xBizKbu24N6w==
X-Google-Smtp-Source: ABdhPJzLTmsNCjV24O8F7U5aEqHkntgwHxweSlZxUSHsTU5Yh2kgtzhUs/Q6xUtAcjuk0nZicNwKJg==
X-Received: by 2002:a63:d49:: with SMTP id 9mr530450pgn.290.1640129078838;
 Tue, 21 Dec 2021 15:24:38 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d3sm159306pfv.192.2021.12.21.15.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:24:38 -0800 (PST)
Subject: Re: [PATCH 2/3] linux-user: netlink: Add IFLA_VFINFO_LIST
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211219154514.2165728-1-laurent@vivier.eu>
 <20211219154514.2165728-2-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bed94eb8-20e7-92fe-8ff9-a87c8513693b@linaro.org>
Date: Tue, 21 Dec 2021 15:24:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211219154514.2165728-2-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/21 7:45 AM, Laurent Vivier wrote:
>    # QEMU_LOG=unimp ip a
>    Unknown host QEMU_IFLA type: 22
> 
> Signed-off-by: Laurent Vivier<laurent@vivier.eu>
> ---
>   linux-user/fd-trans.c | 174 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 174 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

