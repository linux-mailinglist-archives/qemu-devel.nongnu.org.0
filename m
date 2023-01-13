Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1575066A5C3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 23:15:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGSJR-0003WJ-Ew; Fri, 13 Jan 2023 17:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSJP-0003Vv-V1
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:14:11 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSJO-0005GS-BD
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:14:11 -0500
Received: by mail-pl1-x62c.google.com with SMTP id d3so24779717plr.10
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 14:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xuxz0pZIsP/uegBmwm+wHH1XfTE16OnsFkltkhaXl+s=;
 b=kZKmPU4HbUYXeim7HNsNP5/zy+rx/BJEEU78sItn4qr2D3VFK5vDG9HeScs4VZkzeE
 dl/cMjLNqG2sYMr0N7Mz+IuIIEAanwgE7+ld1IaDd+ydpstOPxD8DlIbipSXVA2GaUds
 OWV+nYXqXxHStUW3W/hiDMzlQbgGasEDGW6NOT2dkUrjmVrf96TZoRpx1M9QyN3bRhaG
 veZR9lFh1qDEgmPz72PjixWAn3x9WDHj1M+a56d/gqf0x1ybyGGqfcWW/97kcs9KDcW0
 H9orSVulqWTOKOAi/iTFo4uutoakEWBV7C+HRWbPYQ59cGnQWBS6oy7cyreTGIHX3vuN
 cUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xuxz0pZIsP/uegBmwm+wHH1XfTE16OnsFkltkhaXl+s=;
 b=ce0epp8cEPQ6gg2QkUqVCVV/51YhAdyQR1QP4QDrlApEfxa0flrSUmHqZQbFvdSysU
 FprocBwrakHQYmZSwgmps6zNHY57BSeLsrcM8bwmeBxwZyO+TeFBJzelU65/L+zxh5JL
 XBg1qIRWyBNklAboUpt8dzNmnWKRJxaNlwOTAkaN0hRe2CYi3e1cbO63VazXvN2iaY30
 UoFFa2WaTDgUCCF0mME9B1WYRLLHbV7lie/78f7Rk4ZuLP9LhrHIwfmw5islhM/0Kjbt
 cRJ+WEvLpmpTyQ7b8SVYesb+ZzrOu16Ynn+BzjluQ4SaFJ6dRQIhqGfKyk4wuv7wotVz
 Ip0Q==
X-Gm-Message-State: AFqh2koD3Yg4VMeIwIHnjnN6HfsPx5mwPbfD4RzAJ5YvrNIzOqm/0Zi1
 /wzdQWMi+U5ii5PzBEvHoTrBTA==
X-Google-Smtp-Source: AMrXdXvtveUUiLKDToWdfyOGq2oZJhBQgzNgbtOhJT/PXg7X58ACRy2g4hTxuEJcFt8kDuo2Iz4dbQ==
X-Received: by 2002:a17:902:9b97:b0:193:b58:2b0c with SMTP id
 y23-20020a1709029b9700b001930b582b0cmr22567263plp.23.1673648049048; 
 Fri, 13 Jan 2023 14:14:09 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 q3-20020a17090311c300b0018c990ce7fesm14671185plh.239.2023.01.13.14.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 14:14:08 -0800 (PST)
Message-ID: <aa023bef-2cc6-3738-6c00-a1260b919fc3@linaro.org>
Date: Fri, 13 Jan 2023 12:14:04 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 24/28] tests/avocado: Skip tests that require a
 missing accelerator
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-25-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-25-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 1/13/23 06:04, Fabiano Rosas wrote:
> If a test was tagged with the "accel" tag and the specified
> accelerator it not present in the qemu binary, cancel the test.
> 
> We can now write tests without explicit calls to require_accelerator,
> just the tag is enough.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

