Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BB239A968
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:41:51 +0200 (CEST)
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lorLq-0007to-Je
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorKQ-00072t-OS
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:40:22 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorKK-0004jk-0a
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:40:22 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so5910447pjs.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yoDgw+FklQ780pklSWYimfeG5QOssjefH8kWb2PaZxg=;
 b=QNydmWeKHfKPYSHlT2fau1TYKy6kbVo6hzQF9IJqA27HK6t+N/K/L2V8eFG+jZDP7m
 d3Mw3oOKJJdTWuSevUXqNevHEvB5nea4F4E6L6usTljegbhZjIhqm7wN9ysAj4VGpjic
 9cjdqka79fAsD2D6VRCRBj/T9x7DVic0XhK3kLbbs67FzHUq24p05HWiYVYglGUxMCd+
 bGfMg8UC5vYe48TREat/DzKhdD5PzUauiet99FMld8bY3rXTbjodH44l6rGECw/XXeob
 8MXVaL6D/4Ssy2RPdi7BQZAxOsjwMHo4foREf4W7QMQMscCciiS6o1fYsOhjhVIYzfX5
 wcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yoDgw+FklQ780pklSWYimfeG5QOssjefH8kWb2PaZxg=;
 b=J1BXDEtYwgzUUg146qEeXjJZlvNj3STvtQPFPqmqiK5WQDp/ut9RLzTQDyNy7OxQ6G
 TnnWgDXPbctmzjMFGtrc22V9g6jVTdrXnh1dwrUAsf1wlhLNolslSE+5yPVZ/wR5ITwY
 3N/Dilhe6DyXXUTuA30Ur/DKnqfcy5FgBegJst11YJuHAgij9RH7zT2iC6yHkHQeHfzI
 hlah+zmsdrOb6tra8QzXgSRAALipzVL5IgGoCRhqh+bpbnJIF+7ACujSM1fdmKXCcTXU
 xQzt7a/yxVhQ2QEHZ2DGtEBYUoeVeKwrlhy9tixkKiMNFCNyZ+RZl7XBXoqDAOoq74BF
 DnPA==
X-Gm-Message-State: AOAM530XwcsNzErVpbMLj9q45YWrZmVTVnMXqoHab3HDJDpXFPJqWnd0
 jIMT/7Ft9H3Ey/4yx7SSlsMPWg==
X-Google-Smtp-Source: ABdhPJxMABd/y4iExRlI4GcXvI7EFmpMxZSyuVK/SfZp2GktnORkULeM5MhajSALdQEnCmhBJixozw==
X-Received: by 2002:a17:902:b185:b029:f4:58b2:aa4f with SMTP id
 s5-20020a170902b185b02900f458b2aa4fmr242984plr.40.1622742014503; 
 Thu, 03 Jun 2021 10:40:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h8sm2862934pfn.0.2021.06.03.10.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:40:14 -0700 (PDT)
Subject: Re: [PATCH v2 16/26] s390x/tcg: Implement 32/128 bit for VECTOR FP
 COMPARE (AND SIGNAL) SCALAR
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-17-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89d8e5b3-5533-1dbe-347b-2cfda3e03205@linaro.org>
Date: Thu, 3 Jun 2021 10:40:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-17-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/helper.h           |  4 +++
>   target/s390x/translate_vx.c.inc | 38 ++++++++++++++++++++++------
>   target/s390x/vec_fpu_helper.c   | 44 ++++++++++++++++++++++++++++++++-
>   3 files changed, 77 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

