Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9736452A513
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:39:35 +0200 (CEST)
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyMI-0004Ys-Jt
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyAj-0002JN-Oz; Tue, 17 May 2022 10:27:37 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyAi-0007qW-8W; Tue, 17 May 2022 10:27:37 -0400
Received: by mail-ed1-x52c.google.com with SMTP id er5so9124726edb.12;
 Tue, 17 May 2022 07:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v7sg9QQXDBeTdQv//3ccWes/WQhbiGnjLYuIwev9zvk=;
 b=lkE4qmCKSTB35q2Enj3oPmhC7Rk6z5je5Hu0BJIlFVKIQU83bceubtwxfaCbsYBCLR
 cBh9WNVSd2+3cuFTR7ZjY82zK8DOflrdwH+rYZ6tKpytnsEdwC8nNJneuhU4xSvZdXF/
 kgaOMD1L99RXedbnlEGJqwdRwFU3R+qh33u0RDSOdpD5J2GYaBiSluzETtmX2ysxhK9T
 U4UriCRGy2l69PW3YJYWWhkFDlZCizRp77eL4OVxx1Imr/GLlj6WEKtZkjMsb5N6sKzO
 k7i7v7Xuop2dQpqHfK5Acn/QEw69GCH3alZwXc6JtFdo9sOgdPt2OGYlTl8S+7PvYxwP
 wh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v7sg9QQXDBeTdQv//3ccWes/WQhbiGnjLYuIwev9zvk=;
 b=FWzD1wyB2i9tioMhiYwW9HTUFM7e7gTfAcZuK1L6w5OiwEPh1zv12gX29thKgHh8Lp
 Lz+bdK2oMmaT9XAPRXov/7iop9ikgh6toedmlpxYOJFItVBd3AxjurqLsPFk8gj8wQ36
 yalx9u2b7SLS72bIEaCiKcL4qP9i6hrExq6VTgpJwUsUiGjbC8ctmGpity0/pOf4X9RV
 jllu9fwdg9ZWIkw5AT62rLfvSkkVZyPe6ekPCrZodZId9Ofxpo8iLH2TLjV0TicONSFA
 oYqAegyvneeJd1Iiyr3mT/BJ4lEc0c5agyaJb58jiV5La8dQUW+tK/abOK5dyrgmkX1N
 0DLw==
X-Gm-Message-State: AOAM531M/usDBK9YvFLx/kAqIWKQMBEfev9PgZQgT2xXKZBO+IxhZKPn
 +JqxtXL+7WZImisc5FcdRI0u18tl/aC6EQ==
X-Google-Smtp-Source: ABdhPJzAJc7sHqqeWz+LAS7w+aExMUUjuK79Oh+xLkZzabPKRusMgWDuUOyoUeiMnMx/4b1nXOHvPQ==
X-Received: by 2002:a05:6402:28ac:b0:42a:42d3:7ba0 with SMTP id
 eg44-20020a05640228ac00b0042a42d37ba0mr19291298edb.289.1652797654481; 
 Tue, 17 May 2022 07:27:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 i5-20020a1709067a4500b006fe7c1a89adsm20944ejo.22.2022.05.17.07.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:27:34 -0700 (PDT)
Message-ID: <c6cf67e7-1f44-8348-3536-e8d6fa85d3c8@redhat.com>
Date: Tue, 17 May 2022 16:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 13/18] block: Implement blk_pdiscard() using
 generated_co_wrapper
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-2-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113907.200001-2-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 13:39, Alberto Faria wrote:
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 12 ------------
>   block/coroutines.h                |  3 ---
>   include/sysemu/block-backend-io.h |  3 ++-
>   3 files changed, 2 insertions(+), 16 deletions(-)


Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

