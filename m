Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2871F469A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 20:48:14 +0200 (CEST)
Received: from localhost ([::1]:41508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jijIC-0000VI-QP
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 14:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jijFp-0007ia-5x
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 14:45:45 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jijFc-0002Gn-Mo
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 14:45:44 -0400
Received: by mail-pf1-x443.google.com with SMTP id a127so10440997pfa.12
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 11:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qbtct+EQ4KokFgvJCOyoGOryBmvkopJsWFZLu1mOk14=;
 b=UputIKhIdLmaeYsibJT8kBX0/pEm6qHNFCQxyBCx6KcyFzHkZXEIo4inDN7jjQOAjS
 BFupJDhvgdIgazRPJNJHKP6jFja5AVx6HzAEwGU7B91oymF4zufqlWcxujN+n4kaYSfG
 BysjUZxhiZeT1420lPdAmm81yqT/u55hso/zX7VISogXpwkRsjSJYfb9orvbs9RIM1xT
 3PlHhGYQTXZOTlfW5q007pglxRXEymBdcaZpdhmJ4vOQuOQBkH0v9vwW0MRP8hACRwPm
 5yX2h0Cym0X91fnmNbiQ7J3IHUkvHBhRjVXMIuCEIdTY12JKHNjN1AGmrnVLiBB8cuyI
 PGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qbtct+EQ4KokFgvJCOyoGOryBmvkopJsWFZLu1mOk14=;
 b=NhEIUoabgDcSbcB2kPJjyEvDCZdMT6vZMrC3bZObeMMlQw3JB+0XqUEeOg9K+ICj27
 50hZeHezIS3gh/VjVlOvYYFGXytaqqlTN3wSwlkWOzrp93feuM9G7GL5NQ+vTwzS89OS
 Nxlsu8J4pmJXS46tF1iZgDKLAAvasd8mAd9iShyf+/J6kDGim1rixYN5LJ0Ls1O6hJQq
 oZzYtVrSbTf5JxlJmhF6o9Gvav7Do1CjZmTE2J6yv5cuc9Rqnv+Wiutl5BVfHu56C87v
 +DJ6BibQAYGFpfJ3/JUgTSyPfq4cTv39tHLtiJYw29GQRlT8LWlKBilm0VHHaV/zPu28
 V1RA==
X-Gm-Message-State: AOAM531S+8rHWdSMDa93SE18wYvAzBF7kJgJwDwvtx/siQzG+svMDxU6
 ThqXBkvLIgGXPpKtqP+/zYnEQcSKSAo=
X-Google-Smtp-Source: ABdhPJxTd3KFOqz5T9R+twHeR6JLv3hzoPUmhZuBnEd1VdT1VALqEk5WLDrstcY9Mj0miatqDnypcA==
X-Received: by 2002:a65:454c:: with SMTP id x12mr8308290pgr.313.1591728329852; 
 Tue, 09 Jun 2020 11:45:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d15sm10540797pfh.175.2020.06.09.11.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 11:45:29 -0700 (PDT)
Subject: Re: [PATCH 6/7] target/arm: Convert Neon 3-reg-diff saturating
 doubling multiplies
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200609160209.29960-1-peter.maydell@linaro.org>
 <20200609160209.29960-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7f35c6d-1608-e285-ee83-2e3df8bf221c@linaro.org>
Date: Tue, 9 Jun 2020 11:45:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609160209.29960-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/20 9:02 AM, Peter Maydell wrote:
> +static bool trans_VQDMULL_3d(DisasContext *s, arg_3diff *a)
> +{
> +    NeonGenTwoOpWidenFn *opfn[] = {

5 more static const.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

