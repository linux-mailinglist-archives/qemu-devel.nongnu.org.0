Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0551022BE57
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 08:56:13 +0200 (CEST)
Received: from localhost ([::1]:55850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyrcq-0005Xa-3U
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 02:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jyrZr-0000Pv-6w
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 02:53:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60824
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jyrZp-0001JX-8t
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 02:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595573583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKADiSd/iflVBop3t+eQx+760Ivpih1CCbTxugA27Rk=;
 b=E+HE+cQ2vM42eIvjGmS/TKkYtQpmaAULCiRdluxOkrJDTsnNrjrjouaLSjiSessFbRxJ/5
 2yoa5t49Le6xOCA3E/CXIg1c29hILO5D4KFu2O3VQp+J5jfq6KoyTer21euqD8DbgzpIXl
 bNGLLakUfUDBkESU7ynWLPL6FfhkMfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-H4ED6QJqOECH6bW2Ly9jGg-1; Fri, 24 Jul 2020 02:53:02 -0400
X-MC-Unique: H4ED6QJqOECH6bW2Ly9jGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA06A1005504;
 Fri, 24 Jul 2020 06:53:00 +0000 (UTC)
Received: from gondolin (ovpn-112-188.ams2.redhat.com [10.36.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5541D71D24;
 Fri, 24 Jul 2020 06:52:56 +0000 (UTC)
Date: Fri, 24 Jul 2020 08:52:53 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/1] s390x/s390-virtio-ccw: fix loadparm property getter
Message-ID: <20200724085253.2a33a940.cohuck@redhat.com>
In-Reply-To: <0ce16e30-a5ea-f9ff-89a8-83c393b5118c@redhat.com>
References: <20200723162717.88485-1-pasic@linux.ibm.com>
 <0ce16e30-a5ea-f9ff-89a8-83c393b5118c@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 00:01:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jul 2020 18:37:50 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 23/07/2020 18.27, Halil Pasic wrote:
> > The function machine_get_loadparm() is supposed to produce as C-string,  
> 
> sed "s/ as / a /"
> 
> > that is a null-terminated one, but it does not. ElectricFence can detect  
> 
> maybe: sed "s/null/NUL/"

"NUL" seems to be the more commonly used form in QEMU, so I went ahead
and changed it.
> 
> > this problem if the loadparm machine property is used.
> > 
> > Let us make the returned string a null-terminated one.  
> 
> dito
> 
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Fixes: 7104bae9de ("hw/s390x: provide loadparm property for the machine")
> > ---
> >  hw/s390x/s390-virtio-ccw.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> > index 8cc2f25d8a..e0e4a69ac8 100644
> > --- a/hw/s390x/s390-virtio-ccw.c
> > +++ b/hw/s390x/s390-virtio-ccw.c
> > @@ -701,8 +701,12 @@ bool hpage_1m_allowed(void)
> >  static char *machine_get_loadparm(Object *obj, Error **errp)
> >  {
> >      S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
> > +    char *loadparm_str;
> >  
> > -    return g_memdup(ms->loadparm, sizeof(ms->loadparm));
> > +    /* make a null-terminated string */  
> 
> maybe: sed "s/null/NUL/"
> 
> > +     loadparm_str = g_memdup(ms->loadparm, sizeof(ms->loadparm) + 1);  
> 
> Wrong indentation.
> 
> > +    loadparm_str[sizeof(ms->loadparm)] = 0;
> > +    return loadparm_str;
> >  }  
> 
> With the cosmetics fixed:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks, queued to s390-fixes (with the nits fixed.)


