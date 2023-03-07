Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A208C6AF697
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 21:22:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZdnq-0001nw-J5; Tue, 07 Mar 2023 15:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZdnh-0001mD-5J
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:20:46 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZdne-0001Jv-00
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:20:44 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso11230106wmq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 12:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678220440;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=//KTGqo1ZbuvwkeVCqTamRYcpCZggzKkeREBxxg498A=;
 b=ZcjdPGGFbiU+FQEvZm/+Ra9cB4jMByi+fSjS17RGnN0pX3/JjeBjEmTXeE9tWvlRNm
 +xiAqhshb9ZnJxgTn2mk6gr6gf1HHD0e/JGRM5LvY5BFnBoANAbP7zZId0TUNmiov3JA
 cq2fnyUO82aBdwEc9skq/DPossrB5DU7QJj1pJeEW0RdeaFPSgk4DkL64ywSyiDoSD7u
 a5VPRtWNkBu9dFBTb5Of0EwURgyMvTrP3IxqxNrZsK4CRBQNhsgw1x7PdC4TVV6iHO6p
 mrS30etFQn3vluKuTQE6GJMlLP7s0jkBdNgmZNliVOsJGsIYuCcM5Y+1LgbwgQTCQ1RW
 MeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678220440;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=//KTGqo1ZbuvwkeVCqTamRYcpCZggzKkeREBxxg498A=;
 b=IPETwRoYA6dAp1WA5Zyh3205Yxpr33nF1JjG/rR5ptpRFhKfa7lpaplMELZkSan+NW
 yYBlodCtBTOzaYIVVfjXa5mFYJwR2HZwhgnJDaC1HPPf42LjRvFQKeEPgu1FJh6sCIRL
 yOc5h9YTJWldsJCjOIn1F2afLKZrdxs/jiPrP+fZf2l6u2395Imy6YwOIeHGmwox8mWC
 JzEnavMRfN5SYOA6GoA4KKe91NX0oK3F4niv2odQqFSbpjCGRKjY/bo6Yw2/q9yn6sS5
 VvJtadd4ixHcRNkzNOJLQ+DeadGvHEbnkMqgtywbLVcTJMkENskHWA1BGu3x621h/dgv
 /egw==
X-Gm-Message-State: AO0yUKUOUiUl9g+lauSD9JtrcgnXaTqfCd709xj3eSRg1ZPwL0YsAptF
 GpGCYSG728Disw4utRqeEssG8w==
X-Google-Smtp-Source: AK7set+3DpOcP7xHfRowsfuVV2o2eM9Iw1P8Yp9l56Ty1WWUasOSFy0fQ9J+M8AoONGrOrdA4Yksww==
X-Received: by 2002:a05:600c:3c85:b0:3ea:f05b:50cc with SMTP id
 bg5-20020a05600c3c8500b003eaf05b50ccmr14928023wmb.8.1678220440099; 
 Tue, 07 Mar 2023 12:20:40 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c33aa00b003e215a796fasm13566660wmp.34.2023.03.07.12.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 12:20:39 -0800 (PST)
Message-ID: <c53bca89-53d3-11ca-a768-dc7e9143e7b1@linaro.org>
Date: Tue, 7 Mar 2023 21:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 00/27] Enable PV backends with Xen/KVM emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Hi David,

On 7/3/23 19:26, David Woodhouse wrote:
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:
> 
>    Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)
> 
> are available in the Git repository at:
> 
>    git://git.infradead.org/users/dwmw2/qemu.git refs/tags/xenfv-2
> 
> for you to fetch changes up to 154eac37190c4d80d29b09c226abd899e397530f:
> 
>    docs: Update Xen-on-KVM documentation for PV disk support (2023-03-07 17:04:30 +0000)
> 
> 
> Tested-by: Paul Durrant <paul@xen.org>
> ... on real Xen (master branch, 4.18) with a Debian guest.

This tag only appears in the cover letter, and is missing in each patch.
It would have been acceptable if it were in the PR tag, but
the tag (which for some reason isn't displayed in your cover letter)
is simply "PV back end support for emulated Xen".

You can fetch a series with tag applied with b4:
https://github.com/mricon/b4

You can post signed PR with easily with git-publish:
https://github.com/stefanha/git-publish

> ----------------------------------------------------------------
> David Woodhouse (23):
>        hw/xen: Add xenstore wire implementation and implementation stubs
>        hw/xen: Add basic XenStore tree walk and write/read/directory support
>        hw/xen: Implement XenStore watches
>        hw/xen: Implement XenStore transactions
>        hw/xen: Watches on XenStore transactions
>        hw/xen: Implement core serialize/deserialize methods for xenstore_impl
>        hw/xen: Add evtchn operations to allow redirection to internal emulation
>        hw/xen: Add gnttab operations to allow redirection to internal emulation
>        hw/xen: Pass grant ref to gnttab unmap operation
>        hw/xen: Add foreignmem operations to allow redirection to internal emulation
>        hw/xen: Move xenstore_store_pv_console_info to xen_console.c
>        hw/xen: Use XEN_PAGE_SIZE in PV backend drivers
>        hw/xen: Rename xen_common.h to xen_native.h
>        hw/xen: Build PV backend drivers for CONFIG_XEN_BUS
>        hw/xen: Only advertise ring-page-order for xen-block if gnttab supports it
>        hw/xen: Hook up emulated implementation for event channel operations
>        hw/xen: Add emulated implementation of grant table operations
>        hw/xen: Add emulated implementation of XenStore operations
>        hw/xen: Map guest XENSTORE_PFN grant in emulated Xenstore
>        hw/xen: Implement soft reset for emulated gnttab
>        i386/xen: Initialize Xen backends from pc_basic_device_init() for emulation
>        MAINTAINERS: Add entry for Xen on KVM emulation
>        docs: Update Xen-on-KVM documentation for PV disk support
> 
> Paul Durrant (4):
>        hw/xen: Implement XenStore permissions
>        hw/xen: Create initial XenStore nodes
>        hw/xen: Add xenstore operations to allow redirection to internal emulation
>        hw/xen: Avoid crash when backend watch fires too early


