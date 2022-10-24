Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3233660BE51
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:14:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6cQ-0005Rv-9s; Mon, 24 Oct 2022 19:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6cM-0004MR-MX
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:12:26 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6cJ-0006dR-H6
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:12:26 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 128so9958924pga.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q17x5K97557LtcMhQP9VjUTnnNazCKezhDnZk1cp48o=;
 b=y8+T2NLQs6QvK2GkbMqIzzg12l+jNMVUdwjR9lfwwIjNR3APP6k8S7CHryQPL+BwnT
 7GyTg1x9Ddu5xuGw0ay2jc79kbZ8/YZa7jsSRbClx4+upYTC5oChi+/6hNsyAGI56Fu+
 l7/WpHXbexDyFbZFeBdgBgM3A3WekwqEZWdC8KfOICx7ozk9UEKPnJNrHkRgvNVqnYAI
 rgtOftijeG8OfIpmlktn+o5FsLC82VusN8Dsn9B6RHp/WoYHzMRKSvG81JCH/v4l2D5b
 mYu8NBAcNXg1bmJg08fWkPXjCGqFigRZvDV6zuJswdhMKBPkTHrl9ZpK7EBRjcHWjC3E
 Yfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q17x5K97557LtcMhQP9VjUTnnNazCKezhDnZk1cp48o=;
 b=6ss4UdSy7F7uAke5Z5/3+wdFxcx6Q6sNVKvfNPno8+pXAE0Hsaz/Z49sLR1hVDHIkM
 Zj9uEi0fJinGgu3zgGEdYCmqnHdZLcxJP4ZmiL07IV+mjj9VEplbxmqYLXUAGrji3O+7
 n8mafC1a4a5RhIiPQ2KKwt0/wsPa/pyVkhl/Ygh2K8Lz7JN0rSut5JqB92hJhjWLhese
 vBe6hiWytXNvBKu57gcsq8hQyfqyxH+tvi4GUvM+om8wNzXcQKOKQIRJU/6QddcuU91I
 eNHg0u3Nn2QmGCBYg/pvB9qTG/pbjpJ0DFa+UfJY0bAFPm/8pf+fZZVBJ9sICsgAq+z1
 r4rg==
X-Gm-Message-State: ACrzQf1gAxBHXY2HgiL2e0Om3joLBDFl6XFBCm0JA+T5TRXMp8Py2YoY
 RUUab2JXkLKCIGYjpept7AUoeg==
X-Google-Smtp-Source: AMsMyM6EiOvf5/hFh6JzFjuDFbkBK1BGw5W8uxvGWhRzLFxqULN7BSpSXLfgnLvKLO8+/XQe+FW74A==
X-Received: by 2002:aa7:8dd5:0:b0:565:d35c:4a5d with SMTP id
 j21-20020aa78dd5000000b00565d35c4a5dmr36517222pfr.7.1666653141272; 
 Mon, 24 Oct 2022 16:12:21 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b00180a7ff78ccsm222996plr.126.2022.10.24.16.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 16:12:20 -0700 (PDT)
Message-ID: <32fca129-90ec-801c-606f-7f32a23c236d@linaro.org>
Date: Tue, 25 Oct 2022 09:12:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 02/11] chardev/baum: Use definitions to avoid dynamic
 stack allocation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
 <20220819153931.3147384-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819153931.3147384-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/20/22 01:39, Peter Maydell wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> We know 'x * y' will be at most 'X_MAX * Y_MAX' (which is not
> a big value, it is actually 84). Instead of having the compiler
> use variable-length array, declare an array able to hold the
> maximum 'x * y'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Reviewed-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> Reviewed-by: Samuel Thibault<samuel.thibault@ens-lyon.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   chardev/baum.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

