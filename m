Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B876EC20B
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 21:37:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqfV7-0004ZH-L3; Sun, 23 Apr 2023 15:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqfV5-0004Z9-Pz
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:35:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqfV4-0001MP-96
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:35:55 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3023a56048bso3028754f8f.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 12:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682278550; x=1684870550;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4rJz8GpTOPjuAPXDyJst6TJ5tIRPa8dRae6YngChV4=;
 b=RbpF1xdmBVrlmpvyAgmBFZHCwLiubSCRONlaXQB2RS6TSduNpdSuzTA+q+aOUDJ4Yg
 BYVvqoLUj+TDHfbcV73SZ8o29fJjTs3hjDxWpei9eACa84RAcZJTbOqbeIxTh8UpX/Ss
 bthpdGi60e/XTwK9E1bWjtVlHhq7LekjedVrRLbXI92tAuMmWbi8lrObFKMJtO/51Exa
 Zvefb63ZjMI3aYMFa7ek8/w9Fwdm7lWaNq99SD+jO6ZpCktjweU0ctBSnTjmaB4YBukU
 zti9CV3Nqx1mDGam68e1xtOap3L9Ceccs3zTVC5zk6nBDH1EwNXo1itaFSusQdet6EYJ
 sQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682278550; x=1684870550;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h4rJz8GpTOPjuAPXDyJst6TJ5tIRPa8dRae6YngChV4=;
 b=N7vQhQDeBlFPW6b4GGxsB2mNt3bvAgLdY79m498tGl/14OzP0fF+M6Rr6UU0UA6Idu
 mlLy3vTkeFPH98WOuPcAMvnEJwjIqs+VEkKaxKfIn5Q55F4hAVLxF86YImR15DxWbqUc
 86O6JUwtTZmorjkZzAbKWrEjK1qHfKC9xIOnb/uS+QLUNirPw6DVUfUW2kYgPo6B7L85
 o9DyjMmjW/dHUpdW3mraedHvjgcX/6A5MpsetzGDh26o2creleVZtVrFDXqkF1Ovry5K
 5QE4bDZVTmYtCyMMqpafD+TKLeeG4aIoRpWvGAavM/zJen00io+zZWQWxBu12+02l3yD
 DX5w==
X-Gm-Message-State: AAQBX9dOb84F9ME+e93Q5sCqZif+urf83MZJc0ELXv3apSwxJ71/eMaY
 r7to46/8vaNH0xDdgiNXx0Ej6g==
X-Google-Smtp-Source: AKy350bB7gUwRsRXYv/YG4QH4XdeybZwdwXHs8j7BAnMkydI0s+1+aTPAN6TVQPNtOAtXfyjudPg5Q==
X-Received: by 2002:a5d:6808:0:b0:2fe:fd61:6426 with SMTP id
 w8-20020a5d6808000000b002fefd616426mr8426608wru.11.1682278549929; 
 Sun, 23 Apr 2023 12:35:49 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a5d468f000000b002f5fbc6ffb2sm9235548wrq.23.2023.04.23.12.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 12:35:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 284A81FFB7;
 Sun, 23 Apr 2023 20:35:49 +0100 (BST)
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-8-anjo@rev.ng>
 <19f888bd-f0f4-2307-90c1-744f16ca77c2@linaro.org>
 <fe84e730-88e6-3b68-1929-758868757c68@linaro.org>
 <2c803abc-0f24-ecc6-fc14-56e674994829@linaro.org>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Anton
 Johansson
 <anjo@rev.ng>, ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 7/8] cpu: Replace target_ulong with vaddr in
 tb_invalidate_phys_addr()
Date: Sun, 23 Apr 2023 20:35:31 +0100
In-reply-to: <2c803abc-0f24-ecc6-fc14-56e674994829@linaro.org>
Message-ID: <87jzy2e6i2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/23/23 18:29, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 23/4/23 11:14, Richard Henderson wrote:
>>> On 4/20/23 22:28, Anton Johansson wrote:
>>>> -void tb_invalidate_phys_addr(target_ulong addr)
>>>> +void tb_invalidate_phys_addr(vaddr addr)
>>>
>>> Hmm.=C2=A0 This isn't a virtual address, so 'vaddr' isn't right.
>>> I'm sure we have something more appropriate.
>> tb_page_addr_t?
>
> No, it isn't a ram_addr_t either (see exec-all.h).
> Perhaps just uint64_t.

Surely hwaddr?

>
>
> r~


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

