Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D528444A7C2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:43:19 +0100 (CET)
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLmp-0006CH-1N
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:43:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mkLWQ-0002dp-Ly
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:26:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mkLWM-0006wM-SN
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636442778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c2rpWaWdwfPdBpRDn2QvpLgr64FG8aEbYUOc+3ya21E=;
 b=X32OUGVLHkGn6+MRt1zLkdjafCFfEr5yBGpkt3YFuWK3VW9FIGjP8SAFV+D1zkHYCRN36r
 qdEiaPVBDL7SSDGGhQUT5/1EwRe/C5YIhKv6AS8PgMYt6fZ6xrxNgHcEwbAmKBRM4OokUe
 jc0kHPh68UZtIpPP+pctiwte02zxdwI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-b8PAdEknMXutgUiYBNc-YA-1; Tue, 09 Nov 2021 02:26:16 -0500
X-MC-Unique: b8PAdEknMXutgUiYBNc-YA-1
Received: by mail-lf1-f71.google.com with SMTP id
 f11-20020ac24e4b000000b004001e7ea61cso7710896lfr.6
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 23:26:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c2rpWaWdwfPdBpRDn2QvpLgr64FG8aEbYUOc+3ya21E=;
 b=lmtTWBH7eRxFhPh2xzInmwtlylLuzwYAlGgRBNuj4bxpoTYtKlgTqVgzGRnGxGe22s
 lUMDzySyAO7xkR1E215NCqhHwWkIaWHY7AzswUVj/g8TTBBy+WRC4HjvWahyIcjO7EC7
 aoZVZXMByaWtoCOJW/TMDUDnoAcePupeJ8osiwDZTyVJYrEU/4WNKrWQ+eXY9eQZ1L+y
 omdadrFrvaDRhsyXbdssBGqWZ4mKCmect++cSuexGfLty4kDnkseeJzEzRM3bUv4zmuh
 okOO/W5FRmWNhVD/08a1uOQ2BexDN8jNkBdb+oJt3C8KiVc87QkADkMcaR9dhicJAJ/E
 x3zg==
X-Gm-Message-State: AOAM533urD4EV/PJl6JGY46hgJItC5++3xN1h1GQDm6z341c6z/Wame/
 ddVb00hmGkgyfD95Ut+i1skEz5S+aGZxrlJIuG0VWCOLn+ST1c01XSpGTWJUjDYt7c6rbRZQqfj
 YNZmY+DbmLjK7gzxZzNfT806XWZbpVDQ=
X-Received: by 2002:a05:6512:3b2b:: with SMTP id
 f43mr1957864lfv.629.1636442775395; 
 Mon, 08 Nov 2021 23:26:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwV97XoLnf9cfx1nqriSi0aQLH0Us/bK1+J8nTPX+J7GYVjfDEL9sBT0V8jiVIWfJMKALyKrkLZR3b41SpdGAc=
X-Received: by 2002:a05:6512:3b2b:: with SMTP id
 f43mr1957845lfv.629.1636442775120; 
 Mon, 08 Nov 2021 23:26:15 -0800 (PST)
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
 <CACGkMEsu-1ENupe8xMyKNNpbNjt1aGr5Unr_-4xDwx7OiA0ttQ@mail.gmail.com>
 <MWHPR11MB0031DA3889B2E94DDF5948229B929@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB0031DA3889B2E94DDF5948229B929@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Nov 2021 15:26:03 +0800
Message-ID: <CACGkMEuf=WybP0sZMHMxRBdm6H2ZOo-keoSAqbgJ2dTwdVLjCg@mail.gmail.com>
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

