Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0928E31AC31
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 15:19:30 +0100 (CET)
Received: from localhost ([::1]:52050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAvlg-0002IT-7F
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 09:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAvk3-0001GZ-IT
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 09:17:47 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAvk2-0003Vk-8x
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 09:17:47 -0500
Received: by mail-wm1-x329.google.com with SMTP id o10so2106122wmc.1
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 06:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QeiM1vdWhg3Ntfz7L7oafR2BGbqd3hXlzbrSyTAqu70=;
 b=XePNL6wrq6VJpwyT7x23B7G3vZ39LgnCwqo6bj2ccQXN9wbOXDCHnYyEzQ013qdxrZ
 oFr7UMnQ/h/YGeBpFnAGL0xxrcMNOSIE2RClDPq+Gm+uvCOTHQ9cq/wk0r8yeVdGFov8
 bilq85mNgOoLMp+usLi2K6Iv0isBXd6TPDu1u4MEsKOXyd5yAo+Z8+H5PuXKoTACXjM1
 Rrv1aKs5UlHQWYLcs5m9d52AVmXF7ERvps+vG7k2bP4eBDsrxRv4Gha97DyWn0XDvEqz
 DS4FYvIDp0hH7nEi8i8xVFehOkbtBfZxoOxGK8uAwHNbb9ABxjgYTHVmR73hbBROZ5ie
 aptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QeiM1vdWhg3Ntfz7L7oafR2BGbqd3hXlzbrSyTAqu70=;
 b=Eafofk9tSPnCDGrTg8sxnTrcoQSAxxbDzBxTf9xI9dI0CUQkNlfoaVHjlZPcys/yee
 hMtzMD6AMayLx9BTy+xapHfxljtmCtb2iJdo8JDGG1ILnfaNryagOSWttoyvfFWdFTHD
 SIt7NHn2vqZwdaL0ArOM+ILxnG3jbyJ3TRbXNV7hUlNoAohYZTQqvsOqe9D4Fc8ayIVX
 TEOMPrQMJkga36v55+u4sCcSfeiu0G75X+/BKAR4YZypzD6vJMy8hSasyD6NXDrhBe1q
 qR8huGS6ZYPFRV9uZ1DAQcU4slwX3SwDDQQSCj48qvmul9qk1DODiTBQVufSU7JCzmr2
 VyPw==
X-Gm-Message-State: AOAM530Z0dRZ1knBVw3p/523SMDXYQUVFi5BLpb3NBZMgYiv9NqhnTn1
 fYOEP42+Y7uuK1SGRXHK4/E=
X-Google-Smtp-Source: ABdhPJyFkfgC7b5fWRjTq/bxcOlHnsVy2GJ+rxqt6hy3LXk8729DLq69ZJui4nyvhZzVRxCVJZ1bRA==
X-Received: by 2002:a05:600c:35c7:: with SMTP id
 r7mr2772490wmq.37.1613225864128; 
 Sat, 13 Feb 2021 06:17:44 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t15sm17359660wmi.48.2021.02.13.06.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Feb 2021 06:17:43 -0800 (PST)
Subject: Re: [PATCH v3 23/23] tests/acceptance: add a memory callback check
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210213130325.14781-1-alex.bennee@linaro.org>
 <20210213130325.14781-24-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d14118cf-e7e2-43f9-aeb9-9d2b7da09685@amsat.org>
Date: Sat, 13 Feb 2021 15:17:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210213130325.14781-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/13/21 2:03 PM, Alex Bennée wrote:
> This test makes sure that the inline and callback based memory checks
> count the same number of accesses.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/acceptance/tcg_plugins.py | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

