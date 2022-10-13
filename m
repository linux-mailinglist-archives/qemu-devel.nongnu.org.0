Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529575FD695
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 11:05:27 +0200 (CEST)
Received: from localhost ([::1]:48512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiu9e-0005X1-D5
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 05:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oitNK-0005v6-1u
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oitND-000289-Cq
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665648921;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/as0WB4+8GRntlUAZkae+fBfwIZzB51gqmUF20F7zfs=;
 b=SvHJmr4+PpzIeLriGeXlvsZfN6be/6kA6EfG5sHSpsAyWqEMWHy1/UpZhqHTSn+9LNsGsF
 RoxUh47ITMOW6wykl/H2RGX6j4hqBAehhEmiTYgR0qJeA/crh2PUA3LPX+Sa08UHV7o6qn
 U4fNXb8v4AC2x+NT8t0nAhXW2BSNrUs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-jxRLAmQ0NJGmUahHghQuSg-1; Thu, 13 Oct 2022 04:15:20 -0400
X-MC-Unique: jxRLAmQ0NJGmUahHghQuSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5797B833A0D;
 Thu, 13 Oct 2022 08:15:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6615C15BB9;
 Thu, 13 Oct 2022 08:15:19 +0000 (UTC)
Date: Thu, 13 Oct 2022 09:15:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Subject: Re: MultiFD and default channel out of order mapping on receive side.
Message-ID: <Y0fJFcj9+wcnKYqd@redhat.com>
References: <9f02255a-ceb9-9ca6-2606-b91c5e9e6459@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9f02255a-ceb9-9ca6-2606-b91c5e9e6459@nutanix.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 13, 2022 at 01:23:40AM +0530, manish.mishra wrote:
> Hi Everyone,
> Hope everyone is doing great. I have seen some live migration issues with qemu-4.2 when using multiFD. Signature of issue is something like this.
> 2022-10-01T09:57:53.972864Z qemu-kvm: failed to receive packet via multifd channel 0: multifd: received packet magic 5145564d expected 11223344
> 
> Basically default live migration channel packet is received on multiFD channel. I see a older patch explaining potential reason for this behavior.
> https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg05920.html
> > [PATCH 3/3] migration/multifd: fix potential wrong acception order of IO.
> 
> But i see this patch was not merged. By looking at qemu master code, i
> could not find any other patch too which can handle this issue. So as
> per my understanding this is still a potential issue even in qemu
> master. I mainly wanted to check why this patch was dropped?

See my repllies in that message - it broke compatilibity of data on
the wire, meaning old QEMU can't talk to new QEMU and vica-verca.

We need a fix for this issue, but it needs to take into account
wire compatibility.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


