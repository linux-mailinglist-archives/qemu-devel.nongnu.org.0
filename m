Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5345B798
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:39:19 +0100 (CET)
Received: from localhost ([::1]:35920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpokJ-0002Mk-1Y
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:39:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpocR-00017c-RY
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:31:11 -0500
Received: from [2a00:1450:4864:20::434] (port=40531
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpocN-00070u-Ug
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:31:11 -0500
Received: by mail-wr1-x434.google.com with SMTP id r8so2989972wra.7
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YR8V9SIxCgQd61YTfechf7/N+/1cR167y16NRbVKyrA=;
 b=XH3fOIRiGPba+CT/WAxMywlbxl5vrx75kAYsdiSFt8oQNzN8cW7p6BbfejE+Df74VQ
 LKTGaHvhuVfkvHeDeLV2ptm24zzxek+19WO4BU9zsHGeO8W6xyQi193WQFpb2+r8nFWN
 GtDegJeJ2X5VJRadhu7gdsRePOmAvgTInNzQi0YSll9h9XG5+PUmImDQTlshBTqZUFP3
 67JECPi2Ij9AGjy0ONb5APvs47c/qv9waBRgz2+F888nGyM9tKk1dnpOgCRC8R6s1Iky
 yIat6qk0w8C4Icb+IUoJho3ypGTLwwcbkCL9PIZFI2nMuGnTs9KkAMt8FNwuzlmDU958
 C9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YR8V9SIxCgQd61YTfechf7/N+/1cR167y16NRbVKyrA=;
 b=dVp0GqP+7AYwZ2C4UnX0NEnn2r+6j0ogmt/k5CL70WQzioZtfGTwyHRlWGTVmIy8w7
 mF6GXz2E2H4C1hSSXhwmMPtfeIuPBykAPSXb7AkfC+K78z8GYzIdF3SCNCP1z2S5RxHs
 Lvw7LYx/+XuJegbT9xeTJA2KyqUTT4YwrpVi3IzppWhZ05A0P5mKaUb1HlVPdA1aIlKB
 +R/vW6YG9+HRGZ70hY2rrAl0AiDHcsjtzJNCX+yRrfwQA6coIGjpHLXiq6XKjd2lYAhi
 cqb6hTB2ZsZMIh5mBOwBZfR0aLQqAjb6XTNyBnccWu10VNINCqDvNGt+0ovJ23ou9Ezj
 eEMQ==
X-Gm-Message-State: AOAM531k0baMP4ehiAxw+ORSs35TPMzhtAq0UA8hsGIPMhFypX5D1ytE
 24EGRswwW8GTZayTuyuAQvQ7KQ==
X-Google-Smtp-Source: ABdhPJwjLvqBchP9wSVxIK6cISxbMUb8BaKsGHbAGzSs+TMllrEfJ0te0npHS7Lupg1cfs7IUTLK5A==
X-Received: by 2002:a5d:5646:: with SMTP id j6mr16754865wrw.401.1637746245618; 
 Wed, 24 Nov 2021 01:30:45 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id r17sm4753580wmq.5.2021.11.24.01.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 01:30:45 -0800 (PST)
Subject: Re: [PATCH v1 3/7] tests/avocado: fix tcg_plugin mem access count test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
 <20211123205729.2205806-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30d54f2f-5b62-02f3-5da7-76c08d0b9352@linaro.org>
Date: Wed, 24 Nov 2021 10:30:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123205729.2205806-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 9:57 PM, Alex Bennée wrote:
> When we cleaned up argument handling the test was missed.
> 
> Fixes: 5ae589faad ("tests/plugins/mem: introduce "track" arg and make args not positional")
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/avocado/tcg_plugins.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

