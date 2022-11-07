Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4949D61EB4C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 08:01:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orw7W-0000s3-EG; Mon, 07 Nov 2022 02:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1orw7K-0000o9-HU
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 02:00:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1orw7H-0001pQ-Ru
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 02:00:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667804418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Y07JqAIeWvcvy8sfIVoG/mJu3FwrzuEF4FRCfsijt8=;
 b=DY5bmpmZYajJvvJizhEkPoHIni2dMX+oKizbb0ET7cowBV1kqBEvKBsCzW+Y31Rz6BC3Z5
 XZsOixPGcO2PK+GmS+K8ecmEE3oW1meW1kl5vankZu7MQH1lTdsZv+yCFHddBljH2SjvrU
 Y1RnwCzNvE5BSmsK1mS9GAxpCe+qfMw=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-TpcipMHmMvSy3t8XiOEBxA-1; Mon, 07 Nov 2022 02:00:15 -0500
X-MC-Unique: TpcipMHmMvSy3t8XiOEBxA-1
Received: by mail-oo1-f71.google.com with SMTP id
 k3-20020a4a3103000000b0049eef7e70caso490332ooa.18
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 23:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Y07JqAIeWvcvy8sfIVoG/mJu3FwrzuEF4FRCfsijt8=;
 b=GOh8oMT0I2D02k2aEZQJ8l4Mf5YkBKWoXdvJ2FetZCE/9PQjsDG4jn4ExasqwowNCV
 StUUl4OtXos3XtgrwyrgbylR7/gLkbqhuMadZ4QUcykOcb5wCOm7KMxK7VkmzXJ5ClxN
 1j0SDeQwsZKYZ4nS9fIBiN33XAB21apbFRnFTlvXi874/uX8D0mQrHIwBed2MLEAQ874
 6fBNKdomC0TTsN3JnprlJUCcHLuru6+eIa+wauwcdToh3TfwzV/wEjDJDqNHLa+8gB/c
 d3kReFewCqXbQ7uZ5RC6kzjAPplk6QzD0cO18Q9kkJINhGCrhn2x4VKYykwBYzsghb8r
 wylg==
X-Gm-Message-State: ACrzQf1ER9HsmLOLttFdWHj6Ay5b0KpSgj8CaTBXQoODBs0hbSwpyccA
 dlmuFxqigI9CaMxVvCO0Ix33AoNg6IpIcqPDd8pb+5LdTI+HtOr53xhpAUfraGfzwQ5Jv+l2bcu
 cQQvTvGtTMgsxJ5NXk1hL2f/AyVqmrmo=
X-Received: by 2002:a05:6808:181e:b0:35a:5959:5909 with SMTP id
 bh30-20020a056808181e00b0035a59595909mr9393420oib.35.1667804415259; 
 Sun, 06 Nov 2022 23:00:15 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5wZZXNKfgIX5lo7dVaitbDj+qyRg8X1uKs6RudM+dBpPU8faJhXK0Hs/z6TWHQnS+PbntthC/e9SmhMcz41ps=
X-Received: by 2002:a05:6808:181e:b0:35a:5959:5909 with SMTP id
 bh30-20020a056808181e00b0035a59595909mr9393408oib.35.1667804415062; Sun, 06
 Nov 2022 23:00:15 -0800 (PST)
MIME-Version: 1.0
References: <20221028061436.30093-1-jasowang@redhat.com>
 <20221028061436.30093-3-jasowang@redhat.com>
 <20221105133643-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221105133643-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Nov 2022 15:00:03 +0800
Message-ID: <CACGkMEu5NLEZ=rvWrJoHmUnozg=nwZ4rLVwLN-KQHBqAUW85wQ@mail.gmail.com>
Subject: Re: [PATCH V5 2/4] intel-iommu: drop VTDBus
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: peterx@redhat.com, qemu-devel@nongnu.org, yi.y.sun@linux.intel.com, 
 eperezma@redhat.com, lulu@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Nov 6, 2022 at 1:37 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Oct 28, 2022 at 02:14:34PM +0800, Jason Wang wrote:
> >
> > -    GHashTable *vtd_as_by_busptr;   /* VTDBus objects indexed by PCIBus* reference */
> > -    VTDBus *vtd_as_by_bus_num[VTD_PCI_BUS_MAX]; /* VTDBus objects indexed by bus number */
> > +    GHashTable *vtd_address_spaces;             /* VTD address spaces */
> > +    VTDAddressSpace *vtd_as_cache[VTD_PCI_BUS_MAX]; /* VTD address space cache */
> >      /* list of registered notifiers */
> >      QLIST_HEAD(, VTDAddressSpace) vtd_as_with_notifiers;
>
>
> BTW this triggers a bunch of checkpatch errors. Pls fix up with
> a follow-up patch. Thanks!
>

Ok.

Thanks

> > --
> > 2.25.1
>


