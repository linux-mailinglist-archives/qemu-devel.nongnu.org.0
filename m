Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAB637AFC8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 21:59:16 +0200 (CEST)
Received: from localhost ([::1]:58360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgYXD-0008Gk-MQ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 15:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lgYW7-0007Fn-7E
 for qemu-devel@nongnu.org; Tue, 11 May 2021 15:58:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lgYW3-0002UM-FP
 for qemu-devel@nongnu.org; Tue, 11 May 2021 15:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620763079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YxztpybHsc69fY4MnXZn5BC2gTFVd/M6ZN33vpt8QK0=;
 b=baoLPqHqOp9bP+A+b+RfJ1mKggpYX5tB6u2t3S/YdBrWX38slQHtu1v3ITd2ss8C5JBswB
 i/x8oTv584K0dzDU+rQ2mc4S304HWnCuACA36FvnzzXnJ+tEYTdgpPZc/xX5FrlQ63/T9H
 DoNmprU6Q/8zXbDoZ15mW8/vsG6+AU8=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-A7Vy4YBUML6JSWLs0sj5LQ-1; Tue, 11 May 2021 15:57:56 -0400
X-MC-Unique: A7Vy4YBUML6JSWLs0sj5LQ-1
Received: by mail-ot1-f71.google.com with SMTP id
 u14-20020a056830248eb02902a5e3432ae9so13660167ots.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 12:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YxztpybHsc69fY4MnXZn5BC2gTFVd/M6ZN33vpt8QK0=;
 b=tgYvnhkcCvKaT4nKe2F73xenG27tS5SuBOleN2T2W1JnhVHKMRkGNYSKDU3srzm6PB
 8ooWCTRs6XSGY47616SbEob/+LbJYEjwXCYuhbnlqVzM62bBKwR+3X6Qy9IF+36TDKNq
 olcGRKwCVQ2PZLIpnufZbhDHiNQvw+N+nzlwIKJO/4HPbeVIhG6MpCKJ68E1kNqbqi8W
 FU5ltF0+0Wg+GYm0281IzP4FZMJbZLh8vfPloQJjqpAmej4my5HWgLb6tnUoC+Z4Xweu
 lIRgLrpiYXzLGmufNnuoyf4qDIfsRP4evNSMiwYTg6ma3nOHsYg+VxOnAHDFFCbGz5oU
 EL4g==
X-Gm-Message-State: AOAM531+sVeDJOTztGDYdT0M/HyNbUIpJfTI3GrTpsTUoVsc6NjjxLFn
 fatsICzs745COAbCxj78bxtfmrNSoT5HC1loef2t1I0CRvffREE0bV4a9C5DDwuwY0Zgr3V5YDy
 z0rE7yLtLw0PvSJE=
X-Received: by 2002:a9d:7987:: with SMTP id h7mr18203957otm.70.1620763075301; 
 Tue, 11 May 2021 12:57:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDL73Ndvi+HaETd5ZrOSJFu5f5+1UIYRVy+4bL+W7vQ26KYLN1YhiVtHr6GNvfZeYtqfbLFQ==
X-Received: by 2002:a9d:7987:: with SMTP id h7mr18203937otm.70.1620763074860; 
 Tue, 11 May 2021 12:57:54 -0700 (PDT)
Received: from [192.168.0.112] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 i9sm3476201oog.17.2021.05.11.12.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 12:57:54 -0700 (PDT)
Subject: Re: [PATCH] 9pfs: add link to 9p developer docs
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <E1leeDf-0008GZ-9q@lizzy.crudebyte.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <2208e250-4587-5902-f5c9-4786f8bd41e8@redhat.com>
Date: Tue, 11 May 2021 14:57:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <E1leeDf-0008GZ-9q@lizzy.crudebyte.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 8:12 AM, Christian Schoenebeck wrote:
> To lower the entry level for new developers, add a link to the
> 9p developer docs (i.e. qemu wiki) at the beginning of 9p source
> files, that is to: https://wiki.qemu.org/Documentation/9p
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p-local.c             | 5 +++++
>  hw/9pfs/9p-posix-acl.c         | 5 +++++
>  hw/9pfs/9p-proxy.c             | 5 +++++
>  hw/9pfs/9p-synth.c             | 5 +++++
>  hw/9pfs/9p-util.c              | 5 +++++
>  hw/9pfs/9p-xattr-user.c        | 5 +++++
>  hw/9pfs/9p-xattr.c             | 5 +++++
>  hw/9pfs/9p.c                   | 5 +++++
>  hw/9pfs/codir.c                | 5 +++++
>  hw/9pfs/cofile.c               | 5 +++++
>  hw/9pfs/cofs.c                 | 5 +++++
>  hw/9pfs/coth.c                 | 5 +++++
>  hw/9pfs/coxattr.c              | 5 +++++
>  hw/9pfs/virtio-9p-device.c     | 5 +++++
>  hw/9pfs/xen-9p-backend.c       | 5 +++++
>  tests/qtest/libqos/virtio-9p.c | 5 +++++
>  tests/qtest/virtio-9p-test.c   | 5 +++++

Would it be helpful to also add this link to the virtio-9p stanza in
MAINTAINERS? Something like:

W: https://wiki.qemu.org/Documentation/9p

Connor


