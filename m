Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A56B702A1C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:12:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVAT-0004Xe-8D; Mon, 15 May 2023 06:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pyVAD-0004VI-NJ
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:10:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pyVAA-0001mY-AR
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684145430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=brUKJMDZUGpLDeLqIJDvUBN3Li8wqepRWSbTu0nIGBY=;
 b=MO+AtmVziERsLSwp82wtEeAZAn/b6F47sxhEHLF9DOVC/A+UX/dwSX7sEixrmxDkjnMRnC
 k8WjdkXIMAEoY0En2qGwxJl+t/qNMRM2BklLYjImu19FOBY7rQtxmHRRBuRZNC0SVY5Nkq
 wdKyqaKZglRzpZI7Cn0Z16Vg59wnahs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-6w3XRsUHOASX6ZhFUTtnmA-1; Mon, 15 May 2023 06:10:29 -0400
X-MC-Unique: 6w3XRsUHOASX6ZhFUTtnmA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a34e35f57so1245137666b.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 03:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684145428; x=1686737428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=brUKJMDZUGpLDeLqIJDvUBN3Li8wqepRWSbTu0nIGBY=;
 b=V7iziPKPX29A3q7dqIutuiBZ0FwfULn+loou2+aRb+Bn5IZwxPMkO8iYj/SL+Z8zZt
 j1eHa62MNxH/dTvNDaosGIZPXkAQyKfkyuBP92JuhMjnHhe4AX3NKTlXmbt6TMQWFhGM
 0hDQket33Ob4ESPREULN0prwkH85vCMyOa/cSg/jZecnmkdeQtY/FuFqD2R/ExQFvIw8
 9+jvTb05Pw6vEvPJnzMLdcUxK7PBQQpLONbazAvi4rJwbJjEglr2Uk/jNAqXggORz9/k
 HrMHBxZx6y5s1yLqdcKaCyDZz0nr1LZR4JxupkHbU/0oQFpXHut7oUlilAMUzZrgQEQt
 G9Dg==
X-Gm-Message-State: AC+VfDymugFDfuKinYuvVJGnTpymgEpYTLJ6YO/4kMYY8OYOE9O/kood
 DPwbHZhdLue6B3a9OvLIlBI6OECT2p4Gz5T4CMMDY3E70376k0I2FOiG+DyFf9LLxoTvFmG2bEu
 lQ0hzF7J3n9f7cIs=
X-Received: by 2002:a17:906:9b86:b0:96a:5a59:92cb with SMTP id
 dd6-20020a1709069b8600b0096a5a5992cbmr15633456ejc.47.1684145428118; 
 Mon, 15 May 2023 03:10:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yFhfw6E8Ttm2AqwJ+ssORVo91uiqnM76yUEPCqp21jv2MioupnpJ/BCdPBr4ZslyhWUb7TQ==
X-Received: by 2002:a17:906:9b86:b0:96a:5a59:92cb with SMTP id
 dd6-20020a1709069b8600b0096a5a5992cbmr15633428ejc.47.1684145427733; 
 Mon, 15 May 2023 03:10:27 -0700 (PDT)
Received: from sgarzare-redhat (c-115-213.cust-q.wadsl.it. [212.43.115.213])
 by smtp.gmail.com with ESMTPSA id
 ov17-20020a170906fc1100b0096aa0ca9b5fsm4702584ejb.106.2023.05.15.03.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 03:10:26 -0700 (PDT)
Date: Mon, 15 May 2023 12:10:24 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jonathon Jongsma <jjongsma@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 1/1] block/blkio: use qemu_open() to support fd
 passing for virtio-blk
Message-ID: <q2odwrndg3gt6z25hdxb3t2xxavd64hkp4b23zhzycevhrwx64@25r5r6sidyok>
References: <20230511091527.46620-1-sgarzare@redhat.com>
 <20230511091527.46620-2-sgarzare@redhat.com>
 <1a89ee2e-2368-4051-f9ec-018641721484@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1a89ee2e-2368-4051-f9ec-018641721484@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, May 11, 2023 at 11:03:22AM -0500, Jonathon Jongsma wrote:
>On 5/11/23 4:15 AM, Stefano Garzarella wrote:
>>The virtio-blk-vhost-vdpa driver in libblkio 1.3.0 supports the new
>>'fd' property. Let's expose this to the user, so the management layer
>>can pass the file descriptor of an already opened vhost-vdpa character
>>device. This is useful especially when the device can only be accessed
>>with certain privileges.
>>
>>If the libblkio virtio-blk driver supports fd passing, let's always
>>use qemu_open() to open the `path`, so we can handle fd passing
>>from the management layer through the "/dev/fdset/N" special path.
>>
>>Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>---
>>
>>Notes:
>>     v3:
>>     - use qemu_open() on `path` to simplify libvirt code [Jonathon]
>
>
>Thanks
>
>The one drawback now is that it doesn't seem possible for libvirt to 
>introspect whether or not qemu supports passing an fd to the driver or 
>not.

Yep, this was because the libblkio library did not support this new way.

>When I was writing my initial patch (before I realized that it was 
>missing fd-passing), I just checked for the existence of the 
>virtio-blk-vhost-vdpa device. But we actually need to know both that 
>this device exists and supports fd passing.

Yep, this was one of the advantages of using the new `fd` parameter.
Can't libvirt handle the later failure?

>As far as I can tell, versions 7.2.0 and 8.0.0 include this device but 
>won't accept fds.

Right.

How do you suggest to proceed?

Thanks,
Stefano


