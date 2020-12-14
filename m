Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14102D9A60
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:57:51 +0100 (CET)
Received: from localhost ([::1]:44688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopIM-0002uk-TR
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kopFP-0000vH-BE
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:54:48 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kopFN-0001Or-Ej
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:54:46 -0500
Received: by mail-wr1-x444.google.com with SMTP id 91so16700322wrj.7
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4DaLqvsDm5SqCzWwMhnyPtFEtL70bMDG+mFsDKou0X4=;
 b=UJR/wKdU6rPLN4XQ3J0CDWMk263//v8P+bzOWQhJFiDK7OEBa3DuB1QqwJ9FhLwnBU
 sVYRyqltLyyrCEquXvzE1avw0uaZ/7GIeZsXUMYNR13u7QsAxv1Kpts39QRlHYUJjMMw
 4ZO7U8o2c+gnn08eeunaQ3NbLBwWFp+UQfbvTeDiEOXdK0qYT4R+hJaVehV7fhKcQtEz
 qIZO4zp0dM1YCew+9lZM+4ZGxz7yabrnCZqaEUT2O6oRTjtc9aNrujj2zWCy2Y7eOv2q
 eqVjfJnpDlYtv4xIBSx6G5RV6AjtnmL+0bsAD+OX2Bcs3F/ZoE1qIGzK3+KSiBhFGEFe
 ZynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4DaLqvsDm5SqCzWwMhnyPtFEtL70bMDG+mFsDKou0X4=;
 b=KFqAhTIZzD8t8qDJVc7FsIzvwuck7kovCJrNcBjUWWT0FHUHg++gI4bI80P7NfDqnC
 MoxzuHoffDPIOfTO0ZZax7rKo7Q+J5FXAvr/lbUCnerjBxZl/uS4Wi9/ow31hu0/Ml0v
 gTSbIGxkR8Gp5GULincm+8viJCY7rWSwpk6e9GJP+UkJseOHApbU/+sWFkDuGFPk02eH
 KuohXSWG3gvFxgT5gSBAoWJim/4Fs1qGT4eGet0wxsHaj6YQ7G6TxwNhEtC7ROpBaTZR
 uLv4ZhuUOfOH2krzLEmNGJb+OcFVTSiuIHRTAJ3qyT1TNvo8wrvWx2nBiKaHZxcb0P81
 Rbrw==
X-Gm-Message-State: AOAM531FwvJxp/wAnTZxDPfeODmJTij0Ky8ssUOtss+XPdiqGLbgwE2H
 sOpuj5IoJq8X6A2ahsRKuxA=
X-Google-Smtp-Source: ABdhPJx7e+I0xjoB2By16ZZyhXRHSXtUxgskPOphW25lvrTalpUyK5RyKtestnWlQd/kWiJWMBFQlQ==
X-Received: by 2002:adf:9e4d:: with SMTP id v13mr28765704wre.135.1607957682692; 
 Mon, 14 Dec 2020 06:54:42 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o13sm29553783wmc.44.2020.12.14.06.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 06:54:42 -0800 (PST)
Subject: Re: [PATCH 11/19] target/mips: Extract common helpers from helper.c
 to common_helper.c
To: luoyonggang@gmail.com, Richard Henderson <richard.henderson@linaro.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-12-f4bug@amsat.org>
 <ac8afc12-2ab4-a2a3-81b5-b9d75314bf6f@linaro.org>
 <CAE2XoE_WzMzCbvxtPdQfbU2rs-wd26GXpds9VypW7B-ik7qWJA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8021bdf5-bc67-9029-b9af-0b9ee3b0d4dd@amsat.org>
Date: Mon, 14 Dec 2020 15:54:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE_WzMzCbvxtPdQfbU2rs-wd26GXpds9VypW7B-ik7qWJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 qemu-level <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 3:51 PM, 罗勇刚(Yonggang Luo) wrote:
> On Wed, Dec 9, 2020 at 6:09 AM Richard Henderson
> <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>> wrote:
>>
>> On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
>> > The rest of helper.c is TLB related. Extract the non TLB
>> > specific functions to a new file, so we can rename helper.c
>> > as tlb_helper.c in the next commit.
>> >
>> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>>
>> > ---
>> > Any better name? xxx_helper.c are usually TCG helpers.
>>
>> *shrug* perhaps cpu_common.c, no "helper" at all?
>> Perhaps just move these bits to cpu.c?
>>
>>
>> r~
>>
> Does these are general cpu bits or misp_cpu bits?
> if only misp cpu related, prefer misp_cpu.c
> or cpu.c under misp folder.

Yes, as the patch subject prefix implies, this is a change
local to the target/mips/ directory.

Regards,

Phil.

