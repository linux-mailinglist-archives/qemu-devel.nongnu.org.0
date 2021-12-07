Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413946BD6B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 15:19:07 +0100 (CET)
Received: from localhost ([::1]:34584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mubJB-0003ni-Op
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 09:19:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mubI3-00036T-1v
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:17:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mubHz-0002hf-Lc
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:17:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638886607;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrU4XHw8U5iw3RU4nZQGZgDrQAv/Y031E44/Cyq8JPY=;
 b=P+0xvD+nKQ7lpE7pp/ATMjtvEmzy9x6p2d1Gd+jtIyL/WzQjV4EJXNw7+bLVg/PAbycwn2
 cZVvS9t4g72XrworRSztSVXSWL/0XyUg8bG0zbOvg3cwQkSDYF+kJyzmgRtUolV11P6eOI
 2L2pIN+xHPJY757UYd27hdNfIoxzAvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-bscP127_ONqG3GU49cXgyQ-1; Tue, 07 Dec 2021 09:16:44 -0500
X-MC-Unique: bscP127_ONqG3GU49cXgyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D6F11017968;
 Tue,  7 Dec 2021 14:16:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E47260C04;
 Tue,  7 Dec 2021 14:16:41 +0000 (UTC)
Date: Tue, 7 Dec 2021 14:16:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH v2 0/1] migration: multifd live migration improvement
Message-ID: <Ya9sx9AMwQ2Kwooj@redhat.com>
References: <20211203115533.31534-1-lizhang@suse.de> <Ya5qgYpDrN79A+jl@work-vm>
 <e55634a9-bb30-de28-9dec-2dee15d9cb41@suse.de>
MIME-Version: 1.0
In-Reply-To: <e55634a9-bb30-de28-9dec-2dee15d9cb41@suse.de>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cfontana@suse.de, quintela@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 07, 2021 at 02:45:10PM +0100, Li Zhang wrote:
> 
> On 12/6/21 8:54 PM, Dr. David Alan Gilbert wrote:
> > * Li Zhang (lizhang@suse.de) wrote:
> > > When testing live migration with multifd channels (8, 16, or a bigger number)
> > > and using qemu -incoming (without "defer"), if a network error occurs
> > > (for example, triggering the kernel SYN flooding detection),
> > > the migration fails and the guest hangs forever.
> > > 
> > > The test environment and the command line is as the following:
> > > 
> > > QEMU verions: QEMU emulator version 6.2.91 (v6.2.0-rc1-47-gc5fbdd60cf)
> > > Host OS: SLE 15  with kernel: 5.14.5-1-default
> > > Network Card: mlx5 100Gbps
> > > Network card: Intel Corporation I350 Gigabit (1Gbps)
> > > 
> > > Source:
> > > qemu-system-x86_64 -M q35 -smp 32 -nographic \
> > >          -serial telnet:10.156.208.153:4321,server,nowait \
> > >          -m 4096 -enable-kvm -hda /var/lib/libvirt/images/openSUSE-15.3.img \
> > >          -monitor stdio
> > > Dest:
> > > qemu-system-x86_64 -M q35 -smp 32 -nographic \
> > >          -serial telnet:10.156.208.154:4321,server,nowait \
> > >          -m 4096 -enable-kvm -hda /var/lib/libvirt/images/openSUSE-15.3.img \
> > >          -monitor stdio \
> > >          -incoming tcp:1.0.8.154:4000
> > > 
> > > (qemu) migrate_set_parameter max-bandwidth 100G
> > > (qemu) migrate_set_capability multifd on
> > > (qemu) migrate_set_parameter multifd-channels 16
> > > 
> > > The guest hangs when executing the command: migrate -d tcp:1.0.8.154:4000.
> > > 
> > > If a network problem happens, TCP ACK is not received by destination
> > > and the destination resets the connection with RST.
> > > 
> > > No.     Time    Source  Destination     Protocol        Length  Info
> > > 119     1.021169        1.0.8.153       1.0.8.154       TCP     1410    60166 → 4000 [PSH, ACK] Seq=65 Ack=1 Win=62720 Len=1344 TSval=1338662881 TSecr=1399531897
> > > No.     Time    Source  Destination     Protocol        Length  Info
> > > 125     1.021181        1.0.8.154       1.0.8.153       TCP     54      4000 → 60166 [RST] Seq=1 Win=0 Len=0
> > > 
> > > kernel log:
> > > [334520.229445] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
> > > [334562.994919] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
> > > [334695.519927] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
> > > [334734.689511] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
> > > [335687.740415] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
> > > [335730.013598] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
> > Should we document somewhere how to avoid that?  Is there something we
> > should be doing in the connection code to avoid it?
> 
> We should use the command line -incoming defer in QEMU command line instead
> of -incoming ip:port.
> 
> And the backlog of the socket will be set as the same as  multifd channels, 
> this problem doesn't happen as far as I test.
> 
> If we use --incoming ip:port in the QEMU command line, the backlog of the
> socket is always 1, it will cause the SYN flooding.

Do we send migration parameters from the src to the dst QEMU ?

There are a bunch of things that we need to set to the same
value on the src and dst. If we sent any relevant MigrationParameters
fields to the dst, when the first/main migration chanel is opened, it
could validate that it is configured in a way that is compatible with
the src. If it isn't, it can drop the main channel immediately. This
would trigger the src to fail the migration and we couldn't get stuck
setting up the secondary data channels for multifd.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


