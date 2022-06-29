Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB04560217
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 16:08:49 +0200 (CEST)
Received: from localhost ([::1]:55966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6YN5-0006c3-Vd
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 10:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6YIz-0003Qy-HP
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:04:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6YIu-0002ad-AY
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656511466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DmStksdnunzqg1MhmNY0yeAIMCUcTKybsJoFgv/TYVs=;
 b=OHIi4w1i+VEmx8LoU1X02IaccyiR2VNMQUeBkC8PVVbWzJDUn4/5y2SYuiNYIz9i9JLSkX
 m4F8V7M4C8cil5u63fqTGa/4P/zGco5gzrR5h343/ztyVFK+KytK8rMECFopluVPvz+Tt4
 EIFcopEjOUZuzkJWfOrfvANDM3AoXQo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-rdi6y_lXP5Oo8Ikq3RSNYQ-1; Wed, 29 Jun 2022 10:04:25 -0400
X-MC-Unique: rdi6y_lXP5Oo8Ikq3RSNYQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 y18-20020adfdf12000000b0021b94ba4c37so2497442wrl.11
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 07:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DmStksdnunzqg1MhmNY0yeAIMCUcTKybsJoFgv/TYVs=;
 b=gIRxs6E5xjC1KvBYy/kqb1tiP/Kwaq9GO9uJ8SB2Wuc3maEIAfJFHS+q6+Wpbt2zSN
 PMCWiyKBOzFmy+B/eCer1afeoSyY9jCpMoHnZLYPqkhtwrmy+k5NDCSSFCVrFgHrLI49
 Iio25ADDzMNjuYEtTE9eOaHuxc6DD2+UKS2gTSB7G9AKUSfGPNF0eTj1OE40JpHm+/El
 QS+oPqYnj0kNuqtZQNUtYCIkzp4VHutjclC6CRou3omOk5ev6R0dce27US0deBOU6ORi
 CAOGNGuFh+54q9PSZR23kfEmYA9gNaLKOJiywVxQbBn8d5QUH+0vUiIuZaKwnIFH9ENO
 d1AQ==
X-Gm-Message-State: AJIora/XfyHgqZoI8eWP1z7KDULDac8YZAHAucRxVArY/3MDVu9qy+3m
 2y8YVB3MkWP+2Q7S4a/Oj9VLB0Edd4wOsus/YpEUm8O7cJLgEmDV+8w7hPhLGDcmivIllgZvkFg
 j/P2l95HqbDOf3bw=
X-Received: by 2002:a05:600c:6013:b0:3a0:2aec:8695 with SMTP id
 az19-20020a05600c601300b003a02aec8695mr5707169wmb.192.1656511464251; 
 Wed, 29 Jun 2022 07:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXxEmh6gRyaZb/bi36JKbY7TPvRcs/7cBr01ZVDGlp2/sBRoYl9upYEltnbGDWN5GGl81PhQ==
X-Received: by 2002:a05:600c:6013:b0:3a0:2aec:8695 with SMTP id
 az19-20020a05600c601300b003a02aec8695mr5707143wmb.192.1656511463972; 
 Wed, 29 Jun 2022 07:04:23 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 q20-20020a7bce94000000b0039c4b518df4sm4070099wmj.5.2022.06.29.07.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 07:04:23 -0700 (PDT)
Date: Wed, 29 Jun 2022 10:04:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] microvm: turn off io reservations for pcie root ports
Message-ID: <20220629100152-mutt-send-email-mst@kernel.org>
References: <20220603085920.604323-1-kraxel@redhat.com>
 <20220608120505-mutt-send-email-mst@kernel.org>
 <20220609072838.jcq4cdofpwvlew7j@sirius.home.kraxel.org>
 <20220627183724-mutt-send-email-mst@kernel.org>
 <20220629071023.2wfvs7utmx6w3p4o@sirius.home.kraxel.org>
 <20220629031527-mutt-send-email-mst@kernel.org>
 <20220629122050.yj7zp2xthtwmigzh@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629122050.yj7zp2xthtwmigzh@sirius.home.kraxel.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Jun 29, 2022 at 02:20:50PM +0200, Gerd Hoffmann wrote:
> On Wed, Jun 29, 2022 at 03:16:17AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Jun 29, 2022 at 09:10:23AM +0200, Gerd Hoffmann wrote:
> > > On Mon, Jun 27, 2022 at 06:37:50PM -0400, Michael S. Tsirkin wrote:
> > > > On Thu, Jun 09, 2022 at 09:28:38AM +0200, Gerd Hoffmann wrote:
> > > > > On Wed, Jun 08, 2022 at 12:06:17PM -0400, Michael S. Tsirkin wrote:
> > > > > > On Fri, Jun 03, 2022 at 10:59:20AM +0200, Gerd Hoffmann wrote:
> > > > > > > The pcie host bridge has no io window on microvm,
> > > > > > > so io reservations will not work.
> > > > > > > 
> > > > > > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > > > > 
> > > > > > I don't much like overriding user like this. We end up users
> > > > > > setting it to silly values and then if we do want to
> > > > > > support this things just break. Thoughts?
> > > > > 
> > > > > Well, it just looked like the simplest way to tell the firmware that
> > > > > io reservations are pointless.  Do you have a better idea?
> > > > > 
> > > > > take care,
> > > > >   Gerd
> > > > 
> > > > Fail if user supplies values we can't support.
> > > 
> > > Well, it is the *default* value which doesn't work on microvm.
> > > 
> > > take care,
> > >   Gerd
> > 
> > Changing defaults is ok of course. Let's just not override the user.
> 
> Ok, so I could use a compat property instead and change the default
> for microvm that way.  That would allow the user set any value it
> wants.

And if you like check the value and fail init if not 0.

> I still don't see the point though.  There is only a single value which
> makes sense on microvm.  Which is zero.  The only effect the user could
> archive is make the firmware throwing errors ...
> 
> take care,
>   Gerd

My concern is simple: if right now we override the value then
some users might set it to != 0 by mistake. Then if down the road
we want to intepret != 0 in some way, these setups
will start failing. I don't claim to see a use-case why we'd want to
but it's hard to predict the future with certainty.

-- 
MST


