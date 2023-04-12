Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F736DF4DB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:18:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZQW-00015b-2s; Wed, 12 Apr 2023 08:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmZQS-0000ze-6A
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:18:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmZQP-00010M-SA
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681301889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dW6R+xJWiXk6nxh5241ExTkJXScsa8TCW7cxse49IY=;
 b=N0l0B0eWtIEnN6NFSdeg5UolJNa5pzfzjdUCPXWIOgolrXzSuKMqkLtyZGox69IF+lf2JP
 1NslgbQCu3C/Szog7VohmMQaeMJYjMU1IPHmIFZx9mePH5j9zTLMVVROiqxapcZiENY/+9
 8d3xCd708bsmpyxwr5xi5rBicXQZkGA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-UG4JK0W5NAGS6T4f_xhnvw-1; Wed, 12 Apr 2023 08:18:07 -0400
X-MC-Unique: UG4JK0W5NAGS6T4f_xhnvw-1
Received: by mail-ed1-f72.google.com with SMTP id
 i17-20020a50d751000000b005045c08ca6dso9230693edj.7
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 05:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681301886; x=1683893886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7dW6R+xJWiXk6nxh5241ExTkJXScsa8TCW7cxse49IY=;
 b=PTyITegOrDnN1S/huKHhDxp/gO8Ahzh4K7J2sFKm2DBAsbUixNrcJD8q4ZOTPOocJj
 CZAVwfLjrMxpd5whAn2RcvNcmzwRfAtOuqA0Qpdr3hjkzl8PMjB/NVXluK7Uq7wsuaMF
 PbA037nSVc7ytPlIeLIiLp2ynpA438fZw9qEBt6PiL8L/oMooSO3M2Gk19hZEtM4lzPq
 fx1MM7q2/oj9fr6kmRxVi8oy7dDXVzvP1xkAXcHjo62Y8fPkz/1aMg2M7zBciPkXayvg
 RhPHUjpRJcbT/RHWLr3GhMZHEjHvxo1sfKiS4/m4XTteoX7Uw4jBmFIbZTluNUoB8+kw
 znYA==
X-Gm-Message-State: AAQBX9dfZ7gZcIPJzCCOx3B7XdthTZyjZQgMw0rJjfNZi9j+Izn/Xgor
 HXardXlwXDHfOg02usSRbxEXUnjlx6V+Clh3EzR2qizkYAcvGOqNlO3OMmP4RHNPj9TGZ1sI4lU
 RfBSYCguriTKpx4w=
X-Received: by 2002:a17:906:c085:b0:949:7c05:71b6 with SMTP id
 f5-20020a170906c08500b009497c0571b6mr15000242ejz.44.1681301886568; 
 Wed, 12 Apr 2023 05:18:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZPN9EGn1pLbBURZ1LeG4l6ZO4gfQ2wdmk6k7roqplrFEswAr/66m9aH7qPCj1lthoUjGoLLw==
X-Received: by 2002:a17:906:c085:b0:949:7c05:71b6 with SMTP id
 f5-20020a170906c08500b009497c0571b6mr15000220ejz.44.1681301886241; 
 Wed, 12 Apr 2023 05:18:06 -0700 (PDT)
Received: from ?IPV6:2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e?
 (p200300cfd735c67f6ed98c907a1de97e.dip0.t-ipconnect.de.
 [2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a50c315000000b0050481736f0csm959675edb.12.2023.04.12.05.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:18:05 -0700 (PDT)
Message-ID: <96b06766-5c4f-1d24-cea6-7c497feae44f@redhat.com>
Date: Wed, 12 Apr 2023 14:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] vhost: Re-enable vrings after setting features
Content-Language: en-US
To: German Maglione <gmaglione@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-2-hreitz@redhat.com>
 <CAJh=p+4ki4XGEKZBQADUT5iO2NfPEyhYG4aTmaXyMPNzALpiwg@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJh=p+4ki4XGEKZBQADUT5iO2NfPEyhYG4aTmaXyMPNzALpiwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12.04.23 12:55, German Maglione wrote:
> On Tue, Apr 11, 2023 at 5:05 PM Hanna Czenczek <hreitz@redhat.com> wrote:
>> If the back-end supports the VHOST_USER_F_PROTOCOL_FEATURES feature,
>> setting the vhost features will set this feature, too.  Doing so
>> disables all vrings, which may not be intended.
>>
>> For example, enabling or disabling logging during migration requires
>> setting those features (to set or unset VHOST_F_LOG_ALL), which will
>> automatically disable all vrings.  In either case, the VM is running
>> (disabling logging is done after a failed or cancelled migration, and
>> only once the VM is running again, see comment in
>> memory_global_dirty_log_stop()), so the vrings should really be enabled.
>> As a result, the back-end seems to hang.
>>
>> To fix this, we must remember whether the vrings are supposed to be
>> enabled, and, if so, re-enable them after a SET_FEATURES call that set
>> VHOST_USER_F_PROTOCOL_FEATURES.
>>
>> It seems less than ideal that there is a short period in which the VM is
>> running but the vrings will be stopped (between SET_FEATURES and
>> SET_VRING_ENABLE).  To fix this, we would need to change the protocol,
>> e.g. by introducing a new flag or vhost-user protocol feature to disable
>> disabling vrings whenever VHOST_USER_F_PROTOCOL_FEATURES is set, or add
>> new functions for setting/clearing singular feature bits (so that
>> F_LOG_ALL can be set/cleared without touching F_PROTOCOL_FEATURES).
>>
> Could be the other way around?, I mean before commit
> 02b61f38d3574900fb4cc4c450b17c75956a6a04
>
> so until v7.2rc0 we didn't have this problem with
> VHOST_USER_F_PROTOCOL_FEATURES,
> so "it seems" it's fine to start with the vrings enabled, could be
> possible to go back to that
> behavior (reflecting that in the spec) and add a new flag to start
> with vrings disabled?

I’m not a fan of retroactively changing a public specification in an 
incompatible manner.  Also, “seems fine” isn’t enough of an argument to 
do so. :)  I’m not sure whether finding out if it’s actually fine is 
easy.  But in general, I try to abstain from retroactive spec changes...

I see the problem of qemu apparently not really caring for the specified 
meaning of the flag, indicating that this specified behavior is not 
optimal.  But the ideal way to fix this to me seems to add new flags to 
change the meaning to something more broadly useful.

But I’m not convinced either way.

Hanna


