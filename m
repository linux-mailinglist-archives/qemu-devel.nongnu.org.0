Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52BC34CDF7
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 12:29:16 +0200 (CEST)
Received: from localhost ([::1]:38256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQp8v-0001te-Uk
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 06:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQp7L-00018m-KL
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 06:27:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQp7I-0000Eh-Rr
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 06:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617013646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgjvXzM+TR5QIXlSjNkLN5M7V8Etri4+GLTMLtpeLiM=;
 b=ZrOxwKSX6a7zN9juqv/XTefn8A1qRuZ9aQQMeZ9TwmYO3XH4q8/vuVtkeNTKjAgWCA1JWQ
 NKdqnRRNaqAQAeUyvn8ObQ6pVCRE4A6iIfAcDq9eZjfcl/t0UgiVkUnGI5gmq7POuE+/jX
 dtS8VBG49JzKn7MpaysZzXADQVE85eI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-IOVrCbkDNJyp3ozSyx2LhQ-1; Mon, 29 Mar 2021 06:27:24 -0400
X-MC-Unique: IOVrCbkDNJyp3ozSyx2LhQ-1
Received: by mail-ed1-f69.google.com with SMTP id q12so8376832edv.9
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 03:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tgjvXzM+TR5QIXlSjNkLN5M7V8Etri4+GLTMLtpeLiM=;
 b=Hy6/ydBoc8dBWnfsNKwSvYA4A+laO77dT024K8zEKu2ufFGmLsTHwoAaWp27rC4ER4
 0bGrNlSl0UaOm4KZwAi8H76eCbKyI6IxXSTDWIAI1V1T/s+0ubuFDeIfVd3sz99TosXY
 qRzZu+b3bMw5Z+Vh6rcRWYxPjqind0JM6qtVL5AIEFRW2iEbtpe0/6jsbozL/OmEqhG9
 Hpb1sFnkDpM+2wemmvegBZg0HEH7UTtGwWMrNEwYs7tMfrX0FzgsW3/VTSi1vMjHP3Hc
 BNYfXoO4R1bEeoeRJmWrxa2Z0Xjq24ziDz4eWqoqfxSFilruEKJjhj/a0FAS60Kiiy3o
 piIQ==
X-Gm-Message-State: AOAM5310/LUe7feg2W8NKJi5iVikoF69rwlxQv1A2Pdj2ui0yfTd9n7/
 uyxAP8X383Bl1MTPp6DOAf3KQOkEWLCjw6DtzC9P7PhjnV347fDYXg8lNhIplMu4e18pTnasdSn
 s/01dZLxE+4/BWvM=
X-Received: by 2002:a17:906:86c6:: with SMTP id
 j6mr26743928ejy.197.1617013643437; 
 Mon, 29 Mar 2021 03:27:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVeo7magV6t/zxbRLf9IVf/+CC9xeVLY7Bf0XNuTqyAPeFiOpnq38Em2VG4j//81cra98qNQ==
X-Received: by 2002:a17:906:86c6:: with SMTP id
 j6mr26743915ejy.197.1617013643242; 
 Mon, 29 Mar 2021 03:27:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id l12sm8599011edb.39.2021.03.29.03.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 03:27:20 -0700 (PDT)
Subject: Re: [PATCH] icount: get rid of static variable
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161701335066.1180180.7104085247702343395.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e59b5179-081a-7fc0-919f-b1b0d0941241@redhat.com>
Date: Mon, 29 Mar 2021 12:27:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161701335066.1180180.7104085247702343395.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/21 12:22, Pavel Dovgalyuk wrote:
> This patch moves static last_delta variable into timers_state
> structure to allow correct vmstate operations with icount shift=auto enabled.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   softmmu/cpu-timers.c   |    5 +++--
>   softmmu/icount.c       |    9 +++------
>   softmmu/timers-state.h |    2 ++
>   3 files changed, 8 insertions(+), 8 deletions(-)

Queued, thanks.

Paolo


