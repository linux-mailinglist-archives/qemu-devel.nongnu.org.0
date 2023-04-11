Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297006DDDB2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:25:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmEuT-0002L9-HX; Tue, 11 Apr 2023 10:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pmEuP-0002Gb-0R
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:23:45 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pmEuK-0000dW-RP
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:23:43 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 y11-20020a17090a600b00b0024693e96b58so7014568pji.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681223017;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NI2Vx+lSgdJLBgUoh8kmUEeSSoiXbr7zRbOBeQ1MFTs=;
 b=D4QzL/jofKqXuoQHruZPyAlB1MQ9QHTh/pgmkdLCDzCA9afThDGd/ji+kZeGjrMKx5
 YsTtTBIQSQVrjHGWtOENL3mcVvDrrEhkT1HqJiXAQA/wva85HzljAVULoo6/ajXrVLNJ
 z9BLecYmMrWOd1+Kzc+KKcO3SSjdxza4QWycF0ntFmMNZ/r3Ny79UyHUzIGCpdUanO9l
 G158x4HqAWiFHxNJXm1lVpUpOxe9F9bAdtp4H+ZX3gwYk5KSXLBPcVjKG+TQnkDqwLO6
 ZHg5yEFw7T7ZSlphdx1QTkH7X6XRzbqA+Dn9YV8Suk4B/7MEijYEfH6NLSlZTpWeYFya
 ifUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681223017;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NI2Vx+lSgdJLBgUoh8kmUEeSSoiXbr7zRbOBeQ1MFTs=;
 b=P+fTP6q2xrjNnRSIgrJAZikaA+fuZYhnHqL7Vt8I8KPg8DcfIqzekMIcsr7mYu9eOI
 480RJP8TtwMyuzlgoKvxKcQuVcPGsNlGOm8EYcMd5IOFdyf6VSXzxdf3RQfVg/xgHB7q
 wJF4RPnQao4eqlnkewlXYWXvpith8M7Qgs3TeFOI0sIXsdSJq5k+hObmpxWhIuK3R5U3
 vXTrpV4NDY3QFfF74o48jVXISBG0puehm5hifdF/Hu8HBdb+dquJPIier98iAs+ws1rj
 hn3HHTtS88HUTHPvcLBJibL0urPOO/yLspkglrDZiJ7TacU7APTDmvXR3IZTMaqRiR5G
 aHww==
X-Gm-Message-State: AAQBX9dSURpibGzPFLLWm5VpxFS/FghmP7iepeA5w6HJTKzFDBpNR7bl
 Hnys4pjaf1W+Xj2IDocSkqQ=
X-Google-Smtp-Source: AKy350aDzmHBKAftqh2Buuc50q65zt6PPB0463CqLW6qVfXw0EG0vyhmp5SSgHD4XjpuVCgXj7WuFw==
X-Received: by 2002:a05:6a20:bb2a:b0:e9:5b0a:e7e7 with SMTP id
 fc42-20020a056a20bb2a00b000e95b0ae7e7mr10917818pzb.15.1681223016664; 
 Tue, 11 Apr 2023 07:23:36 -0700 (PDT)
Received: from ?IPV6:2001:ee0:4fb3:2ba0:dcb1:c928:97e1:ce5f?
 ([2001:ee0:4fb3:2ba0:dcb1:c928:97e1:ce5f])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa79096000000b005e0699464e3sm9850085pfa.206.2023.04.11.07.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 07:23:36 -0700 (PDT)
Message-ID: <15b46132-67b3-83f5-2eaa-efdf8f95ce24@gmail.com>
Date: Tue, 11 Apr 2023 21:23:30 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/5] Support x2APIC mode with TCG accelerator
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230409144022.8111-1-minhquangbui99@gmail.com>
 <20230411030857-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <20230411030857-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.17,
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

On 4/11/23 14:09, Michael S. Tsirkin wrote:
> On Sun, Apr 09, 2023 at 09:40:22PM +0700, Bui Quang Minh wrote:
>> Hi everyone,
>>
>> This series implements x2APIC mode in userspace local APIC and the
>> RDMSR/WRMSR helper to access x2APIC registers in x2APIC mode. Intel iommu
>> and AMD iommu are adjusted to support x2APIC interrupt remapping. With this
>> series, we can now boot Linux kernel into x2APIC mode with TCG accelerator
>> using either Intel or AMD iommu.
>>
>> Testing the emulated userspace APIC with kvm-unit-tests, disable test
>> device with this patch
> 
> 
> Threading's broken with this posting.

Oh, thank you, I will repost this series with correct threading.
Quang Minh.

