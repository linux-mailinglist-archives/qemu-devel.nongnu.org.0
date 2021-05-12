Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B137D430
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:22:36 +0200 (CEST)
Received: from localhost ([::1]:34122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgvNL-0005Cc-7R
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgurM-0006l3-Aa
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:49:34 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:38903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgurI-0006gF-6R
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:49:32 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so21637141oth.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YluWeJRgWFZw3gq/0rankOlgnBZOT9VWouGONBhX1ZI=;
 b=W6J7zB95M7MNUeRogI+JCA5EME1n4vslpvqeobTN97nr+E8DqCaykhHnZAj7hvLo2B
 FELlLKj3Rvj1ss873Y8Wm/qXXeTvHrYuftcGtqHqr4xcGW0aZQaAVpCWlEJ1uWT+ReRV
 m0Zo/AoHU93qW36r3CWXa7+O5dVNYtaN1Sm8qmKnZ5wEfhtoNJMd6kmpKnHje78UkbpE
 X4+kIh0zJc9hh+D3m93AB+LDmQnIMNFKiw8cB2/pZ/8rPDDeyqJg4pjTuELSjSgvX/5W
 guKwMNfWS8PUKxilLRjaPnLHEEv084Vd7CDvNE8pNXZ16X2B3SFcdlaXV3Go4ikBzCEt
 nKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YluWeJRgWFZw3gq/0rankOlgnBZOT9VWouGONBhX1ZI=;
 b=FTBk2eQxJkNGXaDZ+fSV9Txlk0Nha+R2asOFWCSOXHkEZC4pnyw9piLHNhihwi0AH4
 h3lv8Nl2IVO9RjPzBpGqd3FN8oaLsqVDNWlMXPFBSAgy54juPTBMKhCZ0iOE1esfr6mY
 pZWOsUkVR/O76N7s3rqkECSNtZhSd7aA5I6Ui9g4ipAOwKMCdDaqAUyLQqPsPR336pcK
 te0YlJu+C+elzlDcKJuUiD0hZ7aYU7TPjDddrUMJPm5wd8XuXBxPyh5i7PXfRENyaBNG
 V+eC6U6nfBMaUibfMqOfdG6EXo0fZHlUVBUodYKxc59GXQ6i6764xZd872eUkooDTnJ2
 dZOA==
X-Gm-Message-State: AOAM532k1PRuZIFvTFcZkDZr3jSVb6KTbssuSPjMzivMbnfJc8BWVEJJ
 pEO3/37otFWov2LcsH+PrM3sXw==
X-Google-Smtp-Source: ABdhPJxVgJ1+FSb0agm7E9/6uE7m7cu2IvwHBohdkTu4jutsVkCs0lieH2VUv0K8OPA6WNRGHyAuKA==
X-Received: by 2002:a9d:6c86:: with SMTP id c6mr13689322otr.9.1620848966689;
 Wed, 12 May 2021 12:49:26 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id l131sm181853oia.0.2021.05.12.12.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 12:49:26 -0700 (PDT)
Subject: Re: [PATCH v9 0/3] target/arm: add support for FEAT_TLBIRANGE and
 FEAT_TLBIOS
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210512182337.18563-1-rebecca@nuviainc.com>
 <875yzng318.fsf@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <d78ebe03-e10a-a080-9bb6-279e333c408b@nuviainc.com>
Date: Wed, 12 May 2021 13:49:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <875yzng318.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=rebecca@nuviainc.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:32 PM, Alex Bennée wrote:

> But it's needed right? It's perfectly fine to pull someone elses patch
> into your series if it's needed for the review. The alternative is to
> add a "Based-on" tag to your cover letter so it's easy to find the patch
> or series we need to apply before yours.
> 

Yes, it's needed. Sorry, I didn't realize there was an established 
process for this.

 From previous patches, I see the line should be:

Based-on: 20210508201640.1045808-1-richard.henderson@linaro.org


-- 
Rebecca Cran

