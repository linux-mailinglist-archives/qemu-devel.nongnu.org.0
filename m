Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD97C31F304
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:25:44 +0100 (CET)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsg3-0002KG-Qc
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsdU-0000xz-CT
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:23:05 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsdS-0000Sw-Pt
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:23:04 -0500
Received: by mail-wm1-x32a.google.com with SMTP id w4so5128873wmi.4
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ecVyXGTpjSeHmyrkyCKmnLzm8v+cJhuUIAUxi3K0VWg=;
 b=Mnw7i+Ej+na9+TSeoDJXvM+TpHlQYZCVhmdDOPGjTKZQIPq+mL51pz+RVXvS4bgOJx
 do4LH3NOpYzeWTEGxI53hSVRrH2roK4goT6tAbsTDvtd/HIUBDtDLo/HP/88ts9WEU+k
 JDq8+1F4uFn4BkVpVwCiE/8KmKZ+1R5mx3u7T1waV3PbMl3+Y2ydi6blc01ubYh8Z3Ie
 mtjHvMpaXE5J3ZsBoFDQfL/g9CATPq+AxdTbdW/774/J7lnFwHmGxSx2aPZ5VQoV/Cmn
 OTlx2poJgJePlDHFY6Oa0BU8W13HIAgS5OVLmN2SOizsVwDNe5T/hgdaG8o3ZrYYfUPN
 tVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ecVyXGTpjSeHmyrkyCKmnLzm8v+cJhuUIAUxi3K0VWg=;
 b=pqDlTtcXNIH0OxwiQcbJteQBeB5LVrUSy2JeASFOoxzsyGI1/woIlK/lZdhikWepmw
 IU+MaWoj1pna6OLmcyi0mjDjJhB/iElxM5vOEA7VPtOzvl7+XaNqzLHpTCpq13aPOuRE
 lK+nBcbHyQ73eVDjsa3vTRi45PLaXqWkoQRHjIp12p2Wk0D+x28DlIV40uuGNLVb0Ml4
 qpO97JMmKx6r+VxYYTweE9ucrwi1NuOl1Ua2Yp8nonF5MmhhHBf98vSNgPywt8/fOOYZ
 9zFNpgPgGuaR46ZrF/VhIWSXRuppv9d18alhgR2PBFFtGJN6KRC4aqh0UOLCnnRp0ioT
 khHA==
X-Gm-Message-State: AOAM531H5pY2lU8TG/QmhhtVcHH6Jpo0u96whmWm3Z4kwlqOvmbZ33hv
 nu5l/Xm8CK3Kp2tOS456HkA=
X-Google-Smtp-Source: ABdhPJwMGz8i8w5wZybQiidZa3o5ak9ob6KyP122IFCVpOzh6rSxyv6zAu/YD0LmTACR52s2tVFwsA==
X-Received: by 2002:a05:600c:d9:: with SMTP id
 u25mr5693591wmm.49.1613690581155; 
 Thu, 18 Feb 2021 15:23:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k128sm4829107wmf.42.2021.02.18.15.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 15:23:00 -0800 (PST)
Subject: Re: [PATCH v4 13/71] tcg/tci: Merge extension operations
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0be8c29a-526a-66cd-c7fd-07cb8f0dfc78@amsat.org>
Date: Fri, 19 Feb 2021 00:22:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:19 PM, Richard Henderson wrote:
> This includes ext8s, ext8u, ext16s, ext16u.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 44 ++++++++------------------------------------
>  1 file changed, 8 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

