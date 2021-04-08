Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE70357E82
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 10:54:57 +0200 (CEST)
Received: from localhost ([::1]:49236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQRE-0006td-Iu
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 04:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUQPo-0006Rz-Ie
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:53:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lUQPl-0003S7-GD
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617872003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hinVNoTOjHFDAo34GuBCl0jqhGDL6WLYveKO7S269Vk=;
 b=AsOksNyiH9DiYFzAfUiqPKjTM1468gD/q23fSGNCE0AUJoTBzRW1hJERsbut2sbLLiiRAT
 /Ionb20HxrD8AHCwm7C8b7644cGfzAPw4paH6UdLYECRC+izejmNXRQ35KSsOTqZ5alztv
 UY1zWYLHyMfE5qWHLaD3mez/RNZiyRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-q9kemR74P2qwGRt7TrL9_w-1; Thu, 08 Apr 2021 04:53:21 -0400
X-MC-Unique: q9kemR74P2qwGRt7TrL9_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 834B08AB620;
 Thu,  8 Apr 2021 08:53:20 +0000 (UTC)
Received: from gondolin (ovpn-113-52.ams2.redhat.com [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 856C85D9CC;
 Thu,  8 Apr 2021 08:53:05 +0000 (UTC)
Date: Thu, 8 Apr 2021 10:53:02 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v1 1/1] s390x: css: report errors from
 ccw_dstream_read/write
Message-ID: <20210408105302.598f46b8.cohuck@redhat.com>
In-Reply-To: <20210407185426.257ed03d.pasic@linux.ibm.com>
References: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
 <1617695053-7328-2-git-send-email-pmorel@linux.ibm.com>
 <20210406170306.1be374c2.cohuck@redhat.com>
 <c541aacd-34cb-3ed5-0016-cca1064c67e6@linux.ibm.com>
 <20210407185426.257ed03d.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: thuth@redhat.com, frankja@linux.ibm.com,
 Pierre Morel <pmorel@linux.ibm.com>, mst@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 18:54:26 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Wed, 7 Apr 2021 13:41:57 +0200
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
> > > Here, however, I'm not sure. Returning a negative error here is fine,
> > > but handle_payload_3270_write (not changed in this patch) seems to
> > > match everything to -EIO. Shouldn't it just be propagated, and maybe 0
> > > mapped to -EIO only? If I'm not confused, we'll end up mapping every
> > > error to intervention required.    
> > 
> > I know very little about the 3270 but in my opinion accessing memory is 
> > not the problem of the device but of the subchannel.
> > So we should certainly propagate the error instead of returning -EIO for 
> > any error.  
> 
> I agree, what condition needs to be indicated when we encounter an
> invalid CCW, IDAW or MIDAW address is clear. In the PoP this is
> described under Chapter 16. I/O Interruptions > Subchannel-Status Word >
> Subchannel-Status Field > Program Check in the paragraphs on "Invalid
> IDAW or MIDAW Address and "Invalid CCW Address".
> 
> My guess about handle_payload_3270_write() is that IMHO the initial 3270
> emulation code was, let's say of mixed quality in the first place, so
> wouldn't seek some hidden meaning/sense, behind the -EIO. IMHO first
> mapping architectural conditions to "errno-style" error codes, passing
> these around, and then mapping them back is a litle non-intuitive. If one
> looks at the purpose of handle_payload_3270_write(), it is basically
> emulating an IO data transfer from the device into the main storage. If
> that sort of operation. So with -EIO the original author probably wanted
> to say: hey there was an input/output error, which ain't that wrong. The
> problem is that somewhere up the call stack EIO gets interpreted in a
> very peculiar way, and along with other errnos mapped to CIO
> architecture stuff like SCSW bits.

It's not quite clear to me what the 3270 is supposed to do (I remember
some requirements for the aforementioned intervention required, but
posting unit checks does not look like the right thing to do for all of
the possible errors.)

Let's just loop the error through? I doubt that this is the last
problem in the 3270 code :) Fortunately, it is a rather obscure device
to be used with QEMU.


