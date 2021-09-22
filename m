Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E2641404E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:07:12 +0200 (CEST)
Received: from localhost ([::1]:53216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mStXL-00070C-4A
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mStT9-0002cu-QV
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:02:51 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mStT8-0002DO-7v
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:02:51 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so1269016pji.2
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Od2m78DAbIxhQjgJYb1X3kfwzhF88vFCZbfbLzS1j8w=;
 b=sq0VqD6U88ncxt50xsTjYenr8S+NQ1Putk2LkxY/pysZ3TwY4bUINVGyQ1ykpW7SrO
 k1gsS3BoUAfr3z1uTsQftTgfgPwUjsxZAtX+lpg/xvg4jXX1KXi5eha2gVTWyBa1ld0O
 5XFz002OFpAz+4LpVJHib8faVTWpQrZzPolbmgPCerfUgatWr1RW2SCRp0V0EBfBipsJ
 0THEKrCY1Qlx6uCNxLErS2EzhcVlSO6X5IhIzEEFnAYczXFEuJFEULikqQ7nn6wycKC1
 6Nilmd86bwMhHNEQ9gvDbVva0mrCRsgXsqFZX2exmNilBTZe1daNHyDiWscIHqpOHr3p
 Yb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Od2m78DAbIxhQjgJYb1X3kfwzhF88vFCZbfbLzS1j8w=;
 b=Boiyxc8ocgsSLjW9W3PBeJB8rLoEtDzPEdF8qk8daN19yAZPhJDnD88vxbbfVEf37V
 v3MTWRC+++UxvMBNItEnNXZOZ3Rm6NXohI2MqRWF4v8m+TaUUA6o2ziYeS/9fspevZCv
 8DgUsiUJK4Gn7gPwn0/9ODlpSKe8upe0sfbMg4I4ZhAlNEo4G+jVFzTwF65UP5MYr5na
 pNHSRGRsNhfobiHoxpJZRnpcmDhb+m42kXWHNqinsBQNguQkk+UH7wYPUDsLyqlkJfa/
 3xVOZ414F8uoOoxB5Rvshoso0BT7BkKY84PfeB7Udco0h59MxGCUUZ47xzAfX7l7LeVi
 gAHA==
X-Gm-Message-State: AOAM532gU8PXmNhOE3BvrYQCqhkVImYqXorZz3bthaX7mBLEoO+yKL0j
 veYnXnwKUYlLLOpUKiiS9+mCC6i/gGA7WA==
X-Google-Smtp-Source: ABdhPJxGuJHvhajHRdDZPckBdc4++mEa3BE1q9lVLHrcizcBb0ItNbu7Ws3CBVin/dOWxgstGTOaJQ==
X-Received: by 2002:a17:90b:3508:: with SMTP id
 ls8mr8914611pjb.240.1632283368572; 
 Tue, 21 Sep 2021 21:02:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b6sm400086pfo.98.2021.09.21.21.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 21:02:48 -0700 (PDT)
Subject: Re: [PATCH v2 07/30] tcg/loongarch64: Implement necessary relocation
 operations
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-8-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <88cf4c62-9736-3951-4e37-67e6a65d7dee@linaro.org>
Date: Tue, 21 Sep 2021 21:02:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-8-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 1:18 PM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 66 ++++++++++++++++++++++++++++++++
>   1 file changed, 66 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

