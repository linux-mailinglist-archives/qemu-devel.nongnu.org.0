Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DAB4C27FC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:21:34 +0100 (CET)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNAJY-0007sf-Su
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:21:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNACW-00042h-Qm
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:14:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNACU-0004CT-Ni
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645694054;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgJ4B3tz34s1Tb6GnQ2bOiBejJPhkPVbk2qDRyrEfYw=;
 b=HOI8s1dqZ502tuaoLUhskQ96hnmt7CpxHdWCVxYED6UFAQ/e0qq1JuDXcG84jDCxKqCoQW
 UsiHv7hfGE/JGYi9BZOnl8ea59oXRnouYAaatlMw7/MfLuDD7Mwmz+IbWNT8scRPjjZTpO
 iCGkWZVC1fTxxT5ot0IJl21CnOJH49M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-WH_VZA4xNQ2c5RscVkDWtQ-1; Thu, 24 Feb 2022 04:14:11 -0500
X-MC-Unique: WH_VZA4xNQ2c5RscVkDWtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF4F71091DA4;
 Thu, 24 Feb 2022 09:14:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A1527FA2F;
 Thu, 24 Feb 2022 09:13:46 +0000 (UTC)
Date: Thu, 24 Feb 2022 09:13:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH] vl: transform QemuOpts device to JSON syntax device
Message-ID: <YhdMRTUvz6PpkIG2@redhat.com>
References: <20220224060653.74229-1-zhenzhong.duan@intel.com>
 <YhdJik/u1TOUCXsU@redhat.com> <YhdLT7gtPNjYfB6C@angien.pipo.sk>
MIME-Version: 1.0
In-Reply-To: <YhdLT7gtPNjYfB6C@angien.pipo.sk>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, mst@redhat.com, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 qemu-devel@nongnu.org, eblake@redhat.com, pbonzini@redhat.com,
 lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 10:09:35AM +0100, Peter Krempa wrote:
> On Thu, Feb 24, 2022 at 09:02:02 +0000, Daniel P. Berrangé wrote:
> > On Thu, Feb 24, 2022 at 02:06:53PM +0800, Zhenzhong Duan wrote:
> > > While there are mixed use of traditional -device option and JSON
> > > syntax option, QEMU reports conflict, e.x:
> > > 
> > > /usr/libexec/qemu-kvm -nodefaults \
> > >   -device '{"driver":"virtio-scsi-pci","id":"scsi0","bus":"pci.0","addr":"0x02.0"}' \
> > >   -device virtio-scsi-pci,id=scsi1,bus=pci.0
> > 
> > Why are you attempting to mix JSON and non-JSON syntax at the same
> > time ? The expectation is that any mgmt app adopting JSON syntax
> > will do so universally and not mix old and new syntax. So in practice
> > the scenario above is not one that QEMU ever intended to have used
> > by apps.
> 
> Based on the previous post they are using some 'qemu:commandline'
> overrides with the legacy syntax with new libvirt which uses JSON
> syntax:
> 
> <qemu:commandline>
>   <qemu:arg value='-netdev'/>
>     <qemu:arg value='user,id=mynet0,hostfwd=tcp::44483-:22'/>
>     <qemu:arg value='-device'/>
>   <qemu:arg value='virtio-net-pci,netdev=mynet0,mac=00:16:3E:68:00:10,romfile='/>
> </qemu:commandline>
> 
> I suggested that they should add the required functionality to libvirt
> instead of trying to hack qemu:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg05068.html

Or the other answer is to switch to use JSON syntax in the above command
line passthrough config.

Or to specify the PCI address so it doesn't clash with other devices
already present.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


