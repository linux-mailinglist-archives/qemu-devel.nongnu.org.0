Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF55E1FBDDC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 20:19:49 +0200 (CEST)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlGBY-0001ox-9L
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 14:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlGAb-0001H2-2g
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 14:18:49 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlGAZ-0003Lu-GO
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 14:18:48 -0400
Received: by mail-pl1-x644.google.com with SMTP id n9so8757411plk.1
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ixv0qVVSKgtQHXUSiBt5c9qUuMecZtLrd9j1SkGWHU4=;
 b=QT52wECj2VluwLSeXHUqf23yIvH1HsUaCqvTSTAQJu8AYv/MJ2/Xnx53lXhgw3W8Rf
 2iGWrEzRzabvSNB0uvo3T6sLUR5VcCww/x37RRdOjprUY32oi/QM4FeH/ZTGSGYS4bPw
 gdX8HqsVpxiU0V5OUVvw1rsZ/bf+QZoLnUDGd4Myw83/rRlHlrXDhdENA0NnAAW/Riw6
 fxxTiFRnfQw6pdwG5GdbeHrYvAo+Yy4JAzzXKxj63kIBvWHVLm1r1tiWx52r7Q5I0hg6
 KiALemtXG4MrH5BxKt0k1xOMet1Urs11vD7jLvhplhJS6kAyTg58cR7RyADiyYpMEuHj
 MrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ixv0qVVSKgtQHXUSiBt5c9qUuMecZtLrd9j1SkGWHU4=;
 b=E4Ua2UhoaVl5GVu+yrvalvyk2xcJTBIb8feT+DUye6iIsyDmH5wWwc0Fswy8tVeSee
 UNOcrt6+sxS4nLa3Qn/iQJ41WRZ3dqtsG1o0HDizYqSxqYGjtan+bLlU3bCz3DDT30cu
 K+iuMdNZotReI3JOapDcGrlU2MaWQx1fBktv0HKLCnNo2nw8totWtaPezK87r87hvXsG
 WR1Spp8ps9JcGOu1IQcqR3SoOv6g4pjxwu7uYmbcHRnraKSr1CdiDUpyyCpFfcegGi1N
 vUkX6IBtjkwq+AGK19H9dhS40K13RyHjrXltEW9MK15SmIQO//RBw2glC2HzhB6hJcTg
 1Aow==
X-Gm-Message-State: AOAM531J/1GwMqS6VhaRTdm1SFlA+Y0Kyz82rQEH7IuQnPUm2FG647uT
 0ZOUwzBfgf6TdFTnDLNAmY40xw==
X-Google-Smtp-Source: ABdhPJxVtgQJuBo24Bqrx0nnozPb24W4nSFlyek56aTG8Oeo17T+r+QY+jRkuXQMbjS5qC9Ii1ytsw==
X-Received: by 2002:a17:90a:32ee:: with SMTP id
 l101mr4263446pjb.213.1592331525708; 
 Tue, 16 Jun 2020 11:18:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id b11sm17810745pfr.58.2020.06.16.11.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 11:18:45 -0700 (PDT)
Subject: Re: [PATCH RFC v2] target/arm: Implement SVE2 TBL, TBX
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200428144352.9275-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7412e55-f2d6-eb01-d95c-26b8dfb194d9@linaro.org>
Date: Tue, 16 Jun 2020 11:18:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200428144352.9275-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/20 7:43 AM, Stephen Long wrote:
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> ---
>  target/arm/helper-sve.h    | 10 ++++++
>  target/arm/internals.h     | 12 +++++++
>  target/arm/sve.decode      |  5 +++
>  target/arm/sve_helper.c    | 71 ++++++++++++++++++++++++++++++++++----
>  target/arm/translate-sve.c | 20 +++++++++++
>  5 files changed, 112 insertions(+), 6 deletions(-)

I've rearranged the macros in sve_helper.c a little and queued.


r~

