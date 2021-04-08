Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6483584B1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:29:42 +0200 (CEST)
Received: from localhost ([::1]:42738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUj7-0007SH-Se
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUUg8-0004wd-Ez
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUUg6-0004Qe-55
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617888392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aiQKXiaJZe+L0vNJLElKKdCbPOYoMyrmUDPvQH1iI0M=;
 b=MH80HXWZZNd+GLAO1wi+Si63/dBJDtI46VRlwCZDzrLmD3qjmRt9KwIvE4jVeyC3+lZx7M
 UPUZaXaYJvO+sM0BeDdeeN+YbOmCvEAGqWhGEKtowH1pDU47wbiOhlEsvDujkfzlWD8oZb
 7T0D7vcrKLUgYD8sjVMVLuA2Ag/EM2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-wM7CyAkIObOnsWApM4gwJA-1; Thu, 08 Apr 2021 09:26:31 -0400
X-MC-Unique: wM7CyAkIObOnsWApM4gwJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7737F10053E9;
 Thu,  8 Apr 2021 13:26:29 +0000 (UTC)
Received: from gondolin (ovpn-113-52.ams2.redhat.com [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9D4160BF1;
 Thu,  8 Apr 2021 13:26:16 +0000 (UTC)
Date: Thu, 8 Apr 2021 15:26:14 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v1 1/1] s390x: css: report errors from
 ccw_dstream_read/write
Message-ID: <20210408152614.4e8ee542.cohuck@redhat.com>
In-Reply-To: <20210408143959.7b6a0fc3.pasic@linux.ibm.com>
References: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
 <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
 <20210407194711.459176c3.pasic@linux.ibm.com>
 <20210408110232.2bf02df4.cohuck@redhat.com>
 <20210408143959.7b6a0fc3.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
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
Cc: thuth@redhat.com, frankja@linux.ibm.com,
 Pierre Morel <pmorel@linux.ibm.com>, david@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Apr 2021 14:39:59 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Thu, 8 Apr 2021 11:02:32 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Wed, 7 Apr 2021 19:47:11 +0200
> > Halil Pasic <pasic@linux.ibm.com> wrote:
> >   
> > > So this begs the question, do we need this fixed for old releases as well?
> > > 
> > > My answer is yes we do. Conny what do you think?    
> > 
> > What do you mean with "old releases"? The dstream rework was in 2.11,
> > and I doubt that anyone is using anything older, or a downstream
> > release that is based on pre-2.11.
> > 
> > If you mean "include in stable", then yes, we can do that; if we want
> > the commit in 6.0, I need the final version soon.  
> 
> With old releases, I wanted to say any QEMU that is still supported by
> us ;). For upstream it is backport to the stable versions currently in
> support.
> 
> The commit message does not tell us if this is an enhancement or a
> bugfix, stable is not mentioned, and neither do we get the information
> since when is this problem existent. I simply wanted to have that
> discussion.
> 
> Would it make sense to split this up into a virtio-ccw a css and a 3270
> patch? That way if there was a problem with let's say 3270, we could
> still keep the other two?

I'm not sure that makes sense; it's not too complicated.


