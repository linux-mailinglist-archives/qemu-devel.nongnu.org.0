Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553206968FB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:13:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxuq-0003ZW-Q8; Tue, 14 Feb 2023 11:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxuo-0003Yu-1g
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:12:22 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxum-0005Y0-Gl
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:12:21 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso6638786wmo.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9BCet0/Ytl+7EIkTe1BFUFOgdQVSDSzfrKkXy3IIAzg=;
 b=VKCZFbVrLIWNPkWAcr+Arvex2026a/BTZ24RBPyZhSfK7qIxuswf9B8+zK9Ey9BFch
 jxoy6Po8KqiP19DTbO1G/gThDn96/rt+wl+b1Bh23MKaXKPCumeAHljP7dIDQusKEqF1
 u2yeoQf6808xzxxLIv/iif81TFpjnaZgDoUUwOfXJyjKpc2oIN7/GnKjGBmtMffjyTEk
 Ew5sPDATj9Uiws4NRuoe4HoxlAzdAXbtQW6ckSw/XjN1mEqwhsVKMa0zr73hnt2Pqmkx
 soHe4TqayuGxmgI5Z3wY/xQRxJiwgAoE8MdJ+hzEkiUkX0pEUsng35Lv9Z6erHQmkrYS
 SIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9BCet0/Ytl+7EIkTe1BFUFOgdQVSDSzfrKkXy3IIAzg=;
 b=LBfTXw/xunvfxCrPUVuYoAppa1eEj0rPxU14VQs1wrFoi8dukN+qtRKPcTznPs+vAx
 5B4NCXmicXxnrHLOiOzMQAuIU+axUVKJWF6WZ+uKXRQPeQ/RZ7Er/qb02X1vNq6Ix4oK
 ZRW1F9T2npKl33+OJjnguSt/sIirqLr7aK3fUMWbtoV2n82d1+ue0GE++u1s6L3ALym/
 g/UnUyfsnwkapdw2FYzgTh66jgcafxvxo+hDi4/XvG5av+RHXnyUnLR+Uy71IQpqg/Lw
 SL3JmasVxJlJf4IcCfC/2gON+u3hicc2nThrMR3mSlz58HlNF2sr8usiTpqNapRJIsB7
 UbAQ==
X-Gm-Message-State: AO0yUKU70XZu75zW9e/0uMTxRP4cbEqVCOwkNgL3eJ53LkycuLrAolH/
 z2HKgMri18QpdOpOt4l+Smg=
X-Google-Smtp-Source: AK7set+HiaUiC+tCSYoEwL2ff58hQl8oGvKlzC1d0thtv2oA7Fm+KXxGkMHrZGI3bHLg3QBFTh3tYw==
X-Received: by 2002:a05:600c:4b1d:b0:3df:fbc7:5b10 with SMTP id
 i29-20020a05600c4b1d00b003dffbc75b10mr2553404wmp.0.1676391138970; 
 Tue, 14 Feb 2023 08:12:18 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c314800b003e11ad0750csm17283999wmo.47.2023.02.14.08.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 08:12:18 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <47665194-a530-484a-6e8e-404f3ad119bf@xen.org>
Date: Tue, 14 Feb 2023 16:12:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 56/59] hw/xen: Support GSI mapping to PIRQ
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-57-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-57-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> If I advertise XENFEAT_hvm_pirqs then a guest now boots successfully as
> long as I tell it 'pci=nomsi'.
> 
> [root@localhost ~]# cat /proc/interrupts
>             CPU0
>    0:         52   IO-APIC   2-edge      timer
>    1:         16  xen-pirq   1-ioapic-edge  i8042
>    4:       1534  xen-pirq   4-ioapic-edge  ttyS0
>    8:          1  xen-pirq   8-ioapic-edge  rtc0
>    9:          0  xen-pirq   9-ioapic-level  acpi
>   11:       5648  xen-pirq  11-ioapic-level  ahci[0000:00:04.0]
>   12:        257  xen-pirq  12-ioapic-edge  i8042
> ...
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 56 +++++++++++++++++++++++++++++++++++++++-
>   hw/i386/kvm/xen_evtchn.h |  2 ++
>   hw/i386/x86.c            | 16 ++++++++++++
>   3 files changed, 73 insertions(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


