Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5347C358493
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:25:09 +0200 (CEST)
Received: from localhost ([::1]:59632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUei-0002d3-8V
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUUdO-0001aX-PJ
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:23:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUUdL-0002c5-DT
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:23:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617888222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BS5Ad0mSQoQ93kGudG8hWX2fqdMWVQtk4MCJLGFgAnE=;
 b=R8HEOXCTeKtp+iE5WnrJE7hRCF0egSnLEJLUD2l/gGYx5ZwIFQA52o7M7WCA2pU6zsztlf
 g74KLgOpewusGwyKk4BAmChJrxw6yKclvHejEXIbqDFE6xNN1q0zBhpDW68CrDm44pBbvD
 E62r642gXWbZM2e2W0IWtVtQy3rVaK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-z77IZ_HuOfeiwDmlAhY4PA-1; Thu, 08 Apr 2021 09:23:38 -0400
X-MC-Unique: z77IZ_HuOfeiwDmlAhY4PA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 246F6BBEE2;
 Thu,  8 Apr 2021 13:23:37 +0000 (UTC)
Received: from gondolin (ovpn-113-52.ams2.redhat.com [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A6F960BF1;
 Thu,  8 Apr 2021 13:23:24 +0000 (UTC)
Date: Thu, 8 Apr 2021 15:23:22 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v1 1/1] s390x: css: report errors from
 ccw_dstream_read/write
Message-ID: <20210408152322.70eea267.cohuck@redhat.com>
In-Reply-To: <6fe2743d-c800-d743-fe01-ea10bed90e9a@linux.ibm.com>
References: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
 <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
 <20210407194711.459176c3.pasic@linux.ibm.com>
 <20210408110232.2bf02df4.cohuck@redhat.com>
 <6fe2743d-c800-d743-fe01-ea10bed90e9a@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, mst@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Apr 2021 14:32:11 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> On 4/8/21 11:02 AM, Cornelia Huck wrote:
> > On Wed, 7 Apr 2021 19:47:11 +0200
> > Halil Pasic <pasic@linux.ibm.com> wrote:
> >   
> >> So this begs the question, do we need this fixed for old releases as well?
> >>
> >> My answer is yes we do. Conny what do you think?  
> > 
> > What do you mean with "old releases"? The dstream rework was in 2.11,
> > and I doubt that anyone is using anything older, or a downstream
> > release that is based on pre-2.11.
> > 
> > If you mean "include in stable", then yes, we can do that; if we want
> > the commit in 6.0, I need the final version soon.
> > 
> >   
> 
> OK, are you OK with the two change propositions I sent?
> 
> 1) let the 3270 decide for internal errors (-EIO) but return the error 
> for CSS errors in handle_payload_3270_write()
> 
> 2) for senseid, always ask CSS to update the residual count
> but only erase the senseid if the write succeeded
> 
> 

I think both make sense.


