Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986F764F63D
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:25:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6L0S-0007YA-8W; Fri, 16 Dec 2022 19:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L0Q-0007Xo-0v
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:24:46 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L0O-00029c-AY
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:24:45 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so3923194pjo.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hh8Yz76yFaa/n8ZwBoq+iqck5VrIbjD5HT0vxAWPQxo=;
 b=qRY+EY28fRxQIvE9H3PfWhehWi9irkwjM+gNy1QJiU9SBhgfBXFlaWbjGlcyMe7Xg7
 k+8n04zgPFaAtz0GVb3bqaUcn/wYRC9Vv6OUxi4G5xjejhFlryIhgOoYfjkk07uRvLmO
 pwURRVwyavs/5kQqN0eub3REz2/GtHXZgvhuDvyXkl+lS6a1uAK48sURWE0/Vtjd0KDz
 PJWnqgFq/MyIYHZYQJadJNGyIYVW+a2Tc2qH8g29tA0ZQWUjIE6866gBSp2ZbsONYMtm
 0DUJV8iUJAFjjRvL1Z7LS1yeeH8UeV+XthA49M5M++pf+ZLgswhDWKzlC7sR7cBRAcSx
 OYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hh8Yz76yFaa/n8ZwBoq+iqck5VrIbjD5HT0vxAWPQxo=;
 b=wHFxY4fRrdAllWrvcwOjd7l3Emx250dLQRmOBqCybPwlAtGGeRdGmtI68+pzfOrLe4
 nzi4pGhdHz/Tw3teSI24OKEy2CPqCqvS3l9Im16rMP3g54H0HA0K5aVawsOz1Sfu/hvm
 t7lk4RlXvJHlYsXyCUYRmavM/Xn21sL2b97fdKr9grBCS5zu9HO+25udRBcZQ6OM7+Y1
 2SBaRTbOE2YOH379Kb7CWQdH/5aD3/rqhfpHocfYfj+FW9Hsb+h1TyHRoDbqSXzyX5Fk
 DLyAivI+jXEgkD2s2XDybK/c4vO0jyXjsCSTXNAHFouI1qWmP1tS9Si7oWLIkRlBgOlB
 y1jQ==
X-Gm-Message-State: ANoB5pnnSXnRQtbNbH0JQwZCOuiUBYzLS0CoWkgyCzGqMTbjKtMPPOKp
 lSDQlAqrGMIslS5gLZjETrwBPA==
X-Google-Smtp-Source: AA0mqf43JAcWBRX07x7/1qcAyHUUSN/OnSSlqQzSW9e9KoKW0NuxJU5KK4KDxN7VM7bfznRCNMLkkg==
X-Received: by 2002:a05:6a21:1013:b0:a7:8b5e:af77 with SMTP id
 nk19-20020a056a21101300b000a78b5eaf77mr36505536pzb.36.1671236682766; 
 Fri, 16 Dec 2022 16:24:42 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 7-20020a631347000000b0047063eb4098sm2038841pgt.37.2022.12.16.16.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:24:42 -0800 (PST)
Message-ID: <be73766d-2848-0a23-94d3-f8a87562a36a@linaro.org>
Date: Fri, 16 Dec 2022 16:24:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/5] target/i386: Remove x86_cpu_dump_local_apic_state()
 dead stub
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>
References: <20221216220158.6317-1-philmd@linaro.org>
 <20221216220158.6317-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220158.6317-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/16/22 14:01, Philippe Mathieu-Daudé wrote:
> x86_cpu_dump_local_apic_state() is called from monitor.c which
> is only compiled for system emulation since commit bf95728400
> ("monitor: remove target-specific code from monitor.c").
> 
> Interestingly this stub was added few weeks later in commit
> 1f871d49e3 ("hmp: added local apic dump state") and was not
> necessary by that time.

Crossed in-flight, presumably.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

