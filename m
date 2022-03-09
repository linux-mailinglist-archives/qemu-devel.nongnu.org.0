Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D0E4D3908
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 19:42:31 +0100 (CET)
Received: from localhost ([::1]:54390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1GY-0006Pm-BC
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 13:42:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nS1CC-0005Jn-1g
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:38:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nS1C8-0007tW-Ju
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646851074;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ah9VFyJsV3KkFAwHK7GekiXtIwzCbwQXCkR2VjEh/w4=;
 b=KYWP3BslMGRupCyV/IdB0yQF+vk0qlwB2cvobEyo3Vcybhm740lRtFxHnn6bMz354bveb/
 nqcnL0U7izOlXqMk9sD3z6jJa6b+PDjdjLphufdRjz/+5QhZs2NsPRmwfOF7rTaWhGfqKa
 7y01K5H0lqQhtqxLztVbhVS98Q/vE3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-WunM8C6ONoiaElxBWKe2pg-1; Wed, 09 Mar 2022 13:37:48 -0500
X-MC-Unique: WunM8C6ONoiaElxBWKe2pg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0B1F84A5F0;
 Wed,  9 Mar 2022 18:37:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9591E8478A;
 Wed,  9 Mar 2022 18:37:45 +0000 (UTC)
Date: Wed, 9 Mar 2022 18:37:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: bad virsh save /dev/null performance (600 MiB/s max)
Message-ID: <Yijz9hzJFJoMo7vE@redhat.com>
References: <YiXzw8pF9If2/M7M@redhat.com>
 <5f318297-51c0-366b-758b-733ba27684ba@suse.de>
 <YiX4gfBtgDq/uZpu@redhat.com>
 <5b3d17d2-f07f-8cb1-54ff-6a517dc4eaef@suse.de>
 <YiX6XSlVNw183PTV@work-vm>
 <51b486fc-2c71-e1c6-6412-d462234d67fb@suse.de>
 <YiiS9HnS0LsiY2Hb@work-vm> <YiiU2gCbnJOgpZxp@redhat.com>
 <700779ea-4274-7872-6022-d32457a00160@suse.de>
 <47786b29-b1a2-1f6a-568d-b61398e0f641@suse.de>
MIME-Version: 1.0
In-Reply-To: <47786b29-b1a2-1f6a-568d-b61398e0f641@suse.de>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Jim Fehlig <jfehlig@suse.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09, 2022 at 07:27:12PM +0100, Claudio Fontana wrote:
> 
> One difference I could see looking at the qmp commands issued by libvirt in the "virsh save" case,
> is "detach:true" in the migration command (which seems to have no effect in qemu),

That is a bug in libvirt - it should not be setting that in QMP.

To quote the QAPI spec for 'migrate'

  # @detach: this argument exists only for compatibility reasons and
  #          is ignored by QEMU


> 
> 
> and maybe more interestingly this stuff about the "fd":
> 
> 
> 2022-03-09 17:29:34.247+0000: 20390: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7faa9003ebf0 msg={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-390"}^M
>  fd=34
> 2022-03-09 17:29:34.247+0000: 20387: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7faa9003ebf0 buf={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-390"}^M
>  len=73 ret=73 errno=0
> 2022-03-09 17:29:34.247+0000: 20387: info : qemuMonitorIOWrite:457 : QEMU_MONITOR_IO_SEND_FD: mon=0x7faa9003ebf0 fd=34 ret=73 errno=0
> 2022-03-09 17:29:34.248+0000: 20387: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7faa9003ebf0 reply={"return": {}, "id": "libvirt-390"}
> 2022-03-09 17:29:34.249+0000: 20390: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7faa9003ebf0 msg={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-391"}^M
>  fd=-1
> 2022-03-09 17:29:34.249+0000: 20387: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7faa9003ebf0 buf={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-391"}^M
>  len=113 ret=113 errno=0
> 
> 
> in qemu I am currently looking at the code in migration/socket.c
> vs the code in migration/fd.c , wonder if the difference would
> stem from there..

When saving to a file, libvirt passes in a pre-opened FD for
QEU to use. IIRC this should always be a pipe FD connected to
libvirt's iohelper program, sometimes indirectly via a compression
program.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


