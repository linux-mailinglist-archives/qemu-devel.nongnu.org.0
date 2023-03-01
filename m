Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5DF6A77E0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 00:44:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXW70-0003kh-TB; Wed, 01 Mar 2023 18:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXW6m-0003hi-Rq
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 18:43:41 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXW6k-0004xR-Fh
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 18:43:39 -0500
Received: by mail-pf1-x429.google.com with SMTP id ce7so9039303pfb.9
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 15:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677714214;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=GEzmUCJmkMM7GREo/h2A9xpLp4g1Pz5LZx9y9eJpD6k=;
 b=pcKU8SsEzCHW6b09X30a02zcmTEjh+qSxlo9k+NaKfbh6Bfx+u8CzDgRXzQXjdmbHy
 jsjUuzYX5SM+XsY2t6C4CTEnedOGnkSJOodUHDmn3u3vK9m7CeL6+NnxGq6DVJ8WA73h
 DQiU1KUR//EBsHAKrJOW+95LH5z5s1xbNDlQA9HoEyqEFZ4zE4a/Y2ChT3436zvUS3Tj
 vAkyDkYL+z3T5bKf4Lj4dH5U/noTlqTMGvUfpk1BI6N4oryYVKpVCK7GCbXnkMgEKG07
 jdtdsqOL2RrUG674xKRZnNDsqerH5xfk3z0HzvApW59uG2XZXDJjdIiYgeQRvabF2CQS
 R89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677714214;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GEzmUCJmkMM7GREo/h2A9xpLp4g1Pz5LZx9y9eJpD6k=;
 b=pGmpogUhixp6Y3br9hjLb+80LFPmU0PY30n1OlDBS++y0ZkMlCol4rjD1y6NzjGxlw
 /If0f9TC6WYTptWKg7nC0SJUAdH3IImyV7QR48uzXJUJv0VYYcThosfYgixgRJMj+Bf6
 IjELXWWeIo/eoQj4A5n53yo88rKlfOEASnK/pdURr62cEcklnXuSONGU6GQBp6LgQXVC
 O8QQ0zq50baCgDol3RE7SPxr3oN0P2/6nRc6N35aG3joEwOHuF2qetqCm50WDcsyapVg
 GZvDDglf3m9jKadkuNmhPPEyDxGW3CC+29h7+TgrIZNd+Ei8S5YDpdK+Egv2xBNt57Dz
 ryAg==
X-Gm-Message-State: AO0yUKV2kKMk0ZxlHRLZLTiven3sh1M8qoxuuJBI0m+R7jW+NmDa+7C7
 IsYE/ojuPLxmsFb6gVAXb56mqA==
X-Google-Smtp-Source: AK7set8wq0zNCbhK+v563PTUbasBOaHgvi5jzv9sBPmOYz11Hzhj5eeLx6nxH8MI7jAczfrRPnWooQ==
X-Received: by 2002:aa7:8f33:0:b0:5aa:464e:8c46 with SMTP id
 y19-20020aa78f33000000b005aa464e8c46mr6720283pfr.22.1677714214289; 
 Wed, 01 Mar 2023 15:43:34 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 w3-20020aa78583000000b005abc30d9445sm8398002pfn.180.2023.03.01.15.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 15:43:33 -0800 (PST)
Date: Wed, 01 Mar 2023 15:43:33 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 15:41:02 PST (-0800)
Subject: Re: [PATCH v2 05/18] target/riscv: gdbstub: Do not generate CSR XML
 if Zicsr is disabled
In-Reply-To: <CAEUhbmWtg8+V44h7xgtggcORLww7kCv60DX+r3XYFTOrgzMtmA@mail.gmail.com>
CC: zhiwei_liu@linux.alibaba.com, bmeng@tinylab.org, qemu-devel@nongnu.org,
 liweiwei@iscas.ac.cn, Alistair Francis <Alistair.Francis@wdc.com>,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <mhng-4de827d1-bce4-4e30-b5d3-cd9e61e4b4db@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=palmer@dabbelt.com; helo=mail-pf1-x429.google.com
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

On Wed, 01 Mar 2023 01:55:34 PST (-0800), Bin Meng wrote:
> On Wed, Mar 1, 2023 at 5:52 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>>
>>
>> On 2023/2/28 18:40, Bin Meng wrote:
>> > There is no need to generate the CSR XML if the Zicsr extension
>> > is not enabled.
>>
>> Should we generate the FPU XML or Vector XML when Zicsr is not enabled?
>
> Good point. I think we should disable that too.

Seems reasonable.  Did you want to do that as part of a v3, or just as a 
follow-on fix?

>> Zhiwei
>>
>
> Regards,
> Bin

