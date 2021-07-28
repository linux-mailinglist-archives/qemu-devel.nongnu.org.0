Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CF53D9581
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:47:48 +0200 (CEST)
Received: from localhost ([::1]:39636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oap-0005wJ-KY
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oUG-00073p-PW
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:41:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8oUF-0004Jt-B6
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3iH27NbZMfOFgit6q/k8WUrYhL1HTRng3/IhI8CsWw=;
 b=bzqvpS+wvX8Qe40b89BAaIbmKqceWSIrX/Uvew60wDMIYkblgLacepnGWGUvu5P6ltcye2
 OrQNETFTy1hrwgAvULJpobWB5LWT8EEfo5NhybSZja4NsScYZSsEPlGK+e/d5rlkGQk0Qf
 Cc/ugTrWn+qnxbRJx6CyPTuvzgGFLHw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-00lQrzxlPjyLuv-843WOtA-1; Wed, 28 Jul 2021 14:40:57 -0400
X-MC-Unique: 00lQrzxlPjyLuv-843WOtA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so1274131wrl.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h3iH27NbZMfOFgit6q/k8WUrYhL1HTRng3/IhI8CsWw=;
 b=FmjvL2M0Dh5mSpp+XH9dx552xK4QKLxymIXXIkQrhIdT/9Zo9eZuVVOw6DHYwCLtPw
 AYvRtjYS5kQXZRqfLrhvwhiCmNEpatHWLr5eqfN8WRPyaEm0XRWCTH1TBSTDXBWWfXPd
 saIxX7d916D2Zt5UqoEdasnihiiq2jP8k7wL8iBw1Sg69mBhL6olXEvW86ccvnFCShhB
 /VSCuo9Lut7xRGdD/mBKhL8kUV3VxMeabtYsNVx5TjsMIfjvWqhCceK1Da2Hjw8lQQOV
 HvE3PPOB1Ys2io1ht7/gFVSYvrMlZ9ULYIcggsl50Ed2+5UhXKnM511IUZnIJZuGdkZo
 NIFg==
X-Gm-Message-State: AOAM531DjXgcgXUIrEgKy6tWcT390ivvPJRpiFsRTZqFJ+y7kKA8AsL0
 AefiDyhtXH7PR2IgRw7tTqf2JCkebqXOQmnY/aqL7RrALfKhmO7dlJsXtTih84n4eQNdQfj1rOP
 4SRY4KW6A66fz4TA=
X-Received: by 2002:a05:6000:10c3:: with SMTP id
 b3mr737107wrx.271.1627497656229; 
 Wed, 28 Jul 2021 11:40:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhhAMN0XoDctF6HN3hUvvRHurWYblEzNfnxiI3JY8PXoOKdlo9H3CO3AasLOkFgjkifVDZMA==
X-Received: by 2002:a05:6000:10c3:: with SMTP id
 b3mr737103wrx.271.1627497656129; 
 Wed, 28 Jul 2021 11:40:56 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id n17sm7585331wmo.18.2021.07.28.11.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 11:40:55 -0700 (PDT)
Subject: Re: [PATCH v3 1/8] cpus: Export queue work related fields to cpu.h
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210728183151.195139-1-peterx@redhat.com>
 <20210728183151.195139-2-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bb1ba9dd-a8f8-4579-9c41-2fdbe3f572ed@redhat.com>
Date: Wed, 28 Jul 2021 20:40:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728183151.195139-2-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 8:31 PM, Peter Xu wrote:
> This patch has no functional change, but prepares for moving the function
> do_run_on_cpu() into softmmu/cpus.c.  It does:
> 
>   1. Move qemu_work_item into hw/core/cpu.h.
>   2. Export queue_work_on_cpu()/qemu_work_cond.
> 
> All of them will be used by softmmu/cpus.c later.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  cpus-common.c         | 11 ++---------
>  include/hw/core/cpu.h | 10 +++++++++-
>  2 files changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


