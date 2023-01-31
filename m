Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F568311D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:15:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsLg-0007ag-Mr; Tue, 31 Jan 2023 10:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMsLV-0007TS-6o
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:14:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMsLT-0004lH-F8
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675178090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2GIHTgnh/6ikT73TXDCm1V+d+Nm+OFlTCi9QeJcKrMU=;
 b=P1819oXzXR8D4tbZgs1CcVFBtLFqTsuEfYQyvsU1tsTNvNRTjn43Itv0o8my54lrbg56u1
 v0FCu2710rIHc7vwg7UZCXJsWqNpTvfbTlh2KlYQ/SkLlEAIrvAu2RUC4WkYU9Mh3k76r3
 rYW4Yy8PLc05aXgpwpnW84SZyMdtSX0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-j3jpAJFKNTi8fRCcFtH0pw-1; Tue, 31 Jan 2023 10:14:47 -0500
X-MC-Unique: j3jpAJFKNTi8fRCcFtH0pw-1
Received: by mail-qk1-f200.google.com with SMTP id
 de37-20020a05620a372500b00707391077b4so9304177qkb.17
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 07:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2GIHTgnh/6ikT73TXDCm1V+d+Nm+OFlTCi9QeJcKrMU=;
 b=4cIxajj2m2juaZ8qUbrGus06dwbBN3PTej70p1neuKRyIBdcbfucPlZPEvntdM8hSN
 dhiRMQrrO41nwCMliZVDwBHYCRcQ3juBPvdbrF+tIkoo0lGtCjRpL2Ftgdt5TCCRkNc0
 0uQI9pLqHpm6qk+c6rgiN8X96YQU8DMq7FVl1Bc9OQiOTOZ+gOX3TU6V038Y5mwxb0Oc
 KZ6/IKHBM19yCMemxHHFYeT6ER61m2dL6fUZrvXrk3UbdfY5WOdIE0bgt0dthhpxPsYW
 PE4vr3ylyS1kPXIjASXH8d29ZpHfiWDRpplKDn9J3zV++SoJ6nL9VPMmqXhbJgYgYLZn
 6zuA==
X-Gm-Message-State: AFqh2kri/7qEmdeDZhmkLGebwjVWSF5TvAU+ZnAazWE0lM5o5BNZe5jh
 IOQVED/XYEiRDP+21JdxoLpBqCcTf/ibGlK4jwJXRZBw06Wk4zNhO2PbvO7OXk79gW0X5Atrga/
 JWzioq12uUyp+4to=
X-Received: by 2002:a05:622a:1995:b0:3b2:4309:99e with SMTP id
 u21-20020a05622a199500b003b24309099emr104472017qtc.54.1675178086919; 
 Tue, 31 Jan 2023 07:14:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3q975CnlqOuB+w1uXPmzs773hgRipx4TCPKlymRqt1hpZr425r0HNx8PNONQU4yIzm0efVQ==
X-Received: by 2002:a05:622a:1995:b0:3b2:4309:99e with SMTP id
 u21-20020a05622a199500b003b24309099emr104471978qtc.54.1675178086585; 
 Tue, 31 Jan 2023 07:14:46 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 x7-20020ac87007000000b003b63dfad2b4sm10035133qtm.0.2023.01.31.07.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 07:14:46 -0800 (PST)
Message-ID: <6b141e58-8413-01d4-7a58-f38c77185cf8@redhat.com>
Date: Tue, 31 Jan 2023 16:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/4] libqtest: ensure waitpid() is only called once
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230117080745.43247-1-pbonzini@redhat.com>
 <20230117080745.43247-4-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230117080745.43247-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/01/2023 09.07, Paolo Bonzini wrote:
> If a test aborts after qtest_wait_qemu() is called, the SIGABRT hooks are
> still in place and waitpid() is called again.  The second time it is called,
> the process does not exist anymore and the system call fails.
> 
> Move the s->qemu_pid = -1 assignment to qtest_wait_qemu() to make it
> idempotent, and anyway remove the SIGABRT hook as well to avoid that
> qtest_check_status() is called twice.  Because of the extra call,
> qtest_remove_abrt_handler() now has to be made idempotent as well.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qtest/libqtest.c | 29 ++++++++++++++++++++---------
>   1 file changed, 20 insertions(+), 9 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


