Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD966EA6E4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:27:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn1x-000235-C4; Fri, 21 Apr 2023 05:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppn1v-00022w-A2
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:26:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppn1o-0001so-Sh
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:26:08 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso42718725e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682069162; x=1684661162;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TMuP0JaD7oSVu2iDKYePE8+CRm2b9/jhT9+tq4+ZAnU=;
 b=oRlRT4FKD6LvAqzrIi6mIlG3U6sb6U3E9QFmN7E36wYF8fYt7JMnxUgfH+uBuGTK5K
 azmzqcZ/37N25ZKkVJ2lhQZC7oZO2v6RkP13GfP284VgoEOcIfv3YSnXgHrsN14QvsX0
 Z7652m+GXmj7hzYW9eqtkS5nbbOY4RHcNvC1eOZ9gSpM8BhxsNj/GrJFx4g+FNQqW0qm
 XUPQupcVRUOzO2Ix6Bqd/9pYO9FvaWZRxT1KyUV6PyYfKJu7zuPNqZrN7lFrcebYOPSQ
 /qFXugeHZSjMavE08jk44spC1qpyJz/xpbeLngIxmA87vUTfJqeRtzc5c+dAdHUoBkGP
 s2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069162; x=1684661162;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TMuP0JaD7oSVu2iDKYePE8+CRm2b9/jhT9+tq4+ZAnU=;
 b=hoVGU1m3v+duai9aYGhMhR57/16dP3Vcsk0qPdBFoUraNlzXwFG01Qk0yvaEfA/n1g
 4zz5xbzODdXg9TysI3Jz1BBxZJWfXhDyF5B+uXpLhhG0H1m9Gjn15DwhbcLCQhXKWAMA
 er5nnlEhXeDxFwQe/TpShlAEd3gXHxr1gY2rqgbQqunlnLIJF5agS29wnMYXfvXEVkAX
 7qcb4fwZeJzgjm1nX/Uj3uidQA2ErUJSjCQWXCqnXgFIsHdrag87JGpGNjEM1R9k2L6U
 rGXHRUnUwnU24rea4YeXjP9EcXRaZGCCoTtDDcbmou8M4su5LZeFzZP0U9r56TDPq9lr
 U1ag==
X-Gm-Message-State: AAQBX9dOE8wrMWFldR09VhoJVWnaOu2zjt+E5CA0+U7ZT2pD4hYVeCRg
 v877JfoakV8TkA6C0/Dvu7dDhg==
X-Google-Smtp-Source: AKy350b4NDzvaIst4Z7LseJzbeCoAY2Zx3K/aqr6qV+blB7oebnxYYG3UdtiFpRJwJ/iBDSZmgE6mw==
X-Received: by 2002:a05:6000:12cf:b0:2ef:b257:b46c with SMTP id
 l15-20020a05600012cf00b002efb257b46cmr7054619wrx.29.1682069162200; 
 Fri, 21 Apr 2023 02:26:02 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 i40-20020a05600c4b2800b003ee6aa4e6a9sm7596922wmp.5.2023.04.21.02.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 02:26:01 -0700 (PDT)
Message-ID: <3a47700d-04b6-7600-2831-46752be5ac0a@linaro.org>
Date: Fri, 21 Apr 2023 11:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/2] tests: lcitool: Switch to OpenSUSE Leap 15.4
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: pkrempa@redhat.com, berrange@redhat.com
References: <20230421084059.9142-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230421084059.9142-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/4/23 10:40, Paolo Bonzini wrote:
> v3 of Peter's series, which uses a newer libvirt-ci commit.  With this
> version, future updates of the libvirt-ci submodule will pick new
> Leap 15 releases without the need for changes to tests/lcitool/mappings.yml
> or tests/lcitool/targets.
> 
> Paolo
> 
> Supersedes: <cover.1681735482.git.pkrempa@redhat.com>
> 
> Peter Krempa (2):
>    tests: libvirt-ci: Update to commit '2fa24dce8bc'
>    tests: lcitool: Switch to OpenSUSE Leap 15.4

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



