Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8095A5E920E
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 12:20:34 +0200 (CEST)
Received: from localhost ([::1]:52370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocOkS-0002n3-WB
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 06:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocOf5-0007Ah-07
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:14:59 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:41607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocOf3-0003aT-Hv
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:14:58 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id l14so2756655qvq.8
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=cPJ9chtXSfKnWh4ALPiDpzOPGsIthH5YhQUg9r+z76I=;
 b=H2CZwLUwV6hEk689vtCaJ9fR/OKPl377GeZDWIeaMlDOLJsA4U4OxnsEgHlhVq3PnE
 HoLGmxwaj+juyYcNVRD0SlAJPqbgJIyg6wgAmjVP67hutcB8AYnyHc0j5bLD1Nz7mcrO
 QJTFtmYKBOMBanghbJxWB/h6FO/WtIiaUeixviuaEmUAMDjaHKiGJrC9QXJs0v2bBY9x
 iduE31kDON5K5iF85Y5GcSLZlprNFUCnlqKRChuGZAUc5vpUq1Kbf11YPlUXeNlvxJd2
 rZ3gdQc6ql2UsW06PGsGax9LV5ZgBq7wt75cYAXEnq6QqUHUx+JsalOEl6IhtjFwth/y
 UP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cPJ9chtXSfKnWh4ALPiDpzOPGsIthH5YhQUg9r+z76I=;
 b=SuEXK/b7NAFoKSPYqlqAxRlhCfUjhvZRWJJjW1QXBRjaiAqTpy7na1fUzFaDnanom5
 ieP+iXS6nq/iZ4EgBwcbGj5+wBEeZDZ7NuwFS98Zh3cG19ZKRbZcCtEJKvnKo6v/giNu
 t65LhXmigkCkKwV+3FUVMlw19LJJsB9F/lbtRBveOA8Sx/YSB1q1s2my9ibfoP5eSPv9
 wwLifiT16Zn/COngBCihnt62b03X/a6zDS/tojuI98zO9L7JxpfeEnx5TyTKyrIo0WMO
 B/Ktg3g95A3tPMaLeXL2VNK5sgSCL+BpK4xte9deocyVP135nD7fw44hzKVts9UxQhPQ
 Nkpg==
X-Gm-Message-State: ACrzQf32UgF78MM03auvn5Me1IdOsR+/Ue/bgPdnzA1h+WpeNKVJDBPc
 Ku9c+WGVPjfhLZAHahqYlCIRfw==
X-Google-Smtp-Source: AMsMyM7hfU361uEgLc2dGf9QAP2aLGANHMywu5UA1v939Lso6aOhNZZ86B5R5PQB1Bc+un8GsEaEFw==
X-Received: by 2002:a05:6214:dad:b0:4a0:b90f:ec83 with SMTP id
 h13-20020a0562140dad00b004a0b90fec83mr13820526qvh.16.1664100896564; 
 Sun, 25 Sep 2022 03:14:56 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:413a:430d:cdd2:88af:d4b3?
 ([2605:ef80:80b2:413a:430d:cdd2:88af:d4b3])
 by smtp.gmail.com with ESMTPSA id
 y11-20020ac8524b000000b0035ba5af2a75sm8790756qtn.16.2022.09.25.03.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 03:14:55 -0700 (PDT)
Message-ID: <9fbf3ee2-07b2-dc51-ebfe-2e57f557687c@linaro.org>
Date: Sun, 25 Sep 2022 10:14:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 7/9] gdbstub: move sstep flags probing into AccelClass
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220922145832.1934429-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/22 14:58, Alex Bennée wrote:
> The support of single-stepping is very much dependent on support from
> the accelerator we are using. To avoid special casing in gdbstub move
> the probing out to an AccelClass function so future accelerators can
> put their code there.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Mads Ynddal<mads@ynddal.dk>
> ---
>   include/qemu/accel.h | 12 ++++++++++++
>   include/sysemu/kvm.h |  8 --------
>   accel/accel-common.c | 10 ++++++++++
>   accel/kvm/kvm-all.c  | 14 +++++++++++++-
>   accel/tcg/tcg-all.c  | 17 +++++++++++++++++
>   gdbstub/gdbstub.c    | 22 ++++------------------
>   6 files changed, 56 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

