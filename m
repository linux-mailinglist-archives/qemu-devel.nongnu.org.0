Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D61F337AEA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:34:45 +0100 (CET)
Received: from localhost ([::1]:36384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPCt-0002gI-J8
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:34:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKP5V-0005Wy-Cw
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:27:06 -0500
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:42587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKP4f-0002Zu-AC
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:27:04 -0500
Received: by mail-qk1-x72c.google.com with SMTP id z190so21391196qka.9
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wd8Gi4rbjbmYeyKGnuSGeRXn7H47f88GDDtzB6hPUhg=;
 b=tCqwLftD5WFyKZ5EcrxqWj8NmwVyPjtWQyZqKt+A5T22gXmEeIY4gE+XYuRzXU64Dx
 qi94IoGbczWGDSckBX8RvGz1FJbzrf4bhGTvDnMRk/XQHR6NrZvTxal5WNC12lhsmsKY
 ZAbp6dYRUxEh7hNmdVlOdSeujsOG8kNShpSMrmCparDSaDdV5HfRC4L8PmyvCmGM8TE4
 OggwU0p7Lu0yUyks8I3LC4pOregsNe8eL8p3mFhtDPOOKvblWk+iycB959e/Nua3c4b9
 Q4ymPgBnllu4bCjB3Q9tLz+JHQK4ZOpxFlDEEI9PBoLQJokUj5n2sVaKR/pnJX8oy6Va
 GXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wd8Gi4rbjbmYeyKGnuSGeRXn7H47f88GDDtzB6hPUhg=;
 b=rPLwy7F0rnFwTn4C9ytF8Qly8k4JnO3lQgV/9UwOHRBw13xgDp0W+lmUB1yW1AxO4R
 SI7pLNH0AFNH+Y/OEsYt0uofn3XDh7ocawOroF+V1Zx6PiIpQ9xnWJipq88AsD4x3EIW
 k/lreycSSvpnEezvNssF0xvg6XIGuVy53DKZGdiY5Rc2PXZ8AysmBp1hP1/1zteIYkDd
 qBfj5o3vgaCvnB5LZ90jJr/0OAz1JB0TL+kCqcQpMkaanJKiGVfB7Y2lB62vSI2cUj/w
 GxmPjv0fPh3rTqQnVi4Vi+94jGPlQJt14sZJVV5d5li9uYGgBXVGJo5yLLq78z4vbn1K
 rdhA==
X-Gm-Message-State: AOAM530CakMGYXUFW/GuHZTQS8neKKuO3XDA61TJg4IZ+2Qd97zG+PWA
 dzCPcVADL7SCA6zSTB7ZWN7xyQ==
X-Google-Smtp-Source: ABdhPJxFUF//nWiu63e5iqklDl+at/F6Zg+ZKZWWyGm7TbnZ/h8HGz181c4lo2MfC9A7Yg2IgDvY4g==
X-Received: by 2002:a05:620a:2216:: with SMTP id
 m22mr9035158qkh.73.1615483569425; 
 Thu, 11 Mar 2021 09:26:09 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a19sm2423466qkl.126.2021.03.11.09.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 09:26:09 -0800 (PST)
Subject: Re: [PATCH v5 1/2] target/s390x: Implement the MVPG
 condition-code-option bit
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210311161747.129834-1-david@redhat.com>
 <20210311161747.129834-2-david@redhat.com>
 <594f6840-2dad-89a2-9103-098e5f465ed4@linaro.org>
 <e9c74b31-28c9-6757-567e-a6d14a9a5b7e@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <232bc238-381f-5651-d0e5-e057e0a73b14@linaro.org>
Date: Thu, 11 Mar 2021 11:26:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e9c74b31-28c9-6757-567e-a6d14a9a5b7e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 11:12 AM, David Hildenbrand wrote:
> Without an access key in GR0, we're using the PSW key - which should always 
> work, no?
> 
> What am I missing?

Nothing.  Insufficiently close reading on my part.


r~

