Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA7F6AE523
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:43:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZTH-0005Uw-U9; Tue, 07 Mar 2023 10:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZZTG-0005Si-4G
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:43:22 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZZTE-0006ND-6v
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:43:21 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v16so12636510wrn.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 07:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678203799;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2kGRmcPQfXmhNBAcM1NELXheCNXcNQIOEudfaQKrvbk=;
 b=CKRCeHP9CceVcZiXAWiuW5iGE9iYz2wAJCrxawLyk3t+WwyAE2uZMWmicOYRLqwoE/
 7VXjn/8bqhfr7VcLV0njk9491mfDjbSEE3a8NSgycDoq1ZzFSyqKz3IKT2fsWMr62utz
 dOrYfcDxy6W2Untx3j7jdsUuhGq1nnhEkMWb1G+VhNnb4rsXCK0NxY4fVnj2D552CjV+
 JZyzEW1VY/bSViSIZbypP5HHdwEUdmXGNlNygua1QfwkRAK2+/Pg1t18+n/1LWBEdKfb
 JtWd+r2yqB2FHbZczUhWZJTkfXPTCcmrrUq6TIN26N5DfEANGRA2XBDb1KRfc7sM7QDv
 zR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678203799;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kGRmcPQfXmhNBAcM1NELXheCNXcNQIOEudfaQKrvbk=;
 b=ZWBJd/gdfHgGQC5/EdOfn5GlgpGhVl+naw6VPaRmwY9fZLe+NUAg+yv+848Lr+Epu4
 uhOKLGsbslXCvX5zptP2Xhyuo/UIvSoIK7TYBdWPgjzJmym90Rv5+vNBj9H0NiosbxBa
 wtOTYBTp5nK5eiO5pAaGaoi2b6JqOd/ekuvig9R1tPkJe3GHeyvjit0HSFycLIEfljbm
 oO/X0OydoeTwWobddXh9kmjciL7JQMqDM7Zqo/aSTEEuCsf5CbMOOzXgm+3wngq6ljLT
 Q52O6nUCCzS7+2xRgFxej5+R3QSixmpEckzpPzAwAlX0gnyNuVWC7Tca1HeNIFILnK5q
 /TxQ==
X-Gm-Message-State: AO0yUKX2aSQ3a1Jdf6DjdXNbdnvhjAyjwnNM6GGd41kytAib4yMWfqn3
 cU3WfrqAaOKViZPJsQK7HlI=
X-Google-Smtp-Source: AK7set+VqiNW2e9+7lxKKxmINTlQmiZWcfel3GBq1alupg3FTk/mwEkf1apbIO7Prt5VWWYGRb+EtQ==
X-Received: by 2002:a5d:5917:0:b0:2c7:69b:317f with SMTP id
 v23-20020a5d5917000000b002c7069b317fmr9412876wrd.60.1678203798778; 
 Tue, 07 Mar 2023 07:43:18 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5945000000b002c3f9404c45sm12808536wri.7.2023.03.07.07.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:43:18 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <66f5a996-7783-ec98-51f4-829a1ab82890@xen.org>
Date: Tue, 7 Mar 2023 15:43:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 18/25] hw/xen: Avoid crash when backend watch fires
 too early
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-19-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-19-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42a.google.com
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
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The xen-block code ends up calling aio_poll() through blkconf_geometry(),
> which means we see watch events during the indirect call to
> xendev_class->realize() in xen_device_realize(). Unfortunately this call
> is made before populating the initial frontend and backend device nodes
> in xenstore and hence xen_block_frontend_changed() (which is called from
> a watch event) fails to read the frontend's 'state' node, and hence
> believes the device is being torn down. This in-turn sets the backend
> state to XenbusStateClosed and causes the device to be deleted before it
> is fully set up, leading to the crash.
> By simply moving the call to xendev_class->realize() after the initial
> xenstore nodes are populated, this sorry state of affairs is avoided.
> 
> Reported-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xen/xen-bus.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


