Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD3E473059
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:23:19 +0100 (CET)
Received: from localhost ([::1]:47970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnAc-00033c-JY
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:23:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwn9F-0001cR-7v
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:21:53 -0500
Received: from [2607:f8b0:4864:20::1034] (port=39823
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwn9D-0007SP-JI
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:21:52 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so14872369pjc.4
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 07:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AGc1PquQXh0+9331OAt9/t/pIqsDq0eIaBHESSHpnxA=;
 b=HzoQt+uthV6vbcJBqrKhH8j/XHs+GtMpyP7UM24kBENT+NfcMcD8q73DEayMJFAfXW
 T/H0duDe+hRFBkSje431MCOqjpnoeAzMinRBa/7+ZVIIa4YNDlfHT4AuuVcnptlaHPPX
 dj/pZL1t99ystjuI/QFfjp+cSMxA6ptDeiX2+id4PhthCtDq7alneV5MFNn8z3VgwScN
 dEgYKBBD5L40M72WwasSMttpH+1qv3ghydG+CuGiP0596hH956hilMQFSiV6qYyH8Xdk
 2vzSOGEN/TN2gvnlk/Dw+P2/zeG1czRpibulnt88oawnU1fUxdO8ZagCubTCFdoUrq+y
 iqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AGc1PquQXh0+9331OAt9/t/pIqsDq0eIaBHESSHpnxA=;
 b=Huy6dzgZwUDkAsShz/Tb/KvwvPgdsom6pYOgUukIpo9VtrgCycirpkKZIJVmVDlFh7
 CCDKX1zuVZeeZP0L89mWRid7NNMmnxrjADa+N36QLZD2bLR4VXjDtAhgNPssv0z+MfPr
 9P5wOUKytQ7rluCNOZ1obllEcH4C4Fet6Dd2bDJSe8Kz5xRAJOilfb1tvjYtfS8vrSaL
 WSJoMdv1syCSRKWYBTphwMVJM1OUCXg3N1OTq+cUzZQOscU5imIFFXX7Utg21qLZn0jH
 mSXisoect5UMR4G/+WmP6XjjpsUIOzMaPhAii31qrvN7U/30c3dhVeQ+Y3b5WtJmIqUA
 ztaQ==
X-Gm-Message-State: AOAM533hVFVGMCXIe00ecwFomwfo92LArV1q1barCdIQAcTr2oznfv7q
 0UKLt5ON0oILIjQLQEovq1pMSA==
X-Google-Smtp-Source: ABdhPJxGt30nuzSBLZfqYPjbexcn085QFp2N6BpQabQxMRsjKxAHXZAfch8zfO4BJ3JlY+kcXaTqIg==
X-Received: by 2002:a17:90b:4c8c:: with SMTP id
 my12mr44483778pjb.157.1639408910304; 
 Mon, 13 Dec 2021 07:21:50 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t191sm5315472pgd.3.2021.12.13.07.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 07:21:49 -0800 (PST)
Subject: Re: [PATCH v2 12/12] target/riscv: Support virtual time context
 synchronization
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-13-jiangyifei@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10d2d911-e975-64b3-8ab6-e950c5064b9e@linaro.org>
Date: Mon, 13 Dec 2021 07:21:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210100732.1080-13-jiangyifei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: bin.meng@windriver.com, Mingwang Li <limingwang@huawei.com>,
 kvm@vger.kernel.org, libvir-list@redhat.com, anup.patel@wdc.com,
 wanbo13@huawei.com, Alistair.Francis@wdc.com, kvm-riscv@lists.infradead.org,
 wanghaibin.wang@huawei.com, palmer@dabbelt.com, fanliang@huawei.com,
 wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 2:07 AM, Yifei Jiang via wrote:
> +static bool kvmtimer_needed(void *opaque)
> +{
> +    return kvm_enabled();
> +}
> +
> +
> +static const VMStateDescription vmstate_kvmtimer = {
> +    .name = "cpu/kvmtimer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = kvmtimer_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static int cpu_post_load(void *opaque, int version_id)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (kvm_enabled()) {
> +        env->kvm_timer_dirty = true;
> +    }
> +    return 0;
> +}

This post-load belongs on the vmstate_kvmtimer struct, so that you need not re-check 
kvm_enabled().

>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
> -    .version_id = 3,
> -    .minimum_version_id = 3,
> +    .version_id = 4,
> +    .minimum_version_id = 4,
> +    .post_load = cpu_post_load,

No need for version change.


r~

