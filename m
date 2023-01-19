Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4954A674173
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:56:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIa53-0001je-3b; Thu, 19 Jan 2023 13:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIa50-0001jQ-TE
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:56:06 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIa4z-00070m-42
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:56:06 -0500
Received: by mail-pl1-x632.google.com with SMTP id c6so3179859pls.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rX3Pwht2yHicLDeRtafLYUYKacRt12cPGiEU/nNxQEc=;
 b=IawTwvWtJvGJPMQBVPaVBRfK0Qpxwk9A6gSyLOSmvUb/XE8cEiKxNFLaz3o5/aDq72
 caTw5jRGuHskMTumJ7JAjUs6o2AU5oMsiVGQJL2X7GjB677TV7zjJeSwfyOvcvDMf0DB
 p/nYOD1qE8hMeuBouRlGifVB6qyFJn/0mWCpdHWq/b6/5t/olh6QAwNOko8ge215msbx
 mvsdToRG1LPuVXevK00EDhEiUYzPVmGJM9aytRj5ybN77dOiBbv5knex2YzeK1gcXQfs
 q2Ck5TRDmVmcMu6rTpziJp3LJXOHbz+DTvWTmct0IAmuTVr6khuIbu2EoPRSyuauaquJ
 S79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rX3Pwht2yHicLDeRtafLYUYKacRt12cPGiEU/nNxQEc=;
 b=l3tIttzh7kLI8zUcvs5ZPAPBmJ39T0bSrSlUOs7eu+cbkJeFrvdkpVxalAsmwikuwp
 JcIr/QeEwvt31wE3KSHEwM3yjHeAQuBgNoon1/QhKB1gIDBIiQGAh4g45/Z6C3xyGQWk
 DsBgDnVYCZx8rKSCdZIG3hF/sytWBzD0qyu88y+shqW2xrme5j6ff5Jqu6JywHoQN00x
 7j1PEQQifWDN/ACoZjeRsaWn7eZb+7rDb4TSJGQWrgLJa+XYI1OztR5r//vBV2tGvQNo
 mZfYoJh1GlVKj9Q/JSduL2yL8r+sfp2/oL0pZnKuSGJzzZPT/9wHe1zWUZ7OxJVr0ciW
 D0Lw==
X-Gm-Message-State: AFqh2kregv7VPTsEFRrITBVJhD8xKh1QSeeBP3Du6zA8AAe6L7JpuYP4
 kO5O7/5VMPmDS4ou9XJpUqD43w==
X-Google-Smtp-Source: AMrXdXvzpeyRpiMvkDsYbRc52NM+/uuuSmn1yTDfQCMRtzt6aJyVO//IJnxnSWBenrNReczIr6zkGg==
X-Received: by 2002:a05:6a20:ba11:b0:ad:5a4d:95b5 with SMTP id
 fa17-20020a056a20ba1100b000ad5a4d95b5mr32359362pzb.40.1674154563534; 
 Thu, 19 Jan 2023 10:56:03 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 e5-20020a17090301c500b00188fadb71ecsm25474434plh.16.2023.01.19.10.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 10:56:03 -0800 (PST)
Message-ID: <ae3535c7-7b96-1832-7ac4-1c6cce1cea0f@linaro.org>
Date: Thu, 19 Jan 2023 08:55:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 06/15] tests/qtest: Add qtest_get_machine_args
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
 <20230119135424.5417-7-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> QEMU machines might not have a default value defined for the -cpu
> option. Add a custom init function that takes care of selecting the
> default cpu in case the test did not specify one. For the machines
> that do not have a default, the value MUST be provided by the test.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/qtest/libqtest.c | 99 ++++++++++++++++++++++++++++++++++++++++++
>   tests/qtest/libqtest.h | 11 +++++
>   2 files changed, 110 insertions(+)

Looks plausible.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

