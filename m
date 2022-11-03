Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7B0618A96
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 22:32:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqhoS-0007nB-BP; Thu, 03 Nov 2022 17:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqhoO-0007ml-PZ
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:31:44 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqhoM-0007hc-6Y
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:31:44 -0400
Received: by mail-pf1-x42d.google.com with SMTP id q9so2827995pfg.5
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 14:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FWr6fk4ToKf25ek7WyHQ/HokEXMF2FGDoUM9E18DSoY=;
 b=nFs8GNhSI1ywimhFzNWlYsjV/oqELGeax7cn4J+G0MvTxIxdOdFYGejKWcIdaCKgGw
 MOYABN+SrTgprkSfQFfsvMIR2lGChHxi48dbkJjRoIgy1rF8wpxnNScShpRfGOFzRzkG
 WgzzetcIi3dVppcJadHn7jVqjMSDeLiSouZAeiSYvPoJuL7915YKQfGwFSp3Iuc+umXO
 5TAmiC3oBTxLrMuP+0DuQEmPoiKnigIrXjYzPpQfu+H+Q3cRNIHk9wkaSjIr4jCXbAcP
 J7hrGcGNkFwo/FwANOuGeeA0wlwrPPXYRvfA22o5NDqlJsWheOeWsX6XSMrBPEC9VyZb
 pTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FWr6fk4ToKf25ek7WyHQ/HokEXMF2FGDoUM9E18DSoY=;
 b=jvQcNa4mVQERy9Ql7zffjsYfl/sDlq3hsU+ewnRr6iZv2i/DFLzOHN6bWQd+0DwZIj
 Fwu5TrcnIdESIOK7J6ThJHEyX9z1NWsNpPi2eu/rWbSexbv+efZ3H2/3VDitFK0qmNcz
 N0FRBXTsQVV/Ti7y4QGV5ups3B6x8x2yr6m3bG8BdKHQTvV6sp6+3BIs0onZMbhJ76I2
 kR0qsxY8JNjO9NO3f4zg4noOWm0SHNhDEXABPca5/5wgCfJoG4tDAx/HhXORBIPXTmIo
 8RzTSsfrEVAPqQkEce838qCmxPbOELmxLgpO6zt1sWdNX/N1BVOTq3CiBHVypCQM7Qla
 xF3w==
X-Gm-Message-State: ACrzQf3ROZMYJW92jSzLm+BMO0QbNVQZhZF+UjipLEye01o4NQ4nKO3U
 +NwLidGHXC5VrV+CdgOQaASreA==
X-Google-Smtp-Source: AMsMyM68ezTKuamU/ngjgBY6lXzsi9RIf8K7PTE1QUvQbwSr+zxeiOcV+YhfXWWoxuIZ+FL6UVGZUw==
X-Received: by 2002:aa7:94b1:0:b0:56c:8da8:4e3 with SMTP id
 a17-20020aa794b1000000b0056c8da804e3mr32228553pfl.62.1667511100545; 
 Thu, 03 Nov 2022 14:31:40 -0700 (PDT)
Received: from [192.168.229.227] ([206.83.113.103])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902bf4a00b00185507b5ef8sm1146947pls.50.2022.11.03.14.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 14:31:39 -0700 (PDT)
Message-ID: <395832eb-2eb6-bdf6-21c1-0f643b0bbf58@linaro.org>
Date: Fri, 4 Nov 2022 08:31:31 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] gitlab: show configure/make args before running
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221103173044.3969425-1-berrange@redhat.com>
 <20221103173044.3969425-3-berrange@redhat.com>
 <CAJSP0QW_soqfj9d=6nkvzMPUzZGwzhfRDXg7QK4Q8OkNCO1+xw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAJSP0QW_soqfj9d=6nkvzMPUzZGwzhfRDXg7QK4Q8OkNCO1+xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 06:06, Stefan Hajnoczi wrote:
> On Thu, 3 Nov 2022 at 13:30, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> When debugging failed jobs it is helpful to see the
>> full configure/make args used, without having to search
>> the gitlab config file to figure it out.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   .gitlab-ci.d/buildtest-template.yml  |  4 ++++
>>   .gitlab-ci.d/crossbuild-template.yml | 15 +++++++++++++++
>>   2 files changed, 19 insertions(+)
> 
> On IRC Mark suggested sh -xc "$CMD" to avoid duplication. I'm not sure
> how to get escaping right though.

set -x && ../configure ... ?


r~


