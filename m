Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462356662CD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 19:31:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFfrV-00013D-S8; Wed, 11 Jan 2023 13:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pFfrT-00012n-UR
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 13:30:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pFfrR-0002vM-Ti
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 13:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673461799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqEzhQM/auRa3JV0lPF9ijOVIJLUMFCYP0+U3tn4hiY=;
 b=K8SJmr+N3WwDssI5jK7TI6ejpddC1njL1Xh0Jza0PkCtToTVXMAKvBjYXAGy5D2X91SM3W
 m5rG9SG4Gi5Ni/Eyn19ISAGl/6EooBfq6PWlTTlHloSVDNcxnfH+YVfhxrV3foYwqw/JQf
 BCNmKQY5+RE7ceq9BgSbkwbaZKLqLbs=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-130--soEX6JfOgecp6qzAWLLJQ-1; Wed, 11 Jan 2023 13:29:58 -0500
X-MC-Unique: -soEX6JfOgecp6qzAWLLJQ-1
Received: by mail-il1-f197.google.com with SMTP id
 s2-20020a056e02216200b0030bc3be69e5so11596282ilv.20
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 10:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqEzhQM/auRa3JV0lPF9ijOVIJLUMFCYP0+U3tn4hiY=;
 b=YxPR1QogANc4NjxQ+4SzrkrVS/twdfa8/D6s8t1cSrF3d02CDLfudnSoOR4kiJ42e3
 Iz5F3+uc53Jhr/NBOPma4peM0XrRBr77Nn2S62yloy6mqafVe5/IObsYRP/8PL+GKcfI
 PBAo6mzfQaf4MwPwmyALyfx9WKT+JB+NBcD/wgN5Xr8E7kHupuAwA3ssQyyjsPMKK8uk
 V5bnMsNYSx6qLPmlJlSbhmONNeJzRFNehGw2ehMzVW1N5W3zf6Q0FSd3b81JUM7Rl9on
 MT8SmC8mS/Tj2d7YwbCe7nEpiTNHjbD9qKsyvrGp9SDqrwgycQBxnNXiRTWst02NTxqB
 O36A==
X-Gm-Message-State: AFqh2kpt2wZmIoAinvdu8qWfYwGh4J6yKj7guVbXtOPhBu29/iVJ/+nl
 2AnlgiwWU8BZbgQKrUupj5esB/dVtY9pOp2tMObQrgiqDoNQl6YcRnlFHpAbqS3FkzMhEeMm/Zs
 XhvTx18WV2GsDGkQ=
X-Received: by 2002:a05:6e02:de4:b0:30d:c0b3:3272 with SMTP id
 m4-20020a056e020de400b0030dc0b33272mr2823385ilj.0.1673461798097; 
 Wed, 11 Jan 2023 10:29:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtxL/QUqEz8MDJOGbfwa7inHMs/Fgw+P0ecF4PjKTyRMnJoaZ2pEZJt2CddNGKHnu+HP9sQ5A==
X-Received: by 2002:a05:6e02:de4:b0:30d:c0b3:3272 with SMTP id
 m4-20020a056e020de400b0030dc0b33272mr2823369ilj.0.1673461797858; 
 Wed, 11 Jan 2023 10:29:57 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 j21-20020a023215000000b003748d3552e1sm4663361jaa.154.2023.01.11.10.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 10:29:49 -0800 (PST)
Date: Wed, 11 Jan 2023 11:29:47 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, paul@xen.org
Subject: Re: [RFC] Notify IRQ sources of level interrupt ack/EOI
Message-ID: <20230111112947.22237481.alex.williamson@redhat.com>
In-Reply-To: <70eb35a08a7c48993812b7f088fa9ae3f2c8b925.camel@infradead.org>
References: <23caafffdd9546b8eeff851660015f3bfc021ed3.camel@infradead.org>
 <20230111112425-mutt-send-email-mst@kernel.org>
 <70eb35a08a7c48993812b7f088fa9ae3f2c8b925.camel@infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed, 11 Jan 2023 16:58:37 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> On Wed, 2023-01-11 at 11:25 -0500, Michael S. Tsirkin wrote:
> > On Wed, Jan 11, 2023 at 02:41:58PM +0000, David Woodhouse wrote:  
> > > This allows drivers to register a callback on a qemu_irq, which is
> > > invoked when a level-triggered IRQ is acked on the irqchip.
> > > 
> > > This allows us to simulate level-triggered interrupts more efficiently,
> > > by resampling the state of the interrupt only when it actually matters.  
> > 
> > I think we tried this with vfio and had to give up on this.
> > I don't remember the details though. Alex probably does?  
> 
> Hm, not sure why there would be any insurmountable problems.
> 
> I've seen this working at scale in a different VMM with split-irqchip
> and PCI INTX + Xen event channel support.
> 
> And it's what the kernel does internally, and exposes through its dual-
> eventfd APIs in both KVM IRQ routing and VFIO interrupts.
> 
> That said, I don't care *that* much. I can live with the way I've done
> it for the Xen support, by polling the status on a vCPU0 vmexit.
> Looking at the VFIO code made me throw up in my mouth a little bit, but
> I just won't do that again... :)

Nice.  IIRC, we ended up with the hack solution we have today in vfio
because there was too much resistance to callbacks that were only
necessary for vfio in the past.  Once we had KVM resampling support, it
simply wasn't worth the effort for a higher latency solution to fight
that battle, so we implemented what could best be described as a
universal workaround embedded in vfio.

Clearly a callback is preferable, and yes, that's how we operate with
KVM resampling and unmasking INTx, so in theory plumbing this to our
existing eoi callback and removing the region toggling ought to do the
right thing.  Thanks,

Alex


