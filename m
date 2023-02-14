Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B139669600B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 11:00:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRs5n-0002T5-HI; Tue, 14 Feb 2023 04:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRs5l-0002Sn-EC
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:59:17 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRs5j-0003kF-RT
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:59:17 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a2so15018052wrd.6
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 01:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cz4fgC2KzkHAiu+weIUTkIaXAovZUaHvWhbnCYPyTr8=;
 b=WFp2eSrUEb1tL7/fQCbKKactkm4mC9LDP5Euh4kg09ovzJ/GJMZieeRzf/TwxJ9hXZ
 dJj3mPSc8rEmnm6uoW208b8hNp9LCmN5TyaM3SrxGqYxcq6d6nT4eQmy/igKRt2ssiQV
 oDqcen9Xpym7aRQrtBfJ8l6GVsAmpjSM1CuZDYeXWW/xDx2Rsw1BwXBwPHLasE9xfIHN
 pgJ7zVd+xG1KKLSwonuMWAz7+aupguLzEMS29U6u46lAek+8/u/yBMchSET3GLaMWVhI
 e+FPf0DZTXjQ1FDZHCa628C1vd2/ZsZDcxr1fqlHls7sexOyI56ZB4GMErlkwioalyNc
 jblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cz4fgC2KzkHAiu+weIUTkIaXAovZUaHvWhbnCYPyTr8=;
 b=1kxsGo+RIyENvvEnoWYFXoOjmoewLch6GU0C55s8peR5n7QXhwu52Z5LmO/mqizZzS
 CwgbFyCzvY8hcC92FngupbOtlSfbDlREai4aBtUfnHh7Ens9gC9yd26+fs26ly4nRh4x
 MBJP0Ft6Gg4MmM61hwK//7h1tugrvHnoFjlb2glne6Ks4cKzepApJJrkp8vg5UV+7gwm
 J5CMzoo/0H+Y9VzWYEW7P64YlT3qd1yjblJXz4x4Gp8eXzAHF4L84lAsV7slMb+mkFHI
 072eIMIrkjieWjVho3SyXAVLi3uZGrGdTlLDB1soXyc6dNLvxxqzN/k9wSOOTdXE9R9S
 /RzQ==
X-Gm-Message-State: AO0yUKWU3JgXuQ5+Xl8o1fIo0A96AspEufYJRYik0LAt8hkNmGbjAC68
 2XCAURgAng2bp1He5earehI=
X-Google-Smtp-Source: AK7set8L3g1JoRGisRjh7WHaSbMNV8F5iAVbE5ztYnsP//9CIPBZWx5ZrBTF9z/NEvB3WCgpjcqlpw==
X-Received: by 2002:a5d:4528:0:b0:2c1:28dc:1561 with SMTP id
 j8-20020a5d4528000000b002c128dc1561mr1684819wra.44.1676368754088; 
 Tue, 14 Feb 2023 01:59:14 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a05600c3b8d00b003dc434900e1sm17969004wms.34.2023.02.14.01.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 01:59:13 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2782d0ab-99ea-b4bf-4608-90f4db90674e@xen.org>
Date: Tue, 14 Feb 2023 09:59:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 45/59] i386/xen: Implement HYPERVISOR_grant_table_op
 and GNTTABOP_[gs]et_verson
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
 <20230201143148.1744093-46-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-46-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_gnttab.c  | 31 ++++++++++++++++++++
>   hw/i386/kvm/xen_gnttab.h  |  5 ++++
>   target/i386/kvm/xen-emu.c | 60 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 96 insertions(+)
> 
> diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
> index cd8c3ae60d..9dfce91f6a 100644
> --- a/hw/i386/kvm/xen_gnttab.c
> +++ b/hw/i386/kvm/xen_gnttab.c
> @@ -181,3 +181,34 @@ int xen_gnttab_map_page(uint64_t idx, uint64_t gfn)
>       return 0;
>   }
>   
> +int xen_gnttab_set_version_op(struct gnttab_set_version *set)
> +{
> +    int ret;
> +
> +    switch (set->version) {
> +    case 1:
> +        ret = 0;
> +        break;
> +
> +    case 2:
> +        /* Behave as before set_version was introduced. */
> +        ret = -ENOSYS;
> +        break;
> +
> +    default:
> +        ret = -EINVAL;
> +    }
> +
> +    set->version = 1;

Seems like an odd semantic. Only a version of 1 can result in a 
non-error exit. I suspect no harm will come from setting it in the error 
case though so...

Reviewed-by: Paul Durrant <paul@xen.org>


