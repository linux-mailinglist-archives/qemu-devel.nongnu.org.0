Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270F134AC64
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 17:16:29 +0100 (CET)
Received: from localhost ([::1]:48858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPp8N-0000FU-LK
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 12:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPp6Y-0007rp-EH
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 12:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPp6V-0007q6-DM
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 12:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616775268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iiQI7m7go2NZeckM1jKkFehH3fU06M+2a8wcLVDqa4E=;
 b=hlU3k96JkvLDWafdwWPz1XSAuSFdfnd+Xn2CO1p19Zizyc+WbN4/14y341IT8OsdgZ34O4
 c6uP9pxkOGDX5GGGZI0OEBnRP4yzDYoKjm0bCq5x+1HA3jgubx50uQJyUUPzZUCkysSHUi
 hSi4HN5NIoZ5IdjguS+z/nzMHkuTGpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-FiiL44-COSq1vs6rIoXj-g-1; Fri, 26 Mar 2021 12:14:22 -0400
X-MC-Unique: FiiL44-COSq1vs6rIoXj-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FB2C801994;
 Fri, 26 Mar 2021 16:14:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7F5A50304;
 Fri, 26 Mar 2021 16:13:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 34A2611327E1; Fri, 26 Mar 2021 17:13:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH 1/2] Fix the segment fault when calling
 yank_register_instance
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <87sg4ihta0.fsf@dusky.pond.sub.org>
 <20210326170227.2c2b3598@gecko.fritz.box>
Date: Fri, 26 Mar 2021 17:13:49 +0100
In-Reply-To: <20210326170227.2c2b3598@gecko.fritz.box> (Lukas Straub's message
 of "Fri, 26 Mar 2021 17:02:27 +0100")
Message-ID: <8735wh3nb6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alexandr.iarygin@profitbricks.com, qemu-devel@nongnu.org,
 Li Zhang <li.zhang@cloud.ionos.com>, pankaj.gupta@cloud.ionos.com,
 Li Zhang <zhlcindy@gmail.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lukas Straub <lukasstraub2@web.de> writes:

> On Fri, 26 Mar 2021 15:41:11 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Looks like a bug fix.  Lukas, can you take care of it in time for 6.0?
>> 
>
> Yeah, this patch only fixes a symptom, but not the core cause of the bug.
> I have already written patches that fix the bugs inclusive test-cases:
> https://lore.kernel.org/qemu-devel/cover.1616744509.git.lukasstraub2@web.de/

Awesome!  I didn't make the connection.  I trust you'll take care of
getting the fixes merged :)


