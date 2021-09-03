Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBF1400755
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:13:56 +0200 (CEST)
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGVX-0001nx-VI
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMGTw-0007Wj-V4
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:12:17 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMGTt-0001aS-At
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:12:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q14so487192wrp.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 14:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GdDA6MxFGVSUTkeK52CHpe7SqeTujh6NGjzSvPioDWk=;
 b=bpXmTL2aGyBDKXUcCq1DSvlAPrTeR8qlIvM4nBdbQwLlZKPL0OmChmXRrwwqgQx+lv
 LJhZvFDLHfmCtd0eGNWDpRoQLiYrUYTfJN05e57110gwXb4ZcLrZ1XfARby+6I7kX4zL
 PEkID0d/byeDH01x8IwIte4CnZD8gDCWf9HRNI7g5gvmsGwUugnxt78W87tJAs//kqmV
 nEhWVg0+kDYvBdVcdGwf21xgVJxregYk56IYiMpr6qcJt1XfZwFbKiYa78STXQwlx95o
 jSb1RxfcF6xasArA4EqziaA76dhklsj4dVJJ1k6BBGypgyKj1ulDINm9m51MUcXl6Ozc
 9f8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GdDA6MxFGVSUTkeK52CHpe7SqeTujh6NGjzSvPioDWk=;
 b=adkYQdUMlKbELuiTMxaKgv/hUVN/0ptjgvcU37LBZEYZeihDMA0O+QjjgDR2FXG2jB
 JfNYDjWoN1ni3AfxadkuMmaIXMQjx/KQ1nidksX0+4cj+6GuQa/hBz9u4R60eMvHsJoS
 vMsFKxI4hQhF750Pi0WvwrYlmWweemX+O0UA1lX7PRwz8B6PMzY1uy8S262MBRzYVVDO
 XJ2xF3UYxuDlZ+heMnSHa8SkfcrlB9jdSHfOK2Syl3d5nqSoxo4JEkAZtbW3alJgiGjK
 fHutDh5xBOFpiMJkUknZGOv/yQDPYHIkc82C4bWsSy6Ly+mIMPmIZfhfgsUfWIS5kXSD
 n28g==
X-Gm-Message-State: AOAM531uVyUC9OZMVaZyOn6Kj+JNbZJnuXMtgpFpYCHSEN3WK244qAR3
 Bk3gWf3dU8ImT526EGZPHhMT6g==
X-Google-Smtp-Source: ABdhPJyTfujJIlCT9r9rbl9FWjTC1s8Jfo/joQRAre0dWajLhDaK/compIWW7EkCzgqCb76mRMqESQ==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr1010295wri.62.1630703531920; 
 Fri, 03 Sep 2021 14:12:11 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id r15sm499117wmh.27.2021.09.03.14.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 14:12:11 -0700 (PDT)
Subject: Re: [PATCH v2 10/19] host-utils: Introduce mulu128
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-11-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <651bcc3e-1381-e886-f6dc-3e7673b50eeb@linaro.org>
Date: Fri, 3 Sep 2021 23:12:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831164007.297781-11-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 6:39 PM, Luis Pires wrote:
> +    *phigh = ahi + blo;
> +
> +    return (bhi > 0) || (*phigh < ahi);

     return add64_overflow(ahi, blo, phigh) || bhi != 0

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

