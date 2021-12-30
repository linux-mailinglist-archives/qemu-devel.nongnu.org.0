Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8418481DE3
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 16:57:51 +0100 (CET)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2xoM-0001Fv-V4
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 10:57:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xn3-0000TN-Ez
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 10:56:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xn2-0003G1-0h
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 10:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640879787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o43fJSwmqj8EQb0ueL/AK/V3EDN9Hv6cpmI3XKSE5RQ=;
 b=KrlP8ojFHeRxgRbw8OyFflQj/e+/bx4XxmbKrT3fcziFj10IEE5tHReu88QL9KmJwR59oe
 1CauQn0Q+dQhhHNNJXtUwbj8tDX8f946VZUgWgLRetyhd3+sMqeQK+VXiIU7vfsMgxUmBe
 jDl9VD0hZW9PgWDJvp7z1XQv3AhQLCo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411--PquX81eNn-J2HLbse_cqg-1; Thu, 30 Dec 2021 10:56:26 -0500
X-MC-Unique: -PquX81eNn-J2HLbse_cqg-1
Received: by mail-wr1-f71.google.com with SMTP id
 h12-20020adfa4cc000000b001a22dceda69so6339782wrb.16
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 07:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o43fJSwmqj8EQb0ueL/AK/V3EDN9Hv6cpmI3XKSE5RQ=;
 b=BXWlE72/OPLGNE2f9Sera2KE8r7tHt49/AD//mGVC6a4WPqQKS1w/IBPkhsO6tmsbf
 8AKvAlSXxeSqdWSg7v5B1DUWsu28sdCdMLNylCu17sMybFloT7M91fGNxDnwRpulxXV3
 zlslPzXqHRvdO0blmdwoeCl8RHWjNIfrk2g/pQCrl2WS4icIKy6xHd4AorUiRH1Y1LfJ
 Qf0VdDeM5Dg17cxPSUgN7YgN8xuWY47UBToVTmfZWn7kSphf3ZtqL44aKoGq5Ds71XpN
 NmFdzf4JmfhCamKJkjMJtVhtnMqhxlOIUs3A9ahlMo2CBIiQiSox2xCF/z0JYBWvmuyv
 26DQ==
X-Gm-Message-State: AOAM532FFzdgD4KB/fAZdsqkABygEw1THnAopip/Ijr0WzA424NaVA9g
 XPed7C8H9XJ6xO/eyeO8cXJy/rxEzIGdmv6bPMsqHuFcwBFjevmTndegHlJw8ta+wBcFtqUQ7hm
 lqoi94sWTyZldalU=
X-Received: by 2002:adf:e80c:: with SMTP id o12mr6314090wrm.364.1640879785059; 
 Thu, 30 Dec 2021 07:56:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqhIuQwnbGn4UtNAJ2GI0kgVYspvc12tFp0VmdI95zLrDm3aUB6vpOpPzOGh9V4531kDbE+w==
X-Received: by 2002:adf:e80c:: with SMTP id o12mr6314079wrm.364.1640879784894; 
 Thu, 30 Dec 2021 07:56:24 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id l14sm18935520wrr.53.2021.12.30.07.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 07:56:24 -0800 (PST)
Message-ID: <3c9dfe95-22c1-e690-5018-1a2c330f5a15@redhat.com>
Date: Thu, 30 Dec 2021 16:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 7/8] migration: Finer grained tracepoints for
 POSTCOPY_LISTEN
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211224065000.97572-1-peterx@redhat.com>
 <20211224065000.97572-8-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211224065000.97572-8-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/21 07:49, Peter Xu wrote:
> The enablement of postcopy listening has a few steps, add a few tracepoints to
> be there ready for some basic measurements for them.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/savevm.c     | 9 ++++++++-
>  migration/trace-events | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


