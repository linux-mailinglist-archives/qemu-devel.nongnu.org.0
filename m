Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA655355CE8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:31:58 +0200 (CEST)
Received: from localhost ([::1]:47308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTsMf-0005MR-TM
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTsLZ-0004w7-9r
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:30:49 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTsLR-0002rg-AA
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:30:48 -0400
Received: by mail-pl1-x62d.google.com with SMTP id e10so3787565pls.6
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 13:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V3iRlDr1rA6jSw+bVgc4dVXb1PNY8W+sGUWnALgi0Co=;
 b=fuqdTYWW7H4+//vYH8nONa3z579B5US49XtLyHGjSeCBDnxewUgitl3g/U5Xv70yO2
 iTTH15Qb0PA1FACn4eAvDAqVCOdKLiSLb1C53MMZmR2pJzLq0Nh3gZsiY2otvV7tMQgI
 KW7M/UoISQOwRBoJ/3Ar8WazFCtJ8u4Rc2tnq9Pdj4/uCDPTo+9mS3cFjM7Hrj0Ah8cY
 bvZEpHH+cGNSCegox7gvH8ugfB6nwMVwt6tXfS0Flwb6PHRHu9fefD7Gcf++iXZFjVKW
 B/kghd1E2MSimV9qw+mRf8HIA4kOcyNPy7ch+gi5HFH3tV9GFhWhjTZqNDWbZE0kvqBQ
 vQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V3iRlDr1rA6jSw+bVgc4dVXb1PNY8W+sGUWnALgi0Co=;
 b=hf4FVLF4en9nWVvqpKCEPk/tscPMeO6gBrKNQpDRJUVH+HGM7y+CKjUQFpjkjJWz9E
 CMdhiSNiRDiJnBqgMz0Q6pYe+X+iPieweOGFyJOwYiUmV1SGNQOB77sch6/xBM/AKQSV
 m8cG2svHHDXi9o6U8ZFtdykrOEfTBZGgNxS/YZNlcIyOvgK4qYVhKMuRcGZjUKtXwvVs
 oPnJXg7QBMoNZw3kNXS0tQKU7EGaqgGGePtp/s9VG11iPGYoj119hMO1Bk1N/QOqOR2O
 iaWs36PFdVG1BJwKVTXxZY8ZLVTJSjtITlc3aRUq1DpfNGfzcj6mXDcBq+NiJy4ZXs/O
 buNg==
X-Gm-Message-State: AOAM532+JgqOldrapzQd/c+cHoF51dnGqRC3oKGkMYPYAhFENLmv7Jgi
 svLw14PjeJRZKNl31NXpcGgl/Q==
X-Google-Smtp-Source: ABdhPJzEG9mqW5m4xVchAAz+1EkpsG7fPEB+iSmSEkatK7ZN8e60k/yBlLedFM3m0gJQCACkpaWF+w==
X-Received: by 2002:a17:902:748c:b029:e9:3d7e:7894 with SMTP id
 h12-20020a170902748cb02900e93d7e7894mr26412pll.51.1617741038771; 
 Tue, 06 Apr 2021 13:30:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id c128sm19103607pfc.76.2021.04.06.13.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 13:30:38 -0700 (PDT)
Subject: Re: [PATCH v2 12/21] Hexagon (target/hexagon) add F2_sfrecipa
 instruction
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-13-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f5ff51f-f232-c27d-e234-7aa5b09bd52e@linaro.org>
Date: Tue, 6 Apr 2021 13:30:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-13-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> +int arch_recip_lookup(int index)
> +{
> +    index &= 0x7f;
> +    const uint8_t roundrom[128] = {

static.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

