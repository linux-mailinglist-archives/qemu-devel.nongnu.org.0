Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9C96A77E1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 00:44:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXW71-0003lc-97; Wed, 01 Mar 2023 18:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXW6k-0003h8-VM
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 18:43:40 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXW6g-0004x2-M1
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 18:43:36 -0500
Received: by mail-pj1-x1029.google.com with SMTP id kb15so15092611pjb.1
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 15:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677714213;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=64U/ZTou++lcAOyxylSvEnNVqwlVlBMljfv5hCd+Dew=;
 b=1cOrr1yVrNd100OCYZSuxZr/iCV9eDyAheI7QIAOhxbfsANh70BGs+BkB7Ioa462We
 OjBcZZOBIDjZsI2ranFfk36/RNMphbR6fHzKKKMEokxaqUvFFR/BuDq46Zxm4HEeCT4U
 dYOvofJhYoUBhqx42uQolnQl+LLFys+HcVwj+a77AdmDzcVk4qIyL8OwCtvu3fb9izEX
 ydPRW9bz8OPu5WZrja2BmcQprsGvvy1tkhEHm+jUwPmB2krtQsW/+DeTBsQrcbSvtR1O
 lUv10iwMJC2ixVbcY1MxbYOrHKvYqqySI2hQlyLNYwHKsYnCzjUsE23X9aIA/33whZMA
 wm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677714213;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64U/ZTou++lcAOyxylSvEnNVqwlVlBMljfv5hCd+Dew=;
 b=BHHWDNG5j3jJw8oMRxXTTlLvwNnsFZjsA8Dv5nXTsVBXV5Sor5CyVaEFgLjWSEmW/b
 Egt623jPcfyTXCvh7P99sspqR/H60Bq0puHCTNuRAgkAz39OeJTyWio2bAxadOaxFPg5
 d8J2Vl9qXBn9P+WnGFPKrXnwzABpbPBP5bMIB5tslZbKFky+WFxS15fGuksT/zxUiHKV
 EePyMd6lQ7ldkFD9S/8Zk9G7MpdBxRaxMVO6DcFjzMUNH4vUId+0fDZ0nCX4dQ2N3UHN
 fvrTG7AyQhganL7EvXsH3ajqEQSK06r1FJRY8hr6QJgULd/wqvjYzZk/mYGyHLiT25sC
 Ut7w==
X-Gm-Message-State: AO0yUKUUP+izQ7B3c5A6rOgtMEXp9pDggGEu/Td2xPN02v/6i5fwGsob
 t/A8rbtNIoPXGaYyIUjDz3CD7A==
X-Google-Smtp-Source: AK7set8+AvW6HbShBlVzBp1jdZ46ga8t1H349NxfTzy/m/mbYG2MVJlcklvPVo2vJ359/UjxNIf5Ew==
X-Received: by 2002:a17:902:e886:b0:19d:b02:cca5 with SMTP id
 w6-20020a170902e88600b0019d0b02cca5mr8581377plg.12.1677714213051; 
 Wed, 01 Mar 2023 15:43:33 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 q19-20020a170902b11300b001963bc7bdb8sm8959050plr.274.2023.03.01.15.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 15:43:32 -0800 (PST)
Date: Wed, 01 Mar 2023 15:43:32 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 15:26:35 PST (-0800)
Subject: Re: [PATCH v2 00/14] target/riscv: Some updates to float point
 related extensions
In-Reply-To: <20230215020539.4788-1-liweiwei@iscas.ac.cn>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 liweiwei@iscas.ac.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liweiwei@iscas.ac.cn
Message-ID: <mhng-0d453785-b4d3-46a2-ab41-6191c34f8b77@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, 14 Feb 2023 18:05:25 PST (-0800), liweiwei@iscas.ac.cn wrote:
> Specification for Zv* extensions can be found in:
>
> https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-zvfh-upstream-v2
>
> v2:
>
> * improve the error message for vector related check suggested by Daniel Henrique Barboza in patch 5
> * add similar simplification for check in csr.c/cpu_helper.c in patch 8
> * fix typos in commit messages
>
>
> Weiwei Li (14):
>   target/riscv: Fix the relationship between Zfhmin and Zfh
>   target/riscv: Fix the relationship between Zhinxmin and Zhinx
>   target/riscv: Simplify the check for Zfhmin and Zhinxmin
>   target/riscv: Add cfg properties for Zv* extensions
>   target/riscv: Fix relationship between V, Zve*, F and  D
>   target/riscv: Add propertie check for Zvfh{min} extensions
>   target/riscv: Indent fixes in cpu.c
>   target/riscv: Simplify check for Zve32f and Zve64f
>   target/riscv: Replace check for F/D to Zve32f/Zve64d in
>     trans_rvv.c.inc
>   target/riscv: Remove rebundunt check for zve32f and zve64f
>   target/riscv: Add support for Zvfh/zvfhmin extensions
>   target/riscv: Fix check for vector load/store instructions when EEW=64
>   target/riscv: Simplify check for EEW = 64 in trans_rvv.c.inc
>   target/riscv: Expose properties for Zv* extensions
>
>  target/riscv/cpu.c                        |  99 ++++++++----
>  target/riscv/cpu.h                        |   3 +
>  target/riscv/cpu_helper.c                 |   2 +-
>  target/riscv/csr.c                        |   3 +-
>  target/riscv/insn_trans/trans_rvv.c.inc   | 184 +++++++---------------
>  target/riscv/insn_trans/trans_rvzfh.c.inc |  25 ++-
>  6 files changed, 146 insertions(+), 170 deletions(-)

Thanks, I queued this up.  There were a few more spelling errors in the 
commit messages, I just cleaned those up while merging.

