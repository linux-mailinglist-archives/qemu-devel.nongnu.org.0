Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9F6319283
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:51:42 +0100 (CET)
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAH42-0006Ix-1L
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAH1K-0005Fx-Qx
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:48:54 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:40477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAH1J-0000Xl-9t
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:48:54 -0500
Received: by mail-pl1-x632.google.com with SMTP id z7so3790647plk.7
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 10:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xliowJxQpXViGg6zwXnXRkog+M5AvhvFNx3ybmWkNtE=;
 b=g82vClW0Fie4+ZQ6O1tz/PBM5rEPAIi3SSX9ghrW+e3Hko29ONlvITgor15nAc3pIY
 mlFGiYD7CBVQQ5vXkpqTYj7GajAmq8CYG0hA555VTkOHXltohAJxJwCeK5ixaD7Pfav9
 M/7ZBrJH4z57I642uPPz2DzjNKmR+pFOQLkunhs6iVFucwFAJjNjIm7f6CS/eMrLXAK7
 qdD0dhmiUHi/fFUb4iaP5Tf0YD1UsxLkWSCu6rmoq4EHV/1ol6Av7IGeD3XDCxrSOP37
 lK7RNqWJkcjXf06VI9vvO8M/y3nEscLm/0Pbmj2ZxnIiI84HjpvYMNiTzav7aBpPlkXT
 scTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xliowJxQpXViGg6zwXnXRkog+M5AvhvFNx3ybmWkNtE=;
 b=OelflPQKO8Pn0soce+oScKL4rlnFNFeNfzw2x01FvySJuGQOelo8RFsWCFmi61qxq6
 CnEnYOrfCQw37Y2H9umjNNbFlSLfCBqMLQH8YXCyg+UrsF4s7bsTdEj3X3FfFguUVlEK
 Ooo/oOY/bNcp/tQuK7i2JrM3L6cUouOJ/qkaLeITld5ylMdQVGeqbx8l7pinyBfcpHJD
 nK/SU6x8ZOxdwoPJIFtq1YzZuxhrZUuUZD9PZyzu3+9+bOzupKbVcWTotY3oXWycNUMC
 NOMVd9NvOT3xmv+L3m4JSv630YpJ19W8+Uj5d2zZ0jPJzTvlhj052AQzmG6+17/8Os7V
 uU/w==
X-Gm-Message-State: AOAM533TO89/OSoCjvWABfjkdTWgXOfqV7C64x4R9oqGG/e5OfSslwef
 c1Zyn6RADZQ1gIltpWE4exhETQ==
X-Google-Smtp-Source: ABdhPJwpnWmrQpL0ewMvrkqVknVPFMO2MKpHrbLwbKP1ba4XVw1miaXGua2uEEQdcC+Wj8O3+xd+4g==
X-Received: by 2002:a17:902:ed8d:b029:e2:b3fb:ca95 with SMTP id
 e13-20020a170902ed8db02900e2b3fbca95mr8609653plj.17.1613069331949; 
 Thu, 11 Feb 2021 10:48:51 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 u142sm4907231pfc.37.2021.02.11.10.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 10:48:51 -0800 (PST)
Subject: Re: [PATCH v2 16/21] accel/tcg: actually cache our partial icount TB
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <437b3e96-da46-2e69-fda7-4fa24778b3a8@linaro.org>
Date: Thu, 11 Feb 2021 10:48:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210221053.18050-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.119,
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 2:10 PM, Alex Bennée wrote:
> When we exit a block under icount with instructions left to execute we
> might need a shorter than normal block to take us to the next
> deterministic event. Instead of creating a throwaway block on demand
> we use the existing compile flags mechanism to ensure we fetch (or
> compile and fetch) a block with exactly the number of instructions we
> need.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210209182749.31323-8-alex.bennee@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

