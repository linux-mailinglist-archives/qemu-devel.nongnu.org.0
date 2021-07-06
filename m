Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D503BDE69
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 22:21:58 +0200 (CEST)
Received: from localhost ([::1]:35270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0rZs-0004iV-1R
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 16:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1m0rZ5-000439-Mr
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 16:21:07 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:46031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1m0rZ1-0000fd-9u
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 16:21:07 -0400
Received: by mail-pf1-x430.google.com with SMTP id q10so74836pfj.12
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 13:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6vkQIAO9JJi4lZ56v3Ydj8fJxsh+UjBCy7XGFkJg4WA=;
 b=NFXvFCqTaMTALIZLd1VurwNJ5evf8N93hcOBDsTrwJXXbcELLEYeFtiqLRpYZa9SEN
 nro/pPAyOSVWlsFBo1T0uWRwEgfhzVwhABycrMXk44ot1thJJBDO4p2zY7qEOIQUWiI1
 45iYgtBKFWzCk5vOVSuUPRwDaKGF9ccx7jsIEI2ZfAxyvmbs8/o0o1lgwahw93aUxRm4
 lTw3pOI/A0W9Zbp4n/91KCnz2w1TE5YqcB9DIN3avmUHwYXK7IZRpvcNverJNQ22uIbs
 mpcg3oKQxyyWO0B/mJI8faNgdjIi22/6uu66VMUtU16ZwPpnjk8p5BR3KxL9mySMLLBD
 5gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6vkQIAO9JJi4lZ56v3Ydj8fJxsh+UjBCy7XGFkJg4WA=;
 b=nMXeJ6BgJehwz1WEuY8cgZQVSo+pNmk4qgbBoBr6hfXqKQ1QCxJhYuziQneDQ67tRR
 6IXeY/7hoBNlJkgvvGp54/Bp4He3zEWJasWd74j1uNyRv4paXWT+HwWs3c2UvMCGl4El
 jvlv0PB+U/g1/yQ2+23cID1Y+UuQOzmy5DSaSCGZ9VCEnxx5yjDkrp8X2Lcxqfe8+FMo
 uSnHEOJPSw4rr7l/wdkSOurBxu175lpHhfJm3UvYxYUriv2mh/QtcmctsW2dyaikEDSS
 rmgNXfg9DlWapHtQ2obKsDWnY0/f1UMaYNQT4J4pNrODXOcc9IMbTfb67vCyhGPwdZCh
 p22w==
X-Gm-Message-State: AOAM5312QhfkoJeg2pDToQ1lUMRjm4yyEd1GkjYHKTlRaVwn6D3j9Lti
 5pUctUeAhGKKE2v+jT20aGlaQA==
X-Google-Smtp-Source: ABdhPJxBdZpYxiybJGCseIZxbGLYPbIfREMJQKq0KPOo9pHxKdrK8EfIgZ8GGjvbm3Tz/GfIyFhsFg==
X-Received: by 2002:aa7:800f:0:b029:31e:13f9:e231 with SMTP id
 j15-20020aa7800f0000b029031e13f9e231mr13713748pfi.33.1625602860312; 
 Tue, 06 Jul 2021 13:21:00 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id h27sm18995633pfr.171.2021.07.06.13.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 13:20:59 -0700 (PDT)
Date: Tue, 6 Jul 2021 14:20:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/5] virtio: Add vhost-user based RNG
Message-ID: <20210706202057.GA1540522@p14s>
References: <20210614202842.581640-1-mathieu.poirier@linaro.org>
 <20210702122652-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210702122652-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Good day Michael,

On Fri, Jul 02, 2021 at 12:27:08PM -0400, Michael S. Tsirkin wrote:
> On Mon, Jun 14, 2021 at 02:28:37PM -0600, Mathieu Poirier wrote:
> > This sets adds a vhost-user based random number generator (RNG),
> > similar to what has been done for i2c and virtiofsd, with the
> > implementation following the patterns already set forth in those.
> > 
> > Applies cleanly to git://git.qemu.org/qemu.git master(1ea06abceec6).
> 
> 
> I get
> 
> /scm/qemu/docs/tools/vhost-user-rng.rst:document isn't included in any toctree
> 

I assume this is because vhost-user-rng isn't listed in
docs/tools/index.rst but I would like to test my theory before sending another
revision.  What build command did you use to generate this?  I tried "make html"
and "make man" as shown in the Documenation section of "make help" but those
targets don't seem to be valid anymore.

Thanks,
Mathieu

> any idea?
> 
> > Thanks,
> > Mathieu
> > 
> > -----
> > New for V2:
> > - Replaced "antropy" for "entropy" (Joakim).
> > 
> > Mathieu Poirier (5):
> >   vhost-user-rng: Add vhost-user-rng implementation
> >   vhost-user-rng-pci: Add vhost-user-rng-pci implementation
> >   vhost-user-rng: backend: Add RNG vhost-user daemon implementation
> >   docs: Add documentation for vhost based RNG implementation
> >   MAINTAINERS: Add maintainer for vhost-user RNG implementation
> > 
> >  MAINTAINERS                              |   9 +
> >  docs/tools/vhost-user-rng.rst            |  74 +++++
> >  hw/virtio/Kconfig                        |   5 +
> >  hw/virtio/meson.build                    |   2 +
> >  hw/virtio/vhost-user-rng-pci.c           |  79 +++++
> >  hw/virtio/vhost-user-rng.c               | 294 +++++++++++++++++
> >  include/hw/virtio/vhost-user-rng.h       |  33 ++
> >  tools/meson.build                        |   8 +
> >  tools/vhost-user-rng/50-qemu-rng.json.in |   5 +
> >  tools/vhost-user-rng/main.c              | 403 +++++++++++++++++++++++
> >  tools/vhost-user-rng/meson.build         |  10 +
> >  11 files changed, 922 insertions(+)
> >  create mode 100644 docs/tools/vhost-user-rng.rst
> >  create mode 100644 hw/virtio/vhost-user-rng-pci.c
> >  create mode 100644 hw/virtio/vhost-user-rng.c
> >  create mode 100644 include/hw/virtio/vhost-user-rng.h
> >  create mode 100644 tools/vhost-user-rng/50-qemu-rng.json.in
> >  create mode 100644 tools/vhost-user-rng/main.c
> >  create mode 100644 tools/vhost-user-rng/meson.build
> > 
> > -- 
> > 2.25.1
> 

