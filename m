Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A99E55BFEC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:56:13 +0200 (CEST)
Received: from localhost ([::1]:34710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67x6-0000t4-7Y
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o67us-0007oT-Hn
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 05:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o67uq-0003Qj-RM
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 05:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656410032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DYgUzBXjYIZj0ki8qqdrsoqCs0Iym1BACGz2MyVpe68=;
 b=ivG5ivqdsqjk1byuG3wkpoJVZZjKtpul8oAObWfBhmA3q3Lxwh7PzYFBf2XZRGx2pmavnG
 cyIDTl7LBxVJYS3+ivJTzxojXuhpiidgeALsKe9/SrRpg1o+1UPPYdbbzgQLeWmBPKQezX
 06YKsW2aJcZ1tmiLK/on5FuUbtXOEco=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-j_nSaI9MNK6aTOriwSaXAA-1; Tue, 28 Jun 2022 05:53:50 -0400
X-MC-Unique: j_nSaI9MNK6aTOriwSaXAA-1
Received: by mail-wm1-f70.google.com with SMTP id
 be12-20020a05600c1e8c00b0039c506b52a4so5552081wmb.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 02:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DYgUzBXjYIZj0ki8qqdrsoqCs0Iym1BACGz2MyVpe68=;
 b=v7U1Zacca50D2NUjRQPFoM6kYs8CLeU++Dq+B1qu1yb1UaWDOusPtVgl3AGuOCBWVo
 10+jQ4q9m+l47xSBtp0K2l5r9PxwKGsk+iKHG+r8c7XQFG+0GvojEfLcXPfXhw5z8eUg
 znwufTHz4CgCDsb2ivvg2Z0wIYXQw9cPuru/rmmjBjtmzb3bP7WzLh0CiAD8XDMBNszs
 6gDOgQggFrbtN/fpt09Pm5h4IaOgbgwM3duMWk+OgIFPzp0kBw7YCOb38HGaeyVdxiLm
 7Y5MYd9gq+wKmzdxDFnEh6l7UAJvgUfJd66ovQSNrNUBxVNvVNSfldbDHMDwQXnON1hw
 DK2w==
X-Gm-Message-State: AJIora+28P9fOBxxqu0dNYfoph8jo8MwO9RKLI3yNj+iYcleowrRROsu
 3gt8vSjyff44whWHkbHzU7O/mtOWjCcblTIvPRbcTLlmsc41d/GdOQYRHFiPfXOzkqKtoSxNMRl
 +p0Jvd7nuqWBFmYE=
X-Received: by 2002:a5d:6dae:0:b0:21b:bb44:3027 with SMTP id
 u14-20020a5d6dae000000b0021bbb443027mr17571216wrs.276.1656410029295; 
 Tue, 28 Jun 2022 02:53:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uj4csHaBmd9H+Q8aC519+ibU25UYa1DwzVecqLXH5t+6cvKpXIUIVK1IzqWMQQv+YM7TBLKw==
X-Received: by 2002:a5d:6dae:0:b0:21b:bb44:3027 with SMTP id
 u14-20020a5d6dae000000b0021bbb443027mr17571190wrs.276.1656410029011; 
 Tue, 28 Jun 2022 02:53:49 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b0021b9a4a75e2sm13160328wrr.30.2022.06.28.02.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 02:53:48 -0700 (PDT)
Date: Tue, 28 Jun 2022 05:53:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220628055258-mutt-send-email-mst@kernel.org>
References: <CAARzgwznJUrO-7kjZ+58qj=UG6V9wojP=ZfW7FePyvb6GxdNtA@mail.gmail.com>
 <20220628020017-mutt-send-email-mst@kernel.org>
 <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jun 28, 2022 at 09:25:35AM +0200, Thomas Huth wrote:
> On 28/06/2022 09.10, Michael S. Tsirkin wrote:
> > On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
> > > > > > > > > No problem with that. So that's venv. But do we need pip and pulling
> > > > > > > > > packages from the net during testing?
> > > > > > > > 
> > > > > > > > We do that too. See requirements.txt in tests/
> > > > > > > > Following two are downloaded:
> > > > > > > > avocado-framework==88.1
> > > > > > > > pycdlib==1.11.0
> > > > > > > > 
> > > > > > > > Also see this line in Makefie.include:
> > > > > > > > 
> > > > > > > > $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
> > > > > > > 
> > > > > > > Right but that's avocado since it pulls lots of stuff from
> > > > > > > the net anyway.
> > > > > > > Are the libraries in question not packaged on major distros?
> > > > > > 
> > > > > > Currently I only need this:
> > > > > > https://github.com/python-tap/tappy
> > > > > > which is the basic TAP processing library for python.
> > > > > > 
> > > > > > It seems its only installed through pip:
> > > > > > https://tappy.readthedocs.io/en/latest/
> > > > > > 
> > > > > > I do not think this is packaged by default. It's such a basic library
> > > > > > for parsing test output that maybe we can keep this somewhere within
> > > > > > the python src tree? Not sure ...
> > > > > 
> > > > > It's pretty small for sure. Another submodule?
> > > > 
> > > > Unlike BITS, this one is likely going to be maintained for a while and
> > > > will receive new releases through
> > > > https://pypi.org/project/tap.py/
> > > > so forking is OK but someone has to keep this updated.
> > > > 
> > > > I am open to anything. Whatever feels right is fine to me.
> > > 
> > > John Snow is currently working on the "Pythonification" of various QEMU
> > > bits, I think you should loop him into this discussion, too.
> > > 
> > >   Thomas
> > 
> > submodule does not mean we fork necessarily. We could have
> > all options: check for the module and use it if there, if not
> > use one from system if not there install with pip ..
> > But yea, I'm not sure what's best either.
> 
> submodules create a dependency on an internet connection, too.

Yes but this dependency is explicit.

> So before you
> add yet another submodule (which have a couple of other disadvantages), I
> think you could also directly use the venv here.
> 
>  Thomas


