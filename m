Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54CF394194
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 13:03:05 +0200 (CEST)
Received: from localhost ([::1]:60084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmaGe-0007mo-Dz
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 07:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lmaFB-0006xH-IF; Fri, 28 May 2021 07:01:33 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lmaF7-0003dn-28; Fri, 28 May 2021 07:01:33 -0400
Received: by mail-ej1-x62b.google.com with SMTP id z12so4837536ejw.0;
 Fri, 28 May 2021 04:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vrL90qiCAXqj+QeSzDm2v8qXMjMpx50hwGesSoeTUoE=;
 b=f/Y3qEGDqB9Mu5bu0jHWufR2Dv51sdYlO3ELK7gEq08VrMJixt+dlrBstydeMXJ9fV
 3WIFIGbiztkNfy0hEzNVVjF9VbPXGQfrprvoDCZXgt6bydqXmJAF6zMv4SbRBKXiYx3h
 lBdthon2V4GyhwIhDbK19kRU2F1Lk3+dDZ7VaCVcm4ZTdLRK691OyFR9SYpb9ryBjiri
 JNhoLUHPY9a81KLQa3va6ROzdwXhYFsX9U1BfaAI56zfkU94TBHSTmWnihGvqdThIiK4
 Bo2y87uFsWNCBd0eZl88a6zOGLQ3Dax7BGhWoUmTTkOT0Uk3n4X7gZo7zlvRZ/7P+vOR
 KxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vrL90qiCAXqj+QeSzDm2v8qXMjMpx50hwGesSoeTUoE=;
 b=ijOmlH0hs3Wfeqf44ugUigXdYpUFZipidUtU0ZO4Z/U3kUfhzfY0qgkZHOOzy71/r4
 1B5O4KaenGzc7b/Xod0bnB7XzvJi+3q3lRm0vtT4nIyDOPe9s/4+gPWbS8PYOmvpna50
 VvyTRXfSQo5FqaSNaV0Jsdk9MFm76EQ1c2YO/LJd6tHsMc4W3y0kdKZ4Eued8BPj0xv2
 X6M7f2iUoCSX6i/dILAfFPUDHN064+kHTOypg8FwVKUydmzEYPx4whj+rICbI9PW3G12
 fJnvzgsJnWTmYSw9GgYj7Nxo217OXX+1COoYQgDRDEbW+4+G0q6/P6YcyWvQSUXj3fwx
 QWdQ==
X-Gm-Message-State: AOAM531vVgdHdgH9OObwCI67tpDZFnaDB3RVSumZ6xN1Z00Pm+1+sR0p
 lTnRGq0Y524E5AGjY7Z+OmVCWC3LCCVQtg==
X-Google-Smtp-Source: ABdhPJzG/DTeRHj+fbVqMA51DVPYnJAVr4mJD8VgdsUpyp2K6GRt66Rr7kI1QbpVgW5IqVHZqIdj+w==
X-Received: by 2002:a17:907:7848:: with SMTP id
 lb8mr8643252ejc.494.1622199685070; 
 Fri, 28 May 2021 04:01:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id h2sm1906975edq.61.2021.05.28.04.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 04:01:24 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] block-copy: protect BlockCopyState .method fields
From: Paolo Bonzini <pbonzini@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-8-eesposit@redhat.com>
 <404e2891-9c03-bc7d-2c69-a572422d7804@virtuozzo.com>
 <4403ee17-0c12-c545-7f64-683bb9057b91@redhat.com>
 <c4ba5232-79cf-6534-d76a-ac5eaebe098f@virtuozzo.com>
 <db0d5d2c-2e7c-ec33-b9df-52977fc3179c@redhat.com>
 <47ae4243-5a4b-e3a5-44fb-48c689f8bc77@virtuozzo.com>
 <867d0357-1032-f56d-dbed-bd646ce8ec00@redhat.com>
Message-ID: <fc91616b-9d6f-dfee-d648-30828a13c1b8@redhat.com>
Date: Fri, 28 May 2021 13:01:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <867d0357-1032-f56d-dbed-bd646ce8ec00@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/05/21 12:24, Paolo Bonzini wrote:
> 
> It's still more complicated, because you need to add some kind of
> 
>      method = s->method;

This would even have to be a separate, one-line critical section...

Paolo

>      ret = block_copy_do_copy(..., method);
>      if (ret < 0 && method <= COPY_RANGE_SMALL) {
>          method = COPY_RANGE_READ_WRITE;
>          ret = block_copy_do_copy(..., method);
>          }
>      lock();
>          if (method == s->method) {
>              /* compute new method */
>          }
> 
> which makes it more complicated than this patch IMO.  But yeah at least 
> it's a viable alternative to the atomics.



