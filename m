Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C266A583
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 22:57:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGS2W-00021j-As; Fri, 13 Jan 2023 16:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGS2R-0001uK-Ia
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:56:42 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGS2Q-0001bx-2A
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:56:39 -0500
Received: by mail-pj1-x1032.google.com with SMTP id v23so23702201pju.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 13:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kIqN+jE3uSNrC7qr0Lqm4+Wo/4eLFOzxN8Nk7zc9IVM=;
 b=jrgWSeu/G77Yg+pfArmC3T1ogNGwsj6F+0ubkRNsymD8OmEFjChn1eRs90PwwCzLYC
 2VV1bDwpUJ8W64ij6tK7B2Yi7yrb59On8/U5u9jzJTFUi+PyZqzDhgk761o5xjCkIixh
 NMHTRLBLM1J5fec7WePyMtBXHqjuZtm00w0Jj2kH3ho4mfzIjvfU+EPtA6OybmG5zRcv
 RwLWtsav9fGrNmJd0s/TsS2WWhTpLN7PqiKbmdRrCMSA3BiEPSldGDtwvaTjSsA1LSGt
 czZg9rowEsCumozFc2DsLZ5ONd9QrIUkJVTDu8Ifj5K4C6f7h7Hg4d7bPrv46z6PcC1P
 3BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIqN+jE3uSNrC7qr0Lqm4+Wo/4eLFOzxN8Nk7zc9IVM=;
 b=jG+7mqgloPZshtnS2vHEJbHIe4xZLzVWvvmO5X/8G9oGu6Zeues9JomPUxKOUokwNa
 Snbw8SDazB01jF5/4RTa597uUUdVfkXPe4ctkL3z2l/VdO+4ekY6sVS7VmOGtMQsi6T2
 VrlF+XJ1LCi+haSUIYaifKfcgJIFTqcusTc00ZJcQdfrcUUDmhgFoJE/tXCIQE24EnVd
 wb9hqk0NTbxIlTl3a86NHJ2L+WhHQ3qWCMnEhEgPuflcHXHziFJf845Ew5VZ6JRe80F9
 3bxWzHspl2+853lCIJ0PNBP/bFbI4aKaASnb3soitH1wNK2NqPY+JPfowmEBNb7ry4OO
 Qc6w==
X-Gm-Message-State: AFqh2ko1zByq7+WfvZAzuV46H1pDrT2cnhJCbquS23qrKSOJsl4HQNkO
 OjGptdv+o2SfYkfzA0mH97iUsg==
X-Google-Smtp-Source: AMrXdXsW9ZiUbChTF6nNBT+89gxnaedfeXBj5ZBoYWhhe2sBd60s/GCtN4Ed2VgnV34pl+x74urzvA==
X-Received: by 2002:a17:902:b613:b0:18f:98bb:c08e with SMTP id
 b19-20020a170902b61300b0018f98bbc08emr79322532pls.36.1673646996604; 
 Fri, 13 Jan 2023 13:56:36 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 l4-20020a170902f68400b00192944e3650sm14592915plg.268.2023.01.13.13.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 13:56:36 -0800 (PST)
Message-ID: <3caea45f-6f4e-f683-c063-2146c94aad2d@linaro.org>
Date: Fri, 13 Jan 2023 11:56:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 12/28] target/arm: Wrap arm_rebuild_hflags calls
 with tcg_enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-13-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
> This is in preparation to moving the hflags code into its own file
> under the tcg/ directory.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> I extracted these into a separate patch so we can discuss. If I move
> the tcg_enabled check to a header that would add overhead for all the
> calls where we know for sure that the code is running with TCG. And I
> don't think we want a new arm_rebuild_hflags_foo to be used for common
> code.
> ---
>   hw/arm/boot.c             |  6 +++++-
>   hw/intc/armv7m_nvic.c     | 20 +++++++++++++-------
>   target/arm/arm-powerctl.c |  7 +++++--
>   target/arm/cpregs.c       |  2 +-
>   target/arm/cpu.c          |  3 ++-
>   target/arm/helper.c       | 16 ++++++++++++----
>   target/arm/machine.c      |  5 ++++-
>   7 files changed, 42 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

