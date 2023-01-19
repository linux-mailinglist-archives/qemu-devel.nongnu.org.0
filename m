Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB47674118
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:38:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZna-0001kI-0x; Thu, 19 Jan 2023 13:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZnV-0001jX-UV
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:38:01 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZnU-0007i6-DD
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:38:01 -0500
Received: by mail-pl1-x634.google.com with SMTP id k13so3181825plg.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DA30NIUbSztFAPQjn+IaTD7qGQLihvGVlL7G9QKj10s=;
 b=dY6FYiDQYuld4JiXknhrWZLSrTBokfvw481xd3e1mpjDtuccDmeSuMrJfUfDP1OleV
 qGNVT31zquYwDghaqoHcxQxwgDvpClFKBk0+oXmpH9mrFMklhU/JJIuLj63Cu3Sx+/Up
 wyFgxS3uQtPSKfyQ6E4Mp0tEwOXTUvVfZbaF6DRpjRqu1TTJOIbTmiR60YJVi1IkPdyT
 HOEJCJr8Df56cEWIjNzOg62YkNijBtMIg+Szf9r67RVEkzXwdQzTu0Hof+ALX+oEAbd0
 JzAs+5Mu0m120oa13oRjCOAGaX86GL0VOkEXSDEskqtC46iAcow8VQ0UMY/+A2fZ4YFe
 eyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DA30NIUbSztFAPQjn+IaTD7qGQLihvGVlL7G9QKj10s=;
 b=Uv0TJlQKK3HC8oI3UjOXsrta2CuvueXpZwbzNuMzho5V/mZoX0ARZ9qM7w9fU4MLaQ
 gDyIBUH9lz36A1vS5g7GYm7vfyr31KQYKrVRd4LWEx221Z53xjMqAKVni8H2qSMEbvZo
 ooR09SZr5LVxVUpaNdB8fClqdv2M7WNZjzU9rTi+s3qNDEmR3bijhrZNqv1/V/cw2QHg
 BHsnzs8MCANXlO/6CEZjksHTL+TLQlAyOGqQeCtctP4UIQEnFNLT+DtJJy8MX4QH1I13
 wTImHvSGBREjuZqx7Z7NFkf95Ya0h79+6AtRvzyLISNVmjMjIkEAcv/9Vn2/RlwDU6GC
 IJkw==
X-Gm-Message-State: AFqh2kpEXD/KSlcXBnbJQhPj/M9d1fQsFPmQYizfmI3jsPLkPpWGuu2i
 herHHgTMvXo0V3zKEy+c65elkw==
X-Google-Smtp-Source: AMrXdXuHyaoEaDMCXQivcBEU/uOCzASte9ezQqT5F843HOgp3pfSfRrPupxDkj02kGVrBpcOe4/rHw==
X-Received: by 2002:a17:902:778c:b0:194:7a99:d5e2 with SMTP id
 o12-20020a170902778c00b001947a99d5e2mr11696173pll.62.1674153478944; 
 Thu, 19 Jan 2023 10:37:58 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b0019327f40bfasm22642329plw.119.2023.01.19.10.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 10:37:58 -0800 (PST)
Message-ID: <b49d7759-a8df-bfbc-7568-afb7f6141e02@linaro.org>
Date: Thu, 19 Jan 2023 08:37:54 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 04/15] tests/qtest: arm-cpu-features: Match tests
 to required accelerators
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-5-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/qtest/arm-cpu-features.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

