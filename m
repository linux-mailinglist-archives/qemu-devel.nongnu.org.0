Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCCE6AE337
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:49:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYbu-0007zz-FT; Tue, 07 Mar 2023 09:48:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYbl-0007zk-Um
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:48:06 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYbj-0002S1-4P
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:48:04 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p16so7911399wmq.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678200454;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8pvI8mWRtOffX7ZweM8Bm3DrCuqAqcnBQHi5XLhLR0g=;
 b=alYzenEzUp2r8Vy229p1P745TTWU2+ZbX8TzLWtvWRpPTXeMlGbQOHk4ZajY3xz/6N
 GzUHEl4YuqPe4t8Hl5ZNwZ8LELWkAFQhvfbYQm1DUZYbd619DH1lg6g7XPPUWe7Y2fV/
 +fQCuSVMU0L/57kbsIA7seQry9CANI0eKyWWb/qw99ndtV4jh9eIm0f25Ug8xHU4KCPk
 Kdggq0ySW+815Q28xTYIn8fck+oqEZF69IJUlk//i+ydQAtNhybPiLTNLGDL/zHZNp7n
 VWWu1qG70u8osSODE0VnTfW/dPdKFFN8TrhbwcHv8nNMOclRBRSP5n6CF15/JoC4kr40
 rXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678200454;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8pvI8mWRtOffX7ZweM8Bm3DrCuqAqcnBQHi5XLhLR0g=;
 b=4Sl7Ut9ZS9aspAr45gAsw+1tgA5d+QQYhqJ9ZayuKZDD1tIwfS0tutXTRfaTtKYhoJ
 phJFyLy0wmUjlfGNF67kbO7B33+2zpbWgaZF3iwVfCOjjw9nSx41gMLHG770YrYHHG49
 1FxBAIiqdUjn3HIXv2g1208eqKsgvJUF4RzTVktBbdP6I86E62dHm1F5prKT7fV49awK
 za26q5a6nnkmwb/Xi3HCxdJqkyBe0lCSE1CO4I/jLf71ZO/q71CvVqUvRMwIp13CoCHy
 MGYsHkxYPBfp6os76ZYtOsPwwJWl2bBWLJ95QpVDuPu646NZvyCflC391/7luJ8zlraC
 UgRA==
X-Gm-Message-State: AO0yUKWGq1wwCa5IiIeyiGWNm1T/82Qby8W58GUErPXbmuczZz7cRocM
 PvNEwMthKo3dITq2+sZra1M=
X-Google-Smtp-Source: AK7set/PT9wHI1ZQ1RmWcMUPmH0kMfiSHl/cQ+QojdbC2iTtmbOaNW0Ly8PRdtS5cR5yr13JA4Auag==
X-Received: by 2002:a05:600c:1992:b0:3e2:9b4:4303 with SMTP id
 t18-20020a05600c199200b003e209b44303mr13106588wmq.19.1678200454574; 
 Tue, 07 Mar 2023 06:47:34 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a05600c329900b003eb5ce1b734sm13767030wmp.7.2023.03.07.06.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:47:34 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <43bf286f-4b3e-5956-25b1-4ab527657fbb@xen.org>
Date: Tue, 7 Mar 2023 14:47:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 14/25] hw/xen: Move xenstore_store_pv_console_info
 to xen_console.c
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-15-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-15-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32b.google.com
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There's no need for this to be in the Xen accel code, and as we want to
> use the Xen console support with KVM-emulated Xen we'll want to have a
> platform-agnostic version of it. Make it use GString to build up the
> path while we're at it.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/xen/xen-all.c   | 61 -------------------------------------------
>   hw/char/xen_console.c | 45 +++++++++++++++++++++++++++++--
>   include/hw/xen/xen.h  |  2 --
>   3 files changed, 43 insertions(+), 65 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


