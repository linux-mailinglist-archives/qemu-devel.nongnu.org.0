Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6AF34BE63
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:56:11 +0200 (CEST)
Received: from localhost ([::1]:49494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQaa2-0005BP-LZ
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaVt-0000id-6p
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:51:53 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:33652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaVr-0003g7-AL
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:51:52 -0400
Received: by mail-oi1-x22b.google.com with SMTP id w70so11165514oie.0
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 11:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D7NezZF+5WkUwJ1eyE637SNJzZnaFaZNsxfb4F1c34s=;
 b=i4+PfvUhQfQ64cszhXjL5liVxaFZQr3VlEiVvEHsfBUc7E0VLGLUmBPkxXmBom1EgP
 1sYzU7XZ0mYHxvoK12657dYDoDPoLTb6jcXzi41wt2uhCyUTn+UmzUxoREWax8KUKmlB
 UKvkcvumhMFfgFpl7G7NjLUwR6tW07l/4YJDlTU7ospCR8g6KRnoKfBsA5v4HKWS8KN1
 Lq9GeSvVUs5nXVLeMNi4jvLRr+kaoB4vPj23XxoBZz8yVeM56KU3C/SvpDZNHE09AJZt
 mrJ0HdKvKdZeyUDEiwtol3xy8VbKpnnRhyMis+qTqWp/++6v2/UUv3dCwxh6FmzQhpBW
 zqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D7NezZF+5WkUwJ1eyE637SNJzZnaFaZNsxfb4F1c34s=;
 b=b8S57MyeDAkZyvTY+pzsL6id0RJww7qtclxX8ZJFzIFq2OiFwmOIQoS5LZZehNuAbU
 utJ4xhmv3YYfhHbVWx9yw5xZ9XTzrT6blsgcQdoQh4UtJ7nq56Z4Hx+2JiJt9ERkd9G/
 k52QTkSop5C4yx9k4Ao3MOroZ7hYjPviKXeNekOe72AELxMP7/yWRp+RLAgyQB/pNBdj
 NXC72e51Rcd6/lIxy4mltiUuyiTG9Qx3XZMbkpmHsbd1H+ACGfxazPTDTjomHgI4/bN+
 kp+f54Zk/VYbfb/vzsZ7tRZQODot6t+7dIlB/wSaY9L650TlDTKOjhSQ6rP5iCxZXbZf
 YUpA==
X-Gm-Message-State: AOAM531f/cFYpVhIPVCQ71zm+HYTDZKlemogfmYqZipTCe2PEvu6Ls/v
 CQJD+12i1pMIlsusaPll77FKvA==
X-Google-Smtp-Source: ABdhPJy5Ikc7yOWJdw3oJSWMl9quKDskJatQGyvs9jqVUopQULBmsDDthndimQ7iqSVIAtAfYFEitA==
X-Received: by 2002:aca:4b03:: with SMTP id y3mr17116905oia.78.1616957510167; 
 Sun, 28 Mar 2021 11:51:50 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id a16sm2979985otk.62.2021.03.28.11.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 11:51:49 -0700 (PDT)
Subject: Re: [RFC v12 57/65] target/arm: tcg-sve: import narrow_vq and
 change_el functions
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-58-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <506abf89-f7a8-64a2-71bb-dcda834c769e@linaro.org>
Date: Sun, 28 Mar 2021 12:51:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-58-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> aarch64_sve_narrow_vq and aarch64_sve_change_el are SVE-related
> functions only used for TCG, so we can put them in the
> 
> tcg-sve.c module.

Extra whitespace.

> +/* tcg/helper.c */
> +
> +void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
> +
> +void aarch64_sve_change_el(CPUARMState *env, int old_el,
> +                           int new_el, bool el0_a64);

Comment is out of date.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

