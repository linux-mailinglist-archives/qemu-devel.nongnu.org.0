Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C7D3649CC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 20:28:21 +0200 (CEST)
Received: from localhost ([::1]:57356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYYdA-0007ek-Vp
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 14:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYYZb-0006WQ-BJ
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:24:39 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYYZZ-0003nZ-Si
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:24:39 -0400
Received: by mail-pg1-x52b.google.com with SMTP id p2so9391079pgh.4
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P9JcEs8oySBw5uinY7JwsMWOr1xj+luiYwH7dH9G1q4=;
 b=zroldLjJk7lpmkbl7J3Wo0vJq7CFxwx9S71EfTF5gyegbJZGrvLA+h4lWdPJc50NAw
 QbUh/IgpkQcY8FOJeBdiVR/pzO3f16KyV2r7uZQKmAckceR4gzw0Dzu2SRiQPtQM8AN/
 hEVl7uGk83+R0yqJSAWpYgXPFH1CTI8/mrLuKWRZmPf3O4xQBdsp7de8EQUkhIOhxwlx
 PylWFXvUai/9JDaGthF4LhjxhEtmdH63c0lnU3ue7ukdHBZCNqAS5s3Yr9Na1X1OqA2V
 +G/cIU+RBz8vpo13O6IrpmmQrkzxs60PuyoqdYJoEZvHbkC0dSoWy2zRnCsn74aidOQl
 ohZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P9JcEs8oySBw5uinY7JwsMWOr1xj+luiYwH7dH9G1q4=;
 b=HiDJ1DfiOEWWmFo1IcERxQEmEMghZPmpdiWK30iA/whBgAZw8WiEZj64itjlHeuJEB
 g5MFb7a5/21ho5Hus/cdLKoQXGPsA8sGd/92XzTg9JaT9rmS1+dPOjkGph9r047iRvdY
 rOBbuw713VA4swMNRHFq2/5gR4Ibja2DeKSOz+9pstLvEZ/NzAhpHqCW6OVfh3EiCUr7
 yfWttRLcN23fhvrz7xDqirYryz+nQMoNjbbWpm1aXxFO2fsSUU3UhVqWUj3D2zL1ItUs
 gFJh6FGaXyY//ilmpT49V7u4ttu+MBJTu/JDuibbqRTo1KZRT4s6eNbDkbO4NP5DtSEx
 KLvA==
X-Gm-Message-State: AOAM531nRHCvxY4/O725ZF2Y2qqHXurdJo8c9MSZyO7gqZVco5za0sZS
 g3uDm4QsEsfC/JEdkhwdn++27Q==
X-Google-Smtp-Source: ABdhPJw67hrqLUVziZ0eH3KoNPQLMbH6wxwxbEFVgLolB/jKfnqOMhcJldDqmbBWENtSgjggo7kSXw==
X-Received: by 2002:a05:6a00:1687:b029:253:f417:4dba with SMTP id
 k7-20020a056a001687b0290253f4174dbamr21097696pfc.5.1618856676134; 
 Mon, 19 Apr 2021 11:24:36 -0700 (PDT)
Received: from [192.168.64.62] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id p126sm12726888pfb.32.2021.04.19.11.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 11:24:35 -0700 (PDT)
Subject: Re: [PATCH v4 06/30] target/arm: Move mode specific TB flags to
 tb->cs_base
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-7-richard.henderson@linaro.org>
 <CAFEAcA_fXNEJXKAnktMuZTRGngToaGqL6QQHk592VJzjRrnstQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b492c7ae-65d3-8763-42a4-6f91c4b5d435@linaro.org>
Date: Mon, 19 Apr 2021 11:24:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_fXNEJXKAnktMuZTRGngToaGqL6QQHk592VJzjRrnstQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 10:08 AM, Peter Maydell wrote:
> Don't you also need to make assert_hflags_rebuild_correctly()
> check flags2 now ?

Oops, yes.  Thanks.


r~

