Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B9167D031
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 16:29:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL4Bk-0000nb-Nx; Thu, 26 Jan 2023 10:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1pL4Bi-0000m7-Gy
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:29:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1pL4Bg-0003cL-T8
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674746955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLzGUyGgzVjEW8+Hw2QIOZ0iRdeC7l8b09X22qxQOZA=;
 b=ZjPScL+pNLi2hzCUm877YZC7FdGRGa0h1ByNY9g3cR0IEanbpEnkdgJ3PODzU6Xwr/CahR
 2RaruT/l2NBvz6mK2KoGU4ednhZh/ToxNkKZ4RwSGMmJ0Vin9BWbuKJv02MOSyOy0pXkJg
 0LC2SAJxBVvFfutrRxWBAG3ydNfzx64=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-6a4LrDOtPH-qnte4axl6tQ-1; Thu, 26 Jan 2023 10:29:12 -0500
X-MC-Unique: 6a4LrDOtPH-qnte4axl6tQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 t17-20020a056402525100b0049e0d2dd9b1so1639324edd.11
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 07:29:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XLzGUyGgzVjEW8+Hw2QIOZ0iRdeC7l8b09X22qxQOZA=;
 b=V8YuzS/5bSjGrfVwiMpqkPHS922MSeJ8oxZ22ChZJYOIBQPyCphelCgmNmyLdC3caG
 jyc0WlokDrHQi7C8c5OrqBsJ/GmWRTHjB1pFdawROJnlSz+jFcpgbJPIml6wgLOJltZU
 U2Re4iKsIm5DmdaeNREnKkJndHLXpUCpFBuNT+DgEWHPFBVV03kaVxZZXlH74vUy6Yzr
 tQztIGInjrH4DZBRq0okoRBhk+Lot8YZA9LnTsk8pSBvvyF7ZtCLu47DSY284AjOSsYY
 NR2snanzniMFY5pAW/4M6pYNpT/8PI0TmW7tTvDPBFAIglMSk8Zm00VuJRet3bu7Bsv6
 seRw==
X-Gm-Message-State: AO0yUKV+AQrgTgOF/k6BilVc2HAUqdm1zxjFzZGg8xVT22rplUYgCmsv
 FEZrilNyhW1c+r3ABnX1SNqx5Rfy3XcW5MmXi0ODnp9m9j+49+Or35bOGA5PUTPJnVBpQActOl9
 Jtx89ptidOnwlDkg=
X-Received: by 2002:aa7:ca4a:0:b0:4a0:e4b4:4f72 with SMTP id
 j10-20020aa7ca4a000000b004a0e4b44f72mr1480950edt.19.1674746951736; 
 Thu, 26 Jan 2023 07:29:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+IFxYDUSQAgpcApJMg3dA9Jvk8Pe+bQuE5vNHC2W+cCYqvOmw3WcRRKS+djEswK0xhoHPitw==
X-Received: by 2002:aa7:ca4a:0:b0:4a0:e4b4:4f72 with SMTP id
 j10-20020aa7ca4a000000b004a0e4b44f72mr1480933edt.19.1674746951563; 
 Thu, 26 Jan 2023 07:29:11 -0800 (PST)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a50fa8b000000b0049e09105705sm869257edr.62.2023.01.26.07.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 07:29:11 -0800 (PST)
Message-ID: <fc6084db-b7d8-25fa-49a8-8b1a2745b070@redhat.com>
Date: Thu, 26 Jan 2023 16:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/3] util/userfaultfd: Support /dev/userfaultfd
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>
References: <20230125224016.212529-1-peterx@redhat.com>
 <0f8ad497-202d-ae55-e468-77bb726a2699@redhat.com> <Y9KK72k8dZU7Ccau@work-vm>
 <Y9KbUaMo8DaH0YKv@x1n>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <Y9KbUaMo8DaH0YKv@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/26/23 16:25, Peter Xu wrote:
> On Thu, Jan 26, 2023 at 02:15:11PM +0000, Dr. David Alan Gilbert wrote:
>> * Michal Prívozník (mprivozn@redhat.com) wrote:
>>> On 1/25/23 23:40, Peter Xu wrote:
>>>> The new /dev/userfaultfd handle is superior to the system call with a
>>>> better permission control and also works for a restricted seccomp
>>>> environment.
>>>>
>>>> The new device was only introduced in v6.1 so we need a header update.
>>>>
>>>> Please have a look, thanks.
>>>
>>> I was wondering whether it would make sense/be possible for mgmt app
>>> (libvirt) to pass FD for /dev/userfaultfd instead of QEMU opening it
>>> itself. But looking into the code, libvirt would need to do that when
>>> spawning QEMU because that's when QEMU itself initializes internal state
>>> and queries userfaultfd caps.
>>
>> You also have to be careful about what the userfaultfd semantics are; I
>> can't remember them - but if you open it in one process and pass it to
>> another process, which processes address space are you trying to
>> monitor?
> 
> Yes it's a problem.  The kernel always fetches the current mm_struct* which
> represents the current context of virtual address space when creating the
> uffd handle (for either the syscall or the ioctl() approach).

Ah, I did not realize that.

> 
> It works only if Libvirt will invoke QEMU as a thread and they'll share the
> same address space.
> 
> Why libvirt would like to do so?

Well, we tend to pass files as FD more and more, because it allows us to
give access to "privileged" files to unprivileged process. What I did
not realize is that userfaultfd is different, not yet another file.

Michal


