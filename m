Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6518E35EA0B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 02:37:12 +0200 (CEST)
Received: from localhost ([::1]:52764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWTWf-0003iO-GZ
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 20:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWTU1-0003Bp-V6
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 20:34:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWTTy-0005NY-50
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 20:34:17 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so11566158pjb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 17:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0VJJRtMCw4yv6vk2vSydmfDD824sqEXfpvHGhKrZK+0=;
 b=r7KtNkpge7korRQM5h4MmAvXaF0MXfMvEzbgcX9Ay836q2HxLxTYfibeHh1KG1WWc4
 3+S6d0iE4ZKBJuWEZjMTniEMkqfOWZQaedzSmE+bFEot+KLGTcyzkV/fmJKSnFHu48iC
 83h1KGcFFvo2QcDQo3bV4QWMpFndD0mdAyWeDYp2RS0w8pKc32cX/choDOq/Bg2nYWCR
 jX2gYiA9Qm258SvoY/CXhUjpn9JVoIgK+4HeVz6ic1vAtseZk6ZlDiIzPshVAnpBOF1J
 v84XU0q48uD5jyONs/pm2qozO4aSsuL1tBEw/VttBelidICux5RZuNJwJ5HrldZieWL8
 +tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0VJJRtMCw4yv6vk2vSydmfDD824sqEXfpvHGhKrZK+0=;
 b=gfgzXjVFo6bvjqrcb7o3hC2RjzCf5exFKZBdK50/1H45WwTWEZGxJ2uXld7mOxVYtD
 /zMc4TyXjxFME6q02+r1qPXNqVD3EmLMdkWkd1zgMFiraJOJ74Y5vZDkwNnNwxqujbV3
 lGmL47cMfAPnlGX9loSfz/rj9u7qjU+EaJ8HTiaTDVxzujWzhAusGx6Bmd8JiaC20m3o
 KdytpWp+z+IXBs8ZYOe/tZwsNp2abpeVI3nZKer2n/r6DlTcR/kRg56EfgoItsA9Qs9r
 iwQBLBhvvjMPxqFcBN+sCW35LPDPepxk4jfGIV3fWFVXCUty2Tse7QdEN7dWAKNfS+ly
 0v6w==
X-Gm-Message-State: AOAM531iL2KAjeL8OCEuMnp+Utu28HvX2OQr2l8qRcr4gRCpIefUr66s
 FphSDmE1VeJQxxjENwBBoYBg9W3inFFerA==
X-Google-Smtp-Source: ABdhPJx80ugKpKbh6yqy6YoOFtwWWJCtEanxa+16A4XQDinpqjgBdEn04gyk17GykVRHRNCyhbraFw==
X-Received: by 2002:a17:90b:3b4a:: with SMTP id
 ot10mr470222pjb.48.1618360452360; 
 Tue, 13 Apr 2021 17:34:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z195sm12771736pfc.146.2021.04.13.17.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 17:34:11 -0700 (PDT)
Subject: Re: [PATCH v2] target/s390x: Fix translation exception on illegal
 instruction
To: Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210413165257.21426-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a307b2e8-3afe-230f-3b5c-2076f832aadf@linaro.org>
Date: Tue, 13 Apr 2021 17:34:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413165257.21426-1-iii@linux.ibm.com>
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 9:52 AM, Ilya Leoshkevich wrote:
> Hitting an uretprobe in a s390x TCG guest causes a SIGSEGV. What
> happens is:
> 
> * uretprobe maps a userspace page containing an invalid instruction.
> * uretprobe replaces the target function's return address with the
>    address of that page.
> * When tb_gen_code() is called on that page, tb->size ends up being 0
>    (because the page starts with the invalid instruction), which causes
>    virt_page2 to point to the previous page.
> * The previous page is not mapped, so this causes a spurious
>    translation exception.
> 
> The bug is that tb->size must never be 0: even if there is an illegal
> instruction, the instruction bytes that have been looked at must count
> towards tb->size. So adjust s390x's translate_one() to act this way
> for both illegal instructions and instructions that are known to
> generate exceptions.
> 
> Also add an assertion to tb_gen_code() in order to detect such
> situations in future.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

