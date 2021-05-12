Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBF37C4E4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:36:22 +0200 (CEST)
Received: from localhost ([::1]:41338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgquL-0004DQ-Pm
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgqnB-0001WG-D1
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:29:00 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:43991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgqn7-00070h-2J
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:28:57 -0400
Received: by mail-qk1-x729.google.com with SMTP id a22so21977301qkl.10
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xIJ0gqae2Jiz/fnfb/GOcofDhM6P9zxDieJb1yxh5j4=;
 b=RbVxcBz35XjbZ8xAYHLaqbzVFoGdjN+n/o7s2OAn+OkRa1fFcLjBiDO21GcZETjlfl
 SCtivxiOGaesL3XCtJhg7efchHNg0JJjZ3Gso0Puazu9/5I1E43myVUTJy+wMOluYHX7
 H/zPtJwa5c1pavSR6pWPset3Ye7vBmV/BDO54JLOpIr6uXgEIG3nRoO/iQcp4Y5HWHYO
 9Op+jDPMMV8tQQeQvk80ReBP1gYNO8rlYTYdJA3jS+JsbxPxDrMdjzA/748dU6doyjg+
 9Ez22cfTIcY4UTZmRtrWPICdvSqGEpi0800EI//kXtW8hcYPzfLSx5ukGcj7kdZ5TVlY
 izRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xIJ0gqae2Jiz/fnfb/GOcofDhM6P9zxDieJb1yxh5j4=;
 b=oqYwnywZLeqNJy9EjK4VASZaGgfOq8tnMZfsY41E2Ri4Kp9AvOqKypUQNQy7zPdF4z
 pddFklPafA22FBywlMybqrpRI0OhbY5L/6xOiogA+kInZm1OeVZIGSkiBp7TzQtGYKRq
 DGiphLBBJ/L3IbvfEccX7XFHJafQ8nzrm6km2xw7Kqa5CaGAd1X6+IGjK5QHeywaWwwg
 RYy5ztB0iHNERrUqFp/DqgfAt5rMy7cNkZ0FF6VXojaORT6RoWj4D+oaaD2VRD9cN9uu
 S0uxz+bdsQtu2lYZJDLMPCIQrGDF5b8hT2+yya52l3n2F5cWQhVLfvzsXkMml//26sXI
 0lUg==
X-Gm-Message-State: AOAM530EjbeV8s/QD4zw7+BIe4YmtrX8rGRcBz7aOf6OJZLwl1SBr2w6
 X9A3ADf05uvaytBZw3TaQiK7Hw==
X-Google-Smtp-Source: ABdhPJxAd/f2Huq4Q/h8393owF/VrqQ16mpbv1ZO4htSqzXp2XIWti3nSZsqMVou1XIBaIPDw+Hhjg==
X-Received: by 2002:a05:620a:70c:: with SMTP id
 12mr33566724qkc.377.1620833331331; 
 Wed, 12 May 2021 08:28:51 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id x28sm243090qtm.71.2021.05.12.08.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 08:28:51 -0700 (PDT)
Subject: Re: [PATCH 00/72] Convert floatx80 and float128 to FloatParts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <87bl9iyahr.fsf@linaro.org> <354c8418-9700-e98d-47b1-10e564fbeeaa@linaro.org>
 <87pmxwfb54.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b908335b-17c1-b550-a34d-7cdd20c77b55@linaro.org>
Date: Wed, 12 May 2021 10:28:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87pmxwfb54.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 6:22 AM, Alex Bennée wrote:
> I did note we are missing mulAdd tests but they seem to be missing from
> the underlying testfloat code as well. I guess we don't care that much
> for the 80bit code? Is it even used by any architectures?

It's not used by any architecture, so no point in implementing it.


r~


