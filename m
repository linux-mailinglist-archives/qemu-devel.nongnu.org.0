Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7484865AFBB
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 11:44:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCII0-0005rp-Oz; Mon, 02 Jan 2023 05:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pCIHx-0005qL-Ep
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:43:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pCIHu-0001CO-Cp
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672656204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Gb3OBv8zRiDBF1PQdnBMksTrMqPnuXK+MHQAwH1Tts=;
 b=KSqKNS41H8GlVesN+10P5hpUyAmfVuIXM11uBRLndquzNh9R1P04mDf/8c6+Iu5N/JN1e0
 VTpUb7N0WZNIQJ2Ub13pcZzlhB/8acyy/YL0CQO4UrCmyEr8IPqnmxeM8q598jdFjsGLWK
 WJ8KA9iiM5AaGuqxbtmxd7UZPKmFv+U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-xPom7NgyO4ywvJgKbM2qeA-1; Mon, 02 Jan 2023 05:43:23 -0500
X-MC-Unique: xPom7NgyO4ywvJgKbM2qeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53A7E18E0921;
 Mon,  2 Jan 2023 10:43:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E14D22026D4B;
 Mon,  2 Jan 2023 10:43:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 99CD018003B9; Mon,  2 Jan 2023 11:43:21 +0100 (CET)
Date: Mon, 2 Jan 2023 11:43:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Minglei Liu <minglei.liu@smartx.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] usbredir: Do not detach usb if backend chardev disconnect
Message-ID: <20230102104321.4exv2ktr2cu2c7th@sirius.home.kraxel.org>
References: <20221109115619.696826-1-minglei.liu@smartx.com>
 <CAP-5UDvpgzQ32fdvTk5t95L+KZh84DonUeRygbAobmjUh8JwVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5UDvpgzQ32fdvTk5t95L+KZh84DonUeRygbAobmjUh8JwVg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 22, 2022 at 09:21:25PM +0800, Minglei Liu wrote:
> ping !
> please review this patch : [PATCH] usbredir: Do not detach usb if backend
> chardev disconnect - minglei.liu (kernel.org)
> <https://lore.kernel.org/qemu-devel/20221109115619.696826-1-minglei.liu@smartx.com/>
> 
> minglei.liu <minglei.liu@smartx.com> 于2022年11月9日周三 19:56写道：
> 
> > If the network between qemu and usbredirserver is temporarily disconnected,
> > the USB device in the VM will be unplugged. If the reconnect parameter is
> > configured for the backend chardev, the device will be reconnected later.
> > But from the inside of the VM, this USB device has experienced unplug and
> > re-plug, if the USB storage device has been mounted in the VM before,
> > the drive letter will change after the device is re-plugged.
> >
> > So in this case, we no longer unplug the device, and operations to the USB
> > is returned immediately at this point.

If you are lucky, and it also depends on the kind of device.

I don't think this is a safe thing to do in general.  You just don't
know what state the usb device is in when you are re-connecting, and
you also don't know whenever a re-connect will ever happen.

take care,
  Gerd


