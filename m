Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CE4278D28
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 17:50:26 +0200 (CEST)
Received: from localhost ([::1]:35364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLpzM-0001en-Ld
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 11:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kLpt9-0006HO-JF
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 11:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kLpt7-00083R-W6
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 11:43:59 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601048636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WxbwFwT33OGrgK/cs5dtfZ6zGQcuRjeRBdSmr0zZmEo=;
 b=jQ4Z92GImr9XPcvKbqzqAY+ySOv9mQ3vCQXgqxfq9QB2FaRzyERRCi4nAlwSKj1UDg1f2Q
 8ADnHf/aShJ+XsB+ZCbAzBL3ny2Vc0i8im4qa1M9GRX/mQ9+xqIX2Tu7nz/NEiK/ecavee
 QvEIcG53+ZCb2bY7fhKwfNxwn7q/ni8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-ROXynxSYMuGmskKxNKIRrw-1; Fri, 25 Sep 2020 11:43:53 -0400
X-MC-Unique: ROXynxSYMuGmskKxNKIRrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A51F10BBECF;
 Fri, 25 Sep 2020 15:43:51 +0000 (UTC)
Received: from gondolin (ovpn-112-192.ams2.redhat.com [10.36.112.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B31C5D9F1;
 Fri, 25 Sep 2020 15:43:42 +0000 (UTC)
Date: Fri, 25 Sep 2020 17:43:41 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH v6 0/8] s390: Extended-Length SCCB & DIAGNOSE 0x318
Message-ID: <20200925174341.21fe97af.cohuck@redhat.com>
In-Reply-To: <20200925173205.288d877b@ibm-vm>
References: <20200915194416.107460-1-walling@linux.ibm.com>
 <20200916175300.5c2b6bbb.cohuck@redhat.com>
 <3f4c28d6-fe5f-2e52-2e51-3190621ea63d@linux.ibm.com>
 <82f7c31c-16f6-8450-d241-ca8257db6469@linux.ibm.com>
 <20200925171855.670bd93a.cohuck@redhat.com>
 <20200925173205.288d877b@ibm-vm>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 01:07:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Collin Walling <walling@linux.ibm.com>, frankja@linux.ibm.com,
 mst@redhat.com, david@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, thuth@redhat.com,
 pbonzini@redhat.com, sumanthk@linux.ibm.com, mihajlov@linux.ibm.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Sep 2020 17:32:05 +0200
Claudio Imbrenda <imbrenda@linux.ibm.com> wrote:

> On Fri, 25 Sep 2020 17:18:55 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Fri, 25 Sep 2020 11:13:49 -0400
> > Collin Walling <walling@linux.ibm.com> wrote:
> >   
> > > On 9/16/20 1:15 PM, Collin Walling wrote:    
> > > > On 9/16/20 11:53 AM, Cornelia Huck wrote:
> > > > 
> > > > [...]
> > > >       
> > > >>>      
> > > >>
> > > >> Thanks, applied.
> > > >>
> > > >>      
> > > > 
> > > > Thanks Conny.
> > > > 
> > > > Much appreciated for everyone's patience and review. The only
> > > > thing I'd like to hold out on for now is for someone to take a
> > > > peek at patch #3 with respect to the protected virtualization
> > > > stuff. I don't know too much about it, honestly, and I want to
> > > > ensure that dynamically allocating memory for the SCCB makes
> > > > sense there. The alternative would be to allocate a static 4K for
> > > > the work_sccb.   
> > > 
> > > I had someone take a look at the patch for PV and was told
> > > everything looks sane. Since the patches have already been applied,
> > > it seems like it's too late to add a reviewed-by from someone?    
> > 
> > Have the reviewer reply with their R-b, and I'll happily add it, as I
> > rebase s390-next before doing a pull req anyway :)  
> 
> well it was me :)
> 
> you can add a 
> 
> Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> 
> for the first 6 patches, and an
> 
> Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> 
> for the last one
> 
> 
> thanks!
> 

Thanks, updated and pushed out.


