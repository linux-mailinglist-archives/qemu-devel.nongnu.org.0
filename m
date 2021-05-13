Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7D437F9E1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:43:55 +0200 (CEST)
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhCZ8-0006OU-2S
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhCXw-0005Xy-WC
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:42:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhCXu-0005vo-Kt
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620916956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39i/nz9HPJ+YZJLDFf2edrKiC5YOwXrOZuzR4o70F0w=;
 b=T+0HvdfmdSWtcmHM2yCjjW45IOtKMjMdmLTxtF2RXly+66QSe138CZOwXGMOKkL6eZAE/I
 KCE9NuSPYRXm2HASc3FHDkm4OVij1QuwHxXebAGWG7UCiwHCcKfQhNDFv9JwQYBmG6KjVM
 7XDQ/MQKYhv8S0uP+nZByq574B4Op6Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-LPgD2ZMXMQydjdJZSdn2gQ-1; Thu, 13 May 2021 10:42:33 -0400
X-MC-Unique: LPgD2ZMXMQydjdJZSdn2gQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 k10-20020a50cb8a0000b0290387e0173bf7so14869252edi.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 07:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=39i/nz9HPJ+YZJLDFf2edrKiC5YOwXrOZuzR4o70F0w=;
 b=fG1WgTv63CISPV4agP69rg56YuH9hg4h/MoU2hugy9A7a/0mtWdV403TvJIaITBCQa
 pLUPSJFyl5HmUgqp8EcB43YdFcKzJIT13JZc1ZsLDX3csupB1cGVcuqXd7ecDBvkXgth
 JCydfYvT1JJA+80Gxkf95IZO+k1IcBV+IGpTJVpwTRxxssAM+5K31i6AzrO09IxDgKyX
 ZMV97e2Q8UisHF1RJEpBfz6maNWnBgX+MDTMCPqGhCiPXptvmpg/nH7koiObCQKBo8Zm
 BduY6kZuTorTfcdiknj0jZNBGPwE5C2q+MoP6BmHI6bG7r0cfExB/Agax7lVspkYio14
 izRA==
X-Gm-Message-State: AOAM530jbQC+4U4OOCSclqCJ/cjIj1gAIYcHd3WGPCqiImdg2yobhtC0
 mucKaxr4wDPz4tWv9cpDu2OksRIO6CglYs8UP1XzunvAk2Zt6Tu+fmsUyLuFlJbF4u1gUzuultu
 RLCISeVfrCIFuzds=
X-Received: by 2002:a50:c34a:: with SMTP id q10mr50979984edb.346.1620916951972; 
 Thu, 13 May 2021 07:42:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnIA6pkB3nnnLpnuNmaCeLFNyW73/6seX2dYbGf1hthWHm7cYbKC7s/gfIjmIkHs4YyA3Jag==
X-Received: by 2002:a50:c34a:: with SMTP id q10mr50979961edb.346.1620916951784; 
 Thu, 13 May 2021 07:42:31 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k20sm361283eja.10.2021.05.13.07.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 07:42:31 -0700 (PDT)
Subject: Re: [PATCH] backends/tpm: Replace qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210512070713.3286188-1-philmd@redhat.com>
 <8f8954d2-248e-95f3-fd84-0d4deb42b9af@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9098aa73-bc20-876a-d617-1222cafecdf2@redhat.com>
Date: Thu, 13 May 2021 16:42:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8f8954d2-248e-95f3-fd84-0d4deb42b9af@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Christophe de Dinechin <dinechin@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 5/13/21 4:08 PM, Stefan Berger wrote:
> On 5/12/21 3:07 AM, Philippe Mathieu-Daudé wrote:
>> Simplify the tpm_emulator_ctrlcmd() handler by replacing a pair of
>> qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
>> macro.
>>
>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>> Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Thanks for doing this. I suppose you will send it via a PR?

Christophe asked it to be sent separately from the other series.

I Cc'ed qemu-trivial@ (patches are collected there once a week
usually).

Regards,

Phil.


