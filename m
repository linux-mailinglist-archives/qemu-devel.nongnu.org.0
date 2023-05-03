Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748BF6F5625
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:27:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9i9-0000jk-4L; Wed, 03 May 2023 06:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9i4-0000Ze-SJ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:27:45 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9i2-0002tK-WA
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:27:44 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30644c18072so268142f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109660; x=1685701660;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ge824/832jY9l3Nqt5ngumFb6XP1AS+MioUnps7SYY=;
 b=x+7hrjNXwwFhsIHfuAImxmIUSvdWGQYQwnNN4L9a99kh9x6sRx/jZp3zZsb20SfYIk
 7wG2AuIZP/Sn66ZKc4XX5rmSETgfiqbmgjIGgPzXZlprw7nBf3yBU1DTzlrruR5edgzY
 WHSruhiPXZ0FdSHYR69JNOMGnA0YYv3lEG6CLKmk+DfEq8G/IBcZegkzFnzxgIBVgYHV
 lfuTbPBsBRKKJuU09lz6MxP5+qGVNLmthrAyDbm6c6+Et2NuZSDdwVHDOfsDbcXhigHd
 xbNpeQsj9kt5o+cbsivWtKig5Zzfs0z+VWZIFBxWplTHR6mZyp8Y6EfNL5gO4P6zxWth
 /y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109660; x=1685701660;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ge824/832jY9l3Nqt5ngumFb6XP1AS+MioUnps7SYY=;
 b=kHFs+ijSfQa0h3RULuLVqslt7mhgI5YCbHuRdDcQf/AjxU8t8JC7rnPfmZxe4keLjd
 h+tMc34i+TdRpHatP6520shct2Dq63SbIoUB+me3CSytkvl6/OXq87y00DN77YCTQy4i
 IgHj3B+woDSAJ0rAqBc9rq1Jf0FQB/QBz9T8ge5WXxYtT1KVpmQ07R8kPia5ryRc70qY
 5jznPUwK3C9OTScxK89nvCfq/Y6bg4iAann5RArK+2c/YO8WZsgzXoqmBJMTcL3tb5rk
 TfqNydm+c8ijV7l6jaPMlKyACRzXHetmo8w32XIqMmtXkO8WGFLbV2iCa5bEAopA06Fx
 yveg==
X-Gm-Message-State: AC+VfDywtQOP+xdt9cDiZAoPBbnDqaga7guyPfWQZc39aE/5XCMlQC+1
 a7lR45aLXraCZPHg+ZaW1GQxEg==
X-Google-Smtp-Source: ACHHUZ5lRrIbUFhw/6yFh+Ob8HXV3uVmzUvJo3vSLgflJa2l/U7RFK4gV+IE3AUzwdIpaEl9FC1eSw==
X-Received: by 2002:adf:dd0c:0:b0:306:4438:17f6 with SMTP id
 a12-20020adfdd0c000000b00306443817f6mr963742wrm.40.1683109660630; 
 Wed, 03 May 2023 03:27:40 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f28de9f73bsm33414134wrp.55.2023.05.03.03.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:27:40 -0700 (PDT)
Message-ID: <bfab901d-0185-95c1-bbcc-6eccaf0dcdeb@linaro.org>
Date: Wed, 3 May 2023 11:27:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 14/22] hw/loongarch: add VIRTIO as a dependency for
 LOONGARCH_VIRT
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/3/23 10:12, Alex Bennée wrote:
> These are needed for board creation so fail under "make check" with a
> --without-default-devices build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/loongarch/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

