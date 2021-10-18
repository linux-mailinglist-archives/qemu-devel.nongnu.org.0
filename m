Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55B143102B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 08:07:59 +0200 (CEST)
Received: from localhost ([::1]:57380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcLoV-0000hI-2Y
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 02:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcLlz-0007Ew-4K
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 02:05:24 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcLlv-0002ob-H1
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 02:05:21 -0400
Received: by mail-pf1-x431.google.com with SMTP id 187so13868270pfc.10
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 23:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4GoNaO6cAr8P3L2u+cHY+4aP6OhACRc+y7aXts4nf94=;
 b=r4WTyBV7kWeANPz7SiXT3APGMeI1UsTVvd99SiW7v6kPu5ot0kAUn+EkvkbO7POTMh
 Lobxv6Pudu2V7CAZZmi3ghtI5tButW1mTuhWyg8aj37hVXoSiZOvpj2QKdZepAHDeV5g
 Sbfm4YUrm0susxrSj9IlonwWpoWy7FawClkA7vV2SwR9gHiKsR/SkaUiPLWlUOw5rEh2
 SQlZHpaUV3ZWaTegHdgFvdfkq56i/BmhYs9zOaTA+RHuOJH/5s+7ZWwh1mjodjbvRvvj
 jKfOsCB33dYqhfMitaR06exyeQpoHF4MsBv3RVfasaa8WqWJiTvCt6GgGZvmcIT2zVaq
 9fAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4GoNaO6cAr8P3L2u+cHY+4aP6OhACRc+y7aXts4nf94=;
 b=jC+SKs2lfktN4dxhvucE017cCN29kdd2GjIjHpNTEPkhmcHa0APJgxaEIkRKF5yRtc
 6lH3Hsi2Lfh+RtY6Ikh+HIOawIVOmQO3pVVoI9FDF5TNAifFsPulNLkvNpO/UA2OymZL
 +n1xA6wJFo6R1fXM6BtTrcniawGChI2rr2UGVvkllsY124QEru1MhZtioE259F3rlLeB
 IBMdiSM/IqtR3yzsjlDbSXCuaBsppPMuEsnW3kGhzl1JWWb0/J8dQ/GRRySoyD7HGNfk
 MNpXlFzAq+fEzWkN2Fyuq3j2Wz6i5UE4IrpN2gWwdXjjFTg4iRz4pVM+uhOUaee2Lic9
 5wKw==
X-Gm-Message-State: AOAM531DkmG0aOVls+6jnzMUy8cpz2c3yrbwKjriZeJB+M5pGYEaAvsK
 O/krNQRPdDw0vxNfyMJ/Y2MUhA==
X-Google-Smtp-Source: ABdhPJwIXRUcIeievjSFGBYGEnJfL4MLGKKmIt/KuHZsMF6TOViuyJrSXzb8Z2utTl+CKelqlPIGng==
X-Received: by 2002:a63:81c2:: with SMTP id
 t185mr14382682pgd.114.1634537117937; 
 Sun, 17 Oct 2021 23:05:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g25sm3209531pge.12.2021.10.17.23.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 23:05:17 -0700 (PDT)
Subject: Re: [PATCH v3 14/14] target/riscv: Compute mstatus.sd on demand
To: Alistair Francis <alistair23@gmail.com>
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
 <20211016171412.3163784-15-richard.henderson@linaro.org>
 <CAKmqyKOZd-gtes+_sQ=ndjqu9nfujE_Kc==Jueno+ds6Pg7neQ@mail.gmail.com>
 <a9a1b623-0420-6285-0ad8-cf152a4e0397@linaro.org>
 <CAKmqyKOQ5UQgY0z2B5H+e5ra_cWz_JZKjtEmnm5er5gs7wWtQw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f2d38eb6-9eda-9335-fc10-86b06e374876@linaro.org>
Date: Sun, 17 Oct 2021 23:05:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOQ5UQgY0z2B5H+e5ra_cWz_JZKjtEmnm5er5gs7wWtQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>,
 liuzhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/21 10:38 PM, Alistair Francis wrote:
> Do we get much of an advantage from this though? To me it seems
> confusing that the mstatus register doesn't actually contain the
> latest value (for example when debugging QEMU and adding my own
> printf's).

(1) We have at least 3 places that need to check the cpu state in order to set SD 
correctly; we would add another couple with the VS bit that's coming in from RVV-1.0.  By 
setting this bit during read, we reduce that to one accessor for read.

(2) We would need to move this bit when changing MXL, once that's possible with the 
various XLEN changing patch sets.

(3) The position of this bit, between MSTATUS and SSTATUS, differs if MXL != SXL, which 
means that there is not really one correct setting for (2).


r~

