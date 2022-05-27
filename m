Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AB7535F10
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 13:16:13 +0200 (CEST)
Received: from localhost ([::1]:38330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuXwy-0001vC-9T
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 07:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nuXWe-0002KF-Q5
 for qemu-devel@nongnu.org; Fri, 27 May 2022 06:49:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nuXWb-0001wb-KA
 for qemu-devel@nongnu.org; Fri, 27 May 2022 06:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653648536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPQmPDnfqMwLuW32B9ZuTSE4SwjrEYrpQSuUHsViwGE=;
 b=VGZJ6nRfTp7/8Yj/cBfRl45efTCTPSJg5P6NLKnYjhDB6Wx42Yenv+fLB7cLskqM9aICaY
 1bEM2CjDRWQeIBIv9MGzf3u9QfYXBh/wJb513WKtjLnT57DB0B50yis/7u+6pp5vJhLXRY
 Ik4WluMO0okkcZKoEasSSYTpBNxmmDE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-OjyF3sJhNkek62zRYrn9oQ-1; Fri, 27 May 2022 06:48:55 -0400
X-MC-Unique: OjyF3sJhNkek62zRYrn9oQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1AEC1011637;
 Fri, 27 May 2022 10:48:54 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 430CA40EC002;
 Fri, 27 May 2022 10:48:53 +0000 (UTC)
Date: Fri, 27 May 2022 12:48:50 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 libvir-list@redhat.com, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [libvirt PATCH] tools: add virt-qmp-proxy for proxying QMP
 clients to libvirt QEMU guests
Message-ID: <YpCskqbkDVuvp4D+@angien.pipo.sk>
References: <20220527094758.604621-1-berrange@redhat.com>
 <YpCl9/EMwenZUxJs@angien.pipo.sk>
 <94610f98-9075-83f5-3d4f-b745467171da@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94610f98-9075-83f5-3d4f-b745467171da@suse.de>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
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

On Fri, May 27, 2022 at 12:35:45 +0200, Claudio Fontana wrote:
> On 5/27/22 12:20 PM, Peter Krempa wrote:
> > On Fri, May 27, 2022 at 10:47:58 +0100, Daniel P. Berrangé wrote:
> >> Libvirt provides QMP passthrough APIs for the QEMU driver and these are
> >> exposed in virsh. It is not especially pleasant, however, using the raw
> >> QMP JSON syntax. QEMU has a tool 'qmp-shell' which can speak QMP and
> >> exposes a human friendly interactive shell. It is not possible to use
> >> this with libvirt managed guest, however, since only one client can
> >> attach to he QMP socket at any point in time.
> >>
> >> The virt-qmp-proxy tool aims to solve this problem. It opens a UNIX
> >> socket and listens for incoming client connections, speaking QMP on
> >> the connected socket. It will forward any QMP commands received onto
> >> the running libvirt QEMU guest, and forward any replies back to the
> >> QMP client.
> >>
> >>   $ virsh start demo
> >>   $ virt-qmp-proxy demo demo.qmp &
> >>   $ qmp-shell demo.qmp
> >>   Welcome to the QMP low-level shell!
> >>   Connected to QEMU 6.2.0
> >>
> >>   (QEMU) query-kvm
> >>   {
> >>       "return": {
> >>           "enabled": true,
> >>           "present": true
> >>       }
> >>   }
> >>
> >> Note this tool of course has the same risks as the raw libvirt
> >> QMP passthrough. It is safe to run query commands to fetch information
> >> but commands which change the QEMU state risk disrupting libvirt's
> >> management of QEMU, potentially resulting in data loss/corruption in
> >> the worst case.
> >>
> >> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> >> ---
> >>
> >> CC'ing QEMU since this is likely of interest to maintainers and users
> >> who work with QEMU and libvirt
> >>
> >> Note this impl is fairly crude in that it assumes it is receiving
> >> the QMP commands linewise one at a time. None the less it is good
> >> enough to work with qmp-shell already, so I figured it was worth
> >> exposing to the world. It also lacks support for forwarding events
> >> back to the QMP client.
> > 
> > I originally wanted to teach the qemu tools to work with libvirt
> > directly similarly how 'scripts/render_block_graph.py' from the qemu
> > tree already does but I guess this is also an option.
> > 
> > This is an option too albeit a bit more complex to set up, but on the
> > other hand a bit more universal.
> > 
> > I'll have a look at the code a bit later.
> > 
> 
> Would have found it useful, at the time I wrote the multifd save series I ended up just scripting around virsh qemu-monitor-command from either bash or C.

I'd consider this to be just something to achieve compatibility with
tools that already exist and expect monitor socket.

If you are writing new software with libvirt connection in mind you can
use 'virDomainQemuMonitorCommand()' or
'virDomainQemuMonitorCommandWithFiles()' directly or via the language
bindings for your language.

Obviously not for bash though.


