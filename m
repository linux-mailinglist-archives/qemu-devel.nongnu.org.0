Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FD0333C6F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 13:17:11 +0100 (CET)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxm2-0007tp-6q
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 07:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJxjd-0006Cg-3w
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:14:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJxja-0005QR-PC
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615378477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GMdRioU6UerZwvwJNVxrjIvUI39vUXP36ajgjTJO2o0=;
 b=gRS4RmfvwHIKaxAZGIjUX6zZv4FOLsNVROPqCFQ+u3hGcCpCri50D24N1nEWVkbkxlEHh6
 ec9FhDERD6wj59B5CSV1WdeLlM2aPJKdPSgV5O0XN8y3CI4JjerMH3i81GhU5QY9UO8X0r
 PEghogq5rS6WkYiLz7X+NBxGNPA1/xI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-tD7wRQwaNfqA-DRkBqu8xQ-1; Wed, 10 Mar 2021 07:14:36 -0500
X-MC-Unique: tD7wRQwaNfqA-DRkBqu8xQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66D931005D5B;
 Wed, 10 Mar 2021 12:14:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2709860C0F;
 Wed, 10 Mar 2021 12:14:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 38A4618000AC; Wed, 10 Mar 2021 13:14:20 +0100 (CET)
Date: Wed, 10 Mar 2021 13:14:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
Message-ID: <20210310121420.azxanmpqlqof46si@sirius.home.kraxel.org>
References: <20210309165035.967853-1-thuth@redhat.com>
 <88c7a101-7cac-ed49-c45c-11fb7d7158d8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <88c7a101-7cac-ed49-c45c-11fb7d7158d8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 06:21:03PM +0100, Paolo Bonzini wrote:
> On 09/03/21 17:50, Thomas Huth wrote:
> > +``-usbdevice audio`` (removed in 6.0)
> > +'''''''''''''''''''''''''''''''''''''
> > +
> > +This option lacked the possibility to specify an audio backend device.
> > +Use ``-device usb-audio`` now instead (and specify a corresponding USB
> > +host controller if necessary).
> 
> Perhaps "a corresponding USB host controller or ``-usb``.  No need to send
> v3 if you send it through your own pull request.

Fixed & added to usb queue.

thanks,
  Gerd


