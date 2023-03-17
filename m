Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F796BEB68
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:34:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdB8v-0002xK-GM; Fri, 17 Mar 2023 10:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdB8t-0002wy-C0
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:33:15 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdB8r-0000yq-NJ
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:33:15 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v21so5463728ple.9
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 07:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679063592;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=veLySn1tdbUtZDD62cKg3Nvp0VTtfUNvQBkosWOL9SQ=;
 b=kZGf63fggAz97xTaqfEPvXrQRkg6D2HRyKxTaDngmLu/rOi8sQhyJ9L/QyBcj5rWSx
 dUwHnNCKgeshWv2B8JeBJclI+nfh1DMYiTmKXe3st9qo7FIQd2YOBXgcg2IwpsperPhz
 xthWJo5aXRzVUW/mCmvVBZies/eebTMK2VfFrPJO2soK3YgfGdJ2IRPbc70FQQGW/VJw
 YT/2Ip1hMsb/7bKOx+PXjljmwMktWRLT0RilodG+xQD74JIOy9hO7FFg96uiXmYw/L7w
 t8KJV9NrR2CTg4R4T3HcgpuN0z3BCcpxoAUcipJpFOUXbGnoO6DIdHYqz3jgOxkcA6G1
 tXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679063592;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=veLySn1tdbUtZDD62cKg3Nvp0VTtfUNvQBkosWOL9SQ=;
 b=sxAfe7kmGjrXLl7ftJdJ+//H7x6OnL/DNvIUl+Cx5sZGVvSl7fBubajggjWxTIfzZb
 x3zCE2r2i0M8NIeztWu8NAkFwvktxbJxEUa9Wk1LVNJEJug/1tGMD3Uqj37kp69G3hhE
 gIacG6WZkMfgerLXgP74GpBaqC5aeG/jIMSxNFuPwVuH6tHQX1eNUX1iPC71/ZkXFIqc
 98IZt15OjIoHPsGjmk1UaJX52lEessTE7QQFTzhfG3ZiX8rj5SB0RSYaFpYAc6wuxYL5
 l1G18s1D0Hjq6uZ2FffhCLbTKmcQiDnOn2iDnjrrj58JQxbyEQ/v/9S1UfMsPD5jMV2A
 iYsQ==
X-Gm-Message-State: AO0yUKUh+P+5lqBDEyIJk3PVBrcWweY90fZq44NXIbi9JILaf1tDZnde
 Z+SU5BfLeBFGN5jdlyOV2Ile+Q==
X-Google-Smtp-Source: AK7set/qdRyU2DFzQgXKQoeDxrdKyUi0uPBpyCOOJVlyt0q7krp4KxGN7Set3F8vGut8qYylR9s3qg==
X-Received: by 2002:a17:90b:4f4a:b0:234:1a60:a6b0 with SMTP id
 pj10-20020a17090b4f4a00b002341a60a6b0mr8354454pjb.34.1679063591918; 
 Fri, 17 Mar 2023 07:33:11 -0700 (PDT)
Received: from [192.168.57.227] (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 mj23-20020a17090b369700b00233b18e6fb3sm1621240pjb.1.2023.03.17.07.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 07:33:11 -0700 (PDT)
Message-ID: <85cfe4cf-d546-a6fe-adb4-f3d64e6eaf84@linaro.org>
Date: Fri, 17 Mar 2023 07:33:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/s390x/tcg/mem_helper: Remove bad assert() statement
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230317135737.597570-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230317135737.597570-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/17/23 06:57, Thomas Huth wrote:
> The "assert(!nonfault)" statement can be triggered by running the
> "mvpg" s390x kvm-unit-test with TCG. According to Richard: "... the
> assert looks backward. We should only arrive there if nonfault was
> true for the probe (otherwise the probe would have raised the
> exception directly).  I would think we could just remove the assert."
> 
> Fixes: 4049431478 ("target/s390x: Fix s390_probe_access for user-only")
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   target/s390x/tcg/mem_helper.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

