Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7BD4C81D1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 04:59:04 +0100 (CET)
Received: from localhost ([::1]:54548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOtfD-0002IO-Dm
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 22:59:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOte0-0001Rd-4b
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 22:57:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOtdw-00016C-O7
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 22:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646107063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NDldxfchtJHBh1aUlPCoP7Bz3fSeRkGoYYgzMdu3mV0=;
 b=O/zY67+lfNvvBkL86+R3H2JkqVnkc6QBlVf+eSakeV8stTi7E7IQCN1yeDuWN5xKM7CUh7
 IYoObdKzmGEHZSlJV1jbYJki/W7NSc+OEQkO17TW9a+X7ke5WOpioBljd75mTWaXkWR7WM
 8+tPksvc+1uCtHaWE6ixFHgR13lcGio=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-ZU3RjzKuMga3MttOy278Ww-1; Mon, 28 Feb 2022 22:57:42 -0500
X-MC-Unique: ZU3RjzKuMga3MttOy278Ww-1
Received: by mail-pf1-f197.google.com with SMTP id
 a22-20020aa79716000000b004e16e3cc5fcso8951286pfg.11
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 19:57:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NDldxfchtJHBh1aUlPCoP7Bz3fSeRkGoYYgzMdu3mV0=;
 b=PyHcfY6GFYHRuWuXU5CXoXixDOwMF2hXkty2iDXSXB8LEoMbZihPJwWxcU+A4A1Bo5
 ugPCjhLW8bZWvu+5oBazVepTuZeIMGA5LYSZpEdFq5RrHBauzPgHOVSpUrz8BysLlmq4
 yTG+UMvzZ+W70u7HHm2NuvLfYIz1mVefzjxZooBYrJpTfHoPylnWEEBGwmCkyNOEMSWG
 x2qnozGpWVsn4fKxbg01hc+ja0UevvU3QbGGNIwTMhaoLNZ/anPdoSLcdeELxsDJ/3sM
 0uEYM9chWB3cn9Kp5g93Yl3cnN+bzW7OrjyS4E/816qaBvsP9zIyM71OOgu9I0XS7nIC
 wYqg==
X-Gm-Message-State: AOAM531EIf1fk6pNRii54PnzuC42rdEwqBh05mMAxRQjJzkllL4mDhcR
 VVN6pnwo3gNh1eKSKVRSBDONfBuBxXugHR45gF97GqpIwPazHBV380BBykXAdORtVLVHNcIaF69
 NsULP1noVa4v5WbU=
X-Received: by 2002:a17:902:b103:b0:14f:aa09:f23a with SMTP id
 q3-20020a170902b10300b0014faa09f23amr24302870plr.25.1646107061406; 
 Mon, 28 Feb 2022 19:57:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySu/PtGQxEVs99roi18qlojP6SnA6NJPQXUiJO/p6hosW5lFyswFIRJg5m71UOCePOm/4xSw==
X-Received: by 2002:a17:902:b103:b0:14f:aa09:f23a with SMTP id
 q3-20020a170902b10300b0014faa09f23amr24302842plr.25.1646107061092; 
 Mon, 28 Feb 2022 19:57:41 -0800 (PST)
Received: from xz-m1.local ([94.177.118.144]) by smtp.gmail.com with ESMTPSA id
 v20-20020a17090a899400b001bc44cd08fesm714325pjn.20.2022.02.28.19.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 19:57:40 -0800 (PST)
Date: Tue, 1 Mar 2022 11:57:33 +0800
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v8 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Message-ID: <Yh2ZrbDkIGOuwrx2@xz-m1.local>
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-6-leobras@redhat.com>
 <87fsogcdue.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87fsogcdue.fsf@secure.mitica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 18, 2022 at 05:57:13PM +0100, Juan Quintela wrote:
> I did a change on:
> 
> commit d48c3a044537689866fe44e65d24c7d39a68868a
> Author: Juan Quintela <quintela@redhat.com>
> Date:   Fri Nov 19 15:35:58 2021 +0100
> 
>     multifd: Use a single writev on the send side
>     
>     Until now, we wrote the packet header with write(), and the rest of the
>     pages with writev().  Just increase the size of the iovec and do a
>     single writev().
>     
>     Signed-off-by: Juan Quintela <quintela@redhat.com>
>     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> And now we need to "perserve" this header until we do the sync,
> otherwise we are overwritting it with other things.
> 
> What testing have you done after this commit?
> 
> Notice that it is not _complicated_ to fix it, I will try to come with
> some idea on monday, but basically is having an array of buffers for
> each thread, and store them until we call a sync().

Or can we conditionally merge the two write()s?  IMHO the array of buffers
idea sounds too complicated, and I'm not extremely sure whether it'll pay
off at last.  We could keep the two write()s with ZEROCOPY enabled, and use
the merged version otherwise.

Btw, is there any performance measurements for above commit d48c3a044537?
I had a feeling that the single write() may not help that much, because for
multifd the bottleneck should be on the nic not on the processor.

IOW, we could find that the major time used does not fall into the
user<->kernel switches (which is where the extra overhead of write()
syscall, iiuc), but we simply blocked on any of the write()s because the
socket write buffer is full...  So we could have saved some cpu cycles by
merging the calls, but performance-wise we may not get much.

Thanks,

-- 
Peter Xu


