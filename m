Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF65652496
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 17:24:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7fOk-00022y-3d; Tue, 20 Dec 2022 11:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7fOh-000218-5H
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:23:19 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7fOT-0003bc-Ke
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:23:18 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso9246153wmo.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 08:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d1YTksavfwYYqa8if0wIA++N7mc6mNZMWiVCAyLHuzs=;
 b=oglmmxAhSsNz8wJYPk4ohaNAhtIvq8uZOwDaojxex8XMtmlqhRuBsci9xRqytS+Ipf
 Dl3ILy4ZyMb7/YIf4kFHS0mHvoy8q5K9LDz455V1m4xq6niPI1k47S40NmlPV+Q91poT
 xGp/os4mMeA+QWVNOYpfQoGG2E8GuMrPs/zJDDmJD2d14sfA+W5JE7e+F43GBbx7Gdgs
 OuVNCKAoI6n7gfYcHnrmST/7Bgw4yiXRVbLZbWA6gmOT+bsg39dSMWnmOZFW08WYIV61
 yQUD8jocEJ+xMFzWfoRbFrxUA9TCO/BKU0shScoLj4EVdP9imMtJi+9jALDHa9gqymZ2
 TsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d1YTksavfwYYqa8if0wIA++N7mc6mNZMWiVCAyLHuzs=;
 b=43ctwlqJDwiApTzM0BaeY8VLxd2flHvD8xOycMEKrldUdbWwMYU76a+ymr7S5G6yv8
 GPnfj2xk7/hojFTcITqqPS5J/lwxuXA8yL5MLZzZrofs3Bz960ZcDpoEc2u5pxgnm0oD
 ptCgL5fl42QFtU4TP4p2oZvb8/XFr/RQrwc9IrfrSj/QJimJz2RLgqm3/kptVCkvMPkp
 Lb/3hTjjWYSFO6VsgOLPgpLWs5LrYygZIVnaLfSvrLHhA+2RcDB5JHstT3dqdwAQSAOa
 eYvjtaIZYyfbmoM3vrKWpo+cUn83HLUpnlrKFFajtdjUDef37Rw3HTsgco1SyBN6Ukv1
 FCCQ==
X-Gm-Message-State: ANoB5pnw+aIuTZWvSFZ0SBc8DGScuBMiVjlfwvwZ8Pi+gRCb//EkrDlv
 wM4+hqSisKMRcZ9OA3AZwOg=
X-Google-Smtp-Source: AA0mqf7HRMq+tcZbevNcF3mFUGAX97wYNwpHELoG846pxSGCSDR6geNaie1PqD1dRWwr6NFLnac3qA==
X-Received: by 2002:a05:600c:554b:b0:3d2:1761:3742 with SMTP id
 iz11-20020a05600c554b00b003d217613742mr30493044wmb.15.1671553379644; 
 Tue, 20 Dec 2022 08:22:59 -0800 (PST)
Received: from [192.168.6.89] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a1ca1c4000000b003d22528decesm23713324wme.43.2022.12.20.08.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 08:22:59 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <bccad857-8038-1406-209e-c5e0a1a721cd@xen.org>
Date: Tue, 20 Dec 2022 16:22:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 08/38] hw/xen_backend: refactor xen_be_init()
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
References: <20221216004117.862106-1-dwmw2@infradead.org>
 <20221216004117.862106-9-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221216004117.862106-9-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.161, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 16/12/2022 00:40, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xen/xen-legacy-backend.c         | 40 +++++++++++++++++++++--------
>   include/hw/xen/xen-legacy-backend.h |  3 +++
>   2 files changed, 32 insertions(+), 11 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


