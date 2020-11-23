Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1452C05C0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 13:29:57 +0100 (CET)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAyi-00040r-LF
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 07:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khAxB-000274-Qu
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 07:28:21 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khAxA-0002h1-6F
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 07:28:21 -0500
Received: by mail-wr1-x432.google.com with SMTP id l1so18376365wrb.9
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 04:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=thCSI8aL6Q1vKErpf+S3MalsJy4Ati/oCClpmrCGQb8=;
 b=Jyl5ml760yya1qYQZ+5EXSSdE4RflY1JrJwmdyE6Vm5sE4Jh5I3ptNDfnTf1xWara7
 IwgdBUImpbNHNucEh8D/vJWnwbv2PC7F7a5ynEbfKniC8cW1vdWB9/FnJcggqjbzCOLG
 /7X88yu1qDamhrjrXzkppatTuWtgyVjSXQ8o7UzR8GVlD8whb3G6oMXlVTcOGwYrgqrc
 yTfMNUY7jojaEFPpemoDahAkxi3W/m8jAlMU233bl54LAsFlpLgAAGKwdU2kBiz51GlN
 ehOOJr9pYtkkIv46c8vXEMm4EPtbx/jrp/Zfpm6mqFAp1ziuTWGpV86qx2nKMWVok/2o
 8VsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=thCSI8aL6Q1vKErpf+S3MalsJy4Ati/oCClpmrCGQb8=;
 b=LE5dSmApbi9yuAl9rzRsP6qxWUNqCKtZrLGYpZjbeU1c30m9nAn7tQNCKo6xFBeGkB
 4dp1/SfFlTwJviUecsAlHgSGmjJj8csqWORikb7cY5No32dhVli2IHaSnhyRUounGAgo
 7B1K/AzSh5X56U7wXz+w33j81glEqJBIoZINRt4DfHBbkOJVrxszu73Qy9nHxoHNbpVE
 q+3Zw4Yw575q9UUMl80GMSNNXYIuqvLzwyCjVYuxzyYcQpmAnMamu83KetDH8vyCynpv
 YlPpbDRx02LsFnDDd/00L7ZZx6Ys1g9t+lxhClDqy71Q0IYCpvm+E7+cOiSni5LiWvZM
 Z2tw==
X-Gm-Message-State: AOAM5302WabSPXCoeGUbaL7l6FNue3zpHwRQTj4TzrexcYPACEgBYnLz
 0hhWhPNxqKqOJ2cvcEkh9Q8=
X-Google-Smtp-Source: ABdhPJxIeKMIxIh3pdXE3tyXDTdjEg6ETHZ+Qj4gm6qqBVB1qG/T+C9usPZH0zwBuuzwGRf3sgaCBQ==
X-Received: by 2002:adf:93e1:: with SMTP id 88mr29448210wrp.37.1606134498468; 
 Mon, 23 Nov 2020 04:28:18 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id s13sm2954630wrt.80.2020.11.23.04.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 04:28:17 -0800 (PST)
Subject: Re: [PATCH-for-6.0 0/2] exec: Ensure variable page size is only used
 with TARGET_PAGE_BITS_VARY
To: qemu-devel@nongnu.org
References: <20201104093534.3064440-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f2f08e47-9f9b-690a-04d7-2afe3277ea3f@amsat.org>
Date: Mon, 23 Nov 2020 13:28:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104093534.3064440-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 11/4/20 10:35 AM, Philippe Mathieu-Daudé wrote:
> Simple patch while trying to figure out Fuloong-2E 16KB page size.
> Better safe than sorry =)
> 
> Philippe Mathieu-Daudé (2):
>   MAINTAINERS: Cover exec-vary.c (variable page size)
>   exec: Ensure variable page size is only used with
>     TARGET_PAGE_BITS_VARY
> 
>  include/qemu-common.h | 4 +++-
>  exec-vary.c           | 4 +++-
>  MAINTAINERS           | 1 +
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 

