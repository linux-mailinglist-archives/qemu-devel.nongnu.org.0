Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483804066A3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 07:09:27 +0200 (CEST)
Received: from localhost ([::1]:41322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOYmz-00029i-UL
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 01:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOYlR-00011w-SV
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 01:07:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOYlP-0002Q8-KR
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 01:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631250464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uKWEhVbvOQYJZCxu29fgtPsjRwc3RHyqva8rpTzm2VY=;
 b=OnJr78tH413SzzeOUcs+s4lIsClvXULY3K0qC5JWRoeHI6AsuEf2PFDfE2+0F6SZnE1UQT
 8OFxoEA85vt0sA5qxdz1ezaEWBERaMOVD45O/d7cKGmgKl45Ge9WxPDL6y/v3CJPGUnO1U
 wwqTOyAViMYU5RG6MhSJsaiwr7yT1eE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-GIndI8zhNIqMu_TgCMYtXg-1; Fri, 10 Sep 2021 01:07:43 -0400
X-MC-Unique: GIndI8zhNIqMu_TgCMYtXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DBDA1006AA0;
 Fri, 10 Sep 2021 05:07:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C79F25FCA6;
 Fri, 10 Sep 2021 05:07:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 374EF18000AA; Fri, 10 Sep 2021 07:07:40 +0200 (CEST)
Date: Fri, 10 Sep 2021 07:07:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: Implementing isochronous transfers in hw/hcd-ohci.c
Message-ID: <20210910050740.pgdcwhe5scohepps@sirius.home.kraxel.org>
References: <263FF66A-21D7-4D0D-BE37-2D44B484A1EE@gmail.com>
MIME-Version: 1.0
In-Reply-To: <263FF66A-21D7-4D0D-BE37-2D44B484A1EE@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 05:06:17PM -0400, Programmingkid wrote:
> Hi Gerd,
> 
> Howard and I were talking about USB audio problems with Mac OS guests. We think the issue might be with frames being sent to the USB audio card too soon. My guess is only one frame is suppose to be transmitted every 1 millisecond. I was also reading the todo notes in the file hw/hcd-ohci.c. This is what it says:
> 
>  * TODO:
>  *  o Isochronous transfers
>  *  o Allocate bandwidth in frames properly
>  *  o Disable timers when nothing needs to be done, or remove timer usage
>  *    all together.
>  *  o BIOS work to boot from USB storage
> */
> 
> Do you think implementing isochronous transfers would fix the audio problems Mac OS guest are experiencing?

Most likely yes, audio devices typically use iso endpints.

take care,
  Gerd


