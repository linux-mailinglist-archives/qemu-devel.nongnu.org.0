Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD985FE133
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:28:37 +0200 (CEST)
Received: from localhost ([::1]:60944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj2we-0000gF-PS
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2sq-0005qb-6v
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:24:41 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2so-0007QL-Pm
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:24:39 -0400
Received: by mail-pf1-x436.google.com with SMTP id y8so2660032pfp.13
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 11:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dmD5cw9gbiOO3ThHlY9u6FGgp2jXEl/ofNejMI/phRs=;
 b=shmTzzUCJXd6mwyBvS08BuIm+m3wf0SKRDNVFpVU3a7azJv/TC4lRwTDcehzKwVhe7
 xfNMBIpc0tbZ1v/6U/AineIB16Ix1uea1IBNDNprpc5paulAdFI0duWsae3sMo5VE6g6
 tUMl39+wmtQ/xFE9qrDh7F6X57Ij5BdrxwabceCKh65QKPM3g78cifdRMRuOq1pxEoMp
 1vMUDEFdg4BU4a+tEWqzgFYkfE64X9VCRsEaje717JHrTR5ZRDLalY+cjDP3qZ2TtICB
 l6EBFx6wcJ76M/ECgzPb/ompGMjLBgOIdWZOQO7OiQn4BBeTybNTxlcpnzVTv+ETXys9
 hqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dmD5cw9gbiOO3ThHlY9u6FGgp2jXEl/ofNejMI/phRs=;
 b=hXmP5K3VD9vWzNvESIBcirriIBXDQYZQ9bX2lk7LRp3fCbCs9WhKSjLWLc794m+0MH
 2qK0DuxeijxeAXJSlTKt1GsDYEEOfktr5U9CaMQLgXwSok+khtMQ51TPY8Y7VpfK5lyI
 X0A9uHMlUowZ/OLDB+DXeJzglH59JJ2KoAGAQBQu0xU80KaEm3vqhrteff3cvWAGiXj7
 jIMO4vRhTSc21Gg7ZOUqKc9eUXsyhlgIlzlRM7JdIxUzPJuxpT+W3RxuZ5bRPyxNEw92
 hN7Ea6IxybS9Nv6+AOZEHhA84wqt0Suq4xIocil+7wc3MVdgB9bDFhNMf98n0ihlpR70
 +IZg==
X-Gm-Message-State: ACrzQf3XIFSdzFrCLt6Ocpa1hCW0HQe8ENevfA2fKOvIp9UVPi3iWuLC
 KdeFMmczzBTUlHOhBt8YAvj/IA==
X-Google-Smtp-Source: AMsMyM7rpmqp7XfhAu3C+hbuGkNe5P7tYLUDviMGCrmp744F7ysDXk5WrBIq4Lm/XN4KYIdFRrTaWw==
X-Received: by 2002:a05:6a00:1ad0:b0:564:a791:42dc with SMTP id
 f16-20020a056a001ad000b00564a79142dcmr1125371pfv.50.1665685477391; 
 Thu, 13 Oct 2022 11:24:37 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 iw15-20020a170903044f00b00176ca74c58bsm149772plb.245.2022.10.13.11.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:24:36 -0700 (PDT)
Message-ID: <3c681639-fd47-4260-cb90-8d1e148f7d77@linaro.org>
Date: Fri, 14 Oct 2022 05:24:31 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/3] tests/tcg/s390x: Add a test for the vistr instruction
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20221012182755.1014853-1-thuth@redhat.com>
 <20221012182755.1014853-4-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221012182755.1014853-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/22 11:27, Thomas Huth wrote:
> This test can be used to verify that the change in the previous
> commit is indeed fixing the problem with the M3 vs. M4 field
> mixup.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   tests/tcg/s390x/vistr.c         | 45 +++++++++++++++++++++++++++++++++
>   tests/tcg/s390x/Makefile.target |  4 +++
>   2 files changed, 49 insertions(+)
>   create mode 100644 tests/tcg/s390x/vistr.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

