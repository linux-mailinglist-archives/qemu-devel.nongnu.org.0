Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248B589877
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 09:36:43 +0200 (CEST)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJVPL-0001jB-GQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 03:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJVIA-0005ci-AL
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJVI6-00031F-QY
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659598149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhC5WdxOsLCyZcxkKLsrbao3qpjxtbXmlnD4zrM6cJk=;
 b=MorgCSOOIdnUxjBDi/Fvqqor+HLFwo+5drxHytxlE0aeA1GpCO4rt069pSfTJI5atetojr
 wYEPtd2YxJCG1jqBCDY+w1dHh4mc5/E+emCXZaWOBGuSYaI3nuRn93uTkhRMy+aGZLpk+Q
 4oswlGmvKzaCUnLJNlAlRVII3J2sduQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-57uFpoF6NPSTpD5FMMOm0A-1; Thu, 04 Aug 2022 03:29:07 -0400
X-MC-Unique: 57uFpoF6NPSTpD5FMMOm0A-1
Received: by mail-lj1-f200.google.com with SMTP id
 k2-20020a2ea282000000b0025dea602f7cso4589162lja.0
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 00:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vhC5WdxOsLCyZcxkKLsrbao3qpjxtbXmlnD4zrM6cJk=;
 b=Km/iM/DUtTbPKONQ/tOv2X8tokNk74vxQHfQhIHZa4YzGQLiTCsGTD0BqJ3ivs6ecF
 D8aF1KIjJW/t3pAQWyzqzyi7Adz3qA52gl5PoyIb7+yj4Czc+4eBdaudIVOnUpKnMPxC
 sy3ProZYYuVxafAJAtiiO6DtCp5P/vwnOMFQqIedueQbyLPWqA+s1mUMMueZIvRK772w
 /xBhjbVQ7E3rPp5iBroBk3qm8PUgo+C9YSOGNovHVxWxRbfil58VZ18gH6IVeRgOxXs+
 4d9uHbXjx40YG/v4upWTd+mJrGu5zZKIxCtpp3pc7cRZofGTKhSBU3obuW0HBNysE4DI
 ZbFQ==
X-Gm-Message-State: ACgBeo0mxrBFNAFhL8O2ldAYLjrwDo7SRB5/vMuD/sR4/ZcP7SVAtwZZ
 42pUO2snzDwRmgSsymt4O4FZT9zOw+KhFp2ENjYMd0zJibV/0W5rr5LCVHRUmDDTUq1uSyDgzpT
 wdvsIc/tZlKTQn51PThYQcfkrPb70Ato=
X-Received: by 2002:a2e:944d:0:b0:25e:6fbf:4a02 with SMTP id
 o13-20020a2e944d000000b0025e6fbf4a02mr167256ljh.323.1659598146449; 
 Thu, 04 Aug 2022 00:29:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hXGcego+Uo8vaIFzciu1FwTuvYIzmOrdgF7CV6259EVbIlgZQ26hFu7rwfBWtvZwQsDhgT57568A8dZ01ysI=
X-Received: by 2002:a2e:944d:0:b0:25e:6fbf:4a02 with SMTP id
 o13-20020a2e944d000000b0025e6fbf4a02mr167229ljh.323.1659598146187; Thu, 04
 Aug 2022 00:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220802175731.312115-1-eperezma@redhat.com>
 <20220802175731.312115-3-eperezma@redhat.com>
 <6ca24679-7d2b-a3ab-4c9e-a83745682808@redhat.com>
 <CAJaqyWfLhAZ3h7EFsPmeUo0f1JBfAG3ubmTa-xwTy0xz5NZr9g@mail.gmail.com>
In-Reply-To: <CAJaqyWfLhAZ3h7EFsPmeUo0f1JBfAG3ubmTa-xwTy0xz5NZr9g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 4 Aug 2022 15:28:54 +0800
Message-ID: <CACGkMEv14q79Bq6Bgh1ko_CrY6iPad9wR1iAQs2bLN2CJVQSQw@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] vhost: use SVQ element ndescs instead of opaque
 data for desc validation
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 4, 2022 at 1:57 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Thu, Aug 4, 2022 at 5:01 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/8/3 01:57, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > Since we're going to allow SVQ to add elements without the guest's
> > > knowledge and without its own VirtQueueElement, it's easier to check =
if
> > > an element is a valid head checking a different thing than the
> > > VirtQueueElement.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> >
> >
> > Patch looks good to me. But I spot several other issues:
> >
> > 1) vhost_svq_add() use size_t for in_num and out_num, is this intended?
>
> Would you prefer them to be unsigned? To me size_t fits better, but
> VirtQueueElement uses unsigned anyway.

Yes, the problem I ask is because the in_num were from
VirtQueueElement which is unsigned and cast to size_t and then cast
back to unsigned.

>
> > 2) do we need to fail vhost_svq_add() if in_num + out_num =3D=3D 0?
> >
>
> We can recover from it, but it's a failure of qemu code.
> - In the case of loading the state to the destination device, we
> already know the layout (it's always 1 out, 1 in).
> - In the case of forwarding buffers, there is no way to get a
> VirtQueueElement with 0 out and 0 in descriptors, due to the virtqueue
> way of working.

So I think it's better to fail the svq_add in this case.

Thanks

>
> Would you prefer to return success in this case?
>
> Thanks!
>


