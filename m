Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA583E8755
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 02:43:35 +0200 (CEST)
Received: from localhost ([::1]:34990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDcLG-0001JY-Rl
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 20:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDcKT-0000ST-29
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 20:42:45 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDcKR-0007t2-SG
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 20:42:44 -0400
Received: by mail-pl1-x62e.google.com with SMTP id e15so387484plh.8
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 17:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GM+f8XeMoSnD+5PmL0D004m9xFw8hfrDaXXDDKMmBv0=;
 b=i3kEOE8L87gGMxcM6Fca9+dx6b69Vj/D5BzWgyuBSq3SDClEvwynCqiJThwEiqNbHj
 cDUsNI8H1CyUKAoPJnFipDxJ7TDSUM++GGVAmg8R6wl8cr7l2Zux7IzBc9l36dgpax/9
 U+NjOSzqfB6iEHsbT5BWOxDqkJ9l3cwbPVtNYcS17C2B2be7tWeP+ITvooxWKbABnHEl
 ag81C422BtD6WSGTWvxbGdkceewob+RjgPca1LISykLRXn6kdjiii3KSEnKEUGXoWzRC
 pVGOc5KVkkmAIiSb4HjpgPQHKgGOOW+RJ42a0ALmy5lYoWiFzfPuM/VS9Qk1WzxCQMO/
 hzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GM+f8XeMoSnD+5PmL0D004m9xFw8hfrDaXXDDKMmBv0=;
 b=nL6I6qMlZiNVclBjvxJ4pK9xOEKV2m9an0oBEdGnSeNnJlHwnLFUB3bFPUxyb98rof
 kQL+/3rKbNq+U2pAk2OWuRC1Z95M4U+28DXB4/i2M4rD2PiTkhZJE9e5NP5/9ZB0+g02
 gmLaACADP/jdS0NN7gj6qGF4F0AMXeRNxeucfRzWUNPZx92YF3qSW3HKFSlXac+ngaBF
 V0Yc6UfPgTz0TUMVu9BMtkU5GCh27ARr09yfv2UpFQBzWRQF/X8tAMTmyX896fSwL8vw
 XhQcOnjXA08hCECJ+aOfGQFT6qxMB0eVRhisxdnbypOjSw9+MCEzcBycXJ4m9hjmSIeN
 p9bQ==
X-Gm-Message-State: AOAM533dbqEoBaR++vLSLh4Mcu1G0d0x+tiykPNXArNv3/1i/5KWUcJK
 Z3RQg5icnEADeKzeUvG/XzOzxA==
X-Google-Smtp-Source: ABdhPJwfd3HO6BoQr09kbNFW8hWIKv2xQAQBr4UDq2AV11eUNvLcP6WdUHXKyx7i7z4xCElIocQdLg==
X-Received: by 2002:a63:556:: with SMTP id 83mr112501pgf.1.1628642562302;
 Tue, 10 Aug 2021 17:42:42 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id 10sm25254929pjc.41.2021.08.10.17.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 17:42:40 -0700 (PDT)
Subject: Re: [PATCH 09/19] PPC64/TCG: Implement 'rfebb' instruction
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-10-danielhb413@gmail.com> <YRH3dJG5iKPGvrel@yekko>
 <df15bc5c-ee71-9cd2-bf20-77da9ec7cc11@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8acd7563-da86-f1e2-180b-5d20b4de44a2@linaro.org>
Date: Tue, 10 Aug 2021 14:42:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <df15bc5c-ee71-9cd2-bf20-77da9ec7cc11@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 9:32 AM, Daniel Henrique Barboza wrote:
> I'm not sure what is the disastree path.

David meant decodetree.  See insn32.decode.


r~

