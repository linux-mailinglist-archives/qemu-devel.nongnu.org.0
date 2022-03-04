Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3AA4CD41B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 13:14:07 +0100 (CET)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6ow-0004tU-Ld
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 07:14:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nQ6nI-0003TO-Q8
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 07:12:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nQ6nF-0006Yv-Gd
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 07:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646395939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=59a0VgVE2BoycYk3S8CfPnfVM4kiT9hCCO9MVrHzKzg=;
 b=cNk6CvsaG4uqUBnph5ft2x0sc7hAV2bwqYEBVC01jrmUjPSybyp1mWinz/CT+WZtdWgShd
 mIVvazxtcu3aMk6sX5Ch1vMJeeHyFV4IQiu7dVAc/HgpHXH+lotWbbeFWV/0sEMEHq8gxn
 6LGrNIY6Xn2l8rwuXyQCbEGcBjUc1is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-hzRV2gxiMWS4psYAhXX5FQ-1; Fri, 04 Mar 2022 07:12:16 -0500
X-MC-Unique: hzRV2gxiMWS4psYAhXX5FQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A00FB824FA8;
 Fri,  4 Mar 2022 12:12:14 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A439978C1B;
 Fri,  4 Mar 2022 12:11:29 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 15379220202; Fri,  4 Mar 2022 07:11:29 -0500 (EST)
Date: Fri, 4 Mar 2022 07:11:29 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 0/2] virtiofsd: Support FUSE_SYNCFS on unannounced
 submounts
Message-ID: <YiIB8XnpQPqktxWG@redhat.com>
References: <20220303171323.580712-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20220303171323.580712-1-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: German Maglione <gmaglione@redhat.com>,
 Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 06:13:21PM +0100, Greg Kurz wrote:
> This is the current patches I have : one to track submounts
> and the other to call syncfs() on them. Tested on simple
> cases only.
> 
> I won't be able to work on this anymore, so I'm posting for the
> records. Anyone is welcome to pick it up as there won't be a v2
> from my side.

Thanks Greg. Hopefully somebody else will be able to pick it up.

What are TODO items to take this patch series to completion.

Vivek

> 
> Cheers,
> 
> --
> Greg
> 
> Greg Kurz (2):
>   virtiofsd: Track submounts
>   virtiofsd: Support FUSE_SYNCFS on unannounced submounts
> 
>  tools/virtiofsd/passthrough_ll.c | 61 ++++++++++++++++++++++++++++----
>  1 file changed, 55 insertions(+), 6 deletions(-)
> 
> -- 
> 2.34.1
> 
> 


