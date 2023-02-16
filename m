Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9641B6999F5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:26:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSh5b-0002NJ-6d; Thu, 16 Feb 2023 11:26:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pSh5Y-0002Li-Ic
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:26:28 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pSh5U-0000Ii-3t
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:26:28 -0500
Received: by mail-pl1-x62c.google.com with SMTP id k13so2607839plg.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=aUlUuI6gCBbBczCA9S8ssW5AtYfBSOSFqRzUBrPAfCQ=;
 b=5G9jFqJ0vg6KIONmR795Z4RV71RtAwJeAvknrPBhlR+V3hTJ8oBO04OPME+QfTEnOp
 2uFgpAItAVPIsYXEnOmDBRsKdgrsMXYm9JgpPFmLhK4CTMr+oWe1aa0wZTO3RTF27XsC
 Oe2NW762kSBEht9jMu3m25nskIBtv8NfW9JCa9S0Dld8WBPHe0GVswsxXhDuPoHRCAjI
 nRWtBJkYoY0YfVjbhUtyP4GiDGpjeVzMMqgxp2JFYLIg79kw7eaAwLFEs41k4GCBpIEv
 KSC8ZyVfr1f+kdbNXBjEwSVaXjZo+RC4eIETcTN9ggNw5s88fCXozwhrkwkIFWpr4QP6
 rqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUlUuI6gCBbBczCA9S8ssW5AtYfBSOSFqRzUBrPAfCQ=;
 b=4juE0cjaGxg79EGsslilP8r95meESQs4PnlAX3Myluu3Yt3IiVo7+eDjIYoElkhCcL
 0BpsqP0oXGLYBU/c/6WoKnLzklq8mNSF4V+cglWMw0P6Ff8tpwx8mQTDgCHnykqSX75m
 2ebKHxUc4fXfxt5EMcAd9/UkbcLT8JWjC2uVGdjhorWbo0vaEC+IfGDnhD3vHrJMmnd4
 CNU1Hr+bjLG/nv1b6jPzfrvO47j4KN4oB36AHO+vjct3rMTzcdw4/8ayGut9tz8qM3eM
 csUdATFhd4ZqvQ/+u6/A8ALDzuyK8eANnOIrtgNBqPdVkdDh4fLYX0Bs41/zoDfcYIko
 AIag==
X-Gm-Message-State: AO0yUKWxuI4AIQeyIZptdowUcVjvWld5ZzKd4BRlMuyWxtsu5qfTCLLX
 9HjjUnqSU4KziQuT9UnJkB3pFA==
X-Google-Smtp-Source: AK7set8pCOyz59jJJBQHx7AVtU+FXFb4Uw8sgoDY4WJpwLF5OcLN5n2gM6exLMjH9XLTYTL17DBNkg==
X-Received: by 2002:a05:6a20:8e10:b0:bf:6cd3:9510 with SMTP id
 y16-20020a056a208e1000b000bf6cd39510mr7202266pzj.24.1676564781797; 
 Thu, 16 Feb 2023 08:26:21 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 a13-20020a62e20d000000b005906dbf5f80sm1490154pfi.163.2023.02.16.08.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:26:21 -0800 (PST)
Date: Thu, 16 Feb 2023 08:26:21 -0800 (PST)
X-Google-Original-Date: Thu, 16 Feb 2023 08:25:38 PST (-0800)
Subject: Re: [PATCH V2 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
In-Reply-To: <Y+znStpBMx35sSop@sunil-laptop>
CC: dbarboza@ventanamicro.com, Alistair Francis <Alistair.Francis@wdc.com>,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 ajones@ventanamicro.com, 
 apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunilvl@ventanamicro.com
Message-ID: <mhng-53c89287-c232-4852-94bc-b060a336c60f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 15 Feb 2023 06:08:10 PST (-0800), sunilvl@ventanamicro.com wrote:
> On Tue, Feb 14, 2023 at 05:44:44AM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 2/14/23 00:43, Sunil V L wrote:
>> > On Mon, Feb 13, 2023 at 03:48:04PM -0300, Daniel Henrique Barboza wrote:
>>
>> Nah. Doing that now will make this series rely on acks for every other ACPI arch to
>> push the RISC-V side.
>>
>> Let's make this happen as is now to get ACPI in RISC-V working. We can think about
>> reducing overall ACPI duplication later. IMO it's enough for now to, mention in this
>> commit msg, which bits of the arm64 virt-acpi-build.c you changed for this RISC-V
>> version.
>>
>
> Okay. Thanks!. Will update the commit message and send the V3 soon.

I'm checking up on this one as I don't see a v3 on the lists.  No rush 
on my end, I'm just trying to make sure I don't drop the ball on 
anything from the backlog as I'm catching up.

Thanks!

>
> Thanks
> Sunil

