Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5127E66C718
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:28:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSKS-0002wN-PQ; Mon, 16 Jan 2023 11:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHSKQ-0002wC-Cx
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:27:22 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHSKO-0001m3-QL
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:27:22 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso504208wmq.5
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dHcJLRa5yRo5NnDbRQj2UFCcOitqKIJfqrAKTf2grIU=;
 b=gnNFHzork/3WRc9hSVlM4c91cZOkJVG5Hx8+ui8ocXK+F6QS3OCt7XotFlHXxsKo0e
 J0YCMCyPkKF/zZym+SFcum+hZ3EamIcDjjFAzmY8W0+RlRAFzlfHpe10l68y3EzyViAg
 rgfM+5/ojAhtxbuF+QH+8C+7gTJlUASXjaNuX2uJbhEgBDIa2AWanbU4kDxQtQKvLw8C
 SU+WGAfpnHmFKrnBJB0yDzZ1eoBH8aBmGnZozyJLMfpFzg6V38jLjHNGzdveiWig7ST0
 i/Y7dUHa1l+nGvVtdkGPOzcSPlozR4X7LSl8a3jYz/XnkWnC8FOC4lCbXFyLNZIkpFPh
 OSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHcJLRa5yRo5NnDbRQj2UFCcOitqKIJfqrAKTf2grIU=;
 b=IMLa6x1zCM9GREwZXVPBSR8/PMGDXhCzZGRpMa/2pbkilrt2O57hSBTSi6oLpYpaIx
 D6gHxfbGCyr7p8zjwcTU5FhjizYtB+U4v2bisCK8ANAoZhhF6IRGQfWQa6MXmFNi9wwQ
 snMSsWYe43yv3NB1RZBdO8aaG0dSgZWhQK10ehnnAS5g4tgj/fkMXTND4v5CZLAr7P6W
 dMY9CrOv3ovjjWUlopapbi7DcUpfSu6/ECGRPoTpwhda1ssaENBOeBNMgZucPv/sJsDR
 vlIVpLddUsM7RsNijO54FgKiAGAd3EoB7B6PmsCP4qzPnMQmOf+EYTYXQerCYWmFQrsP
 YkCw==
X-Gm-Message-State: AFqh2kqBAcYbuYQwz/4svAsMGo33B3C5ZmApoZEm1JiwPFD3bCQ6aBrD
 tGjw3G1qLLlwoBVxr6C5dKc=
X-Google-Smtp-Source: AMrXdXuodVf2pPTGzO6DlLvPBNCzVGPHzgiM1rOgJbKnzmNRTgxhifcuuNYkECfMOtHF7tzP6J6AhA==
X-Received: by 2002:a05:600c:810:b0:3da:f0e:fe34 with SMTP id
 k16-20020a05600c081000b003da0f0efe34mr50347wmp.32.1673886437165; 
 Mon, 16 Jan 2023 08:27:17 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003c6bbe910fdsm47772268wmq.9.2023.01.16.08.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 08:27:16 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <21ca1bcc-f2ae-3ba4-5293-8aaa1d40321f@xen.org>
Date: Mon, 16 Jan 2023 16:27:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 11/51] i386/xen: implement HYPERVISOR_sched_op,
 SCHEDOP_shutdown
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-12-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-12-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/01/2023 12:20, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> It allows to shutdown itself via hypercall with any of the 3 reasons:
>    1) self-reboot
>    2) shutdown
>    3) crash
> 
> Implementing SCHEDOP_shutdown sub op let us handle crashes gracefully rather
> than leading to triple faults if it remains unimplemented.
> 
> In addition, the SHUTDOWN_soft_reset reason is used for kexec, to reset
> Xen shared pages and other enlightenments and leave a clean slate for the
> new kernel without the hypervisor helpfully writing information at
> unexpected addresses.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Ditch sched_op_compat which was never available for HVM guests,
>          Add SCHEDOP_soft_reset]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Paul Durrant <paul@xen.org>


