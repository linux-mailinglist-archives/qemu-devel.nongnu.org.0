Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040892B9CF5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 22:29:26 +0100 (CET)
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfrUb-0004Cj-3E
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 16:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfrTf-0003ha-KD
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:28:27 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfrTe-0002OK-3M
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:28:27 -0500
Received: by mail-pg1-x533.google.com with SMTP id q28so5420402pgk.1
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Th2L+cxfAJKNpgfTu59OpahZ0MVv8mB13xXeHaN+YwM=;
 b=ZxU5zsIYOaz/NhRzZ4BzQTT9szU2cCa8lz5hX4qSIgv9j4BK0nNgAwS1NPOwllv1vb
 RpwVCbbNb1ro+plRLxl8Ca7RuCRGwfILOfNo+N3HIfK37hdKfh7s2+Drswk7G9cnM4Ib
 1mTX79avZALi0loCWAydGezWHYQnLyPUzy4Gzy23gJTFD/HRxW7xK//BZs6rCuk4JkHk
 fVI8zXATvNY9DwF3lJzMQDHoF9KuZ5ZJl2eW0JYANWn4+W/hFiJCEhs9nwH2AawH/t4j
 Jrb2M/RWTnFrHTbiV432iy3WblowOO/UE+O+BoZAL09VkyJ30cSgPSIkvKfqLPRtuozg
 yxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Th2L+cxfAJKNpgfTu59OpahZ0MVv8mB13xXeHaN+YwM=;
 b=pP7dihbxo5Ia0a07XaJ7bbxnQJgecZCW3LFW/k7EsZYbCv44FpvblNMJOcfqfU1CcT
 X8/wo80D3Ivy/dve6e3TUtg2F6r39aIVQJbqDTvUL+XFu0dE/zfoRBtwk/5K5/cMQ0zK
 hv7oaRJM2lsNl2eKjYhPMTpnEIYPpqXFWgxtJfvu/WQRT+4tPwmzwqAvfdSvHI/CHFly
 /gtxrYzBuXBmE40aLS4uNOClUv1/YR2eO5JoTc2TxDB2NOM2+Ue9zk3wZs2BFshgrcoL
 AOH+35B0gg72l7f8/6wOXov15FbwPUmQlvzI3bpewMhAZdAkDXlUslNdbS+CsRno6Tzg
 S7kA==
X-Gm-Message-State: AOAM533KXrAAMq8X+cx+71zf9fBwgHHuz4e5arRXGqdhVHO/DQnrUDTU
 wFEz1V8Twn964TOfzni8vKltJg==
X-Google-Smtp-Source: ABdhPJxzGGM0psQPBTqcT3wh5y8bXETiWoWITi5HO3k+cUopoBuAlm0sgFGZyUVQ9zOoYn7eTh4eYw==
X-Received: by 2002:a17:90a:4884:: with SMTP id
 b4mr6301379pjh.198.1605821304741; 
 Thu, 19 Nov 2020 13:28:24 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id in14sm647445pjb.57.2020.11.19.13.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 13:28:24 -0800 (PST)
Subject: Re: [RFC 12/15] target/riscv: rvb: generalized or-combine
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-13-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c0a1551-1fe6-effc-231d-532b7fde548c@linaro.org>
Date: Thu, 19 Nov 2020 13:28:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-13-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static target_ulong do_gorc(target_ulong rs1,
> +                            target_ulong rs2,
> +                            const target_ulong masks[])

Similar comments to grev.  I'll also say that the masks array should *not* be
local to do_grev, but placed at file level so that it can be shared between the
two functions.


r~

