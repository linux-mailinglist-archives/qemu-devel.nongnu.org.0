Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D92348077
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:27:43 +0100 (CET)
Received: from localhost ([::1]:42232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8EH-0004AX-MY
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP82k-0006ZP-MC
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:15:46 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:46620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP82i-0001b7-SL
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:15:46 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 125-20020a4a1a830000b02901b6a144a417so6038651oof.13
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GzlNPV51fOf6p1/CKC7k58RMV6nLOzpKg0JmZJuvKoQ=;
 b=TChREu2pQbQXvhF8Sphp/Xw1sZNM2yPOw0i4o1oh37WnPaiJtk/j2JuIAQjg/41ZIT
 fCMnlsUGzWw9esJwtrjjvIJ4aSsBHi5ixssIE2ccMYCw9aGcRB388Or5NXt6Z65S8dqi
 ncY3OYYpU1NsmvbWlQCk1vgG5ILmKw+0AYP4+KNTr8eEWpej0sSwVlLIjJTNwkGSx+h1
 o1VxjqkeBwZrDLX9Kxz5dpKF9UehNOUFnhuJwXvMS1YTTdTtTYGNJ1SQiIiCUTuKsmeU
 6lFNEAxGPfWH+aK/i050HnF7xRHSQvFLI5603DdNdLI/iyEMoyvq5v3RjgN63TMBJAgj
 jFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GzlNPV51fOf6p1/CKC7k58RMV6nLOzpKg0JmZJuvKoQ=;
 b=Wu46L/XreiweS9opNDnCZtD128cTYfG6mYsBH62yMzQNewrbRAFEGK6jG9dsK4KnR7
 lwsYHEq9y3BDvwEeaAeqTBwfZuaO6k+aKERaGMrCq0IvMWgKIItF09Mwge0Z5YiQuImC
 Qv5vpkqvzzjdCgIIX6jS2e5IORNrXpQCuCpujb9uHJku8HeC8hwWL3tLx+WWeiOMoeeP
 /hh+xJW5HQWL1UncfPhr/21llhdKSVDpR6RAxN0vEE3PcmR3Uhw9+xkFDgbiFvCtYfE/
 s3K9T8vqCzK9/YcKh+Vq8EQOWto/PY2XwTO6u94C3SgsyxWGxYSr9cL8RozrxjTISx0U
 Vw8Q==
X-Gm-Message-State: AOAM532YZTXyBbGRzWfAiowva8EFoqhKWyqpQd99hHEDMfv/fqrEO5E8
 5rr1ow2EU/1p+KrL7UxaQwahjQ==
X-Google-Smtp-Source: ABdhPJzwN9aUnI4cJwHSBvnvD9qbVpwl+U+dl+dU0swCTIpzBo6qKmCbLDDOdh+uNvbHrOH3wGeXwQ==
X-Received: by 2002:a4a:37c5:: with SMTP id r188mr3812351oor.77.1616609743451; 
 Wed, 24 Mar 2021 11:15:43 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id w16sm727144otq.15.2021.03.24.11.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:15:43 -0700 (PDT)
Subject: Re: [RFC v11 05/55] target/arm: tcg: split mte_helper user-only and
 sysemu code
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323151749.21299-6-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5be5719f-8785-0f8c-8b48-9e1ff454b395@linaro.org>
Date: Wed, 24 Mar 2021 12:15:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323151749.21299-6-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc34.google.com
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

On 3/23/21 9:16 AM, Claudio Fontana wrote:
> +#ifndef MTE_HELPER_H
> +#define MTE_HELPER_H
> +/**

Whitespace after the define.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

