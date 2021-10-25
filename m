Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF24439942
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:50:49 +0200 (CEST)
Received: from localhost ([::1]:48296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf1JG-0008Qa-4Z
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mf1Ay-0000fI-Oh
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mf1Au-0002M6-Nq
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635172927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FbkIM5n85cbhhcOhoih05DnGwitBOLLPevtEXJ8yBbI=;
 b=HoFgIpDFl/5ua/qj3i6sG5TcdRzd6nEgrp01QKJIR0Kwz8rDYeTY35ZvNZ3qXLYd3+qJH3
 9QZ1MK2Di6RapgV7wHtYVUQbEu3CJVtwVkqMJwS1Mx0JTHOjHNPc210O0Cfs3V4GlDsLIo
 sJiJZN+ks69SCWMDAPtG1D3PucFasZE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-_lEhQj2qODuwN-wFhXjAAw-1; Mon, 25 Oct 2021 10:42:06 -0400
X-MC-Unique: _lEhQj2qODuwN-wFhXjAAw-1
Received: by mail-ed1-f72.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so863929edv.10
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 07:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FbkIM5n85cbhhcOhoih05DnGwitBOLLPevtEXJ8yBbI=;
 b=37PjJU+OlitiKbqTJbDmDBC0kgYVACHuMomSl5xea3HCj8SwnVQiuzrjmsuYjWCx5B
 A3Do1zHhIudzpwtPZvKZ85gHWs+/wdHmoF4yGB3/QjBUrqRYaUXIG83QNR5Y4Nw/fsrC
 O9bXxnqrUNS7a0/Zi/DUXbCTAx4G2V2LHnELrgXBtEzUvFm3dREKTTObMmJhPqPczIiU
 Tup3gqe+sWNnVSqDNlJG181VmG3xM4PwcIeRLPaYE+15Ma87NiJ7Dq3P8NG4aooiwBvx
 qmJxs5yNTuHSLx8KpZjdRWLL+6CagkLtDWR/YUMb0gPDQY0VTQ/EBaVhA4IOm7AzJJjh
 Qy7Q==
X-Gm-Message-State: AOAM530Bs+2GnReyL3dfkA76o5IEvae/pm2ks3yR3LTAIabdxbxBK4tT
 iED/2B+9fBZJt1S6gM6JkRjdhfjJtvvfK5Bn46yMTQM0HPauhuMOpRLUTAvZ0NkzgR/G1CO+w9U
 eOXHzzyyzMxjszps=
X-Received: by 2002:a50:e089:: with SMTP id f9mr26782421edl.290.1635172925095; 
 Mon, 25 Oct 2021 07:42:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLqmV1b5kI2PfSmKP3yqHnHQooegMXzH8GCa4t+QoI47kqJ5U7rrbHxQZtL/EhLFZoQo1nJQ==
X-Received: by 2002:a50:e089:: with SMTP id f9mr26782390edl.290.1635172924856; 
 Mon, 25 Oct 2021 07:42:04 -0700 (PDT)
Received: from steredhat (host-79-30-88-77.retail.telecomitalia.it.
 [79.30.88.77])
 by smtp.gmail.com with ESMTPSA id c21sm9242997edx.1.2021.10.25.07.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 07:42:04 -0700 (PDT)
Date: Mon, 25 Oct 2021 16:42:02 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 0/3] linux-aio: allow block devices to limit aio-max-batch
Message-ID: <20211025144202.wgkuzfqoycfwqkix@steredhat>
References: <20210923143100.182979-1-sgarzare@redhat.com>
 <YXa8VhoW8flejiRy@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YXa8VhoW8flejiRy@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 25, 2021 at 04:16:54PM +0200, Kevin Wolf wrote:
>Am 23.09.2021 um 16:30 hat Stefano Garzarella geschrieben:
>> Commit d7ddd0a161 ("linux-aio: limit the batch size using
>> `aio-max-batch` parameter") added a way to limit the batch size
>> of Linux AIO backend for the entire AIO context.
>>
>> The same AIO context can be shared by multiple devices, so
>> latency-sensitive devices may want to limit the batch size even
>> more to avoid increasing latency.
>>
>> This series add the `aio-max-batch` option to the file backend,
>> and use it in laio_co_submit() and laio_io_unplug() to limit the
>> Linux AIO batch size more than the limit set by the AIO context.
>
>Looks like you're only going to improve the wording for the QAPI
>documentation for v2, so feel free to add:
>
>Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>

Yep, I'll add your R-b in the v2 :-)

Thanks,
Stefano


