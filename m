Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855C56F12BC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 09:47:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psIoB-0001SS-Vb; Fri, 28 Apr 2023 03:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psInn-0001Ri-Ja
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 03:45:59 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psInl-00053e-BI
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 03:45:58 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so1816137766b.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 00:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682667955; x=1685259955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9+3Y/1h9lEs1HleW94zteSaZCO8L6luldy64B9AYTpM=;
 b=byDizdONfpo3dmZy/geATRaH7m6rumXCCS+989aN4pK5TO9I1o3Tzf317syL+FMees
 OXaDqIjoK+ARptNWt0LFJ2o2inaoTb0w/xq/D5Be6fP/XqjySOVb2tB1XjK4QlNre2eW
 Gk/rpIKrOLLBgk1uMojGBBWSGPzJ0qKrpfX4qOdCyp/PE/tnqTmAuKqcSWErF+Y74gGz
 BIxkowcAsT+zRa0tuNfJVlzhSGRlG7hzGuIpep1+IxQiQBXbBC+HoCiuklwmhLFRNSB+
 2tzyq5Obq5d3AxdQ6CAZXMZME/oOGnTjBTwHJLPpDTfujQ0IB/LhuuRgTX8lJT9Fy9jI
 kndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682667955; x=1685259955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9+3Y/1h9lEs1HleW94zteSaZCO8L6luldy64B9AYTpM=;
 b=M1VBbQBJUf9dzoXKccvVAgx+YYjbRADSec1LE0ThD0WPSDcX9jLAxSV2lbWUoJ59PD
 EuGrnGP3SRcNz2Cr2EMt94L36e9OOJEQKMNjujSsqESnwLiHTvRBuio1Px3sq83UFiDN
 5fhbSB87Cg8UNDGno06CXPkaT0DIEsCfRf5U5R5ziOb4aLN0AoEH05GlJtk45ahJT+Me
 nv1LhVHY7Jx1Izd0P9i6pAN88K7Rykl0A2D7u87AQmsn4e2w+aTF4OH5ZAidJCE9a4XG
 0X84xZ5Q/hvtfyWqZvmSPU0cYQyaRVlA0fhJzN4GZLung1YPEatyyJb05UlpQgPZDx8H
 CEkg==
X-Gm-Message-State: AC+VfDyv9pmeFHU1Z/79ULthSA4Cn42+et3zoIRqliTyct2Atam06dT7
 EmJlhcfjDryUWjVRbYz7SLE3bQ==
X-Google-Smtp-Source: ACHHUZ6XhXserF5kiJqQGZNrjPILoiCfbvjAUX8kEOmR9ovwxbvvcN02Ik+SYowW0QRSmkgHDEAoMQ==
X-Received: by 2002:a17:906:ef0d:b0:959:266b:dea8 with SMTP id
 f13-20020a170906ef0d00b00959266bdea8mr3873768ejs.2.1682667955023; 
 Fri, 28 Apr 2023 00:45:55 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a1709063ad000b0094f71500bfesm10732000ejd.4.2023.04.28.00.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 00:45:54 -0700 (PDT)
Message-ID: <fa2ae98d-4113-b204-7e12-9490b5765b4d@linaro.org>
Date: Fri, 28 Apr 2023 08:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 06/13] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-7-farosas@suse.de>
 <c2853e95-2aec-246a-5846-d91d40329c61@linaro.org> <87a5ytpirj.fsf@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87a5ytpirj.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x633.google.com
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

On 4/27/23 14:16, Fabiano Rosas wrote:
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 4/26/23 19:00, Fabiano Rosas wrote:
>>> We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
>>> query-cpu-model-expansion test to check against the cortex-a7, which
>>> is already under CONFIG_TCG. That allows the next patch to contain
>>> only code movement.
>>>
>>> While here add comments clarifying what we're testing.
>>>
>>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>>> Suggested-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>>> ---
>>>    tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
>>>    1 file changed, 17 insertions(+), 3 deletions(-)
>>
>> I don't see why you're changing the cpu model here.
>> Neither cpu will work, of course, but why change?
>>
> 
> Because there's already a patch in master that puts the cortex-a7 under
> CONFIG_TCG, so I can have the whole if/else in this patch.
> 
> If I keep the cortex-a15, this change needs to go into the next patch
> ("move cpu_tcg to tcg/cpu32.c") which moves the rest of the 32bit cpus,
> which was supposed to be only code movement.

Well, I still think the change to a7 is wrong.
If the two patches need to be merged to break bisection,
then so be it -- just mention that fact in the commit message.

Peter, do you agree?


r~

