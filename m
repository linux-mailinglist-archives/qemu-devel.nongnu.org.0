Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB5C6B518C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 21:14:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paj7C-0004zf-Qq; Fri, 10 Mar 2023 15:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1paj79-0004zF-PR
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 15:13:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1paj78-0000nn-1G
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 15:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678479195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zn+VAGFn26bwBSZo3ltdu5088gL+1tacmUhXTa09CjM=;
 b=E/d1ueySNElqgJ3U+B+GoFAe2BrP2hM+NTPAA+fRzUNSLKAUds9yaTGZN/E09UyM9xnjEu
 61qifbuQ0dWl97Iy0gK7RL4lu8gKzhPvd8X1vElu/UsHIOVqzi/kqvLD1ZJ37UBuVabo5A
 YcQF4BUfxJOblHNfCsQ/eHPY0GsygF0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-FnxFNxCAMDShn83y3AgprQ-1; Fri, 10 Mar 2023 15:13:14 -0500
X-MC-Unique: FnxFNxCAMDShn83y3AgprQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 pc36-20020a05620a842400b00742c715894bso3682698qkn.21
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 12:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678479194;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zn+VAGFn26bwBSZo3ltdu5088gL+1tacmUhXTa09CjM=;
 b=q+j42Pj1b47zsHynYcURbfyXhpQTJR9g2K1e3NSoAfRv72tgA1GAaa/PV1WqN62nh2
 yyeywqPC9CD5eV/E8lVzgu2QFYm9hTt5ErC4gc2Yo2GuaXO6CokbLSEMje4HA4OuOzHa
 j8JWuHBxfGfH1T7TQqmRlMoLBrCTPskGLk57QZZs2n9mgbo48mdBRM71ybFO1yyNximf
 5jr79PoWN2eos3Ia42X011K4P6M4aYLr+hwZaUAEHkwqmBEoeiDXoP2R8jCck5M0hncY
 p+0taIf5m06/vk3bvIep8CT0sFICKZfjaVK1aAffNyuO7VgdZRxuwZ00ATkKpChkxad1
 qxmg==
X-Gm-Message-State: AO0yUKWcMkmGWFa3djG4vrTZnfxDZrCyIL6/PcfrAE8fkDxESW8cPTKc
 VuiuR+378l9vRlTi6CiKG5WkPVgUyBrKnmlZ8Y2h9Gyc4hqvoEv4/11O4mShb/SsbBr2JIZjTez
 1YtC2zCnesAWzYnY=
X-Received: by 2002:a05:622a:1b9e:b0:3bf:a3d0:9023 with SMTP id
 bp30-20020a05622a1b9e00b003bfa3d09023mr13017342qtb.5.1678479193909; 
 Fri, 10 Mar 2023 12:13:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9Z/GUXTHBScrLlS+wnzCdLakQMj2efBUJcRRIwkuHEs3F8k1NdjTAh7BABIUhjtBE2OIVCsw==
X-Received: by 2002:a05:622a:1b9e:b0:3bf:a3d0:9023 with SMTP id
 bp30-20020a05622a1b9e00b003bfa3d09023mr13017315qtb.5.1678479193679; 
 Fri, 10 Mar 2023 12:13:13 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 c20-20020a379a14000000b00742a23cada8sm379955qke.131.2023.03.10.12.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 12:13:12 -0800 (PST)
Date: Fri, 10 Mar 2023 15:13:11 -0500
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/intc/ioapic: Update KVM routes before redelivering
 IRQ, on RTE update
Message-ID: <ZAuPV0kTb0ruFihj@x1n>
References: <e1b97564a7728a5106134bc7063a8c62f134a45e.camel@infradead.org>
 <ZAUZYkChWfwCcfSn@x1n>
 <6E7EA2EE-382C-4345-9A2A-D61E0139FB65@infradead.org>
 <34f494519d1921e8b62a6f3e709511a9467df54d.camel@infradead.org>
 <ZAYXUKUtU9ipksUq@x1n>
 <55bab93ee00619ac5b5b7416c17aee175ada8a8b.camel@infradead.org>
 <ZAkVwunxmEfXu4+H@x1n>
 <0754a758a46549dccde7878282721fe3835dc4b3.camel@infradead.org>
 <ZAoPlRMlcO4fm5rJ@x1n>
 <e8d8950b45cf35f16f3e9d3af979af1ea2ccead6.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8d8950b45cf35f16f3e9d3af979af1ea2ccead6.camel@infradead.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Fri, Mar 10, 2023 at 05:52:57PM +0000, David Woodhouse wrote:
> On Thu, 2023-03-09 at 11:55 -0500, Peter Xu wrote:
> > 
> > There're four devices that can hook onto this, IIUC.  Besides IOAPIC and
> > VFIO, there's also ivshmem and vhost.  IIUC we'll need to change all the
> > four devices to implement this.
> 
> If you grep for kvm_irqchip_add_irqfd_notifier() there are more than that.

Looks right to me.  I assume they're all line based IRQs routed later to
IOAPIC, so they're the real devices consuming the IOAPIC entries.

> There's a bunch of largely duplicated code, with different code paths
> for kvm_irqfds_enabled() and other variants. In code that I don't think
> should even have to *know* about KVM, should it? 
> 
> I think I'd like to provide a generic set of helpers which just allow
> callers to register a virtual IRQ and then trigger it manually and/or
> attach an irqfd (and a resamplefd, qv) to it.
> 
> This new helper code can then cope with listening in userspace on that
> fd if/when it needs to, and can even work for the non-KVM case. The
> actual devices get a *lot* simpler.
> 
> It'll *broadly* look like the existing kvm_irqchip_* functions but be a
> lot simpler to use.

IIUC what's missing is the reverse chain of notifications from e.g. IRTE to
the device, either via MSIs or via some pins of IOAPIC.

I don't think I have very good knowledge on the whole IRQ path yet so I
can't really tell anything useful, but what you said looks like a good
thing to have.  If it can cleanup things besides achieving the goal of
fault irq reporting it could be more worthwhile.

Thanks,

-- 
Peter Xu


