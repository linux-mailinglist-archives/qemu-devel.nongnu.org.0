Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710E83278DD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:06:44 +0100 (CET)
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdZj-0003pj-GS
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdX2-0002mm-P2
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:03:56 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdX1-0002RJ-9h
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:03:56 -0500
Received: by mail-wm1-x32c.google.com with SMTP id u11so7321558wmq.5
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 00:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KsvH5GvtEttcttTk9hbRnRHAoQfZPWjRw2UC3EDJcC8=;
 b=gvE/cjA4nu53G7VXJebmU9OLOcsDPil7an5YIfM4rKilw+D0+3NIgY3167Uw61+ME0
 ullsTFPHJDMWbqZWXT/D4iGmdRQ+m8SjJRc3Het3A7WCFd72M2bQ+ZIeCA61o1U1+GST
 lxeYVePz0pE4kq+r+PVu/UGMII1fe6c810B1O//9hdIgtqdViUDHc7MBdMElC0EGozsX
 DnyLBKMaEaGLVPiJ4dyTAuU+jYkLcCLqVCuwPWYQYFyon+Hz2clsD/wh3sI+D9dwvfpi
 irzVC+gqAP14mKezGNSiNXZGKipS9WOgnoU4P6ujbl94XeZTVTdKxekv7wX0VEv6Dk56
 61aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KsvH5GvtEttcttTk9hbRnRHAoQfZPWjRw2UC3EDJcC8=;
 b=BiPCRA/R4XAL9s9ROtOxpU5kPsDsKHXYFvyOhmS8psP3wkXAx8wz9FCcPCAEtKV5k/
 HaAilq5LJnZnQU9seCVoir8ZJ5qKx+ouDmpW48ENyKl7a3SUpzQnH+62et3/1TBnDO/u
 8YKr5A+wet48nBd7c1j5XZXjHhGuMjWCgdolJ1Yq934GZ5GFdiLYGEq3RgeWp5KMp6Pi
 iGQB+XDbd18uBFRF+A3LK5mvaH6+D6SDO72mM5r1Bi62ocJUV2moiuAkF8D0/4U7rM3y
 XJPN20q7YuB+stC1QjxkSTJcXhs1LgGFsDxNDe8s3REFENaimNXt7J5fxFaOpa/pAztZ
 T5RQ==
X-Gm-Message-State: AOAM533v1I1xoPCRku+M5S3hHnaFWd8Dh7ukW+2RQD1kdMoKoyhLrLF7
 2Y9HWTVbLsfqsOhbtTdktDw=
X-Google-Smtp-Source: ABdhPJxEybaakT5ZyfMgfGHfYTVJFqiFH8d1Y61WYD6oNHfDKBk5ofLSI7vn+OMTQWfreoPmAzflBg==
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr7882881wmq.140.1614585833987; 
 Mon, 01 Mar 2021 00:03:53 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l10sm22867134wmi.10.2021.03.01.00.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 00:03:53 -0800 (PST)
Subject: Re: [PATCH 1/2] target/mips: Fold jazz behaviour into
 mips_cpu_do_transaction_failed
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210227232519.222663-1-richard.henderson@linaro.org>
 <20210227232519.222663-2-richard.henderson@linaro.org>
 <8102bde6-d2d3-0058-dddb-db295ce5bfac@amsat.org>
 <e5f80cc6-7302-93eb-9dc5-d92811b74997@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6d3b1ad6-bf7a-d653-5ee6-22565072c925@amsat.org>
Date: Mon, 1 Mar 2021 09:03:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e5f80cc6-7302-93eb-9dc5-d92811b74997@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 10:39 PM, Richard Henderson wrote:
> On 2/28/21 8:14 AM, Philippe Mathieu-Daudé wrote:
>>> +    /* Used for the jazz board to modify mips_cpu_do_transaction_failed. */
>>
>> Isn't it possible to have other (old) boards doing something similar?
> 
> It's possible, but I doubt any need to.
> 
> I think the comment in hw/mips/jazz.c is correct, in essence.  That we're
> simply being bug-compatible with older qemu, and that 

"... we don't know if ..."

> real jazz hw does not
> discriminate between instruction and data loads.
We could figure it out by suggesting a test to linux-mips list,
one subscriber still has a working Jazz board.

