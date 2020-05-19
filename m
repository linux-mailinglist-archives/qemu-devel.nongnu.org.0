Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0C41D9FBB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 20:42:11 +0200 (CEST)
Received: from localhost ([::1]:40096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb7Bq-0007hT-6b
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 14:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jb7B2-0007I7-Eg
 for qemu-devel@nongnu.org; Tue, 19 May 2020 14:41:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20787
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jb7B0-0005aH-RY
 for qemu-devel@nongnu.org; Tue, 19 May 2020 14:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589913677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ab4fbNjvWDzHIVmqT3YTn4wTIyCZOsp8UYTdGyQH4ik=;
 b=PkVdEvRW/IHIcHzHHOWm8FTipymPfD7mtjWT4EMmO8sERyBzEdeGFyXuFk3AEEJeQ1tXHq
 0FKT/ng6IWtI9aHHajecfakGByjK14Z10xDS2XRBRaiWd4XY8KCc/zn0OWoA1iavg1kdFR
 og7A21L4lFMvgP1/g+QIYotkNegvdHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-Diz2Rs7ePHeNQMbvR1DZMQ-1; Tue, 19 May 2020 14:41:12 -0400
X-MC-Unique: Diz2Rs7ePHeNQMbvR1DZMQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A86CA872FE0;
 Tue, 19 May 2020 18:41:11 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5955F5D9C5;
 Tue, 19 May 2020 18:41:08 +0000 (UTC)
Subject: Re: Question: How do I discard any changes for the device which is
 set by blockdev option?
To: Masayoshi Mizuma <msys.mizuma@gmail.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, "libvirt-list@redhat.com" <libvirt-list@redhat.com>
References: <20200519175659.4poxgjmp4xoufl7h@gabell>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <efeb1594-589b-3f0a-9295-da55f92970b2@redhat.com>
Date: Tue, 19 May 2020 13:41:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519175659.4poxgjmp4xoufl7h@gabell>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:56:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/20 12:56 PM, Masayoshi Mizuma wrote:
> Hello,
> 
> I would like to discard any changes while the qemu guest OS is done.
> I can do that with snapshot and drive option.
> However, snapshot option doesn't work for the device which set by
> blockdev option like as:
> 
> $QEMU --enable-kvm \
>        -m 1024 \
>        -nographic \
>        -serial mon:stdio \
>        -blockdev driver=file,node-name=mydisk,filename=/mnt/fedora.qcow2 \
>        -blockdev driver=qcow2,node-name=vda,file=mydisk \
>        -device virtio-blk-pci,drive=vda,bootindex=1 \
>        -snapshot
> 
> I would like to use blockdev option to set the device because
> libvirt uses blockdev option for disk element.
> 
> If there's no way to do so, does that make sense to get available
> snapshot option to blockdev as well? If that makes sense, I'll try to
> implement that.
> 
> As for qcow2, I think we can do such things to use qemu-img snapshot
> command, for example save the original image and restore the image
> after the qemu guest OS is shutdowned. However, it may be complecated
> for user. I would like the simple way like as snapshot/drive option...
> 
> If I'm missing something, let me know.
> 

Sounds like a repeat of this thread:
https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg06144.html

where the consensus is yes, -blockdev and -snapshot are incompatible, 
libvirt has plans to use the <transient/> tag to behave the same as what 
-snapshot does (but no one has implemented it yet), and in the meantime, 
it is possible to force libvirt to avoid -blockdev if you still need to 
supply -snapshot behind libvirt's back.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


