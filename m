Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E742946C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 18:23:28 +0200 (CEST)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZy5G-0002va-WA
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 12:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mZy0c-0006Fc-D8
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 12:18:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mZy0Z-0001im-Ic
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 12:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633969114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qVyhZAngvGB3DY5VaSm2UxoQ34QPRPEeBHZtHQFRTrY=;
 b=Dp+DL6OyaRrzNYi6qdMfFJFnGHIBh8GjzleyZErPTbdyAhF5EGi8MAXJL9iLeNpEu6ZBhh
 3WET9w2ynldowNmFpsnbuG9xRAFJxUH+YRYQ6qNVgP3TCIo20JvqWEG08zeSzJ2inM83Yk
 iar9o6w/5JUG7ZJnGdcL9X+Kbuh30qA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-B-OjAFhJPN6j-zDqQnL4sQ-1; Mon, 11 Oct 2021 12:18:31 -0400
X-MC-Unique: B-OjAFhJPN6j-zDqQnL4sQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0A9C10557D6;
 Mon, 11 Oct 2021 16:18:08 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 621475F4E4;
 Mon, 11 Oct 2021 16:17:08 +0000 (UTC)
Date: Mon, 11 Oct 2021 11:17:06 -0500
From: Eric Blake <eblake@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 2/2] monitor: refactor set/expire_password and allow
 VNC display id
Message-ID: <20211011161706.56ycs26qtwhdawmu@redhat.com>
References: <20210928090326.1056010-1-s.reiter@proxmox.com>
 <20210928090326.1056010-3-s.reiter@proxmox.com>
 <YWRSJQPJRdGsPXET@work-vm>
MIME-Version: 1.0
In-Reply-To: <YWRSJQPJRdGsPXET@work-vm>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Stefan Reiter <s.reiter@proxmox.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 04:03:01PM +0100, Dr. David Alan Gilbert wrote:
> * Stefan Reiter (s.reiter@proxmox.com) wrote:
> > It is possible to specify more than one VNC server on the command line,
> > either with an explicit ID or the auto-generated ones à la "default",
> > "vnc2", "vnc3", ...
> > 

> > +++ b/monitor/hmp-cmds.c
> > @@ -1451,10 +1451,41 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
> >  {
> >      const char *protocol  = qdict_get_str(qdict, "protocol");
> >      const char *password  = qdict_get_str(qdict, "password");
> > +    const char *display = qdict_get_try_str(qdict, "display");
> >      const char *connected = qdict_get_try_str(qdict, "connected");
> >      Error *err = NULL;
> > +    DisplayProtocol proto;
> >  
> > -    qmp_set_password(protocol, password, !!connected, connected, &err);
> > +    SetPasswordOptions opts = {
> > +        .password = g_strdup(password),
> 
> You're leaking that strdup on the error returns; you probably want to
> add an error:  exit and goto it to do all the cleanup.

Or maybe there's a way to use g_autofree to let the compiler clean it
up automatically.

> 
> > +        .u.vnc.display = NULL,
> > +    };
> > +
> > +    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> > +                            DISPLAY_PROTOCOL_VNC, &err);
> > +    if (err) {
> > +        hmp_handle_error(mon, err);
> > +        return;
> > +    }
> > +    opts.protocol = proto;
> > +
> > +    if (proto == DISPLAY_PROTOCOL_VNC) {
> > +        opts.u.vnc.has_display = !!display;
> > +        opts.u.vnc.display = g_strdup(display);
> > +    } else if (proto == DISPLAY_PROTOCOL_SPICE) {
> > +        opts.u.spice.has_connected = !!connected;
> > +        opts.u.spice.connected =
> > +            qapi_enum_parse(&SetPasswordAction_lookup, connected,
> > +                            SET_PASSWORD_ACTION_KEEP, &err);
> > +        if (err) {
> > +            hmp_handle_error(mon, err);
> > +            return;
> > +        }
> > +    }
> > +
> > +    qmp_set_password(&opts, &err);
> > +    g_free(opts.password);
> > +    g_free(opts.u.vnc.display);

Hmm. Why are we hand-cleaning only portions of the QAPI type instead
of using the generated qapi_free_SetPasswordOptions() do to things?

> >      hmp_handle_error(mon, err);
> >  }
> >  
> > @@ -1462,9 +1493,31 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
> >  {
> >      const char *protocol  = qdict_get_str(qdict, "protocol");
> >      const char *whenstr = qdict_get_str(qdict, "time");
> > +    const char *display = qdict_get_try_str(qdict, "display");
> >      Error *err = NULL;
> > +    DisplayProtocol proto;
> >  
> > -    qmp_expire_password(protocol, whenstr, &err);
> > +    ExpirePasswordOptions opts = {
> > +        .time = g_strdup(whenstr),
> > +        .u.vnc.display = NULL,
> > +    };
> 
> Same here; that 'whenstr' gets leaked on errors.
> 
> > +    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> > +                            DISPLAY_PROTOCOL_VNC, &err);
> > +    if (err) {
> > +        hmp_handle_error(mon, err);
> > +        return;
> > +    }
> > +    opts.protocol = proto;
> > +
> > +    if (proto == DISPLAY_PROTOCOL_VNC) {
> > +        opts.u.vnc.has_display = !!display;
> > +        opts.u.vnc.display = g_strdup(display);
> > +    }
> > +
> > +    qmp_expire_password(&opts, &err);
> > +    g_free(opts.time);
> > +    g_free(opts.u.vnc.display);
> >      hmp_handle_error(mon, err);

Same here - using the generated qapi_free_ function rather than doing
things by hand, and/or smart use of g_autofree, may make this easier
to maintain.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


