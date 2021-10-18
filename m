Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D9F4328A6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 22:53:09 +0200 (CEST)
Received: from localhost ([::1]:42082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcZd5-0001nd-Vp
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 16:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcZaH-00084F-AU
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 16:50:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcZa7-0000UF-6R
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 16:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634590201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ulj4h8MQYp21p6C7TH+LEd0CYfp/aSUgLTdq7C5hcrg=;
 b=gvHbxHa+GM7dhMUPXEIScGKycr5Zrso26pUes9BS0KVIPJ+3XQ09+4hFTYHtHpERNKJNzL
 7KFeSXueQDusuj2w5o1QA7eCfNk+AvABLo8c+c13aT37CbYiz1bMDFpkpevB+td5qPMrPw
 xsoGeNN2TCXifLRSS2ofBGfQB2byQN4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-l9KhOhUWPzq7XDaSpysaiQ-1; Mon, 18 Oct 2021 16:50:00 -0400
X-MC-Unique: l9KhOhUWPzq7XDaSpysaiQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 h99-20020adf906c000000b001644add8925so6047147wrh.0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 13:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ulj4h8MQYp21p6C7TH+LEd0CYfp/aSUgLTdq7C5hcrg=;
 b=QlzNrOHy/b8UkYBHxF7KBjF7imCvtHUlb6dKe1IYLrmnQm4ShD7WqMvpzD/Z1YnGbv
 trtFgoG2RUiJbOsU3CicLMNDO1tYNKbI10SNsgzqKWmCvnyNcTdgUqSEZKF8lC/aiSwZ
 WhxktCGg1TK8mYK9HtUH/co4CM+0OWyf1WKIv9apS4fbQehyIF2swW76NYx6V+R5kRwQ
 Z33l73l2y5fF1R/GaM7YwwtwuY+sqi1SYI+aBz91MlNvtd5AD081D1zgIDgGQVyJC1GU
 XG/0XH+Hu7NaP5IdrsLebSglBi+yvL35AsBfVUjv/t4kkJHZyMbtq6X3YkJRALWusz6V
 kdYw==
X-Gm-Message-State: AOAM531y8EsUuH7JwahDbhCizI5ii36+XxKa6lsFIhTUi8smlOv6AVPA
 MGvl8j8kmVQ+OKVIp05JyzPC8H3aQas8UQqJEhO04sIawYogmVJP9QqaXs8x4wYCGuV8SU31Mdd
 1E7ODq0G0so1T7to=
X-Received: by 2002:a1c:3b86:: with SMTP id i128mr1363734wma.132.1634590198342; 
 Mon, 18 Oct 2021 13:49:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrBSNe5FMwZd+yUOErQf/ZOVTtIeiOwVIVrSlGskYzFMqX6S5jgZ+WSDgneCkfLlCPgiLKjQ==
X-Received: by 2002:a1c:3b86:: with SMTP id i128mr1363705wma.132.1634590198054; 
 Mon, 18 Oct 2021 13:49:58 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id i188sm481878wmi.5.2021.10.18.13.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 13:49:57 -0700 (PDT)
Date: Mon, 18 Oct 2021 16:49:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: TCP/IP connections sometimes stop retransmitting packets (in
 nested virtualization case)
Message-ID: <20211018164839-mutt-send-email-mst@kernel.org>
References: <1054a24529be44e11d65e61d8760f7c59dfa073b.camel@redhat.com>
 <ed357c14-a795-3116-4db9-8486e4f71751@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ed357c14-a795-3116-4db9-8486e4f71751@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "J. Bruce Fields" <bfields@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, netdev@vger.kernel.org,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Gilbert <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 11:05:23AM -0700, Eric Dumazet wrote:
> 
> 
> On 10/17/21 3:50 AM, Maxim Levitsky wrote:
> > Hi!
> >  
> > This is a follow up mail to my mail about NFS client deadlock I was trying to debug last week:
> > https://lore.kernel.org/all/e10b46b04fe4427fa50901dda71fb5f5a26af33e.camel@redhat.com/T/#u
> >  
> > I strongly believe now that this is not related to NFS, but rather to some issue in networking stack and maybe
> > to somewhat non standard .config I was using for the kernels which has many advanced networking options disabled
> > (to cut on compile time).
> > This is why I choose to start a new thread about it.
> >  
> > Regarding the custom .config file, in particular I disabled CONFIG_NET_SCHED and CONFIG_TCP_CONG_ADVANCED. 
> > Both host and the fedora32 VM run the same kernel with those options disabled.
> > 
> > 
> > My setup is a VM (fedora32) which runs Win10 HyperV VM inside, nested, which in turn runs a fedora32 VM
> > (but I was able to reproduce it with ordinary HyperV disabled VM running in the same fedora 32 VM)
> >  
> > The host is running a NFS server, and the fedora32 VM runs a NFS client which is used to read/write to a qcow2 file
> > which contains the disk of the nested Win10 VM. The L3 VM which windows VM optionally
> > runs, is contained in the same qcow2 file.
> > 
> > 
> > I managed to capture (using wireshark) packets around the failure in both L0 and L1.
> > The trace shows fair number of lost packets, a bit more than I would expect from communication that is running on the same host, 
> > but they are retransmitted and don't cause any issues until the moment of failure.
> > 
> > 
> > The failure happens when one packet which is sent from host to the guest,
> > is not received by the guest (as evident by the L1 trace, and by the following SACKS from the guest which exclude this packet), 
> > and then the host (on which the NFS server runs) never attempts to re-transmit it.
> > 
> > 
> > The host keeps on sending further TCP packets with replies to previous RPC calls it received from the fedora32 VM,
> > with an increasing sequence number, as evident from both traces, and the fedora32 VM keeps on SACK'ing those received packets, 
> > patiently waiting for the retransmission.
> >  
> > After around 12 minutes (!), the host RSTs the connection.
> > 
> > It is worth mentioning that while all of this is happening, the fedora32 VM can become hung if one attempts to access the files 
> > on the NFS share because effectively all NFS communication is blocked on TCP level.
> > 
> > I attached an extract from the two traces  (in L0 and L1) around the failure up to the RST packet.
> > 
> > In this trace the second packet with TCP sequence number 1736557331 (first one was empty without data) is not received by the guest
> > and then never retransmitted by the host.
> > 
> > Also worth noting that to ease on storage I captured only 512 bytes of each packet, but wireshark
> > notes how many bytes were in the actual packet.
> >  
> > Best regards,
> > 	Maxim Levitsky
> 
> TCP has special logic not attempting a retransmit if it senses the prior
> packet has not been consumed yet.
> 
> Usually, the consume part is done from NIC drivers at TC completion time,
> when NIC signals packet has been sent to the wire.
> 
> It seems one skb is essentially leaked somewhere, and leaked (not freed)

Thanks Eric!

Maxim since the packets that leak are transmitted on the host,
the question then is what kind of device do you use on the host
to talk to the guest? tap?


-- 
MST


