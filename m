Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C88536B080
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:25:42 +0200 (CEST)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laxUr-0001Le-4r
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laxSz-0000FS-QQ
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:23:45 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laxSs-0003Vo-88
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:23:43 -0400
Received: by mail-wr1-x431.google.com with SMTP id m9so42310974wrx.3
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ypTCcpGDOH8f7Vsihr5Sivrmq3VqK7cNiUPIWaGl0bU=;
 b=uVhrKTo5+jE6X5ccgMS2V0pG8iNZrYzqtWcDmZ/PT+ydm0ZCFqn68n4akfdWRUr14I
 ovS9cnkcAyUKEe/HAq5/W67gVnNOH2SxgE/UMwWMjmG1HkHgQ1HsBsT3iJlFmRtm/MFF
 EOUDVXnR0B/7ipSQO3l+VIUBBD7g40SUyj8UzaMXLKsjbqDMGjV5Osrms2sTdvhzi7YB
 Isr5OabCc6/j4bdR4e0hD1gVBCxFtkAp4HEqjabRMPtNcERaPBo854IDN3ipNRi7Yk0P
 WnRKWsvgmoB7X4ERDF0YAtt+MO0l7A/HK/pu8APGuc6wt9AGSxZeyVqN0vMIcMNw/fN2
 ehRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ypTCcpGDOH8f7Vsihr5Sivrmq3VqK7cNiUPIWaGl0bU=;
 b=iO+2zk6K90qwOWkDDkXCfDCUCvJ1iVeRVAGy5JxAGD8df7V0oMWVZlvGI15TM9X/eP
 hhcNzRiR1gdr6ATYrTxz68s6s0F8w3vZTtBXfdyM2KJ3ZJa10Dzdo07A7LuRhsiao4Nm
 VkGpGCd91i9uw6a/qyLgYAUA0piP+0U3Ves5r3lPpPqE2nsCe+EaYRe5oLvaOyBwekb6
 bJdLWO68oDiBg+0JXSQ+/t+xQlxlurQ71/7OpJRjWg1MwelHLsa00weZaAgV2uOyxYu7
 UdZE5MXitqJDYXfqTG/ZNLnRG9wlw5XoW9Nd899aRhxGFc217Xsx9ng1C8YZ5nLXIpWy
 lFBA==
X-Gm-Message-State: AOAM532Vx624OOH6OWpg/TkS2Jk3tQBN69Z31FAn2dH6uywegW8W/UZN
 DXJUxVmq+kcY+g6yPXlycXI=
X-Google-Smtp-Source: ABdhPJzs4eCX090dLmmD/96GFk+M+Oe12/Kj9mA3JzYkAgEkgPjduZK8dEcBIqkxtLu3/FGQTE6vmw==
X-Received: by 2002:adf:ce90:: with SMTP id r16mr21644270wrn.354.1619429015331; 
 Mon, 26 Apr 2021 02:23:35 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f1sm19721811wru.60.2021.04.26.02.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 02:23:34 -0700 (PDT)
Subject: Re: Resetting non-qdev children in a 3-phase reset device
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
 <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
 <CAFEAcA8hs3Uw=8-_CFa_GoMhmqxCcHw5t751oKzicd0_+Dh8kA@mail.gmail.com>
 <87y2datpyw.fsf@dusky.pond.sub.org>
 <5570bf5a-3cab-c30c-2c21-0ab02543199e@amsat.org>
 <2f4155ca-ee84-75f0-8b35-aac6b18ee4f0@amsat.org>
 <3dcb8efa-8f6b-0f45-a753-cc58d3bf9855@amsat.org>
 <87im4cb6ag.fsf@dusky.pond.sub.org>
 <b7f6752b-6f4c-a3d2-074c-0b41094d7dfa@amsat.org>
 <CAFEAcA__LbLXA3b8U_-wHrxcET7OwCTOoL_8kYAYsd3LTKEOZQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b3f8daaf-521d-edbe-c2f3-4af9cd74e46e@amsat.org>
Date: Mon, 26 Apr 2021 11:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA__LbLXA3b8U_-wHrxcET7OwCTOoL_8kYAYsd3LTKEOZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/21 8:33 PM, Peter Maydell wrote:
> On Sat, 24 Apr 2021 at 14:04, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> I now understand better the diag288 case, but I still don't understand
>> the TYPE_APIC one. It has no DeviceClass::reset(), its abstract parent
>> TYPE_APIC_COMMON register apic_reset_common() but being TYPE_DEVICE it
>> is not on a qbus. It is somehow connected to the X86CPU object, but the
>> single call to apic_init_reset() is from do_cpu_init() - not a reset
>> method -.
> 
> pc_machine_reset() calls device_legacy_reset(cpu->apic_state)
> which is to say it invokes the DeviceState::reset method,
> which is either kvm_apic_reset or apic_reset_common.

Oh, thanks! I guess "convoluted" is the proper adjective to describe
this reset logic. I suppose APIC is a very old device, part of the
Frankenstein PC, so hard to rework (because we are scared of the
implications of changing old & heavily used devices).

