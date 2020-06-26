Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2C020B888
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 20:44:09 +0200 (CEST)
Received: from localhost ([::1]:40380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jotKa-0001Ii-As
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 14:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jotJf-0000s4-D3
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 14:43:11 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42907
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jotJc-0000La-Sh
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 14:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593196983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3A11qs4Un9QS2F/U0WejBe+YhNl2tHu9skLugM2ygDE=;
 b=BZAO0XqgSdFK5OSV3zNphd/4qHKecSv7O/0BjYIrvhUJWHbz0OvfqsMHRVbb6/g/omiO21
 WplHvLr3ivPOevVzdjC02GDVaPAgol849dY7gqDd6EwIOx7GnkuE0jS+4Ns/d5hv+0GDuu
 xmfU0owC0RXEV/3YSHx0MLW/qds5gc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-u0DArtVbO-m79Nq_NDabwg-1; Fri, 26 Jun 2020 14:43:02 -0400
X-MC-Unique: u0DArtVbO-m79Nq_NDabwg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A16718585BD
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 18:43:01 +0000 (UTC)
Received: from work-vm (ovpn-113-27.ams2.redhat.com [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CFED5D9C9;
 Fri, 26 Jun 2020 18:42:54 +0000 (UTC)
Date: Fri, 26 Jun 2020 19:42:52 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 3/3] virtiofsd: Allow addition or removal of capabilities
Message-ID: <20200626184252.GS3087@work-vm>
References: <20200625162929.46672-1-dgilbert@redhat.com>
 <20200625162929.46672-4-dgilbert@redhat.com>
 <20200626103117.GE281902@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200626103117.GE281902@stefanha-x1.localdomain>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Thu, Jun 25, 2020 at 05:29:29PM +0100, Dr. David Alan Gilbert (git) wrote:
> > +    /*
> > +     * The modcaps option is a colon separated list of caps,
> > +     * each preceded by either + or -.
> > +     */
> > +    while (lo->modcaps) {
> > +        capng_act_t action;
> > +        int cap;
> > +
> > +        char *next = strchr(lo->modcaps, ':');
> > +        if (next) {
> > +            *next = '\0';
> > +            next++;
> > +        }
> > +
> > +        switch (lo->modcaps[0]) {
> > +        case '+':
> > +            action = CAPNG_ADD;
> > +            break;
> > +
> > +        case '-':
> > +            action = CAPNG_DROP;
> > +            break;
> > +
> > +        default:
> > +            fuse_log(FUSE_LOG_ERR,
> > +                     "%s: Expecting '+'/'-' in modcaps but found '%c'\n",
> > +                     __func__, lo->modcaps[0]);
> > +            exit(1);
> > +        }
> > +        cap = capng_name_to_capability(lo->modcaps + 1);
> > +        if (cap < 0) {
> > +            fuse_log(FUSE_LOG_ERR, "%s: Unknown capability '%s'\n", __func__,
> > +                     lo->modcaps);
> > +            exit(1);
> > +        }
> > +        if (capng_update(action, CAPNG_PERMITTED | CAPNG_EFFECTIVE, cap)) {
> > +            fuse_log(FUSE_LOG_ERR, "%s: capng_update failed for '%s'\n",
> > +                     __func__, lo->modcaps);
> > +            exit(1);
> > +        }
> > +
> > +        lo->modcaps = next;
> 
> How about passing char *modcaps into this function so that lo->modcaps
> isn't modified by the parsing loop? That seems a bit cleaner and if we
> ever decide to free lo->modcaps it will work as expected.

Yep, can do.

Dave

> Stefan


--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


