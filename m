Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D18144D023
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 03:51:18 +0100 (CET)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml0BJ-00017G-FD
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 21:51:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ml0A5-0000QE-NE
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 21:50:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ml0A1-0003wv-VF
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 21:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636598995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PxIqyxRefd5zP8ZwUjAyxzHwkYke5fstt3jT6bc/Zjw=;
 b=B+mZ4tyrAWzJH35r5hPOn9PHufBU4F/WjGlAVlA4ehOhMIMIhCj0I4ml88UveGLMhFJHz6
 Jpy5NNXKxtrBmr9fLTg8KQ6TiCn1t7pQMZ8il81mRRuRCr9LMyGGQVKjD8OA7iVVMLTOM1
 MBvJAZ94IJggzsOrw6CmYP/HNt6ZTro=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-jQsVQ36zMuufR97vcf9lkQ-1; Wed, 10 Nov 2021 21:49:53 -0500
X-MC-Unique: jQsVQ36zMuufR97vcf9lkQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 z1-20020a056512308100b003ff78e6402bso2028340lfd.4
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 18:49:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PxIqyxRefd5zP8ZwUjAyxzHwkYke5fstt3jT6bc/Zjw=;
 b=pJHvh0/BdiJXK+LwT9dsU5ShcbOjqH18M436qLy/QT/M9GHZOLjr9/8jYJG3mqSD6w
 5AfjTZ5pRHwiLpP1xhRt5rj6zN6PjksJ9dX0T6K5Oc9QdJ1Wj+CGQtrlC328T+otw66Q
 lz/MNlz/KSMsEjQQmYhYIUPyJejLuMiWnRu+rdLxMveY4Sx8a/us0KnNYLmCA7ei1jjb
 xqyNQB5pVzv6rshPn/vGIInmXhFVDEkRkaivdOrvvosSozxAorOiK1jmc7v2LkF9fdOf
 e/WregAHxQyC8S2D0KgtTJL0IA4dvISorfpao3ywsZNBv1jwnFskCDR7BO7kP9nvxznm
 OfkA==
X-Gm-Message-State: AOAM532rTsAAaNZnyyIwJ820VIsdAaj3kTCAC6GBFDh0lNWWfsEL0b2e
 4RcBPiNVq+5MipHP9d8BClTGV6RK16eHc60lofwqzOwsph/jqAU/v2RfXYuqmUv/vHFDRYkaZIn
 fCerdiGa7lBhPKQwz7fb9JQH1W3BGWaY=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr3841221ljp.362.1636598991733; 
 Wed, 10 Nov 2021 18:49:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5G85NYgbXCXfVA+iS+G1Vp5XRHyIs0a06bZ31yplzJQcve+LcTkPg6g5N+ouNMvX79AOxK8UeTUZTw7Z05QI=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr3841202ljp.362.1636598991510; 
 Wed, 10 Nov 2021 18:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20211110023915.3797141-1-chen.zhang@intel.com>
 <87czn88uqc.fsf@dusky.pond.sub.org>
 <MWHPR11MB00319C2B4ED872EDDB5D43539B939@MWHPR11MB0031.namprd11.prod.outlook.com>
 <87v9104jlb.fsf@dusky.pond.sub.org>
 <MWHPR11MB0031DA3FF0E560F0A83C9B759B939@MWHPR11MB0031.namprd11.prod.outlook.com>
 <87czn82ys4.fsf@dusky.pond.sub.org>
In-Reply-To: <87czn82ys4.fsf@dusky.pond.sub.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 11 Nov 2021 10:49:40 +0800
Message-ID: <CACGkMEt0UcaOupg3NPM4GZGUWDXrsm9AVnkQ1-bZZM3duuhocQ@mail.gmail.com>
Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by default
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Zhang, Chen" <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 4:36 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> "Zhang, Chen" <chen.zhang@intel.com> writes:
>
> >> -----Original Message-----
> >> From: Markus Armbruster <armbru@redhat.com>
> >> Sent: Wednesday, November 10, 2021 2:21 PM
> >> To: Zhang, Chen <chen.zhang@intel.com>
> >> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> >> devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> >> Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by default
> >>
> >> "Zhang, Chen" <chen.zhang@intel.com> writes:
> >>
> >> >> -----Original Message-----
> >> >> From: Markus Armbruster <armbru@redhat.com>
> >> >> Sent: Wednesday, November 10, 2021 1:07 PM
> >> >> To: Zhang, Chen <chen.zhang@intel.com>
> >> >> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> >> >> devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> >> >> Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by
> >> >> default
> >> >>
> >> >> Zhang Chen <chen.zhang@intel.com> writes:
> >> >>
> >> >> > This patch make filters and colo-compare module support vnet_hdr by
> >> >> > default. And also support -device non-virtio-net(like e1000.).
> >> >> > But it can't avoid user manual configuration error between
> >> >> > different filters when enable/disable virtio-net-pci.
> >> >> >
> >> >> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> >> >>
> >> >> Have you considered backward compatibility?  Can it break usage that
> >> >> now works?
> >> >
> >> > Yes, this patch fully guarantees the compatibility as Jason's comments.
> >> > Original usage still works.
> >>
> >> Worth a brief explanation in the commit message?
> >
> > OK. Add following statement to commit message:
> > This patch make filters and colo-compare module support vnet_hdr by
> > default. And also support -device non-virtio-net(like e1000.). Because
> > when enabled the support will make the vnet_hdr_len field become must-delivery
> > part of filter transfer protocol(even 0 in use -device e1000). It fully guarantees the
> > compatibility for management layer like libvirt.
> > But it still can't avoid user manual configuration error between
> > different filters connected when enable/disable vnet_hdr_support.
> >
> > How about this explanation?
>
> I'm deferring to Jason, because I can't judge this for technical
> accuracy.

I think it should be fine.

Thanks

>
> > By the way, please let me know your comments on filter passthrough series:
> > https://mail.gnu.org/archive/html/qemu-devel/2021-08/msg01393.html
> > If OK, I will update it.
>
> Uh, I was under the impression that you'd respin with my comments
> addressed as per your reply to my review.
>
> It's too late for 6.2 now.  Suggest to respin, and adjust the "since:"
> tags to 7.0.
>


