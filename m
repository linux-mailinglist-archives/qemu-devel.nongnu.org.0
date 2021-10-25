Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F41C439888
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:26:55 +0200 (CEST)
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0w9-0005uZ-UZ
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mf0po-0007lj-Q7
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:20:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mf0ph-0006ZG-Cj
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635171612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AFbM5pRwXG4nRAiTXGscgxylnJj+7VgCqzDtN/oGafw=;
 b=JucVqOdbZXSv1LLWxRybJ+17rOeR4F3i9V+V4iL/QaYstc+ZrjXKQ1lse+WNeHWVisHrPQ
 7q1IibmaE3eOpWwS9i0v8kGYSq9H9Hk6YqmT0yC+ULOQkqvcD2Z/0UwAef4juzgnX49/sT
 CC7sF17ACvVXR9V0Arr9MXSZnfuP0DQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-4lVUmfojPJSBViiGBjx8cg-1; Mon, 25 Oct 2021 10:20:10 -0400
X-MC-Unique: 4lVUmfojPJSBViiGBjx8cg-1
Received: by mail-wm1-f69.google.com with SMTP id
 d73-20020a1c1d4c000000b0032ca7ec21a4so257900wmd.1
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 07:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AFbM5pRwXG4nRAiTXGscgxylnJj+7VgCqzDtN/oGafw=;
 b=pSC6WH6XbUSEOAW+vbFtx7y7jQzZmylaTqokbdvTJ920ViUkctzNseAxqPFtqgrisz
 Kj9vggi/8OFSKNIiSkQFazel4+bd8is8mmUzl+mre/BD/do0xpl6PWP347gnr4rX0F7x
 6VDOHSuhmuzALZloj5FZPxVMYYqzPfN+jh0SZY+rhwIf1DUqcoDxtz9sLM3OAwXUa/uj
 0X++OHglFIGfEv8kOMvDVm05KBxbHl5ITm6J8U0ZmNclu8GFlxPUbWKwSwuMlXa76CrW
 l8boelTrlMkfh5dSzfR56aJGHg2Hp33Wn1NtVgioaQu/Xv5MXlw19JedM+D06XmIyBVa
 X2/Q==
X-Gm-Message-State: AOAM532qmR81zF0kCbmjrho07dINE+1pH+VNth1yP6c0G0MDB/xP6I6/
 WRqRr1NfG1T2atpi47H9pJPp7f+dnfKgL2sdn2uUpQ9lfGzr2kgaP/g6ruQG0b3iOzCZWqh7VFY
 cHTx5fliPFmdRlYQ=
X-Received: by 2002:a05:600c:4c17:: with SMTP id
 d23mr2505963wmp.117.1635171609543; 
 Mon, 25 Oct 2021 07:20:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGQIntsYyV9FEHOq+uftlH7SZEXcDpYYV3TDns8QKf82rDHRMq5v5o1XYQ/VecR6Ll7HSOGg==
X-Received: by 2002:a05:600c:4c17:: with SMTP id
 d23mr2505930wmp.117.1635171609272; 
 Mon, 25 Oct 2021 07:20:09 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x21sm18969126wmc.14.2021.10.25.07.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:20:08 -0700 (PDT)
Message-ID: <c948a4d6-9051-a616-ec3f-f9cbc123161a@redhat.com>
Date: Mon, 25 Oct 2021 16:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC 0/2] tls: add macros for coroutine-safe TLS variables
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20211025140716.166971-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211025140716.166971-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng <fam@euphon.net>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Richard/Peter

On 10/25/21 16:07, Stefan Hajnoczi wrote:
> This is a preview of how we can solve the coroutines TLS problem. Coroutines
> re-entered from another thread sometimes see stale TLS values. This happens
> because compilers may cache values across yield points, so a value from the
> previous thread will be used when the coroutine is re-entered in another
> thread.
> 
> Serge Guelton developed this technique, see the first patch for details. I'm
> submitting it for discussion before I go ahead with a full conversion of the
> source tree.

Beside the point Daniel raised (shared libs) this sensible
approach LGTM.

> 
> Todo:
> - Convert all uses of __thread

$ git grep __thread | wc -l
55

:/

> - Extend checkpatch.pl to reject code that uses __thread
> 
> Stefan Hajnoczi (2):
>   tls: add macros for coroutine-safe TLS variables
>   util/async: replace __thread with QEMU TLS macros
> 
>  MAINTAINERS        |   1 +
>  include/qemu/tls.h | 142 +++++++++++++++++++++++++++++++++++++++++++++
>  util/async.c       |  12 ++--
>  3 files changed, 150 insertions(+), 5 deletions(-)
>  create mode 100644 include/qemu/tls.h
> 


