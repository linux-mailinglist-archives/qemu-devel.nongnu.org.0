Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AC432ACC4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 02:42:53 +0100 (CET)
Received: from localhost ([::1]:42408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHGXM-0001SW-78
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 20:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHGVh-0000wl-JL
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 20:41:09 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHGVf-0005re-Ui
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 20:41:09 -0500
Received: by mail-pj1-x1032.google.com with SMTP id i14so3152069pjz.4
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 17:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XuXS3i4/XvdvIzCalOOMqX4RMKv+QgX664hm8rjO7Yc=;
 b=sdAv9ZqP/LZCYgCcJhMz7S4XcAiFRPTzalCF39BD8DLV9gMYS9poPHLHCz+AaN+JIW
 Cb2dir8OhSvgn5BpRz1BottrhVmskQOliAbJzPBj964z5FEuqS8Nl+Vm+buoGDiCyFld
 J5tPqF8bl44uThTTlaODpBUM2vo8Xy3FkNqzUNIlj+KZdl4dc+cxXBBW/IEp+5EIeDBh
 LWd/7EL9CeNKj9qU71PktCdctwfB2zuxPjhZK5LJtdcSsDrND36H0/rwLmMeIBD3RhrK
 i/J46c1Noeox4bCBpUPkLGH2vKnrJHvgRZQGoABAcobsXYcDZwqHnwWVNM5UbbtVYWln
 EgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XuXS3i4/XvdvIzCalOOMqX4RMKv+QgX664hm8rjO7Yc=;
 b=VLwUed0HsuWQlOXPaXGaRHD4Ru1WJts/FxrFOOjRvZVf7yR54R27bs1rP73/ggu4V2
 Q2dMMzMgHaRZT2k2HeBpw0DF9i0ioee9GZ4PIO2bkyhDgp9Q4CBiNg5XI2N5lZVJsjCk
 /5uDH1MjhLQQQF6jhxhDL339gPDmv6kK9wRoc+XnstyWQZh3PyJk7zqpHzQiIFWZ+jUO
 xHoVYihbiQrvTu4/SBVC/JjTOdIPGt2zYmAUt6mnEkw4jANRisAyhtMnhwfgRim7IVgy
 PAZM2WqlozCdmbLF8fTaOLFA0uLCxtIO72zkWZaUKpo5uOHhlPD9AQpsl9bsAe62d8Tm
 Q2mA==
X-Gm-Message-State: AOAM530/ZmWznVuRLfs7hamFWHg1hbgA2TCscVzImHg2WA2g3PHxMQ/q
 6w40htJtdLGDRN9nPxd/CHnRzg==
X-Google-Smtp-Source: ABdhPJwxwrAMuJmoqKkPQdrEHwq8rIest1m8ja52eWfPexB0pwQvL7RJGvOgghZj59xBGNNeV7hxeA==
X-Received: by 2002:a17:90b:e01:: with SMTP id
 ge1mr7399752pjb.117.1614735666639; 
 Tue, 02 Mar 2021 17:41:06 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 14sm22583471pfy.55.2021.03.02.17.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 17:41:06 -0800 (PST)
Subject: Re: [PATCH v2] target/s390x: Implement the MVPG condition-code-option
 bit
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210303013915.3122076-1-richard.henderson@linaro.org>
Message-ID: <40cd0a20-a4d1-998b-b0d3-b195b8c60201@linaro.org>
Date: Tue, 2 Mar 2021 17:41:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303013915.3122076-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 5:39 PM, Richard Henderson wrote:
> If the CCO bit is set, MVPG should not generate an exception
> but report page translation faults via a CC code.  Create a new
> helper, access_prepare_nf, which can use probe_access_flags in
> non-faulting mode.
> 
> Cc: David Hildenbrand<david@redhat.com>
> Reported-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   target/s390x/mem_helper.c | 76 +++++++++++++++++++++++++++------------
>   1 file changed, 53 insertions(+), 23 deletions(-)

Oh, I meant to say that this is untested, but is what I was
talking about wrt performing only a single lookup per page.


r~

