Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C41A5FB79D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:44:38 +0200 (CEST)
Received: from localhost ([::1]:33000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiHQr-0007CM-H8
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oiHCC-0006HZ-KL
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:29:30 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oiHC8-00031w-Ee
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:29:26 -0400
Received: by mail-pg1-x52d.google.com with SMTP id l6so3551885pgu.7
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 08:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7rH9THNz7SBJa9oJzu3oIf0K2uweLEd+Z8Xz/sfAsjw=;
 b=rGdIfgD4vUzultG2pc0bGfjMpbePGNK8CqvwRlvdkYGCqwceZYdfB1QumWtbSQjlvz
 SfeRBVBofQKce8esm48eOfNqNY4FJpNSn+8Zqoh8aU9KCRhrbB7rX+WI8lLsGTqsoFb9
 POmlySXhR7resVi3YqFMJZBFON7T8XG8Z3ZZU/LV1UJtcn5iQf2V1uraLL0xYoy8K40e
 4jj+8BLmilyQrb8nW2sDdrhpwKWFpbclrgxgNeGhXrAtxC6qxPw72ahfkeYZPpETeusX
 VBXLdpZ4OWKAXvtVpWHYRe55XzIG4OlcFZmAa/TASUKr8t6XanS+0B+YyIgqzZn9TzJ2
 r08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7rH9THNz7SBJa9oJzu3oIf0K2uweLEd+Z8Xz/sfAsjw=;
 b=Z1lYs81VevkXYSnqyn8vExoDQqVLkwvrfJZtmxuqhA8ROlckaIItUwqeJYCWJQKWhp
 dRIzIU18tR8LLwltEAwWyO8x96rW2+SuwYH5kTTU+9WvDI/ltWbkMozRGiRfFuuucwXp
 K2/hHq1nRFvJULY18Ccpf6PG5RIS+C2H3nDexoOplgXHN3BpB4FWCHnERNUWUaxy86Pe
 yAcocWunPDbD1ZDgNQKL2tMOkBjJS4+IzFpiX12iu1gU/C9+UUl5RmJNtJVjkH7dbi8f
 HA5TfhcjSoGWeIrBPPBehy9/xNktvpUM8CEhvqJH6GgUs3ATfn5nqkCILX3799gJ0oTU
 4B4g==
X-Gm-Message-State: ACrzQf0MECHJxf6elxS4m88ctI54JvLY1Rnj+EshFq4qeI+3KvCFX7gR
 o3UIn8xshJTDt1lm5n5hgkP4fw==
X-Google-Smtp-Source: AMsMyM6MlXD94JsmTQm/HvopX4q3rjjf7C6rlXlJTFIVpVDRnRHfTc1WbuEf9uQBoKHT5A64cL09sw==
X-Received: by 2002:a63:ff1b:0:b0:43c:e4ee:e5e0 with SMTP id
 k27-20020a63ff1b000000b0043ce4eee5e0mr20560646pgi.540.1665502153427; 
 Tue, 11 Oct 2022 08:29:13 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:67e1:640e:ccb8:1a4a?
 ([2602:47:d49d:ec01:67e1:640e:ccb8:1a4a])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a170903230e00b00177e5d83d3esm8909678plh.88.2022.10.11.08.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 08:29:12 -0700 (PDT)
Message-ID: <c8592d26-6cac-1e6e-cb7f-ac91f7966890@linaro.org>
Date: Tue, 11 Oct 2022 08:29:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] qgraph: implement stack as a linked list
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, alex.bennee@linaro.org
References: <20221011104649.324963-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221011104649.324963-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.934,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/11/22 03:46, Paolo Bonzini wrote:
>   {
> +    QOSStackElement *elem = g_new0(QOSStackElement, 1);
>       int len = 0; /* root is not counted */
> -    if (qos_node_tos == QOS_PATH_MAX_ELEMENT_SIZE) {
> -        g_printerr("QOSStack: full stack, cannot push");
> -        abort();
> -    }
> -
>       if (parent) {
>           len = parent->length + 1;
>       }
> -    qos_node_stack[qos_node_tos++] = (QOSStackElement) {
> +    *elem = (QOSStackElement) {
>           .node = el,
>           .parent = parent,
>           .parent_edge = e,
>           .length = len,
>       };
> -}

If you're going to completely initialize the structure via assignment, you don't need to 
zero the storage first.  I suggest either g_new + structure assignment or g_new0 + 
sequence of element assignments.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

