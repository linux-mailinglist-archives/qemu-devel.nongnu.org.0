Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD214EE64F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 04:57:23 +0200 (CEST)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na7TW-0001vl-O6
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 22:57:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na7S9-0000eR-UA
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:55:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na7S8-000152-Ad
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648781755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=urHEJSwAsaiYGZGCyR0IJmA46atmlKpwFFPvB5d5MsI=;
 b=FZJtlay9C5X2qwklMDy9JAoPR5edI1bTIc4rh1iEaZUunNkGM+ZeJYbczLURVV2vRl2hSc
 iBH1Drrz/WfUOXKMkIUSVvNiLzaAP+MIKDWOgXbkZFadyOtdCK0HXFfk+crAgTsoYSgeyd
 sVlH5nTyM9RO6teU8eg0D+uuBLBluHE=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-9_agJXe5OBOnS7E-Qo-ncg-1; Thu, 31 Mar 2022 22:55:54 -0400
X-MC-Unique: 9_agJXe5OBOnS7E-Qo-ncg-1
Received: by mail-lj1-f200.google.com with SMTP id
 126-20020a2e0584000000b0024af05cbffdso438751ljf.19
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 19:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=urHEJSwAsaiYGZGCyR0IJmA46atmlKpwFFPvB5d5MsI=;
 b=OxcFmVkZxHEd0qGFDPyUE0VRLUHQbz1R7GEJlUEQKE+XiB2Dbf+7oRwC5qy9MgUvZ2
 ZdjSgX9lC4/aJTYVvZT9Ec/ZrNzKj4AKYQwpsynATkpV6+G/VyMPtBb8BdDz+/5EPfo+
 xaYwnUQKaI0g62K3r+9p1C8JE/3gaMXMO/P9ZQpTzq6bGFKmakYW1XSSlFrpUhYOsc2n
 5UfVOkBqB3GlU+nfo5w/ZuCGepu4UCPXYYD9lVhd4awCbS810stvD0GapzLVv6iERh8m
 /vrvAsEWVNxZymgBXeXjHOxV6CsvMJV/MSUqaEJFs/NZS2wsgdP1ixL4XFJpl2n2VH3W
 r4oA==
X-Gm-Message-State: AOAM533ntEdIbT4ABMA9apweWwNFDIkC8oc+d5tMMyUhW2axWOHt2eiU
 1e2Z7sQTatqIDPP4XvWfJMWWeDXysKjv/Yh0kZTbMdncash+5vLd/KgEqzK0AnB72iXIvV0pLqH
 /+ntcGjpZoQLLHTzTLDYqaHGj7hxd2KA=
X-Received: by 2002:a05:6512:3341:b0:433:b033:bd22 with SMTP id
 y1-20020a056512334100b00433b033bd22mr12694010lfd.190.1648781752664; 
 Thu, 31 Mar 2022 19:55:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCsTL8Q3IXmTPxRvEIG9f2sCJk9DVb4lWtx8Y/XpI/WmINdzpfpGGvv2FxfqwNNp9IHef0HE1P/htIRU1ju+M=
X-Received: by 2002:a05:6512:3341:b0:433:b033:bd22 with SMTP id
 y1-20020a056512334100b00433b033bd22mr12693999lfd.190.1648781752446; Thu, 31
 Mar 2022 19:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <1648634561-12504-1-git-send-email-08005325@163.com>
 <1648703950-7321-1-git-send-email-08005325@163.com>
 <CACGkMEuGiuQ9DYqpqp9QAWhSgMiRa_aMnYqdDU8vECZxdGRWXg@mail.gmail.com>
 <1354a482-bfb2-1a0e-2c0d-fd6b7446292b@redhat.com>
In-Reply-To: <1354a482-bfb2-1a0e-2c0d-fd6b7446292b@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 1 Apr 2022 10:55:41 +0800
Message-ID: <CACGkMEvw7-HL5_-xY_=h7RqrQrFrjW_vVqpWjH9HdUYLwdY0Kw@mail.gmail.com>
Subject: Re: [PATCH v3] vdpa: reset the backend device in the end of
 vhost_net_stop()
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Cindy Lu <lulu@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, eperezma <eperezma@redhat.com>,
 Michael Qiu <qiudayu@archeros.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 08005325@163.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 5:12 PM Maxime Coquelin
<maxime.coquelin@redhat.com> wrote:
>
> Hi,
>
> On 3/31/22 10:55, Jason Wang wrote:
> > On Thu, Mar 31, 2022 at 1:20 PM <08005325@163.com> wrote:
> >
> > Hi:
> >
> > For some reason, I see the patch as an attachment.
>
> We are starting to see this more and more since yesterday on DPDK
> mailing list. It seems like an issue with mimecast, when the From: tag
> is different from the sender.
>
> Maxime

I see. Thanks

>
> > Thanks
> >
> >
>


