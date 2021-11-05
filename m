Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2E3445F06
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 05:07:21 +0100 (CET)
Received: from localhost ([::1]:44974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miqVc-0001fk-2c
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 00:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miqS4-0007vt-Fb
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 00:03:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1miqRx-00081b-Cn
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 00:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636085001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVT6zErktyEWLegaojFRYZJvood2ySaD00de0ECchQQ=;
 b=WL563GP6URCpEicgr4jCe1+ShKtkSEIHRSEoiIPPKme2d2EqbrcH3/qa/ltp4vCBOVTL+I
 UYKwlJ51JKOPSk1/dZgHuzvEzMAvBxmImYiEExsIbHDDhsxt5OuQz0S3kvShYto2OkZvr0
 /mLpoMUZHuucP2fI457LC+r4lSrl2KM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-rfaGzn-NOf-WBdV8sthO4A-1; Fri, 05 Nov 2021 00:03:20 -0400
X-MC-Unique: rfaGzn-NOf-WBdV8sthO4A-1
Received: by mail-lf1-f69.google.com with SMTP id
 br22-20020a056512401600b004017a0f5cc6so2790127lfb.16
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 21:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VVT6zErktyEWLegaojFRYZJvood2ySaD00de0ECchQQ=;
 b=aKfdLnBXaODZ7DedMcKbRs+APpfDpUMCfrBUrsW/dQhAOJ7ouDZl7acb3CRAzG1xG/
 CHjnmaYaK+y9atRUpStmF9CkcNwHXa53sVXo0GSPvkwHP1tkoLbJd7Wc7ypL6Gs7yfgu
 Pw62mamWdOeDeGJCUqWsvEh9fez9wrhP2xJhPvxAI5HZcCu2p97bfMIRTQ+4FAGxKRMU
 priZhphOEYqIaNBFwwHpjEG31r4x52aTZw6sD2zrFzjO6FANonfpzFPGF34wNxt6aM5+
 qpGWjqyTA1/AMhNUHqQGrdzBLko9L0q4axyeARAc6HbBy883zPXpw/RF2B+vkxLf/cVr
 kPAQ==
X-Gm-Message-State: AOAM530cngoA/ZeQBL1W4KqgujAgw1IFi6WRFfd31qxUVENer1kqkqs7
 hKoGBggcticTIQu6q1O8mlBwGw6cGGVkSdw6YUjJ61tAkxWemBXZDH5WXvcna+VcAFjWiRdDtev
 ZSTasF1+yjXauTANX/K4AkHSZk+rTfBU=
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr1576733lfv.481.1636084998626; 
 Thu, 04 Nov 2021 21:03:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7CDnyku3hmpFpZ9hBwH5Ey0+6POf0T4fwpxuY0pIbdT7Bsn8GJycu3y7zZNZEBu3SPFMj9Nm97VMWsabV7JI=
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr1576707lfv.481.1636084998367; 
 Thu, 04 Nov 2021 21:03:18 -0700 (PDT)
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
In-Reply-To: <DM5PR11MB00276DF408F0DBC3C6EFADB89B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 Nov 2021 12:03:07 +0800
Message-ID: <CACGkMEvuXhuzSiTebOQqvriD5UnaiPzaY37AOR8bihTC4FTa4Q@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
To: "Zhang, Chen" <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 5, 2021 at 11:27 AM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Friday, November 5, 2021 11:17 AM
> > To: Zhang, Chen <chen.zhang@intel.com>; Markus Armbruster
> > <armbru@redhat.com>
> > Cc: qemu-dev <qemu-devel@nongnu.org>; Li Zhijian
> > <lizhijian@cn.fujitsu.com>
> > Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol for =
filter-
> > mirror/redirector
> >
> >
> > =E5=9C=A8 2021/11/4 =E4=B8=8B=E5=8D=881:37, Zhang, Chen =E5=86=99=E9=81=
=93:
> > >>>>>
> > >>>>> I wonder if we need to introduce new parameter, e.g force_vnet_hd=
r
> > >>>>> here, then we can always send vnet_hdr when it is enabled.
> > >>>>>
> > >>>>> Otherwise the "vnet_hdr_support" seems meaningless.
> > >>>> Yes, Current "vnet_hdr_support"  default enabled, and vnet_hdr_len
> > >>> already forced from attached nf->netdev.
> > >>>> Maybe we can introduce a new parameter "force_no_vnet_hdr" here
> > to
> > >>> make the vnet_hdr_len always keep 0.
> > >>>> If you think OK, I will update it in next version.
> > >>> Let me explain, if I was not wrong:
> > >>>
> > >>> "vnet_hdr_support" means whether or not to send vnet header length.
> > >>> If vnet_hdr_support=3Dfalse, we won't send the vnet header. This lo=
oks
> > >>> the same as you "force_no_vent_hdr" above.
> > >> Yes, It was.  But this series changed it.
> > >> Current "vnet_hdr_support" can't decide whether send vnet header
> > >> length, we always send it even 0.
> > >> It will avoid sender/receiver transfer protocol parse issues:
> > >> When sender data with the vnet header length, but receiver can't
> > >> enable the "vnet_hdr_support".
> > >> Filters will auto setup vnet_hdr_len as local nf->netdev and found
> > >> the issue when get different vnet_hdr_len from other filters.
> > >>
> > >>> And my "force_vnet_hdr" seems duplicated with
> > vnet_hdr_support=3Dtrue.
> > >>> So it looks to me we can leave the mirror code as is and just chang=
e
> > >>> the compare? (depends on the mgmt to set a correct vnet_hdr_support=
)
> > >> OK, I will keep the filter-mirror/filter-redirector/filter-rewriter
> > >> same as this version.
> > >> For the colo-compare module, It will get primary node's filter data'=
s
> > >> vnet_hdr_len as the local value, And compare with secondary node's,
> > >> because it is not attached any nf->netdev.
> > >> So, it looks compare module's "vnet_hdr_support" been auto
> > >> configuration from the filter transport protocol.
> > >> If the "force_vnet_hdr" means hard code a compare's local
> > >> vnet_hdr_len rather than come from input filter's data?
> > >>
> > >> Thanks
> > >> Chen
> > >>
> > > Hi Jason/Markus,
> > >
> > > Rethink about it, How about keep the original "vnet_hdr_support"
> > > function, And add a new optional parameter "auto_vnet_hdr" for
> > filters/compare?
> >
> >
> > It's a way but rethink of the whole thing. I wonder what if we just ena=
ble
> > "vnet_hdr_support" by default for filter and colo-compare?
>
> It's works by default for user use -device virtio-net-pci and e1000...
> But it can't resolve this series motivation, how to fix/check user config=
uration issue:
> For example user enable " vnet_hdr_support " filter-mirror and disable " =
vnet_hdr_support" filter-redirector
> And connect both filter modules by chardev socket.
> In this case guest will get wrong network workload and filters didn=E2=80=
=99t perceive any abnormalities,
> but in fact, the whole system is no longer working.
> This series will report error and try to correct it.

The problem is how "auto_vnet_hdr" help in this case. It's a new
parameter which may lead to more wrong configuration?

Thanks

>
> Thanks
> Chen
>
> >
> > Thanks
> >
> >
> > >
> > > Thanks
> > > Chen
> > >
> > >
> > >>> Thanks
> > >>>
> > >>>> Thanks
> > >>>> Chen
> > >>>>
> > >>>>> Thanks
> > >>>>>
> > >>>>>
>


