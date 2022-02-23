Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8A94C120B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 12:57:27 +0100 (CET)
Received: from localhost ([::1]:44220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMqGs-0002C6-Hj
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 06:57:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nMqEs-00009S-P5
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:55:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nMqEr-0006df-0K
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645617319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Ee3ews6J+vbHexNZ/FlowaEO378+WDoMvKkWgD05cE=;
 b=gOZkK7NxUZvx2wztVdyoUrkVWIfB8rsNN0wtpkDT5D9Rs14lmtdSagcUbfqpbhyNNo/clQ
 ZQ1zNiIc1IpoXaJ5FLJOYOSBFvj5v6lmBtYJRxj/0jnWA8JhlVOKZnZCO+rL5by5R9KRxD
 Tklq7CJ4ieHX37KlklSO6Wb3durMASk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-jvOLcGmaNmuRL2PE9ICMTA-1; Wed, 23 Feb 2022 06:55:16 -0500
X-MC-Unique: jvOLcGmaNmuRL2PE9ICMTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C0071854E21;
 Wed, 23 Feb 2022 11:55:15 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7B883280;
 Wed, 23 Feb 2022 11:55:14 +0000 (UTC)
Date: Wed, 23 Feb 2022 12:55:11 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: Re: [PATCH] qdev: move legacy cli device creation after JSON syntax
 ones
Message-ID: <YhYgn4Sa5XeDTpnf@angien.pipo.sk>
References: <20220223094649.64566-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220223094649.64566-1-zhenzhong.duan@intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 17:46:49 +0800, Zhenzhong Duan wrote:
> While libvirt does not support all the qemu parameters in standand
> xml syntax, such as hostfwd. We have to use <qemu:commandline> to
> passthrough the parameters. E.x:
> 
> <qemu:commandline>
>   <qemu:arg value='-netdev'/>
>     <qemu:arg value='user,id=mynet0,hostfwd=tcp::44483-:22'/>
>     <qemu:arg value='-device'/>
>   <qemu:arg value='virtio-net-pci,netdev=mynet0,mac=00:16:3E:68:00:10,romfile='/>
> </qemu:commandline>
> 
> Then we got below error:
> 
> qemu-system-x86_64: -device {"driver":"pcie-root-port","port":8,"chassis":1,"id":"pci.1","bus":"pcie.0","multifunction":true,"addr":"0x1"}: PCI: slot 1 function 0 not available for pcie-root-port, in use by virtio-net-pci
> 
> Libvirt generates qemu "-device" in JSON syntax followed by the
> passthroughed "-device" in legacy syntax. But legacy syntax
> described devices are assigned BDF first, this leads to conflict
> with the pci devices in JSON syntax with fixed BDF.
> 
> Move legacy syntax described device creation after JSON syntax
> described ones so we can start that kind of VM successfully in
> libvirt.

As a libvirt developer I strongly suggest you post patches for your use
case to libvirt rather than trying to go behind our back with the
commandline passthrough.


