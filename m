Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C674128A6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:06:47 +0200 (CEST)
Received: from localhost ([::1]:56156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRQz-00032r-SG
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSQp1-0005We-I7
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:27:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSQoy-0004NC-7m
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632173245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=boyyZjgEshS9NYgwepGlNEP3YstuWhlkvnC3l/w/LBA=;
 b=DQbtCbJGUuXxBTnoupebF1vIpfj1BTBAMDq+UdL+8b370I3xoMMGaB6sG8sOhFgpjufqZ0
 MPomzwWbcDkk4t8ZZbgZPmgkt9p+uAaLKSqZ1vwdWT+Sny9Eh1H7UmpFIf8fbzmG+WzLHf
 +Z7J0E4rWwDc20NaM83slmBKY5lOStw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-hU90ztlmPIKTO__QfPhxBg-1; Mon, 20 Sep 2021 17:27:22 -0400
X-MC-Unique: hU90ztlmPIKTO__QfPhxBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC5DE802936;
 Mon, 20 Sep 2021 21:27:21 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 058B91000358;
 Mon, 20 Sep 2021 21:27:15 +0000 (UTC)
Date: Mon, 20 Sep 2021 16:27:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v3 2/3] monitor/hmp: add support for flag argument with
 value
Message-ID: <20210920212714.wjwtofo6jvau6gpm@redhat.com>
References: <20210920105641.258104-1-s.reiter@proxmox.com>
 <20210920105641.258104-3-s.reiter@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20210920105641.258104-3-s.reiter@proxmox.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 20, 2021 at 12:56:40PM +0200, Stefan Reiter wrote:
> Adds support for the "-xS" parameter type, where "-x" denotes a flag
> name and the "S" suffix indicates that this flag is supposed to take an
> arbitrary string parameter.
> 
> These parameters are always optional, the entry in the qdict will be
> omitted if the flag is not given.
> 
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---
>  monitor/hmp.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)

Looks like yet another hack on top of our existing pile of hacks, but
it is cleaner in v3 than it was in v2, and I'm not coming up with
anything better.

> 
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index d50c3124e1..a32dce7a35 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -980,6 +980,7 @@ static QDict *monitor_parse_arguments(Monitor *mon,
>              {
>                  const char *tmp = p;
>                  int skip_key = 0;
> +                int ret;
>                  /* option */
>  
>                  c = *typestr++;
> @@ -1002,8 +1003,22 @@ static QDict *monitor_parse_arguments(Monitor *mon,
>                      }
>                      if (skip_key) {
>                          p = tmp;
> +                    } else if (*typestr == 'S') {
> +                        /* has option with string value */
> +                        typestr++;
> +                        tmp = p++;
> +                        while (qemu_isspace(*p)) {
> +                            p++;
> +                        }
> +                        ret = get_str(buf, sizeof(buf), &p);
> +                        if (ret < 0) {
> +                            monitor_printf(mon, "%s: value expected for -%c\n",
> +                                           cmd->name, *tmp);
> +                            goto fail;
> +                        }
> +                        qdict_put_str(qdict, key, buf);

Do we have any documentation that also needs a matching update?  Or is
our documentation for the pseudo-grammar of .hx parsing limited to the
code?

>                      } else {
> -                        /* has option */
> +                        /* has boolean option */
>                          p++;
>                          qdict_put_bool(qdict, key, true);
>                      }

Holding my nose a bit, but only because of the mess that this already
is, not because of what you added.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


