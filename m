Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB31B69CF71
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 15:31:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7CI-0001ar-5M; Mon, 20 Feb 2023 09:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pU7CF-0001Vi-ST; Mon, 20 Feb 2023 09:31:15 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pU7CD-0008ES-3U; Mon, 20 Feb 2023 09:31:14 -0500
Received: by mail-wr1-x432.google.com with SMTP id l25so1021840wrb.3;
 Mon, 20 Feb 2023 06:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uapwYjG86j09Ao3mvRI6hLJtSjzf0Mx1ain+YxVd2BI=;
 b=hSQTdGUJEXGKq5Wud5TAYYDkn8KABInLFUYE+YusrDV5Ovf+HsD1rOdu/OnXW7yA9Y
 eLXGYOLqkjZwaniw06Fn35BRstiJPQqPptcg+lPynDycV+nnITZTXrDlzT9zq7VLHQgl
 2NVvHbT+7iwVFKKFHGEk4JpNEEYReR/QAVNqh4USvu9GLyKxDHEYmpd+hQ+qiQvxWkSe
 bKtYvnnPls0hz5vSBMA7BtFrZb/wCyFT7zTjubhQF6XYPx7p/3fwQGq8c/oUna51Q/Oc
 6iSm3PD/6+OHGjU0yeR+6tu1RGdsff/OGIn/FeV/Z/0K4qE1Y3xAWqY90dx31HrYwWSM
 CDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uapwYjG86j09Ao3mvRI6hLJtSjzf0Mx1ain+YxVd2BI=;
 b=NNxQDcrS+xmkkC1rZf1NU/lEphz4WzVZ2ekuA3mNfbnkiOhmyJrnDH5d/73z60pj0j
 6NPKpk3LQsR3uZCttFGrEmmVgTa5eTRzQOluaSN/NxJv/5ERGXEL/HzCUBPcFs0ykDJY
 B3Rft0pzMBsCCnUxuxKsl+1JmiHF4xcMq32JYvwOQ9vx2thRRAYWbntXtPI7QymRqBrT
 VP0hhfsA5hKcRaFDM9GJ18BWLVBKGm3l27GxROKi48Mxoh4YIfo7KtulSzFLkzkTnFNW
 swRRwwjDM6LPPcE7e0F41tWEVQPP0UJRjtWQt9S6i3tm1krbNparD88S2dBtLHZknx2U
 iuLg==
X-Gm-Message-State: AO0yUKX32g4iBEi3wV6vcASHVZAHLj3TeIZBLut0QNfcTHnmys4wBT58
 VPedRytn6g2Fxm/VRkuYZC0=
X-Google-Smtp-Source: AK7set/rskOGDs/Z2znmzqCCaAutsqAyx0x+1Ja7sEXGjK57+P5aqoHZuUBPoOyvYEvouv1K55YXtQ==
X-Received: by 2002:a5d:4cc7:0:b0:2c6:5168:7785 with SMTP id
 c7-20020a5d4cc7000000b002c651687785mr1520329wrt.28.1676903470855; 
 Mon, 20 Feb 2023 06:31:10 -0800 (PST)
Received: from [10.85.37.29] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 a17-20020adffad1000000b002c54e26bca5sm5769962wrs.49.2023.02.20.06.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:31:10 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <44b7cee5-5a8a-44fd-7cd9-e50864a6dfa8@xen.org>
Date: Mon, 20 Feb 2023 14:31:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] accel/xen: Remove dead code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org
References: <20230215153451.30626-1-philmd@linaro.org>
Organization: Xen Project
In-Reply-To: <20230215153451.30626-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/02/2023 15:34, Philippe Mathieu-Daudé wrote:
> Unused since introduction in commit 04b0de0ee8
> ("xen: factor out common functions").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/xen/xen-all.c | 10 ----------
>   1 file changed, 10 deletions(-)
> 

Acked-by: Paul Durrant <paul@xen.org>


