Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E86674F89
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:34:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImqX-0003Dg-Va; Fri, 20 Jan 2023 03:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImqV-0003DO-KM
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:33:59 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImqU-0006zP-4L
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:33:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so5303890wma.1
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OVPMcvR91J1wUmUIiKBaZJTmp6AMb/u+iWbWfFVtLVc=;
 b=a4Gulv4mMcB39YKgn2PH8cFBnIaJ3reCfqPoJrqN36OnqgMSom116XiIf3T6rwBgal
 +/ZyP0TlQl4jXEAIs/RIUJlrVb+MwOvupdiiqTfmWsJXYkxv6fKC/PTxQuTyLsVYLcGa
 lvu+TnwKhrDscBSMgPbbk2ONu45Dxb3stkiyOfZwr4VpUIGOKxtBmkSDCD36EmtRTLcF
 ipY82B1W3Ar4x6sd8taaeJH/DCWSXMiNyfA/diCPbl0ykjmIFTNhxnSqDyTZu+vCstI1
 5fviE2+DMqD0etzzEFZU2FPWN8scw1pRMUaiLNaqttRfp1oTTxZXwN1fox6HhXh6aCoz
 BrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OVPMcvR91J1wUmUIiKBaZJTmp6AMb/u+iWbWfFVtLVc=;
 b=aYWXrnI921I2H6nqLOTrbptcx/8q87KJlrMauGFyHKxCp1RWMDYP9Hv/bZaHLABYvD
 xFchcQ9kBr9ocw2XTTCBkiiT9Cd5XcuQtAvTPdK3YcHvYaSc61G663qDEpQ6Zw2mIBFT
 EtGSnTwJyB8/cSd3Zl5N+9PR78JfZWvsmSwb52lt2ysIisDCEDxf5roTsCBiFc7qqpRR
 SZMg/1/GDTzQJ1jJEHiQQAuArtObPC8tpcZJVMP2BDYKzL0R1UGT8P41vNSIEA2NrVsT
 65oNYNRfVJ8rzN5NYzGQoRdOBMiuIbTYcC343D4/4ainD3O4B/i3Tt6zjDMVSc5l36ZV
 LetA==
X-Gm-Message-State: AFqh2krS6UXhTo7IpOhXeY9wKy4Tv8UrVVHo3wlLr/UiO5l+OQAxABT4
 ybGaxv3x2f1v/36rUnxLxF7Jfg==
X-Google-Smtp-Source: AMrXdXt9PytUlD1nBIEnS+86bwHJGWLjmfoR0sRC5Mw0c191YOta7RRhfhgwzva2sOJfkfTf0NiCxQ==
X-Received: by 2002:a05:600c:510d:b0:3da:f6ae:faa9 with SMTP id
 o13-20020a05600c510d00b003daf6aefaa9mr18307130wms.29.1674203636378; 
 Fri, 20 Jan 2023 00:33:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b003db012d49b7sm11202140wms.2.2023.01.20.00.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 00:33:56 -0800 (PST)
Message-ID: <99817587-688d-5410-3021-1bbdcea0f197@linaro.org>
Date: Fri, 20 Jan 2023 09:33:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] travis.yml: Use the libfdt from the distro instead of
 the submodule
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230120075330.2076773-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230120075330.2076773-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 20/1/23 08:53, Thomas Huth wrote:
> No need to compile-test third party submodules over and over again if
> we can simply use the pre-build library from the distribution instead.
> 
> By also adding --enable-fdt=system to the configure options, we can
> also avoid to check out the "dtc" submodule here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Add --enable-fdt=system to the jobs
> 
>   .travis.yml | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


