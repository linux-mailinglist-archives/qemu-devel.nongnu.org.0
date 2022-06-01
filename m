Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F2F53AC6C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:03:12 +0200 (CEST)
Received: from localhost ([::1]:39352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSgZ-0007FQ-EQ
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nwSeu-00069Z-7p
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:01:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nwSer-0004IL-67
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654106483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6MUmgMd/KCn3s8zFwGcSUV+BPq9yGtIZvzbMpaBtec=;
 b=Q8RhWgkROGnMBD3lS0t8QIpqaszXlsiHTdzhY6MzOydOxkmMULiuYXnH9j/boF7I4go1nM
 AIg5EvZN1RjaYERVzyWev4p6zquPecZ6h8+05QqAqmrB/s6lhj2FrRoDCi9cEA2OyEgw+e
 m2MiGkraWQwWYNj1pfw9weRXGRcTizs=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-hxIGFYQbMP2QsEQNB6hdvg-1; Wed, 01 Jun 2022 14:01:22 -0400
X-MC-Unique: hxIGFYQbMP2QsEQNB6hdvg-1
Received: by mail-io1-f71.google.com with SMTP id
 ay41-20020a5d9da9000000b006685ce50214so1311095iob.22
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=n6MUmgMd/KCn3s8zFwGcSUV+BPq9yGtIZvzbMpaBtec=;
 b=UeQuquE0+wr5g7tjs4HjBAAxspSS4nmEh44bEhwhJYDJ+iNMh7fepxZHvb5oGa5QPN
 lbqGuUDzKSaNXR8sPDUjuLNmYt80wWDFhv8iW6HEUxA7G758mlCQ+TH3tBqgxrNEdJPC
 O9wivvF5eK4joqmoL+eicNzn7TYenQXUsnIlhVeT/fXqdslcoP4q71AEchXyBWaN5Xic
 lj8/LjDQlXUb0GtWnDdET9e5izH2jGVuDQtcqPc1izmbalJHY6T2CXxrwD7V63bYQMjk
 BeVavU9rF41r9j0Cq2JO4JIDq52KDpn6kh26xO/bVNf5en6d/nQoGxhN3LTGj67mipue
 tW5g==
X-Gm-Message-State: AOAM532sULCBAuwYMqcDOQx2/yqgC+q/WqoCCprYUOq8V86zGQ3HtHJU
 V4prd0oLymzZtTszDKiA4hL6JaqLDcSXHRTy8DNQ9DJw6yVvnlO2AYxLc/Fvw2rNiv3esO0V+Ai
 7tzsiJbuKGUE552Q=
X-Received: by 2002:a05:6e02:1608:b0:2d1:b86c:5b6b with SMTP id
 t8-20020a056e02160800b002d1b86c5b6bmr791884ilu.304.1654106482045; 
 Wed, 01 Jun 2022 11:01:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw78IdotcS3eOfLXqVoU/auEYUqxcV8mb0KDZUlQF7hOR8WdInavrbGD808CiqfJFPwpgy2ew==
X-Received: by 2002:a05:6e02:1608:b0:2d1:b86c:5b6b with SMTP id
 t8-20020a056e02160800b002d1b86c5b6bmr791865ilu.304.1654106481794; 
 Wed, 01 Jun 2022 11:01:21 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i8-20020a02ca08000000b0032e779b6b8csm605124jak.179.2022.06.01.11.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:01:21 -0700 (PDT)
Date: Wed, 1 Jun 2022 12:01:20 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Dong, Eddie" <eddie.dong@intel.com>
Cc: "Rao, Lei" <lei.rao@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "Zeng, Jason" <jason.zeng@intel.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>, "Li,
 Yadong" <yadong.li@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 00/13] Add a plugin to support out-of-band live
 migration for VFIO pass-through device
Message-ID: <20220601120120.46c7a057.alex.williamson@redhat.com>
In-Reply-To: <BL0PR11MB30424D25A1C7C5544AF643868ADF9@BL0PR11MB3042.namprd11.prod.outlook.com>
References: <20220524061848.1615706-1-lei.rao@intel.com>
 <20220526124427.3f23708f.alex.williamson@redhat.com>
 <BL0PR11MB30424D25A1C7C5544AF643868ADF9@BL0PR11MB3042.namprd11.prod.outlook.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed, 1 Jun 2022 17:09:25 +0000
"Dong, Eddie" <eddie.dong@intel.com> wrote:

> > -----Original Message-----
> > From: Qemu-devel <qemu-devel-  
> > bounces+eddie.dong=intel.com@nongnu.org> On Behalf Of Alex Williamson  
> > On Tue, 24 May 2022 14:18:35 +0800
> > Lei Rao <lei.rao@intel.com> wrote:
> > > This proposal adopts a plugin mechanism (an example can be found in
> > > [1]) given that IPU/DPU vendors usually implement proprietary
> > > migration interfaces without a standard. But we are also open if an
> > > alternative option makes better sense, e.g. via loadable modules (with
> > > Qemu supporting gRPC or JSON-RPC support) or an IPC mechanism similar  
> > to vhost-user.
> > 
> > AFAIU, QEMU is not interested in supporting plugin modules, especially
> > proprietary ones.  I don't see that a case has really been made that this
> > cannot be done in-band, through a vfio-pci variant driver, possibly making
> > use of proprietary interfaces to a userspace agent if necessary (though
> > please don't ask such to be accepted in-tree for the kernel either).  A vfio-
> > user device server might also host such proprietary, device specific agents
> > while supporting the standard, in-band migration interface.  Thanks,
> >   
> 
> Thanks Alex. Removing plug-in module is not a problem.
> 
> Do you mean to implement the migration and protocol handling inside
> Qemu-client (probably vfio-client after the VFIO-user is merged)? Or
> to build as part of libvfio-user? We can also build it as a separate
> process of Qemu-server as part of Multi-Process Qemu.

AIUI, the QEMU "client" in a vfio-user configuration is simply QEMU
itself.  The vfio-user "server" provides the actual device
implementation, which could support different license models, depending
on what libraries or existing code is incorporated to implement that
server.  The QEMU remote machine type is simply a QEMU-based
implementation of a vfio-user server.  The vfio-user server is analogous
to a vfio-pci variant driver in the kernel/ioctl interface model.  The
vfio-user client should be device agnostic, possibly with similar
exceptions we have today via device specific quirk handling for the
vfio kernel interface.

> In here, the protocol between host CPU and SoC is based on gRPC,
> which support Rust code in client (Host CPU side here) more than
> C/C++. Do you have any suggestion to better support Rust code with
> Qemu C/C++ code? 

I'm not qualified to provide suggestions regarding Rust code
integration with QEMU, but I think that's only required if the device
specific migration support is on the "client".  As above, I don't think
that's the correct model, the vfio migration protocol is meant to
support any device specific requirements on the device end of the
connection, ie. the "server" end for vfio-user, which can be an
entirely separate, non-QEMU based process.  I think there are also ways
to write kernel drivers in Rust, so possibly a kernel interface
vfio-pci variant driver could also work.  Thanks,

Alex


