Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6395534808D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:34:17 +0100 (CET)
Received: from localhost ([::1]:55838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8Kd-0001pc-NZ
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8Hs-0000ma-VD
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:31:25 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:35556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8Hr-0001py-35
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:31:24 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so23966845oto.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I7uuWNyPQO7hGg0BqTGxYGCU1JDn+QXHsUDIYtKh6+8=;
 b=dtlurwLPvfrb/pQs/u7xNHET9peqExjVFfbWxY3j6nLNjP9kPedZAykiPNwQnagFrD
 08Lj7dJcCLV7Jpxzl/p/3ELY0OdeNNwp4FIKjMbLxHellTCFIppELP04W8ceOvY9GCxQ
 DeiA6DveaVjc9kmCgN4MpSD3qNAj3wUq8GGxqips6nT86dK0sw+P5o2VN9EbkcSckiB/
 SIWPtPUlvnd2aagGvT2JydqKDOHje7vXMwbyszzNthHoFLk3o+KIWDkIoEWJiomdYVd0
 oo1avtKuHWC3hH0sbvBikQ+vzem/P0q1zhwLXEJZr8tHiMpk7xbD4jfAevHsEdZwDrO6
 xroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I7uuWNyPQO7hGg0BqTGxYGCU1JDn+QXHsUDIYtKh6+8=;
 b=n8shi6NsxhDOnCgz1KTBI3n1/dIKwE9yjCYIP85onJ4RY0/I43jV6kHlNVUx7w6W9m
 2J6rNttzgKtqyzXUOEtXFWGfC8nHUSptYDphXwDWLv/LuEd05mP1g7x5VAfPYtqyUEJB
 sHBMkvgsxPb7m9UBxDixqu762EAjAqi9jSF6y8eSXSP4rVaqxem616mAmDgTtmeluJt1
 lJqWWWQLZLAZXuxBR8Upmkr3BmJSaH8YKrY2gqxR8s5NxKOQGHE0v/e2OGbUIYu6kueG
 fLEo3i+Dlq2cGplm8fefFzaOUT4WFt857axhkun8M2WNVODcSQcjSnJsOhOlxIhGOBGt
 zS+A==
X-Gm-Message-State: AOAM5320VikaB81hGmKRwiqzXNK4A7oPhVri82OpCNscXp/frkwQsA/z
 OITfgF1TrOX36Yfif8muw98g+w==
X-Google-Smtp-Source: ABdhPJyVT4b4BhEYAtIG/JFl6IPK+tqkB+UvkAov8HaIBVYM6DPkdhHypn4afvgZqKochaBUqOjPsA==
X-Received: by 2002:a05:6830:238c:: with SMTP id
 l12mr4271746ots.276.1616610678753; 
 Wed, 24 Mar 2021 11:31:18 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g5sm582322oiy.24.2021.03.24.11.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:31:18 -0700 (PDT)
Subject: Re: [RFC v11 11/55] target/arm: move physical address translation to
 cpu-mmu
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-4-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3562913-02eb-07d0-e7a1-36833ddad525@linaro.org>
Date: Wed, 24 Mar 2021 12:31:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-4-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:45 AM, Claudio Fontana wrote:
> get_phys_addr is needed for KVM too, and in turn it requires
> the aa64_va_parameter* family of functions.
> 
> Create cpu-mmu and cpu-mmu-sysemu to store these and
> other mmu-related functions.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

