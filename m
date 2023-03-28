Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE746CCB2C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:02:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFWD-0007uq-Sb; Tue, 28 Mar 2023 16:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFWB-0007uf-PV
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:02:07 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFW9-0001NK-Vh
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:02:07 -0400
Received: by mail-pl1-x633.google.com with SMTP id c18so12780318ple.11
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 13:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680033724;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1FxfoVUUzTYoFQdEfxHyHMR8M7BqxE4QxA7ioCnUWyc=;
 b=AV63N2DYrlndYD4L+MRSIZp10ptA9b8pOoPQkEkDibWh/wjnaXqLjEw1sknpMfe89U
 zS5o3E1cFE1GiCyoveShXUgmxKqEDihUNOMTd5Go+rWvCvTthRFqw+gG27X5eOXGaecV
 Bwfyd17r8alag9v2jJKtoDcx7bg2VgDHh+coa+gZbnr+uwV/rK5IAeNZDBz3Y8s3GPeT
 qqWYzkFGuEfpZ/1DFfPG08S6b40ozIlK2Y9qKbLDEwWkWBTPowza1jAgr2ITkvFBMely
 YLgzfk7hHdiKAoO9RhU9c0byM5s2LxdA/twziEBwtB0Tv4bjym4TEPCU1dB0h8Rwaoam
 ecHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680033724;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1FxfoVUUzTYoFQdEfxHyHMR8M7BqxE4QxA7ioCnUWyc=;
 b=35h7Ai1sDKMpjXEJw8lIQ30jqYBhIm5oYZqHkueeKzA3o52qxT0H9sskr8LC8jYSl9
 cFj75VWeyRm/0fK9M9Gkc6uqCGb+i415+qqlWTftpApJg2saIHI6wkIl1NpFoTrJDbxM
 yxsJM8zUlULUUHfpGYotuXzNphIaCaI0c4AC0NKp4lEHPQ/cBjTW/nOd+55KCvFww8oe
 E/qQonuJrZrEdfiqqsYfNKCET3jZ4DLm8BC2hy4OyyTJ/E4Q9ltW4WQhZD1iIqpgZDeL
 p07gxoTVfvBpZmRY4U1ahsvCHqZtcWVR5iNpXYt9WVzlZXDAcWOwmxhAuGvAZxjAHZfc
 tGJQ==
X-Gm-Message-State: AAQBX9cf5YtrT2Jwb+NaJ6jp8+0PgcdSM6PUkiHJrKqqOIvMWLfjuofY
 NYy6KQyLg/Mq0AVdZs+10VVQ/fZRMSr9pzg0qL4=
X-Google-Smtp-Source: AKy350YcZs0NoJDNgzSDdB8FNHFsKv3KfHXDxOKMNFT5Nhlt8ZLwySg73Y8D6zDx9BU1jeYXTD/GPw==
X-Received: by 2002:a17:90b:3887:b0:23f:58d6:b532 with SMTP id
 mu7-20020a17090b388700b0023f58d6b532mr18201980pjb.5.1680033724477; 
 Tue, 28 Mar 2023 13:02:04 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 lx4-20020a17090b4b0400b002349fcf17f8sm6500173pjb.15.2023.03.28.13.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 13:02:04 -0700 (PDT)
Message-ID: <f4f64a3a-958f-f363-2b32-2857e800835f@linaro.org>
Date: Tue, 28 Mar 2023 13:02:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 07/44] target/loongarch: Implement vneg
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-8-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-8-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 3/27/23 20:05, Song Gao wrote:
> This patch includes;
> - VNEG.{B/H/W/D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    | 10 ++++++++++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 20 ++++++++++++++++++++
>   target/loongarch/insns.decode               |  7 +++++++
>   3 files changed, 37 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

