Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B0F67414D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:53:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIa1o-00006k-8h; Thu, 19 Jan 2023 13:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIa1l-000068-P6
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:52:45 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIa1k-0005ax-5y
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:52:45 -0500
Received: by mail-pl1-x62f.google.com with SMTP id v23so3186323plo.1
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gbb/c1AND59VtYrc55X0gpXjoCBL6kNk4bfM57Wy6pY=;
 b=REE11CMAKQCUjfy/8ibJVI/dQKjF4KU9DAD2ADjholXyzfG1qlWOAwqi4jgR4qO8Ik
 tUHARdV4EM7FQsrgPqBf8th0Xch9Tx5az0AMfv0KsBUN/1sPzCIFJ8hcXKBc3KYple24
 Z4uDaDlx8ZbQG5AiwKBEX2RXh6hUFUGqU5XvHtsple5vrZMoRV+IbsMbLyFex+nC9hsA
 97V1xVfPVoH63MNW9vjgPW2G3PnoC0I6MCPlYXv/01IyMIekIBPnHtiU4KdI61yUJ4Us
 y5zrVd84Q7JLMallQbrs4VHCjnolei8icVZZXJ96u30u1Dc7q/9ye+uO8z/XBUaLs10K
 Kdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gbb/c1AND59VtYrc55X0gpXjoCBL6kNk4bfM57Wy6pY=;
 b=RX6nA+lH0AtOdz3l6JyMRcMuWnUgk+QTwZH/rhni9vzqJr1j6cYtsNOF2CL52jf2eL
 uOnCCdp8H6xTw+PrrzYJTTFH3UrnuhuiB8J5GfJ7FBLFXF8+U7IFGgtS0gG9xL1Hma4k
 JfoN9ykoIvfjuuWj8EYrheWV/G2ejBpuJcZmzaXe2zXUGwcqbi/OMsUzksKncbXHE1eG
 J9OcBMqRvktTSLpSDkgAahfBs5t97it0dlOnXc+hc/H/t8sha0HPl3djEf7CAKuB+pwr
 QJiVeo9ApuP6elKfY+xP6DW3QUvaSPTc2jyWG73x4GsGlzpqaPiouggqlhsQ24+tC98R
 fmAg==
X-Gm-Message-State: AFqh2krGy7EUeKf4E7WkqwGmnOXEZYk+AvD2jiRAFrA1b20zPiuR5W2T
 3DE+ql4n9Xsqo58o6Ckr04RFQw==
X-Google-Smtp-Source: AMrXdXs9CKqruJwCFSzEg6htBnpD2A+WMvTNl1MimfsQDtrkzvgJyJYLBoyN+uAfalvFrghwxPHuhA==
X-Received: by 2002:a17:902:7209:b0:194:73c4:6bdd with SMTP id
 ba9-20020a170902720900b0019473c46bddmr12313264plb.17.1674154361382; 
 Thu, 19 Jan 2023 10:52:41 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 b11-20020a170902650b00b00194cf9d5fbcsm1617968plk.167.2023.01.19.10.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 10:52:40 -0800 (PST)
Message-ID: <c98b7667-4233-5e62-0bde-751b53cbd24c@linaro.org>
Date: Thu, 19 Jan 2023 08:52:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 12/15] tests/tcg: Do not build/run TCG tests if TCG
 is disabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-13-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 03:54, Fabiano Rosas wrote:
> The tests under tests/tcg depend on the TCG accelerator. Do not build
> them if --disable-tcg was given in the configure line.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   configure | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Amusing that this wasn't found earlier.  But it does in fact give nonsense results for 
--disable-tcg on x86_64 host as well.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

