Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F1754E226
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:38:48 +0200 (CEST)
Received: from localhost ([::1]:54830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1phv-0001Vx-NM
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1pIn-0006EL-RQ; Thu, 16 Jun 2022 09:12:49 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1pIl-0006WN-PE; Thu, 16 Jun 2022 09:12:49 -0400
Received: by mail-ed1-x52a.google.com with SMTP id b8so2115627edj.11;
 Thu, 16 Jun 2022 06:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L2hrB0plMgAHiquTLfE38T8oQ7cyZFSMEAEJaJZYK5E=;
 b=TqmIwQAMuIVNDcLdvJDXGIN/JczB+Q9I4LHB6W6Cw35pUokrw8Rr0uL7jCDnkzFqsa
 jWRf/C8tE3MwSg6AXCrf5Y5gEAm8SUsGAlExsD9X19lDEgl8QIK4LDfJV2g8bRhO6BxT
 BAyAer3nMJAQX9gv9oL52Hj3F9QsNGmK1Ru7bM8eVMdNy5rNd8eG8CUh5TyTcIGgwHkh
 8Hmc3GSt+weXtSln/q0YCp2ezYnRSZ5PYM2pyS5cSi20uMmYZXz24elJQvI/mLHh+pJc
 tJ57t/hwRhaSiu7vnWAZkwqJHgmc26+hZVf9wPMGALGRKgMUg97hMKsDGkY4SZRiZWUz
 O2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L2hrB0plMgAHiquTLfE38T8oQ7cyZFSMEAEJaJZYK5E=;
 b=r2dlgsAmtw1zGgncK41GHyJqmW/OwMdEWZilY5kbBkA+ycdW4zUo44Uw+BpQKFvVCq
 m0T9iyMAn5sa6eFwdCXlX4kl2tcZgHDxOnODOdNFM30tXCauN3407/kUUpnVhDbDl8zE
 9ZwGjLCJAkWmK+f0Ejnz3gSbqYxSb66jXtEbS/Dl3WirdSkIzQvZ2RlMOAj0l/plESmv
 USflec2eEvIkVT7HkreAHNgqRL5oGKmaiyoeO3IJnqhXrK7YD8mLjn3FgIrQmMx9KUIB
 3O8b5gvZDIn76RBBZMxW0MD+aol2Zh1l8ZqSJ5SukoFEx0Sh7uKm1pvFfynWJpPEVywG
 Kreg==
X-Gm-Message-State: AJIora/pCBDkt2pOhWEeDQtd79DET5ImhfIUnJ++tqQukCFsqD8sm7ZO
 eTx+N9+/Z7XEqptsm4kjty8=
X-Google-Smtp-Source: AGRyM1v55H66hBmX2ysmJock2t+2WUlLwuYuJfgUMopF0AIJEj1KL/WcfoISmqnRQOFe4YbsFhJ+2A==
X-Received: by 2002:a05:6402:354a:b0:430:4855:2821 with SMTP id
 f10-20020a056402354a00b0043048552821mr6381913edd.391.1655385165399; 
 Thu, 16 Jun 2022 06:12:45 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 q23-20020a170906b29700b00708e906faecsm768320ejz.124.2022.06.16.06.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 06:12:44 -0700 (PDT)
Message-ID: <ef5aeba2-6f86-89ae-bee9-de16d267f226@redhat.com>
Date: Thu, 16 Jun 2022 15:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/9] Preliminary patches for subproject split
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-block@nongnu.org
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/16/22 14:40, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> Here is another subset of the large "subproject(qga)"" series I intend to send
> soon after (https://gitlab.com/marcandre.lureau/qemu/-/commits/qga).

Hi,

I took a peek there and I have a question.  While the configure script 
has had enough of a diet that it should be possible to compile the 
subprojects as standalone with relatively little effort, how do you plan 
to handle things such as compiler flags that are detected by meson.build 
(especially enabling/disabling warnings)?

Paolo

> Thanks
> 
> Marc-André Lureau (9):
>    monitor: make error_vprintf_unless_qmp() static
>    error-report: misc comment fix
>    error-report: introduce "detailed" variable
>    error-report: simplify print_loc()
>    error-report: introduce ErrorReportDetailedFunc
>    error-report: add a callback to overwrite error_vprintf
>    qapi: move QEMU-specific dispatch code in monitor
>    scripts/qapi-gen: add -i option
>    scripts/qapi: add required system includes to visitor
> 
>   include/monitor/monitor.h            |  2 +-
>   include/qapi/qmp/dispatch.h          |  7 ++-
>   include/qemu/error-report.h          |  8 +++-
>   bsd-user/main.c                      |  2 +-
>   linux-user/main.c                    |  2 +-
>   monitor/monitor.c                    |  5 +-
>   monitor/qmp.c                        | 68 +++++++++++++++++++++++++++-
>   qapi/qmp-dispatch.c                  | 64 ++------------------------
>   qemu-img.c                           |  2 +-
>   qemu-io.c                            |  2 +-
>   qemu-nbd.c                           |  2 +-
>   qga/main.c                           |  2 +-
>   scsi/qemu-pr-helper.c                |  2 +-
>   softmmu/vl.c                         |  7 ++-
>   storage-daemon/qemu-storage-daemon.c |  7 ++-
>   stubs/error-printf.c                 | 23 ----------
>   tests/unit/test-qmp-cmds.c           |  6 +--
>   util/error-report.c                  | 46 ++++++++++++++-----
>   scripts/qapi/commands.py             | 15 ++++--
>   scripts/qapi/events.py               | 17 ++++---
>   scripts/qapi/gen.py                  | 17 +++++++
>   scripts/qapi/introspect.py           | 11 +++--
>   scripts/qapi/main.py                 | 17 ++++---
>   scripts/qapi/types.py                | 17 ++++---
>   scripts/qapi/visit.py                | 21 ++++++---
>   stubs/meson.build                    |  1 -
>   26 files changed, 226 insertions(+), 147 deletions(-)
>   delete mode 100644 stubs/error-printf.c
> 


