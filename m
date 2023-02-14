Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0242C6968BB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:04:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxmr-0005GQ-Q7; Tue, 14 Feb 2023 11:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxmq-0005Fs-H5
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:04:08 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxmo-0001OS-QR
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:04:08 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso14054303wms.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IkCQzah6EEHJSmAGkR2OqMMbePxCozDKzMCGnMBNr5o=;
 b=oUDM4uU9smcUamzjU3dfnoCvepJu8ycpUNAhG1+ySoguVTzwqVTYlH26de2/Yha57T
 9s9kR9orw+nvjsFN1GgAJtolP36GnQCHvYdqQrkVygY53316FgPpXQjud7hYD+xW5diu
 dXul7IduQwzK4V2OFM1fvAjH1T3nvYi2Eaib3JB/G6Qu+nhhM8W/uAnqk0sD1/YmHNv2
 7rbWXg9040B7ea274QK71ukcdBwm9b8kqrcCdXQzCUeECIYbPVrB27UzdzvGoD7d1FpH
 OC4b3EtqrT4EQwepKkRFwj7UNWe6ecgpnbqimqxiECHhnV8Y9zJK9pt5a1AniCXldi4b
 5dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IkCQzah6EEHJSmAGkR2OqMMbePxCozDKzMCGnMBNr5o=;
 b=dZ1Xs9Cmji69DTfPevuumSg9fYlqZV/EARZChQ5+AxCo8rssrZd/WX9QhzXTitQoY6
 Lq+M8IeySu32I1YgGQPSUcqVfKieUlEksLfNDgLAlNNusWc/Oi5zZfJGdmJnWy5DCH08
 DY4w4eQZghGdaWca8YbUL9kZUWPwAt2+hI6wzMCgS0aBm2NSPydD9nNtPA0qk3TZVwhk
 KwpzNN/CLVdaGjEJaWN4i5Ht0KJf2s7PtrXhZIAssJTIH7GJxlzyFmcpJReSLSI7XIq5
 2m3SeyFDZ4ZjwEJmCOHdd8QzqNfozxb8IEz0EiwZoSP7FT4UYwAqMg1hCkFL6wkyFBjX
 TG9w==
X-Gm-Message-State: AO0yUKUTQrKmXn7pfbzKmHPMkX7pJKdDlI0VEAXtl6o4osc1LXRRMgV1
 liWSbYdR4bPVapdaIrRpV/ih1yEdu/dk8w==
X-Google-Smtp-Source: AK7set+dZ2GUyD51qf2GLvNBQ9jt0cuvZwLR8az0wLyxj0Pt+8f8S29S8gYJbGQTT/XLicR9nR51wA==
X-Received: by 2002:a05:600c:130f:b0:3df:fd8c:8f2f with SMTP id
 j15-20020a05600c130f00b003dffd8c8f2fmr2350205wmf.40.1676390644887; 
 Tue, 14 Feb 2023 08:04:04 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a05600c475300b003dc433355aasm19024813wmo.18.2023.02.14.08.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 08:04:04 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <a73392af-60d5-d17f-1649-4a92b2c809ba@xen.org>
Date: Tue, 14 Feb 2023 16:04:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 53/59] hw/xen: Automatically add xen-platform PCI
 device for emulated Xen guests
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
 <20230201143148.1744093-54-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-54-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x331.google.com
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
> It isn't strictly mandatory but Linux guests at least will only map
> their grant tables over the dummy BAR that it provides, and don't have
> sufficient wit to map them in any other unused part of their guest
> address space. So include it by default for minimal surprise factor.
> 
> As I come to document "how to run a Xen guest in QEMU", this means one
> fewer thing to tell the user about, according to the mantra of "if it
> needs documenting, fix it first, then document what remains".
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/pc.c | 3 +++
>   1 file changed, 3 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