On Tue, Nov 9, 2021 at 3:20 PM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, November 9, 2021 2:42 PM
> > To: Zhang, Chen <chen.zhang@intel.com>
> > Cc: Markus Armbruster <armbru@redhat.com>; qemu-dev <qemu-
> > devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol for =
filter-
> > mirror/redirector
> >
> > On Mon, Nov 8, 2021 at 10:50 AM Zhang, Chen <chen.zhang@intel.com>
> > wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, November 8, 2021 10:42 AM
> > > > To: Zhang, Chen <chen.zhang@intel.com>
> > > > Cc: Markus Armbruster <armbru@redhat.com>; qemu-dev <qemu-
> > > > devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > > > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol
> > > > for filter- mirror/redirector
> > > >
> > > > On Fri, Nov 5, 2021 at 4:43 PM Zhang, Chen <chen.zhang@intel.com>
> > wrote:
> > > > >
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Friday, November 5, 2021 4:30 PM
> > > > > > To: Zhang, Chen <chen.zhang@intel.com>
> > > > > > Cc: Markus Armbruster <armbru@redhat.com>; qemu-dev <qemu-
> > > > > > devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > > > > > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer
> > > > > > protocol for filter- mirror/redirector
> > > > > >
> > > > > > On Fri, Nov 5, 2021 at 1:29 PM Zhang, Chen
> > > > > > <chen.zhang@intel.com>
> > > > wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Friday, November 5, 2021 12:03 PM
> > > > > > > > To: Zhang, Chen <chen.zhang@intel.com>
> > > > > > > > Cc: Markus Armbruster <armbru@redhat.com>; qemu-dev
> > <qemu-
> > > > > > > > devel@nongnu.org>; Li Zhijian <lizhijian@cn.fujitsu.com>
> > > > > > > > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer
> > > > > > > > protocol for filter- mirror/redirector
> > > > > > > >
> > > > > > > > On Fri, Nov 5, 2021 at 11:27 AM Zhang, Chen
> > > > > > > > <chen.zhang@intel.com>
> > > > > > wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > -----Original Message-----
> > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > Sent: Friday, November 5, 2021 11:17 AM
> > > > > > > > > > To: Zhang, Chen <chen.zhang@intel.com>; Markus
> > > > > > > > > > Armbruster <armbru@redhat.com>
> > > > > > > > > > Cc: qemu-dev <qemu-devel@nongnu.org>; Li Zhijian
> > > > > > > > > > <lizhijian@cn.fujitsu.com>
> > > > > > > > > > Subject: Re: [PATCH V5 1/3] net/filter: Optimize
> > > > > > > > > > transfer protocol for filter- mirror/redirector
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > =E5=9C=A8 2021/11/4 =E4=B8=8B=E5=8D=881:37, Zhang, Chen=
 =E5=86=99=E9=81=93:
> > > > > > > > > > >>>>>
> > > > > > > > > > >>>>> I wonder if we need to introduce new parameter,
> > > > > > > > > > >>>>> e.g force_vnet_hdr here, then we can always send
> > > > > > > > > > >>>>> vnet_hdr
> > > > > > when
> > > > > > > > > > >>>>> it
> > > > > > > > is enabled.
> > > > > > > > > > >>>>>
> > > > > > > > > > >>>>> Otherwise the "vnet_hdr_support" seems meaningles=
s.
> > > > > > > > > > >>>> Yes, Current "vnet_hdr_support"  default enabled,
> > > > > > > > > > >>>> and vnet_hdr_len
> > > > > > > > > > >>> already forced from attached nf->netdev.
> > > > > > > > > > >>>> Maybe we can introduce a new parameter
> > > > > > "force_no_vnet_hdr"
> > > > > > > > here
> > > > > > > > > > to
> > > > > > > > > > >>> make the vnet_hdr_len always keep 0.
> > > > > > > > > > >>>> If you think OK, I will update it in next version.
> > > > > > > > > > >>> Let me explain, if I was not wrong:
> > > > > > > > > > >>>
> > > > > > > > > > >>> "vnet_hdr_support" means whether or not to send vne=
t
> > > > > > > > > > >>> header
> > > > > > > > length.
> > > > > > > > > > >>> If vnet_hdr_support=3Dfalse, we won't send the vnet
> > header.
> > > > > > > > > > >>> This looks the same as you "force_no_vent_hdr" abov=
e.
> > > > > > > > > > >> Yes, It was.  But this series changed it.
> > > > > > > > > > >> Current "vnet_hdr_support" can't decide whether send
> > > > > > > > > > >> vnet header length, we always send it even 0.
> > > > > > > > > > >> It will avoid sender/receiver transfer protocol pars=
e issues:
> > > > > > > > > > >> When sender data with the vnet header length, but
> > > > > > > > > > >> receiver can't enable the "vnet_hdr_support".
> > > > > > > > > > >> Filters will auto setup vnet_hdr_len as local
> > > > > > > > > > >> nf->netdev and found the issue when get different
> > > > > > > > > > >> vnet_hdr_len from other
> > > > > > filters.
> > > > > > > > > > >>
> > > > > > > > > > >>> And my "force_vnet_hdr" seems duplicated with
> > > > > > > > > > vnet_hdr_support=3Dtrue.
> > > > > > > > > > >>> So it looks to me we can leave the mirror code as i=
s
> > > > > > > > > > >>> and just change the compare? (depends on the mgmt t=
o
> > > > > > > > > > >>> set a correct
> > > > > > > > > > >>> vnet_hdr_support)
> > > > > > > > > > >> OK, I will keep the
> > > > > > > > > > >> filter-mirror/filter-redirector/filter-rewriter
> > > > > > > > > > >> same as this version.
> > > > > > > > > > >> For the colo-compare module, It will get primary
> > > > > > > > > > >> node's filter data's vnet_hdr_len as the local value=
,
> > > > > > > > > > >> And compare with secondary node's, because it is not
> > > > > > > > > > >> attached any
> > > > nf->netdev.
> > > > > > > > > > >> So, it looks compare module's "vnet_hdr_support" bee=
n
> > > > > > > > > > >> auto configuration from the filter transport protoco=
l.
> > > > > > > > > > >> If the "force_vnet_hdr" means hard code a compare's
> > > > > > > > > > >> local vnet_hdr_len rather than come from input filte=
r's data?
> > > > > > > > > > >>
> > > > > > > > > > >> Thanks
> > > > > > > > > > >> Chen
> > > > > > > > > > >>
> > > > > > > > > > > Hi Jason/Markus,
> > > > > > > > > > >
> > > > > > > > > > > Rethink about it, How about keep the original
> > > > "vnet_hdr_support"
> > > > > > > > > > > function, And add a new optional parameter
> > "auto_vnet_hdr"
> > > > > > > > > > > for
> > > > > > > > > > filters/compare?
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > It's a way but rethink of the whole thing. I wonder wha=
t
> > > > > > > > > > if we just enable "vnet_hdr_support" by default for
> > > > > > > > > > filter and
> > > > > > > > > > colo-
> > > > > > compare?
> > > > > > > > >
> > > > > > > > > It's works by default for user use -device virtio-net-pci=
 and
