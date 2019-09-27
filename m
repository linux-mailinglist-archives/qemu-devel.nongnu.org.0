Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1190BC0AB6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 20:00:41 +0200 (CEST)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDuXn-0005Vw-RX
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 14:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iDuVn-0004Jg-8O
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 13:58:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iDuVl-0002qg-UG
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 13:58:34 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46881)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iDuVl-0002qL-Ln
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 13:58:33 -0400
Received: by mail-pl1-x644.google.com with SMTP id q24so1374207plr.13
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 10:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4H2CEP14SRDjt9nqGH0C2aQdbk4YpfFex1mFVZk3ts8=;
 b=idDP7l4bN8byur/rz4A+EM3WCjaNDFOVs80C1hwLdPyCPWnHb7KJKhMUpGmCDpGSJ+
 GL0laHu7LuDZOLuwoZxoUnhaD0VmwpY6uZm3429V00PuzAhpuFKrPd+fYRN4yjvyZmoq
 7VBP87VWHW09cL+9wKQBENmRnxz7x588zKI+i3wjJ6r19AKDjRgxV3Rr4Ui0xd5Ntrtm
 +wnubmJBsIgzqiRH91MkdFwA+OyXGW846JSd88FQxmvBXclIlOjgfHCA376e6xGkbahH
 anH50/xQZ1m2VaLCsCDMqqHeQqZCKdTiCd2w7aTwF4XFtoItjc/ghX+S8PvlD3/9SaJz
 jhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4H2CEP14SRDjt9nqGH0C2aQdbk4YpfFex1mFVZk3ts8=;
 b=WmsOp86ZvYvt8jN+yA0Mu5UUL0Xul2wXeMD5Ts3fR+eTrt3cCbOeLTJhw9gZNqjh1V
 AYTxzrxsMlH2HQX249RZ5K3cvvD8rkwG1FF66/uwA/n0aPhKurEaPCzmKVa7xvmdyBTv
 BwscF9kzphy/DL7AAeSPyq5F9DihXg2d1xMYlr2SIeeANTengcT35wprfqiM/mzXVDz5
 DgjF9GAbLoEo04jdrnDpY5p2ltq29SRTSAKstqXxTgarareJoXiYhRhk8ntBU1T9CdnQ
 18VwY7mlrjHz2huEFRuoNcioxgwjlmXJ2v/4NeNd7LOk8CeQtEsAydQ8JEvZIxAl8sl8
 Pb9A==
X-Gm-Message-State: APjAAAVMbWneEICYt2jRGjJ5zkjs9MT79Kzr59f0wgzIR9e2y7FYru6R
 LsFnvyJPlftmLMaJC/rZdJKZmA==
X-Google-Smtp-Source: APXvYqywwBcDSxowb9eGiLFVBqp0QdiPhOLFS0t5w8P/BQYpfBqQgszwGBDH32REUFOTn78zS06uXw==
X-Received: by 2002:a17:902:fe12:: with SMTP id
 g18mr5857366plj.97.1569607112387; 
 Fri, 27 Sep 2019 10:58:32 -0700 (PDT)
Received: from [172.20.32.216] ([12.157.10.118])
 by smtp.gmail.com with ESMTPSA id n66sm3108349pfn.90.2019.09.27.10.58.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 10:58:31 -0700 (PDT)
Subject: Re: [PATCH v3 4/7] s390x/mmu: Inject PGM_ADDRESSING on boguous table
 addresses
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190927095831.23543-1-david@redhat.com>
 <20190927095831.23543-5-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ac6370a5-8dce-aa64-6e24-e3214014de06@linaro.org>
Date: Fri, 27 Sep 2019 10:58:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927095831.23543-5-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/19 2:58 AM, David Hildenbrand wrote:
> Let's document how it works and inject PGM_ADDRESSING if reading of
> table entries fails.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Typo in the subject: "bogus".  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

