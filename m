Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225486838B3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 22:33:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMyFJ-0004kf-7w; Tue, 31 Jan 2023 16:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMyFG-0004jT-FB
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:32:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMyFE-0002N4-RU
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675200768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6CmhZLbc4JWRLN0ylBEXm/j6iZQjw4ir9FyIBY6Whv8=;
 b=XpNGV2p2BzLjlqdCdYOA0RDmX6wMGg9lxWhGHWxf8BMMiyTik3xTt5C499UfgJXoyh4pgz
 ANcZ+kCdG2MhNd3cwOiI3U1KKk4nmbVUqCPy19Jyi2Ejt06jExVwIyDO1pmYV9lmPK+BcI
 4m+qZnZxCbrwLvAwEcn9cFVk71N8Y5I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-TNVufx-BP9WBw3auvcCumw-1; Tue, 31 Jan 2023 16:32:46 -0500
X-MC-Unique: TNVufx-BP9WBw3auvcCumw-1
Received: by mail-ej1-f70.google.com with SMTP id
 ds1-20020a170907724100b008775bfcef62so10462893ejc.9
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 13:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CmhZLbc4JWRLN0ylBEXm/j6iZQjw4ir9FyIBY6Whv8=;
 b=YMdPE/EV1nXazXxkwALiGV7JCyPUdJjon+xwuGI854yeugki0Yt2wGbElK849b/qlH
 r1Rjub4xM/Lct7GaT8K9jv++IPmVhC+px/R09UhHyRfjcIxUS2xHK4XKn/TPpOON+Cf2
 lwlV/K97fzECNPEbj//vow9Rdzhvx6Pc1qOyMl99TFOUUgdrkiByaeZSt5CdmYLVupQe
 aPmzmFI8k8M9ovv7g7H5v2HqH+LhzcRNwoslG5BNfHcgL9Hl9iC8i2s8XLrhGjar6B9f
 TGsqMYLcZmkhev3LNRpaCFC9jtUgEMVGJ2XI/wQycqax120+w52Pc9bLubzt6EWr6WJ8
 P3DQ==
X-Gm-Message-State: AFqh2koIGho2YvFLBC5Md5s4FzbN/EgkSUWBc5xTnIFYvkd51fVztUX/
 v0yIBrpcjd6pZE6RNBctrwRIvPf04LlqiSwIYA/t+fBa9RNYGMG23al7yeRQF3zsK6wPl01ySt/
 K9MBYBm36y1E62YQ=
X-Received: by 2002:a05:6402:3898:b0:45c:835b:ac64 with SMTP id
 fd24-20020a056402389800b0045c835bac64mr64062890edb.31.1675200765582; 
 Tue, 31 Jan 2023 13:32:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtkY7wHr214Xmr24i+GbusGT/3B0dhu2mbMYL+z36lt6StnCSY1OHRuKnP7PQul+BbYOATVZw==
X-Received: by 2002:a05:6402:3898:b0:45c:835b:ac64 with SMTP id
 fd24-20020a056402389800b0045c835bac64mr64062874edb.31.1675200765315; 
 Tue, 31 Jan 2023 13:32:45 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8825450edu.96.2023.01.31.13.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 13:32:44 -0800 (PST)
Date: Tue, 31 Jan 2023 16:32:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
Message-ID: <20230131163230-mutt-send-email-mst@kernel.org>
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <CAJaqyWfZX2sgoOq+Poa2tQTc2VTRneaUvzozOdDS+7SoMUdNkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJaqyWfZX2sgoOq+Poa2tQTc2VTRneaUvzozOdDS+7SoMUdNkg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Jan 31, 2023 at 08:11:06PM +0100, Eugenio Perez Martin wrote:
> On Tue, Jan 31, 2023 at 8:10 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > Hi,
> >
> > The current approach of offering an emulated CVQ to the guest and map
> > the commands to vhost-user is not scaling well:
> > * Some devices already offer it, so the transformation is redundant.
> > * There is no support for commands with variable length (RSS?)
> >
> > We can solve both of them by offering it through vhost-user the same
> > way as vhost-vdpa do. With this approach qemu needs to track the
> > commands, for similar reasons as vhost-vdpa: qemu needs to track the
> > device status for live migration. vhost-user should use the same SVQ
> > code for this, so we avoid duplications.
> >
> > One of the challenges here is to know what virtqueue to shadow /
> > isolate. The vhost-user device may not have the same queues as the
> > device frontend:
> > * The first depends on the actual vhost-user device, and qemu fetches
> > it with VHOST_USER_GET_QUEUE_NUM at the moment.
> > * The qemu device frontend's is set by netdev queues= cmdline parameter in qemu
> >
> > For the device, the CVQ is the last one it offers, but for the guest
> > it is the last one offered in config space.
> >
> > To create a new vhost-user command to decrease that maximum number of
> > queues may be an option. But we can do it without adding more
> > commands, remapping the CVQ index at virtqueue setup. I think it
> > should be doable using (struct vhost_dev).vq_index and maybe a few
> > adjustments here and there.
> >
> > Thoughts?
> >
> > Thanks!
> 
> 
> (Starting a separated thread to vhost-vdpa related use case)
> 
> This could also work for vhost-vdpa if we ever decide to honor netdev
> queues argument. It is totally ignored now, as opposed to the rest of
> backends:
> * vhost-kernel, whose tap device has the requested number of queues.
> * vhost-user, that errors with ("you are asking more queues than
> supported") if the vhost-user parent device has less queues than
> requested (by vhost-user msg VHOST_USER_GET_QUEUE_NUM).
> 
> One of the reasons for this is that device configuration space is
> totally passthrough, with the values for mtu, rss conditions, etc.
> This is not ideal, as qemu cannot check src and destination
> equivalence and they can change under the feets of the guest in the
> event of a migration. External tools are needed for this, duplicating
> part of the effort.
> 
> Start intercepting config space accesses and offering an emulated one
> to the guest with this kind of adjustments is beneficial, as it makes
> vhost-vdpa more similar to the rest of backends, making the surprise
> on a change way lower.
> 
> Thoughts?
> 
> Thanks!

I agree here.

-- 
MST


