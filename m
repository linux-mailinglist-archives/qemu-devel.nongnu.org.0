Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03AC265B36
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 10:11:26 +0200 (CEST)
Received: from localhost ([::1]:56726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGe9V-0001Se-NS
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 04:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kGe8j-0000xU-Nv
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 04:10:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37637
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kGe8i-0006yq-0Z
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 04:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599811835;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ho93S6/3mVoRej4Ur2XbI7no+VDnOb0eXfO1raLX7TQ=;
 b=L4hXfAtQjIhSMtScnW25afla0IWUtZIZvkcf+OqS7YPB/lk3NdhONau8gg7J3K64FBvQlX
 tejF1Mq0XBzPO9eWmhiFqf5e31re8vVnunBo6DwYbe+JLVQsCwwZsfqMn1Y1b0sqEmeeDW
 dw6/LH/lChg1S3W824ZD69YAgMB5qrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-9fR3O-MBNTSooLTHaWsRhw-1; Fri, 11 Sep 2020 04:10:27 -0400
X-MC-Unique: 9fR3O-MBNTSooLTHaWsRhw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 247AC1019624;
 Fri, 11 Sep 2020 08:10:26 +0000 (UTC)
Received: from redhat.com (ovpn-113-229.ams2.redhat.com [10.36.113.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19A399CBA;
 Fri, 11 Sep 2020 08:10:20 +0000 (UTC)
Date: Fri, 11 Sep 2020 09:10:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 00/18] chardev: QOM cleanups
Message-ID: <20200911081018.GA1203593@redhat.com>
References: <20200910194903.4104696-1-ehabkost@redhat.com>
 <CAJ+F1CLLKesMvZo4DJcC=f387d_fN8g--qX8YEQGu8Thf1qotA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLLKesMvZo4DJcC=f387d_fN8g--qX8YEQGu8Thf1qotA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 03:28:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 11, 2020 at 12:07:27PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Sep 10, 2020 at 11:50 PM Eduardo Habkost <ehabkost@redhat.com>
> wrote:
> 
> > Some chardev QOM cleanup patches had to be dropped from my queue
> > due to build erros introduced by code movements across ifdef
> > boundaries at char-parallel.c.  This series redo the changes from
> > those patches, but the macro renames are now a little different:
> >
> > In this version I have decided to rename the type checking macros
> > from *_CHARDEV to CHARDEV_* instead of renaming tye
> > TYPE_CHARDEV_* constants to TYPE_*_CHARDEV, to make the
> > identifiers actually match the QOM type name strings
> > ("chardev-*").
> >
> 
> Sounds reasonable to me, but it loses the matching with the
> structure/object type name though.
> 
> - MuxChardev *d = MUX_CHARDEV(s);
> + MuxChardev *d = CHARDEV_MUX(s);
> 
> I have a preference for the first. Unless we rename all the chardev types
> too...

I tend to think the structs should be renamed too - I've always considerd
them to be backwards.

> Imho, the QOM type name is mostly an internal detail, the C type name is
> dominant in the code.

Err it is the reverse. The QOM type name is exposed public API via QOM
commands, while the C struct names are a internal private detail.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


