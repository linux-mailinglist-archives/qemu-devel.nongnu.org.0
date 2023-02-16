Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C76698EEE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:44:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZs0-0000BM-22; Thu, 16 Feb 2023 03:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSZrx-0000BA-Kq
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:43:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSZrv-0008Vv-8J
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676537034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Hh0yzucf96hMG3sBFNwMzo3gflmOS3OTSbm2THsLGw=;
 b=b3InEkXU1EpVNEkN3j06IFFTCgH8MXP6QWLx2OW1SKE5RmiXl48AcXyqbLT/PvTYqM1Rd+
 QOlCwFhZBOxylbPzLd5UBuwkdhyz8GgNCbEuBPcfe51/07RWctRi7Y9d7Gg+A3xN1x5o01
 c3uY2AJnRhzkmbWz8bR9RZx056QQNYc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-1foh6Kq6MBuJlcndOD5-1A-1; Thu, 16 Feb 2023 03:43:53 -0500
X-MC-Unique: 1foh6Kq6MBuJlcndOD5-1A-1
Received: by mail-qv1-f71.google.com with SMTP id
 kd28-20020a056214401c00b0053cd4737a42so717640qvb.22
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 00:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Hh0yzucf96hMG3sBFNwMzo3gflmOS3OTSbm2THsLGw=;
 b=xjyO96dZ5RNGb9DsEw0KoByjJ6cS9k19xS1LpqamPGT//0FXlxu6F2g8pxeNOgDCBL
 QIyktqfdX27t2MRnnz6vuKCJnUDzt7eSk9NfcwTzaHoppjq6zsaHqR8X2D3Pp6bKbg1f
 Apd8eyJgKAy69inubDBlmyy1H/Juy/533IOrcDTPSEsXtUBqFYgzcWqM7C90sWmbhz14
 zGVyalCm5+PG5NmW0D5POor3J8iMx7db0iI/MlttTmeUQ39PWZDNzh3gNKSm/jJleho4
 tvGkc0yqUoh0S7rbv1yKdztBLyX4eXXzVaUREojMpN4/b1wt9Wbpo9XAldjvohPmVQCR
 h7tQ==
X-Gm-Message-State: AO0yUKXgicc1VsX9JQSKOSoFD1Pxy/w/VjaVYA+XRjL6QGZf8xSsF6FK
 txe6lPif3e+Z0c+/7DypTESNdqIt59NW9cbjO28k56maM+QCLtIkr53pfTKR88v9MjDcxIn7/fn
 t5TdFR8m526gmpJo=
X-Received: by 2002:a05:622a:43:b0:3b8:6a41:c329 with SMTP id
 y3-20020a05622a004300b003b86a41c329mr9025411qtw.21.1676537032671; 
 Thu, 16 Feb 2023 00:43:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9+DMlmrOA/LqvUoeMIuhPH7CwdH8JUHOEgTrbcWuaV0hiQ/m29l27OZJSKj4vgxFUAB0eMtw==
X-Received: by 2002:a05:622a:43:b0:3b8:6a41:c329 with SMTP id
 y3-20020a05622a004300b003b86a41c329mr9025394qtw.21.1676537032444; 
 Thu, 16 Feb 2023 00:43:52 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 g9-20020ac84b69000000b003b9bb59543fsm823336qts.61.2023.02.16.00.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 00:43:51 -0800 (PST)
Message-ID: <8ef56623-8296-3f0f-5558-8f02c65ec12c@redhat.com>
Date: Thu, 16 Feb 2023 09:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/2] s390x/pv: Add support for asynchronous teardown
 for reboot
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, david@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, pasic@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, seiden@linux.ibm.com
References: <20230214163035.44104-1-imbrenda@linux.ibm.com>
 <20230214163035.44104-3-imbrenda@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230214163035.44104-3-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 14/02/2023 17.30, Claudio Imbrenda wrote:
> This patch adds support for the asynchronous teardown for reboot for
> protected VMs.
> 
> When attempting to tear down a protected VM, try to use the new
> asynchronous interface first. If that fails, fall back to the classic
> synchronous one.
> 
> The asynchronous interface involves invoking the new
> KVM_PV_ASYNC_DISABLE_PREPARE command for the KVM_S390_PV_COMMAND ioctl.
> 
> This will prepare the current protected VM for asynchronous teardown.
> Once the protected VM is prepared for teardown, execution can continue
> immediately.
> 
> Once the protected VM has been prepared, a new thread is started to
> actually perform the teardown. The new thread uses the new
> KVM_PV_ASYNC_DISABLE command for the KVM_S390_PV_COMMAND ioctl. The
> previously prepared protected VM is torn down in the new thread.
> 
> Once KVM_PV_ASYNC_DISABLE is invoked, it is possible to use
> KVM_PV_ASYNC_DISABLE_PREPARE again. If a protected VM has already been
> prepared and its cleanup has not started, it will not be possible to
> prepare a new VM. In that case the classic synchronous teardown has to
> be performed.
> 
> The synchronous teardown will now also clean up any prepared VMs whose
> asynchronous teardown has not been initiated yet.
> 
> This considerably speeds up the reboot of a protected VM; for large VMs
> especially, it could take a long time to perform a reboot with the
> traditional synchronous teardown, while with this patch it is almost
> immediate.
> 
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>   hw/s390x/pv.c              | 28 ++++++++++++++++++++++++++++
>   hw/s390x/s390-virtio-ccw.c |  5 ++++-
>   include/hw/s390x/pv.h      |  2 ++
>   3 files changed, 34 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


