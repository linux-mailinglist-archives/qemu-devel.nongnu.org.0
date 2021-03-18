Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2CE341080
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 23:52:28 +0100 (CET)
Received: from localhost ([::1]:59656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN1VD-0004nW-UR
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 18:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lN1Tm-0003mO-T4
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 18:50:58 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:44732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lN1Tk-0008UN-Vy
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 18:50:58 -0400
Received: by mail-oi1-x22a.google.com with SMTP id a8so2728760oic.11
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 15:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jQpPIfpmeUFvPQ4iWg2g5au/FZugINoMB4iPNOcWXZ8=;
 b=rFPXj1tJKSL4FXK9CvvAYDb9avhntfr0M48AG+N/HL6X6g1WAgi/bwamcZRqVa/I/l
 JTPBG6TXFUhGRVyU68sIeCtCs8mtnzaQXaVIyk/yXyOXBUTfVat0KQuVrzORkZsGV1Jt
 gztd7FHadNmGlIxkbsLAOD8thjBXEHri3+mUBj5RE579KJ8l0TW7QIm8Q+4EXo2i/PIi
 GelmpFK9flvx6A7fLiknbBEC2/oQS5FRq5weU4iVvz50lHvR5wfkGGyBfgXbOJTNeyPz
 7CaLm+bqfNaHO6opUiiriTcivwuihIfKISL19YYBREQeO+VBuERQK6JjScrROXStl5Zd
 7s7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jQpPIfpmeUFvPQ4iWg2g5au/FZugINoMB4iPNOcWXZ8=;
 b=b9UctH6WmCEzIvA72GT/ei7VjIJ6egFJf5iYocA1s5S5qG0tTEv0L5Oros5RKnQEa3
 fnrjXgRkwVwpqIyI+mv2ByTClveWGN9Oxf4JjlzbqgY2j2PrsBdAI6wx+qf06KNy4C2l
 ivGpYU84BIySA8+FQ6F4k3w6S4TjmB6/WU6dNsnJI4lODk9IK/j1Jv3dqQ69mhYg/UQZ
 GrdCCKNeinA6WXG141Jed291HdcktYWDZ/ZbGTnjCDhokDjgz8eTvodZhxbdyzaGyyh4
 uP0UKGwtRToBlwPCw9givMzEojAC3deqawHvL9si2dkrQjQcx+x4I1w5lr3xvjoGClfU
 8p8g==
X-Gm-Message-State: AOAM532YNuwdP9f4Rey2YZL6RPEJlzMmnU6lSRJ4s42UvUKinO56U9wZ
 lWVktul5uTb6VUNqh3gLWhFrDQ==
X-Google-Smtp-Source: ABdhPJw3rrFZHOJQlYlA/kHjpB2qV1GlcJZJnGMIdF+FLwG1+1Z1VobnlMEM6wdyV/+yoZkMyosJxQ==
X-Received: by 2002:aca:2219:: with SMTP id b25mr4608881oic.112.1616107854961; 
 Thu, 18 Mar 2021 15:50:54 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r16sm877308oic.29.2021.03.18.15.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 15:50:54 -0700 (PDT)
Subject: Re: [PATCH for 6.0 v2] hw/intc/i8259: Refactor pic_read_irq() to
 avoid uninitialized variable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210318160949.3681463-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2137cb0-e898-5f30-4060-5868e7eb4698@linaro.org>
Date: Thu, 18 Mar 2021 16:50:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318160949.3681463-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 10:09 AM, Philippe Mathieu-Daudé wrote:
> +        int irq2;
> +
>           if (irq == 2) {
>               irq2 = pic_get_irq(slave_pic);

Move the declaration in here:

     int irq2 = ...


r~

