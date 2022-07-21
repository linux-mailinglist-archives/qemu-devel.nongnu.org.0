Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629C257C570
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 09:38:58 +0200 (CEST)
Received: from localhost ([::1]:49884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEQlt-0003mO-6G
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 03:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEQiz-0008TG-IT
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 03:35:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEQiw-0006cl-6Z
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 03:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658388952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6VIOe1Dy2W7L82ElVlZWIG6U0Y+1XsDDgs4uY6VGoE=;
 b=U8Lco1LoCjQ6nhokpMwzWXfM1YXuIIXHiqLQQ+VACiEYTSabCGR8EVnA2ribd640SUS+lr
 CHJbPue/70W+YVTM4Ambg5/t0QJFMB7MzuQj25Wf0eeRWMQ3Vmv6NApJe8MIqPwodgq8Yx
 sbVP8tBDmieMM24tzXHoXhBZdPymNP0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-SjEV83JuMuKAxuqrfA9NSA-1; Thu, 21 Jul 2022 03:35:51 -0400
X-MC-Unique: SjEV83JuMuKAxuqrfA9NSA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v123-20020a1cac81000000b003a02a3f0beeso2439189wme.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 00:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x6VIOe1Dy2W7L82ElVlZWIG6U0Y+1XsDDgs4uY6VGoE=;
 b=ehz1wqUtmbtDWPmqSt44GZ1llCbNK9WOzzDI3+tvTZ/j56qupz5Ls/CA3tAu+LQtRm
 8pZCOrHgD1zkZP/Uj/WQfMIl5f+8qQIk+ibbhLcilejcVtKvWzIqidhVWfOcwviBxqCi
 DjwkUtjd9lpv3UWslHuTApuKr9giqueGL4o3LBeGPGzTPjf4I4gpgz/W5UJ5aD/Yk28D
 hW1dcd6uEx7oeM6iCUg4aNhyp4dcCzDjwufBz3mlWzQR08ZyCch9tPyqQKOtH+bYlij1
 0gNE340XSG8hcrozrEAJfB9QLgKIrcPsF95y6/vYINyV4A0+H2YdEn37IKpXRxgBN23V
 NpHA==
X-Gm-Message-State: AJIora8KtadLuKljkywo8oZ+6MND6VqnDx4kylqLaW82lPsU0yo7xNuK
 GdI2iRCmROMAyLkB3UrSmIurKHQScyWMpe1EpOTO9Eaa9ub0bpVdV1V11d9njyu3ZwylsvsPFiV
 UsMprImtxZ1otHSk=
X-Received: by 2002:a5d:47a8:0:b0:21d:b690:9273 with SMTP id
 8-20020a5d47a8000000b0021db6909273mr31698768wrb.242.1658388950001; 
 Thu, 21 Jul 2022 00:35:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1us8CIjQmgoKjTyDopra7oakdwdBgByNrfUkfeJutWFotzoh9jT4VKV4iCNyPKSDMF46TRMeA==
X-Received: by 2002:a5d:47a8:0:b0:21d:b690:9273 with SMTP id
 8-20020a5d47a8000000b0021db6909273mr31698761wrb.242.1658388949819; 
 Thu, 21 Jul 2022 00:35:49 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-217.web.vodafone.de.
 [109.43.179.217]) by smtp.gmail.com with ESMTPSA id
 x15-20020a5d490f000000b0021e43b4edf0sm1051646wrq.20.2022.07.21.00.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 00:35:49 -0700 (PDT)
Message-ID: <1201ec96-1392-a43c-4b7a-ce3c9b108d21@redhat.com>
Date: Thu, 21 Jul 2022 09:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] gitlab: drop 'containers-layer2' stage
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Ed Maste <emaste@freebsd.org>
References: <20220720165159.2036205-1-berrange@redhat.com>
 <20220720165159.2036205-4-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220720165159.2036205-4-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/07/2022 18.51, Daniel P. Berrangé wrote:
> Since we express dependancies via a 'needs' clause, we don't need to
> split container builds into separate stages. GitLab happily lets jobs
> depend on other jobs in the same stage and will run them when possible.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/container-cross.yml | 24 ++++++++++++------------
>   .gitlab-ci.d/stages.yml          |  1 -
>   2 files changed, 12 insertions(+), 13 deletions(-)

On the one hand, I think this helped to see which containers depend on 
others ... OTOH I like the idea of saving some horizontal space in the 
pipeline overview page, thus:

Acked-by: Thomas Huth <thuth@redhat.com>


