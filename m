Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B857F3499AF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 19:48:27 +0100 (CET)
Received: from localhost ([::1]:44094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPV1u-0001VI-KC
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 14:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPUxv-0008AZ-Un
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:44:21 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:41755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPUxr-0008Uf-8Y
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:44:18 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 q127-20020a4a33850000b02901b646aa81b1so719748ooq.8
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 11:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eJAJOUjDZsPKzWNlQ/i/hzFFoLjctiZ3Sr8Z8FdJ70k=;
 b=oywWD3BRTVv88RkFEpc7IHK+6fsHr1D732AZ0nXZqwvbxIm5/rH8GqGioDLDFOVIP4
 dQztaoK2opIQhPxOu1M/FdM+v5scjhLfZ9c3Sk8UMstrdXvgNof/zLkgMduHX1dxiHsH
 H82auXD9nh/dVMTG+O+rsBiVHxVRCTZw/YR+IkGP0jExs0EV1s7Adi5POtPf7qM/lBEI
 EIWH8qKA38bWo65hRAB2dINJb9jXqpc5mA/pVLC/vsaw1gjfCELf9eU3u/Avb2/TIHKC
 aWg8WRwehXYCi+FW+mgwuYPTEd59bsGvqEqMBaUSbpD6ECt0TCqsHvImmlazm5/AIZdz
 Wrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eJAJOUjDZsPKzWNlQ/i/hzFFoLjctiZ3Sr8Z8FdJ70k=;
 b=QRvOHTHkZ0Xwjla+tW7RvgtlQuAwYLFTOb2L0l60aooCO5C8kZVJpBktYMQynYhoqo
 DB0YA21yXjfPol11xwdUu30CAfo6/ej7Qh23avX6NTbg0TvpNZy//AbJMRLRn+hIp7cT
 3jrmTQyUzvIR0K4awoEHwG84mYmYFQIik25Yj9h/HubJ0HHrsfe0HSWQT11xjIMQgWDD
 STHMKS+jztT+H/Ya9UkVq3niLt3RayzFQb2JMwxmK0eXUEnGZelp7w4DiHl4+bE1LCh+
 noiBuSgIJDKiz6JWoP23Y9DD1AK5UjJ2QeBb9wSWf/N5cz2/Th76puZd/ksTdfjJ5CHy
 AjgQ==
X-Gm-Message-State: AOAM532V9/MCcosfNbgZs0Uol0sCjPOmAXE5u/moYkMkZCan6bwy+ciO
 7jIauNWBazc4rA9yVJzy93IPMQ==
X-Google-Smtp-Source: ABdhPJzwvo8VtR7qsJz5dIybvHfCFZw6gkpFJJa6ws2PamJ5T3ZWJA8hwH2RkGC+5aOjv+8V8rOUjg==
X-Received: by 2002:a4a:b787:: with SMTP id a7mr8289358oop.18.1616697853248;
 Thu, 25 Mar 2021 11:44:13 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id v23sm1597400ots.63.2021.03.25.11.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 11:44:12 -0700 (PDT)
Subject: Re: [RFC v11 46/55] target/arm: cpu-sve: split TCG and KVM
 functionality
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-39-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89d76a02-42b9-f5e3-7520-3fd9d2769dfb@linaro.org>
Date: Thu, 25 Mar 2021 12:44:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-39-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
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

On 3/23/21 9:46 AM, Claudio Fontana wrote:
>   /* called by arm_cpu_finalize_features in realizefn */
> -void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
> +bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);

No interface changes simultaneous with code movement.


r~

