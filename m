Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F003831FEB7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 19:21:41 +0100 (CET)
Received: from localhost ([::1]:40348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDAPM-0000zB-8D
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 13:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1lDAO8-0000B4-HT; Fri, 19 Feb 2021 13:20:24 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1lDAO6-0000mT-Ro; Fri, 19 Feb 2021 13:20:24 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o15so7814947wmq.5;
 Fri, 19 Feb 2021 10:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QWLOIiitmqBo5+3UaA0iJ43f4RC209g18TM/vosn6KU=;
 b=POVBAu9h6VXtheGXvk2NfpN7VuXcoirzXDBHZeSRMcMGwnLtXNDmDnbRloswSncCiu
 UUBmOonAiKAxfUdgfpFKvVHNlcCFmDWcmG8TCbHlREKDdpiW5tij6aSeDioQohoQDmeC
 l2FziYTXDZmhyOPKjnAEbFWKjYxdlG6G3js9cUC1ajMTGuLS3fEZNPbSMl5onWT1CxdM
 Q2YUQQV7bJTmWqgCLcKw5KDw4nOFUtWukP3ASDJiAqkYmBSvJTP2EuipIaJIBK23iSfg
 JQjIFR1ep2dPw3zIHeetdBiKkyAERCkBqJuP8d2NkTJ+YjJg4vONwd4TsJwMnLvHRhe0
 xrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:subject:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QWLOIiitmqBo5+3UaA0iJ43f4RC209g18TM/vosn6KU=;
 b=AURS/4ne9tMJV+Px9ryZGoWjugSWAtvs+E/4LrPN0vA5Tow7ERpoUsYmbqAdcWwNo/
 jR+psyx+V7Wx6SAEQRBU+tjySiS86QMyZ0Wa5ZWTvjbBvjNBiVaLbqarlipjUKJFWJCe
 TrAzamXcSrV2z8DVDCXRotEubbkihETqWThMdzlpX7MIyrfy+eJRmHki74WVaIuVQR3i
 h3Hl2J/MD9M8P3/kgXgi7yW71nFNC4+iIkYv6CKteG+v/dhwAcQZ/K1b/vaHxwumwR2f
 woVqKZ19rsHB0aCcF4WGlmc76nLEJXng9Sd/8Iqe0hKdQIqYzyK9V+r3aMC15K6e8OGl
 oeOg==
X-Gm-Message-State: AOAM531N83AURT4HmKtYRo2DsCHeIBaabIfrKfrZmvrfLpiYG5Lfexfu
 DznDQj6emhEQNwOFsLf1fLU=
X-Google-Smtp-Source: ABdhPJyPeyLs0ufJRIjEcmZzmn8XKM8ztr4zDFZnUaEnnHiY3eTI/16kdMKEeG8iwgyT/uZdHskVEw==
X-Received: by 2002:a1c:a795:: with SMTP id q143mr9362251wme.113.1613758819494; 
 Fri, 19 Feb 2021 10:20:19 -0800 (PST)
Received: from ?IPv6:2a00:23c5:5785:9a01:101f:7370:9e02:844f?
 ([2a00:23c5:5785:9a01:101f:7370:9e02:844f])
 by smtp.gmail.com with ESMTPSA id y16sm14031151wrw.46.2021.02.19.10.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 10:20:19 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 09/11] hw/xenpv: Restrict Xen Para-virtualized machine
 to Xen accelerator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-10-philmd@redhat.com>
Message-ID: <f386d7c4-f139-4f17-4e5b-5a3c5288b238@xen.org>
Date: Fri, 19 Feb 2021 18:20:17 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219173847.2054123-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/02/2021 17:38, Philippe Mathieu-Daudé wrote:
> When started with other accelerator than Xen, the XenPV machine
> fails with a criptic message:
> 
>    $ qemu-system-x86_64 -M xenpv,accel=kvm
>    xen be core: can't connect to xenstored
>    qemu-system-x86_64: xen_init_pv: xen backend core setup failed
> 
> By restricting it to Xen, we display a clearer error message:
> 
>    $ qemu-system-x86_64 -M xenpv,accel=kvm
>    qemu-system-x86_64: invalid accelerator 'kvm' for machine xenpv
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Paul Durrant <paul@xen.org>

