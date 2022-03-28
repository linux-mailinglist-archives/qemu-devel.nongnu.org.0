Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F9F4E9D98
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 19:32:56 +0200 (CEST)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYtEd-00022k-UO
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 13:32:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYtCw-0000BE-De
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 13:31:10 -0400
Received: from [2a00:1450:4864:20::536] (port=40925
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYtCu-0004NU-Sh
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 13:31:10 -0400
Received: by mail-ed1-x536.google.com with SMTP id y10so17751093edv.7
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 10:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qch/dCOC4MNXuzxPzA8gdKcrxCJbZKJIOJvW9gbjudQ=;
 b=b5YEzo8MydyaRyArC77iW1Eofilr8aXwy5OWlav+JBIhJD511y3sl2W+9puILUPBOb
 MG7f+lqaNoroxtWkhxeyhjoC2fJFbK6seXtSgJ9EQX5XDdlwQAmphN3DXH6BK4JkaQv/
 HevEBiP0z0UlmzLjHye6bBer0jvV1xe9k4WGQKYlkGUeo6PImyK55FhnUuE45K8yg8Sm
 eynLR0qv6S6cxLfZ+FwRGKxVHervrBd29ReRJ6dVTwmSxBpKdvC1EM1oScN6Opix67Ut
 UC+tTcu1tGxX6vIsa4LK5HX1fPg7MfGvCtsWrlNKZPBX5VOyibv8Ds+7h4Y4IrL1cN+W
 gnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qch/dCOC4MNXuzxPzA8gdKcrxCJbZKJIOJvW9gbjudQ=;
 b=SQdqASuwq/ryJkTcdsfhJXA+DDzrFGWaO0LT+FXOwIG8hSZ4Y9hp8nPBO3acFuKq6K
 KW7hjHQEscFlXrPUbwect0urt0Sruc9KjK6uY6kiJxZaNbAmbB9Jf3sbYAGSA2Y0LFeB
 mruWcTu67zsZFQVJfdASLTsh31Yd7RQMX8P6yn0jeAPIW5O6EcQ1xFzp1+HL7Y1Vu36w
 jbmu20eVG2eJwFfuQdo8LF7UqSZsH84SKUUFM4qEILqog9/+Q5oNWobvIxbPoTdfAbf1
 R6PpHZsEpqBBV1sD7AKi6cFd50mpt2nC5RsPHcfGg/LgthAQ+uilq+jkWaW5sQjoDN80
 n09A==
X-Gm-Message-State: AOAM533s5hcQL6d8ABsZ039YkzfRY7ex+qfXN/wxOOFbFqBj+N7mwc4k
 XDteBr4meHSDBotoXeqZ0lA=
X-Google-Smtp-Source: ABdhPJwS3bv/fRQa4rXaGtTcDvKQdpzVoVXTSe+06vzsO4dnxLdXa7XXFfaQywRNCvuwvFGmJIhSzg==
X-Received: by 2002:a05:6402:274e:b0:419:81a1:ed9b with SMTP id
 z14-20020a056402274e00b0041981a1ed9bmr17709083edd.9.1648488666852; 
 Mon, 28 Mar 2022 10:31:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8ca6:a836:a237:fed1?
 ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a056402194100b00416b174987asm7361439edz.35.2022.03.28.10.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 10:31:06 -0700 (PDT)
Message-ID: <37fa82d9-8ebc-aa8d-925d-8596f94cef40@redhat.com>
Date: Mon, 28 Mar 2022 19:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 01/15] tests/docker: remove dead code
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220328140240.40798-1-pbonzini@redhat.com>
 <20220328140240.40798-2-pbonzini@redhat.com> <87h77ixd77.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87h77ixd77.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 18:18, Alex Bennée wrote:
> 
>> debian-powerpc-user-cross was the only linux-user powered cross builder
>> and it was removed in commit 80394ccf21 ("tests/docker: remove
>> debian-powerpc-user-cross", 2019-09-26). Remove all the infrastructure
>> around it since it is now unused.
> It doesn't remove it all - we still have the
> docker-binfmt-image-debian-% rule (which I'd like to keep). Anyway:
> 
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>

Yeah, I wasn't sure about that one.

Paolo


