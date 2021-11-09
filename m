Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEC444A71B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:59:20 +0100 (CET)
Received: from localhost ([::1]:36828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkL6F-0004xp-Si
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:59:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mkKpz-0000P6-JF
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 01:42:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mkKpx-0006OX-2B
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 01:42:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636440147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tOhyohd/vQ8MtgLIjrPgF0wcDaoikIQHblgeW6h4KRo=;
 b=NbLhr4E6wq+ZVafmMdwPSB/ziypv5FBdSr24jZdxpIptViOkNZn+FNDUeZ5GoqrmbWAWQE
 zRLh28UWAg5PuDZh6sWY7sXRHTvaTaJc2Hpe1s8kvTCMkA0N0IhCrvUhKnk2ZFhIki8RpI
 JQ765imm4ymzVt2uFyK+8q4Ynan3Xlo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-XsQjSA1cPUKOye8TsWoyGw-1; Tue, 09 Nov 2021 01:42:24 -0500
X-MC-Unique: XsQjSA1cPUKOye8TsWoyGw-1
Received: by mail-lf1-f72.google.com with SMTP id
 bp10-20020a056512158a00b0040376f60e35so2116116lfb.8
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 22:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tOhyohd/vQ8MtgLIjrPgF0wcDaoikIQHblgeW6h4KRo=;
 b=UTO63837ClDfqL4S51JEYKR398Nxe+c2thgJNYz8pIMvw4iJIOX+SYO+F6PLY1BiUY
 1oFMCTn3P5i2eUETeaIarCStObKM9zDOVEU+4ErRa7fe5KguVWajNNzBLrnDNsaMtm1W
 wCg5h7IXRu/c4fKl4R8NOMBPE+YEDBJIKNkNE9DGV3vX6I2vfM8IgQbgbYjVAK9P5vqu
 WLZ+p334R63/l8rN+9klrWmKDRLikbaMxldiM4gX1pySylMf9IxyPFwd5+VtQcUMhu55
 KkmWrGzHXpgOp84LgNklmreNSOxqmMy2KrbXduIDyuSISCOi/ajgvCD3I9w/F7kTyED5
 vzWg==
X-Gm-Message-State: AOAM53012GMvqJhbfgr5sXXgL/0vo4+DwaJB3cgczpiaGXooDxHnKTWQ
 TsEXaBYDwcXXDJkG15whQyKmEpsV7AxJBRiXx5eUVwLMkKPh8jGO5fG+jOJJKFwtE0RjY9kNjuS
 /Hx9UCyJik/fl7t02FnQWEZ7ri8sif/Y=
X-Received: by 2002:ac2:4e68:: with SMTP id y8mr5002474lfs.348.1636440143192; 
 Mon, 08 Nov 2021 22:42:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8McOZLsuPxGmd1N/RljiSlFDGQrCg9fijonxJHlbJlFsiX648ilvt6WXm0clGDkN5gszcN5auVlfZC45nwWo=
X-Received: by 2002:ac2:4e68:: with SMTP id y8mr5002455lfs.348.1636440142922; 
 Mon, 08 Nov 2021 22:42:22 -0800 (PST)
MIME-Version: 1.0
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
 <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
 <MWHPR11MB00315CFF0E7854146B5C9AE69B8A9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB0031B626425E7815EB78A9E49B8D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <94f96089-f8a8-d3d4-18c3-26917952fc14@redhat.com>
 <DM5PR11MB00276DF408F0DBC3C6EFADB89B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEvuXhuzSiTebOQqvriD5UnaiPzaY37AOR8bihTC4FTa4Q@mail.gmail.com>
 <DM5PR11MB002701BF07DCC15BF968A1749B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEs5q4E3yK_ZjUQsvJ=Ojd6hmTVEwQeh1N0QDPNaPoM7Dw@mail.gmail.com>
 <MWHPR11MB0031EBF5ACACF7455EA9F4779B8E9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsLF6VUDNgnUngrE4LePkM8pFe3fYrPd2W6O8RUpcprNQ@mail.gmail.com>
 <MWHPR11MB00315078A1A7329E96FAA8F79B919@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB00315078A1A7329E96FAA8F79B919@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Nov 2021 14:42:11 +0800
Message-ID: <CACGkMEsu-1ENupe8xMyKNNpbNjt1aGr5Unr_-4xDwx7OiA0ttQ@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
To: "Zhang, Chen" <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 8, 2021 at 10:50 AM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, November 8, 2021 10:42 AM
> > To: Zhang, Chen <chen.zhang@intel.com>
> > Cc: Markus Armbruster <armbru@redhat.com>; qemu-dev <qemu-
> > devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol for =
filter-
> > mirror/redirector
> >
> > On Fri, Nov 5, 2021 at 4:43 PM Zhang, Chen <chen.zhang@intel.com> wrote=
:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Friday, November 5, 2021 4:30 PM
> > > > To: Zhang, Chen <chen.zhang@intel.com>
> > > > Cc: Markus Armbruster <armbru@redhat.com>; qemu-dev <qemu-
> > > > devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > > > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol
> > > > for filter- mirror/redirector
> > > >
> > > > On Fri, Nov 5, 2021 at 1:29 PM Zhang, Chen <chen.zhang@intel.com>
> > wrote:
> > > > >
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Friday, November 5, 2021 12:03 PM
> > > > > > To: Zhang, Chen <chen.zhang@intel.com>
> > > > > > Cc: Markus Armbruster <armbru@redhat.com>; qemu-dev <qemu-
> > > > > > devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > > > > > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer
> > > > > > protocol for filter- mirror/redirector
> > > > > >
> > > > > > On Fri, Nov 5, 2021 at 11:27 AM Zhang, Chen
> > > > > > <chen.zhang@intel.com>
> > > > wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Friday, November 5, 2021 11:17 AM
> > > > > > > > To: Zhang, Chen <chen.zhang@intel.com>; Markus Armbruster
> > > > > > > > <armbru@redhat.com>
> > > > > > > > Cc: qemu-dev <qemu-devel@nongnu.org>; Li Zhijian
> > > > > > > > <lizhijian@cn.fujitsu.com>
> > > > > > > > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer
> > > > > > > > protocol for filter- mirror/redirector
> > > > > > > >
> > > > > > > >
> > > > > > > > =E5=9C=A8 2021/11/4 =E4=B8=8B=E5=8D=881:37, Zhang, Chen =E5=
=86=99=E9=81=93:
> > > > > > > > >>>>>
> > > > > > > > >>>>> I wonder if we need to introduce new parameter, e.g
> > > > > > > > >>>>> force_vnet_hdr here, then we can always send vnet_hdr
> > > > when
> > > > > > > > >>>>> it
> > > > > > is enabled.
> > > > > > > > >>>>>
> > > > > > > > >>>>> Otherwise the "vnet_hdr_support" seems meaningless.
> > > > > > > > >>>> Yes, Current "vnet_hdr_support"  default enabled, and
> > > > > > > > >>>> vnet_hdr_len
> > > > > > > > >>> already forced from attached nf->netdev.
> > > > > > > > >>>> Maybe we can introduce a new parameter
> > > > "force_no_vnet_hdr"
> > > > > > here
> > > > > > > > to
> > > > > > > > >>> make the vnet_hdr_len always keep 0.
> > > > > > > > >>>> If you think OK, I will update it in next version.
> > > > > > > > >>> Let me explain, if I was not wrong:
> > > > > > > > >>>
> > > > > > > > >>> "vnet_hdr_support" means whether or not to send vnet
> > > > > > > > >>> header
> > > > > > length.
> > > > > > > > >>> If vnet_hdr_support=3Dfalse, we won't send the vnet hea=
der.
> > > > > > > > >>> This looks the same as you "force_no_vent_hdr" above.
> > > > > > > > >> Yes, It was.  But this series changed it.
> > > > > > > > >> Current "vnet_hdr_support" can't decide whether send vne=
t
> > > > > > > > >> header length, we always send it even 0.
> > > > > > > > >> It will avoid sender/receiver transfer protocol parse is=
sues:
> > > > > > > > >> When sender data with the vnet header length, but
> > > > > > > > >> receiver can't enable the "vnet_hdr_support".
> > > > > > > > >> Filters will auto setup vnet_hdr_len as local nf->netdev
> > > > > > > > >> and found the issue when get different vnet_hdr_len from
> > > > > > > > >> other
> > > > filters.
> > > > > > > > >>
> > > > > > > > >>> And my "force_vnet_hdr" seems duplicated with
> > > > > > > > vnet_hdr_support=3Dtrue.
> > > > > > > > >>> So it looks to me we can leave the mirror code as is an=
d
> > > > > > > > >>> just change the compare? (depends on the mgmt to set a
> > > > > > > > >>> correct
> > > > > > > > >>> vnet_hdr_support)
> > > > > > > > >> OK, I will keep the
> > > > > > > > >> filter-mirror/filter-redirector/filter-rewriter
> > > > > > > > >> same as this version.
> > > > > > > > >> For the colo-compare module, It will get primary node's
> > > > > > > > >> filter data's vnet_hdr_len as the local value, And
> > > > > > > > >> compare with secondary node's, because it is not attache=
d any
> > nf->netdev.
> > > > > > > > >> So, it looks compare module's "vnet_hdr_support" been
> > > > > > > > >> auto configuration from the filter transport protocol.
> > > > > > > > >> If the "force_vnet_hdr" means hard code a compare's loca=
l
> > > > > > > > >> vnet_hdr_len rather than come from input filter's data?
> > > > > > > > >>
> > > > > > > > >> Thanks
> > > > > > > > >> Chen
> > > > > > > > >>
> > > > > > > > > Hi Jason/Markus,
> > > > > > > > >
> > > > > > > > > Rethink about it, How about keep the original
> > "vnet_hdr_support"
> > > > > > > > > function, And add a new optional parameter "auto_vnet_hdr=
"
> > > > > > > > > for
> > > > > > > > filters/compare?
> > > > > > > >
> > > > > > > >
> > > > > > > > It's a way but rethink of the whole thing. I wonder what if
> > > > > > > > we just enable "vnet_hdr_support" by default for filter and
> > > > > > > > colo-
> > > > compare?
> > > > > > >
> > > > > > > It's works by default for user use -device virtio-net-pci and=
 e1000...
> > > > > > > But it can't resolve this series motivation, how to fix/check
> > > > > > > user
> > > > > > configuration issue:
> > > > > > > For example user enable " vnet_hdr_support " filter-mirror an=
d
> > > > > > > disable " vnet_hdr_support" filter-redirector And connect bot=
h
> > > > > > > filter modules by
> > > > > > chardev socket.
> > > > > > > In this case guest will get wrong network workload and filter=
s
> > > > > > > didn=E2=80=99t perceive any abnormalities, but in fact, the w=
hole
> > > > > > > system is no longer
> > > > > > working.
> > > > > > > This series will report error and try to correct it.
> > > > > >
> > > > > > The problem is how "auto_vnet_hdr" help in this case. It's a ne=
w
> > > > > > parameter which may lead to more wrong configuration?
> > > > >
> > > > > No, the "auto_vnet_hdr" will fix most the wrong configuration
> > > > > issues as
> > > > "vnet_hdr_support" correct setting.
> > > > > When we enable the "auto_vnet_hdr", the original
> > "vnet_hdr_support"
> > > > will no effect.
> > > >
> > > > So it looks to me it still depends on the management to set
> > "auto_vnet_hdr"
> > > > to be true? (or make it enabled by default)
> > >
> > > Yes, I plan to make "auto_vnet_hdr" enabled by default in next versio=
n.
> > >
> > > >
> > > > If we can do that, isn't it much more simpler to make
> > > > vnet_hdr_support by default?
> > >
> > > Yes, For compatibility filters and COLO still work with the original
> > "vnet_hdr_support".
> > > For new users, they can enable the new "auto_vnet_hdr" to avoid some
> > issues.
> >
> > Question still, so we have
> >
> > 1) enable vnet_hdr_support by default
> > 2) add auto_vnet_hdr and enable it by default
> >
> > Using 1) seems much more simpler and can solve this issue. If we depend=
s
> > on the default behaviour, it should be almost the same. If we want to t=
each
> > the mgmt, both should work. Any other advantages of 2)?
>
> Using 1) we can't ensure user configure parts of module by itself. (vnet_=
hdr_support =3D off).
> In this case, filter data already wrong and the filters can't report any =
transfer error here.

So I think the point is we can't ensure the user configure parts of
module in any case even if auto_vnet_hdr is introduced. E.g user can
choose to disable it manually. That's why I think it should not differ
too much from making vnet_hdr_support enabled by default.

Thanks

>
> Using 2) filters will find/report this issue and try to fix it from local=
 vnet_hdr_len.
>
> Thanks
> Chen
>
> >
> > Thanks
> >
> > >
> > > Thanks
> > > Chen
> > >
> > > >
> > > > I think I may miss something.
> > > >
> > > > Thanks
> > > >
> > > > >
> > > > > Thanks
> > > > > Chen
> > > > >
> > > > > >
> > > > > > Thanks
> > > > > >
> > > > > > >
> > > > > > > Thanks
> > > > > > > Chen
> > > > > > >
> > > > > > > >
> > > > > > > > Thanks
> > > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Thanks
> > > > > > > > > Chen
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >>> Thanks
> > > > > > > > >>>
> > > > > > > > >>>> Thanks
> > > > > > > > >>>> Chen
> > > > > > > > >>>>
> > > > > > > > >>>>> Thanks
> > > > > > > > >>>>>
> > > > > > > > >>>>>
> > > > > > >
> > > > >
> > >
>


