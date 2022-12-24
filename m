Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33887655AE2
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 18:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98lJ-0002eH-N6; Sat, 24 Dec 2022 12:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98lI-0002cc-1Z
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:56:44 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98lG-0007fr-LA
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:56:43 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c9so242447pfj.5
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 09:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JV9HYPV/epsDfSS1VcOwJQWQBXGtNbjw/Ej6s1/DAQY=;
 b=cSKiS+a83Io2TlL7vdEKGHofZw6vUZUUPL3DbXtgtOqaDgUahdPwHATFK7Tn9Xel4c
 3gNGBHSZ/IpNtPwxLYDK96RyZYlnl0vGc29D47mZzn/a63nVoqam7L9uhThlMqrsHFF+
 16HTcYWyf+n/7FXhrLQKdwGFP7Hml4wAo12cLVOFJKO0sYbfq8f+fmu8FW6aL903ZIHL
 tZcH9fGg1Ta0oMP3kQrx5MMJdlhTl1nyMXz6bVJg3pYiVVOYGL9SdkdSkKxyIs86qva0
 /6dHwnX5vxtvu3zo/0QF/5fiYS4UQL3br/w/oSk6IfE4/PmvGkAN3g4GO9r9L99GQQOD
 UGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JV9HYPV/epsDfSS1VcOwJQWQBXGtNbjw/Ej6s1/DAQY=;
 b=4FGLFgOGoWmC+sYhbo7GTsBFrwp+N75IqMh2pE1xFXWzEVC5pBhskw24EbUsgQYcoL
 oCOhOldI4Tad/A7RDWKbSF+Zh/4Dj2eiMMI5BQhkVHTukyIkyOlckq24jkJB4dF17Hpq
 A/c1nYNJtxnbwqFoE66tDNnoo4BfqHJpdQPv9UkeCkGnbpThGz8xRb69X+nBL9Wx3QRM
 0wXX7gU6qyls8g/TP8G4HIe3Lkc4ebSBsxeA3mO3GGoT7oRRMWGLaf0opJwUU97GmP/s
 qD47W/o+vgj3+5pOpZnu0KPaWrvWZetWZKhlUTq+5/t172Ux37XSnP629gxQ1QmF5sxc
 NWuA==
X-Gm-Message-State: AFqh2kqz6ez8fLy4RG9uspjZKhtY8Nb1m6cSdjvkA+NVB8IewLbYH/6j
 KtzH76GyHFuOAG6LqA511vxZuw==
X-Google-Smtp-Source: AMrXdXshO5tI3oq1JNlE1PUVgX+9fwNX6VImSbsbX5Zy7o58kb0quQZMNJ0PNFEA4Omwk2tQ3KAvIg==
X-Received: by 2002:a62:1550:0:b0:576:f02e:d0ef with SMTP id
 77-20020a621550000000b00576f02ed0efmr16386192pfv.4.1671904601096; 
 Sat, 24 Dec 2022 09:56:41 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 r29-20020aa79edd000000b005764a143be3sm4359829pfq.103.2022.12.24.09.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 09:56:40 -0800 (PST)
Message-ID: <b03502bd-f71f-addd-e574-d02418c24446@linaro.org>
Date: Sat, 24 Dec 2022 09:56:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 13/43] target/loongarch: Implement vadda
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-14-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-14-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:16, Song Gao wrote:
> +TRANS(vadda_b, gen_vvv, gen_helper_vadda_b)
> +TRANS(vadda_h, gen_vvv, gen_helper_vadda_h)
> +TRANS(vadda_w, gen_vvv, gen_helper_vadda_w)
> +TRANS(vadda_d, gen_vvv, gen_helper_vadda_d)

These can be implemented with abs + add.


r~

