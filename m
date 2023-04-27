Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E786F0392
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 11:44:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pryAn-0001RD-BE; Thu, 27 Apr 2023 05:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pryAk-0001QL-Pe
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:44:18 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pryAj-0006xe-9I
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:44:18 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-507bdc5ca2aso14547056a12.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682588655; x=1685180655;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NKTxXQ5YVmv7VUuu7M36wDBnaG4p0r1am1RGBJA/TEo=;
 b=sJHWHXwRaKIKKvRQgYq1zrevnmol5fwvqPjSIDdul5REcx9+9BtygqNVi6pDr/O693
 xZ7BEnmk88eTvqcdBa0zd2PuDJIdO/CWB/XUJM2RqSPSfE3Hc3NUewdTvlU+anu+EbNi
 4w0BTlYP7ecV0FXVuMI6Hxzxb7AFGVSYCsXCbBTfy+E7qy9nG2yyMDPP/2UPMI2coqQ/
 rDKk6jMpCp8CxGra0o8dnd4exUVRyse/4OSK5GAFDAUNb/YKJ/rGAH9nks3hpnVdbKSL
 FN8W3w7orfndiwHi+moXJm8y+AGLUHyI0q+0J7UFjzMmUGqWoTzDqHGLopacSR/WkCyD
 mevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682588655; x=1685180655;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NKTxXQ5YVmv7VUuu7M36wDBnaG4p0r1am1RGBJA/TEo=;
 b=aLZBAFMvGvMp3ZZDILm9Wvn7EEyfJ+4l48POaDM8wMx/PCcDOT09NcXKMxeG1Lsc9s
 1hhA/e+9O5rWkcYZShcCWwXJZOyL8xJhvRRYeHg8Mqb2z84NjUcCgDQahfqZIEmhZSoi
 jZ8xvitpV4M2zG5oNM+1QGtMulRNUo2FakW84/QmXatZXBZ5s5c+UdOTT0lWorMUNOPf
 RmQN1wIrrCevB06DlgcRo5PPLeB/uipDYm1cVdpdfRPQSrAzabp8uINvEqv54R0MmXHt
 XWbNbtM5wtAWdMDAS+Yhxt3Yg1Ruon48OW7fwOdIczVZfb/rraw8xJd1Z+ekzPfUU2it
 MDvg==
X-Gm-Message-State: AC+VfDzNUnqxvQ6MAptOTbo47gTCrF/0blq8wxc18H6BR92MJU7Rs+7b
 FlySh4NKY9zaUuWzdZfN1VbENQ==
X-Google-Smtp-Source: ACHHUZ5rvBn4kpZdo9SZPAlp8ZZIIREd+Bg0eQ561uO19z3GqMP9LCH3g63gyyMGfIX0f9ygdWd+iQ==
X-Received: by 2002:aa7:d6c8:0:b0:4fe:19cb:4788 with SMTP id
 x8-20020aa7d6c8000000b004fe19cb4788mr957139edr.42.1682588654696; 
 Thu, 27 Apr 2023 02:44:14 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 n7-20020aa7c787000000b00506b2af49fbsm7785905eds.81.2023.04.27.02.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 02:44:14 -0700 (PDT)
Message-ID: <63f4fdab-a3c5-6259-3e8f-f2e6b7fef823@linaro.org>
Date: Thu, 27 Apr 2023 10:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 12/13] tests/qtest: Restrict tpm-tis-i2c-test to
 CONFIG_TCG
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
 <20230426180013.14814-13-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426180013.14814-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
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

On 4/26/23 19:00, Fabiano Rosas wrote:
> The test set -accel tcg, so restrict it to when TCG is present.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/qtest/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

