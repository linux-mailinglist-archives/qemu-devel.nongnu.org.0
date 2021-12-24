Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E63F47E9CD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 01:15:45 +0100 (CET)
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0YFM-0007Ee-Aq
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 19:15:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0YCt-0005sC-SZ
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 19:13:12 -0500
Received: from [2607:f8b0:4864:20::1036] (port=55998
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0YCs-0007bw-FG
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 19:13:11 -0500
Received: by mail-pj1-x1036.google.com with SMTP id iy13so6224520pjb.5
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 16:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HgJLRynaYtxpSwM1uJ+6ScN64JbFZgg30u8UT59iUW8=;
 b=mhJ1erFbTaMfwQWZu6NAWav4Q8xgKRaDAC+5ZpDh0xRKZv1/QITOzUiUEn75/3op6n
 i/KD0K/WEC1HuT5l/iEE5QhNvklVJfvGLjsb3bFlQTxiOkfrS2LbAx2n6cTAZC0+bCLn
 OhXzIZT3yuu6EswOYXD0b4Cd7kh93Vq99c/CbKX316BYGFQI3EfqkkekhnQHWeEwBqv8
 wJ93xzo99HJbJfXyfd32oGS+eCOMDJWq+Urutr8oauE+S4c+xRuw5Iszmj/ziMTKHm16
 cBMOHoHOi/f6vXvfJsE4ku9L2v2T1Eu/RZegv9WZwZYxzihX0WHXEwKqhewhh0LigsG0
 OYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HgJLRynaYtxpSwM1uJ+6ScN64JbFZgg30u8UT59iUW8=;
 b=0aOAep9LH1EGmMPmh761jvu28N4rAYz3cMxpLzZYamF5zZmVDU1B8Uy5kbkVm+ZZOu
 jmOowyujogt9uwfVXPvTnNlB8NfxFFbHPFq/fKql6XnkNqjI3P0t/Gk6daWnlC0rNSRd
 b7NzuyDm5wkHxm0a0ll7nXwxPGwIxk9IheIm0N6LTWdh+0LX98I1F+V4n+4idTljE0kD
 GfBMH21qUq/MrT9z2FIdRdZRorAlAhmbeZgv6vyE3I9Jgp66rJoOoLUeBwPqZ/QiSJ+6
 P193XBp36YJROHIbNzVm18B0jK0kCmUFVSRzX/bnXwqVxZcYP9di9x/VyXXiwv6dczMm
 vLqw==
X-Gm-Message-State: AOAM5338qdoSPmrlq2SL5kluTyLuVJFe1VOYCbeQRyC3vit2OcDruVq3
 I+w79Tugmvf06I5dDn0fHXMP5o5g3Zrm/Q==
X-Google-Smtp-Source: ABdhPJxQdisk//wdKetbY2sM6sBnnydMP9Vbe7cKzrTySO5xR8gdemaZmg7oCkHCdTCTAT3SKkp6xg==
X-Received: by 2002:a17:902:9a47:b0:148:a2f7:9d69 with SMTP id
 x7-20020a1709029a4700b00148a2f79d69mr4451807plv.136.1640304789318; 
 Thu, 23 Dec 2021 16:13:09 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b65sm6864713pfg.209.2021.12.23.16.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 16:13:08 -0800 (PST)
Subject: Re: [RFC v2 04/12] target/ppc: powerpc_excp: Stop passing excp_model
 around
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-5-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3cbd42f7-a1ce-502d-60cb-cbb0dd75c97b@linaro.org>
Date: Thu, 23 Dec 2021 16:13:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220181903.3456898-5-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 10:18 AM, Fabiano Rosas wrote:
> We can just access it directly in powerpc_excp.
> 
> Signed-off-by: Fabiano Rosas<farosas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 43 ++++++++++++++++++++--------------------
>   1 file changed, 21 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

