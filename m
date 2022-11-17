Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8CB62D5A5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 09:58:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovaio-0004YP-Od; Thu, 17 Nov 2022 03:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovaim-0004Vz-Gv
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:58:08 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovaik-0008Gd-W9
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:58:08 -0500
Received: by mail-pj1-x1036.google.com with SMTP id m14so1116014pji.0
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 00:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m3JEUblQcjFyR4canKFbx4FYf6Qxt2K4mcAGKEkZ7vY=;
 b=jljCAW3J5iY0rXuYhOFRy7uSC1jhu5sLC9ARexCzI4Xqpg2/wg1EPx2NOslD7lKLh/
 fZf1mTzIjfNhr7x4rTEERLQiwrshVBC+nwMOuKW4W6jDwVX+h+cWiY60i9ArjksbFzXP
 /pTjrXLYvHRnr7v1tgGPWCmXh5i6vVyn5lKcMzyxjMirYG1f4/u14BkuaMFJzudLtjgZ
 Wpou4nuOPA2vNWnvbt+JJiNO7eYAwIEOYIwJ/9baqPTW9WRUruxqU80Eg0RehtmOW3aH
 5EZI6+W/dxQNdZXeVUGcCtYwdHZhURaSf88/vZPpEaWZKfy5j3p5WAJVMaQMrGGQaEmB
 s49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3JEUblQcjFyR4canKFbx4FYf6Qxt2K4mcAGKEkZ7vY=;
 b=7cICjJUtlmjB0ozmcTYJorUdULFXr6iS9JHWaLr/fiQyjpK528PGF5vfz7QJC5B9EJ
 j6cu0s6eMd99Z2QeUjcSqFejTy4GoUob/bIKo5oz2jolUnIY/UQoPKt7v7OXmsI+kmLJ
 XmOkTef1CgZ6SMhQN3ErzixTSsJWL5IasrCgYdLkV833mPgcwD3N8P5Kz0Rg72KsNAnd
 bBcs7YyXKjtUZp1kYm2q4p6X3RwzM9jXB67pKMxsJ0UQhQmuaETf/9wHqxHiAe45fFRI
 2mkrDUGSYLrFSrqqY3xarpNnySy0hZ6ba2+pmhBBGdeS3tndXzCAJ0LPB+iS09WlbHEg
 UEdw==
X-Gm-Message-State: ANoB5pltNY5VVG9W6ZEI9ChjpgpAJhLrXFbYqZpzLvE36EEggUrm7abg
 eEVwH80Wod1RX7RmGk8sj/FEgw==
X-Google-Smtp-Source: AA0mqf5tD8/uXxduR9/zjm1yVMKTDbtqLAY7M43OG9gvODdM7fqrdVBwC3EGpSYL+F1XD7hzG1AHyw==
X-Received: by 2002:a17:902:8a81:b0:186:9849:5c1a with SMTP id
 p1-20020a1709028a8100b0018698495c1amr1811672plo.110.1668675485502; 
 Thu, 17 Nov 2022 00:58:05 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:b354:386:82db:58e7?
 ([2602:47:d48a:1201:b354:386:82db:58e7])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a63f950000000b0043b565cb57csm504581pgk.73.2022.11.17.00.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 00:58:05 -0800 (PST)
Message-ID: <ec0f1fdc-f446-00b7-959b-f86e47bbedfd@linaro.org>
Date: Thu, 17 Nov 2022 00:58:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/9] target/riscv: add support for Zcf extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221117070316.58447-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 11/16/22 23:03, Weiwei Li wrote:
> Separate c_flw/c_fsw from flw/fsw to add check for Zcf extension
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn16.decode              |  8 ++++----
>   target/riscv/insn_trans/trans_rvf.c.inc | 18 ++++++++++++++++++
>   2 files changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