> > e1000...
> > > > > > > > > But it can't resolve this series motivation, how to
> > > > > > > > > fix/check user
> > > > > > > > configuration issue:
> > > > > > > > > For example user enable " vnet_hdr_support " filter-mirro=
r
> > > > > > > > > and disable " vnet_hdr_support" filter-redirector And
> > > > > > > > > connect both filter modules by
> > > > > > > > chardev socket.
> > > > > > > > > In this case guest will get wrong network workload and
> > > > > > > > > filters didn=E2=80=99t perceive any abnormalities, but in=
 fact,
> > > > > > > > > the whole system is no longer
> > > > > > > > working.
> > > > > > > > > This series will report error and try to correct it.
> > > > > > > >
> > > > > > > > The problem is how "auto_vnet_hdr" help in this case. It's =
a
> > > > > > > > new parameter which may lead to more wrong configuration?
> > > > > > >
> > > > > > > No, the "auto_vnet_hdr" will fix most the wrong configuration
> > > > > > > issues as
> > > > > > "vnet_hdr_support" correct setting.
> > > > > > > When we enable the "auto_vnet_hdr", the original
> > > > "vnet_hdr_support"
> > > > > > will no effect.
> > > > > >
> > > > > > So it looks to me it still depends on the management to set
> > > > "auto_vnet_hdr"
> > > > > > to be true? (or make it enabled by default)
> > > > >
> > > > > Yes, I plan to make "auto_vnet_hdr" enabled by default in next ve=
rsion.
> > > > >
> > > > > >
> > > > > > If we can do that, isn't it much more simpler to make
> > > > > > vnet_hdr_support by default?
> > > > >
> > > > > Yes, For compatibility filters and COLO still work with the
> > > > > original
> > > > "vnet_hdr_support".
> > > > > For new users, they can enable the new "auto_vnet_hdr" to avoid
> > > > > some
> > > > issues.
> > > >
> > > > Question still, so we have
> > > >
> > > > 1) enable vnet_hdr_support by default
> > > > 2) add auto_vnet_hdr and enable it by default
> > > >
> > > > Using 1) seems much more simpler and can solve this issue. If we
> > > > depends on the default behaviour, it should be almost the same. If
> > > > we want to teach the mgmt, both should work. Any other advantages o=
f
> > 2)?
> > >
> > > Using 1) we can't ensure user configure parts of module by itself.
> > (vnet_hdr_support =3D off).
> > > In this case, filter data already wrong and the filters can't report =
any
> > transfer error here.
> >
> > So I think the point is we can't ensure the user configure parts of mod=
ule in
> > any case even if auto_vnet_hdr is introduced. E.g user can choose to di=
sable
> > it manually. That's why I think it should not differ too much from maki=
ng
> > vnet_hdr_support enabled by default.
>
> Yes, you are right. The "auto_vnet_hdr" just can fix part of user configu=
re issue.
> And I think this series make the filters better, it make user know filter=
s have some issues
> when they have wrong manual configuration(current code not).

I think if you stick to the change, I wonder if something like
"vnet_hdr_support=3Dauto" would be better? (not sure if it's too late to
change)

Thanks

>
> Thanks
> Chen
>
> >
> > Thanks
> >
> > >
> > > Using 2) filters will find/report this issue and try to fix it from l=
ocal
> > vnet_hdr_len.
> > >
> > > Thanks
> > > Chen
> > >
> > > >
> > > > Thanks
> > > >
> > > > >
> > > > > Thanks
> > > > > Chen
> > > > >
> > > > > >
> > > > > > I think I may miss something.
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
> > > > > > > > >
> > > > > > > > > Thanks
> > > > > > > > > Chen
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Thanks
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Thanks
> > > > > > > > > > > Chen
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >>> Thanks
> > > > > > > > > > >>>
> > > > > > > > > > >>>> Thanks
> > > > > > > > > > >>>> Chen
> > > > > > > > > > >>>>
> > > > > > > > > > >>>>> Thanks
> > > > > > > > > > >>>>>
> > > > > > > > > > >>>>>
> > > > > > > > >
> > > > > > >
> > > > >
> > >
>


