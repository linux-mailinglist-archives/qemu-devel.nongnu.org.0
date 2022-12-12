Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CD964A27A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:54:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jE8-0004qs-76; Mon, 12 Dec 2022 08:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4jE3-0004n3-Lk
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:52:13 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4jE0-0002n9-ET
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:52:10 -0500
Received: by mail-wr1-x42d.google.com with SMTP id f18so12146541wrj.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=3UYhZlXRh8E6aunBUIvzuQWCcslbUvEmFKOIK9gxiRM=;
 b=nHgyDXWjEK++zDnARzhhleAbUBsCzOKLjB6CZNHH3kK8z2hU/5W0yKUVDZwtCZ1MaX
 D+LWHAxcYroTWPJNCf7pkeurGE/S/Lz3tkIzGJgCwTzTfoK3yOu/MaSsij7Nwb5qS6EF
 M/9YgqI/EzgWGMSrQEquk34SwP1YUC17JqZelFdbHq6kBZ9/qDAuKWqlP0f1GpNgEPqb
 /vrsZGgzgKnGcmcD+7kQ1RzvIexETQvtxyokAmo0kWhsZtdXNTytf/C0xSFJjOXfKjQr
 cI2r+2hKYh2iuqS0WFkdF3i7V3m51pI445JyqJZCyiNtzvyG2CcqvinZmwLJ7B94HyRa
 CHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3UYhZlXRh8E6aunBUIvzuQWCcslbUvEmFKOIK9gxiRM=;
 b=XXczyaoksoFsNfgY3rlpG62TIrnVuKBsYcJp3svzF70itxu22TIbo05FIFhmu91L4s
 SjSqTNl53S8Y97+g+6rl/sqRH/ew2Oc7ahYZrfAGtdAYdLTtWeKgFk8epq0qfKrCsP28
 9MT+JK+XFso+WE4jPukTI8UxkHy6jRwjSvcGXJXs2yTmPVVLOSBLVIeLOUCSNl8WVVlQ
 cFVdOb7V7325q2rEEQnc+AobTKZ9A7EPBD2gwVV/1BQP6Z92wwltwoGDyBH5smVuevku
 l/qii9Umii6TN3yB9m5JFXm7aaz6cK6f6QLgU88gxLk2fugVFbjXkIU7sCXZaojGioI5
 bf0w==
X-Gm-Message-State: ANoB5pnkcUweuTUdHCD+gM2g+v9GZkGRqxEr4i7skRsWt45DO6UCKP7D
 d4Xl8tmMiay9b/cKPs6SSNY=
X-Google-Smtp-Source: AA0mqf4vF0PgKWI+oRniqn0mGrvlXvtqMSObjOn1PWP2ACOONHI6rHkwzVs0nOkXJ/zvw5pNldd+MA==
X-Received: by 2002:adf:ecc1:0:b0:242:710c:9916 with SMTP id
 s1-20020adfecc1000000b00242710c9916mr10024125wro.70.1670853126813; 
 Mon, 12 Dec 2022 05:52:06 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 a18-20020adffb92000000b002424b695f7esm8958767wrr.46.2022.12.12.05.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 05:52:06 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <5fd96ad6-f033-f26c-4447-2379eaca0578@xen.org>
Date: Mon, 12 Dec 2022 13:52:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 08/22] xen_platform: exclude vfio-pci from the PCI
 platform unplug
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-9-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-9-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09/12/2022 09:55, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Such that PCI passthrough devices work for Xen emulated guests.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/xen/xen_platform.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


