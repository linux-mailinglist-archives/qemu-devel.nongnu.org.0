Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7547653777B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 11:06:57 +0200 (CEST)
Received: from localhost ([::1]:52788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvbMW-0007CA-4w
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 05:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvbGN-0005fp-9y
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvbGJ-0005Qd-Ra
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653901231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2js2A7FN5sF2aMwiphHVqiL/uDqh+FBWbs3fIOlyMRw=;
 b=JbAZeZnaU6Kznz6z3CT33KwnccfFp1mPrYyDB7mLU/zAUiPwSw/hh6P9dPb4iBOI+L/gEb
 tWkvtjjHZMAh6ju458qXtJZgUj2BvqDTCYkUBTXjh2sMRwhiRMeCNE8cickB7Nxwnskjkt
 87BbcFca1VU/ZVEfbwrxAdKjS1hDiJU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-EFLh71LJPIKG0EdDJKDvXA-1; Mon, 30 May 2022 05:00:29 -0400
X-MC-Unique: EFLh71LJPIKG0EdDJKDvXA-1
Received: by mail-qt1-f200.google.com with SMTP id
 m19-20020a05622a055300b002f940281f18so9660464qtx.22
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 02:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2js2A7FN5sF2aMwiphHVqiL/uDqh+FBWbs3fIOlyMRw=;
 b=IFFgZxpLXxtcgBs9Dq7XMVUjnm6T644neO1P2uGgdSx19ptCRLw28AB7UduCJPogOM
 stpVtCFj59PJudMYt+XmYMzaS5K+2xYs57tgSQMJI8cAyLnxUNwZ6HolxP1AK5tv72nO
 pR1o9CCtPKpPQNX3d9xJ9Y4DKyd88vVOAcPUK455kMzV27n93hXvpTxokHDOVRoe7CRQ
 kOQZRLwF7fzUtyidS1HI3aIROSCvri6ZkdAMwRYGzJpNvl5mZbeUWS/sSAUB4gXu3rt/
 eiZy8c+kB5QGsdWvlLhqI7PoNorbIeyCP+FfhoO2UxuEV/4g9IOHHUGKFtWp/YF7r/ju
 DcKA==
X-Gm-Message-State: AOAM530dUnpGnD/NHEX/hSw2G7fb/euxl0Q4ACq4mFU8SEE9by1+wuTq
 RRK2MIThW7mzn2MfGhLNyeSPwuDNdnB7iiNe/WurKR9oYUBV9MF5JWv9xWRxvrgMa/Ok0GMW0ik
 XME5hO3qBq78Ft24=
X-Received: by 2002:a37:9cb:0:b0:6a3:6426:c2ac with SMTP id
 194-20020a3709cb000000b006a36426c2acmr29215199qkj.265.1653901228953; 
 Mon, 30 May 2022 02:00:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAJxoXm79redsOelOOZYI4BPqW6OmxQD+72UL7lCZuXONAScxrSnJVmQtgYys+US61GTXLJQ==
X-Received: by 2002:a37:9cb:0:b0:6a3:6426:c2ac with SMTP id
 194-20020a3709cb000000b006a36426c2acmr29215187qkj.265.1653901228703; 
 Mon, 30 May 2022 02:00:28 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-216.web.vodafone.de.
 [109.43.179.216]) by smtp.gmail.com with ESMTPSA id
 2-20020ac85942000000b002f90f479af6sm7174353qtz.40.2022.05.30.02.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 02:00:28 -0700 (PDT)
Message-ID: <99b9cc4c-ec48-6b4a-00ba-b36ae0a4d94f@redhat.com>
Date: Mon, 30 May 2022 11:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 32/33] gitlab: don't run CI jobs in forks by default
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-33-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220527153603.887929-33-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 27/05/2022 17.36, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> To preserve CI shared runner credits we don't want to run
> pipelines on every push.
> 
> This sets up the config so that pipelines are never created
> for contributors by default. To override this the QEMU_CI
> variable can be set to a non-zero value. If set to 1, the
> pipeline will be created but all jobs will remain manually
> started. The contributor can selectively run jobs that they
> care about. If set to 2, the pipeline will be created and
> all jobs will immediately start.
> 
> This behavior can be controlled using push variables
> 
>    git push -o ci.variable=QEMU_CI=1
> 
> To make this more convenient define an alias
> 
>     git config --local alias.push-ci "push -o ci.variable=QEMU_CI=1"
>     git config --local alias.push-ci-now "push -o ci.variable=QEMU_CI=2"
> 
> Which lets you run
> 
>    git push-ci
> 
> to create the pipeline, or
> 
>    git push-ci-now
> 
> to create and run the pipeline
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20220526110705.59952-6-berrange@redhat.com>
> [AJB: fix typo, replicate alias tips in ci.rst]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/ci-jobs.rst.inc | 38 ++++++++++++++++++++++++++++++++++++++
>   .gitlab-ci.d/base.yml      |  9 +++++++++
>   2 files changed, 47 insertions(+)

Please add:
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/751

Reviewed-by: Thomas Huth <thuth@redhat.com>


