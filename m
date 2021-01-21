Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA852FF1B1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:22:06 +0100 (CET)
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2den-0006UR-LR
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2dQw-0001d4-OO
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:07:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2dQr-0001xD-TX
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611248861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SQ+6olHgKnKPE6DnDxzxSB+lZZcmOgzms78hUwejSA=;
 b=gpn9XCGk1OinR16ROHZRMxo1KVwrXwhBV33reE8xAIDKecy4bAxiGnIbO0HfMH4ZGt6Knt
 PIHlx+VdBUB6MbBEMW5jNrFgRAlpF3hEpQvTjfIA6BwnlpkfPlVxLJVXS6HjYCWzd04dWV
 JYdYar8wt6AqR0A8iNzMyoPYpoewupQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-f8gIAlHqPUat8ma6DwWtQA-1; Thu, 21 Jan 2021 12:07:39 -0500
X-MC-Unique: f8gIAlHqPUat8ma6DwWtQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F5B284E24F;
 Thu, 21 Jan 2021 17:07:38 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-169.ams2.redhat.com
 [10.36.115.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA6FD5D9DD;
 Thu, 21 Jan 2021 17:07:26 +0000 (UTC)
Subject: Re: [PATCH] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
To: Alex Xu <alex@alxu.ca>, qemu-devel@nongnu.org
References: <20210121144429.58885-1-stefanha@redhat.com>
 <f5fc73e5-334e-c1ef-3982-227715efc26b@redhat.com>
 <1611243688.4854bsewsj.none@localhost>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <8d4f7c40-95c7-feed-1744-73ca2349c1f2@redhat.com>
Date: Thu, 21 Jan 2021 18:07:26 +0100
MIME-Version: 1.0
In-Reply-To: <1611243688.4854bsewsj.none@localhost>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: mszeredi@redhat.com, slp@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, P J P <ppandit@redhat.com>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/21/21 16:52, Alex Xu wrote:
> Excerpts from Laszlo Ersek's message of January 21, 2021 10:32 am:
>> Assuming a benign / trusted guest, is there going to be an override for
>> this?
>>
>> Asked differently -- if we don't want to set up a separate block device
>> on the host, to contain the filesystem that is mounted as the shared
>> directory, can unionfs (?) / overlayfs be used to re-mount an existent
>> host-side directory as the shared directory, but with
>> "noexec,nosuid,nodev" *bolted-on*?
>>
>> If people have to create separate block devices (on the host side) for
>> innocent use cases such as running tests in a trusted guest, that's not
>> going to qualify as "usability progress" relative to having a qcow2 (or
>> raw) image file.
>>
>> "nodev,nosuid" is kind of a no-brainer for any host-side *data* volume
>> anyway (such as the one underlying "/home", even), so I don't see those
>> options as a challenge. But "noexec" is different.
>>
>> Thanks,
>> Laszlo
> 
> On Linux, there are two types of mount options: per-superblock, and 
> per-point. Most filesystem-specific options are per-superblock, and 
> apply to all mounts of that device. noexec, nosuid, and nodev are 
> per-mount options, and apply individually to each mount, bind or 
> otherwise, of a given device. Bind mounts copy the parent per-mount 
> options, but can be individually altered. Note also that it is not 
> required to create a new location for a bind mount.
> 
> For example, invoking:
> 
> mount --bind -o noexec,nosuid,nodev /var/lib/vms/source1 /var/lib/vms/source1
> 
> would effectively secure a source directory. This can also be inserted 
> in /etc/fstab, such as:
> 
> /var/lib/vms/source1 /var/lib/vms/source1 none bind,noexec,nosuid,nodev 0 0
> 
> Note that, as explained in Stefan's initial email, this hides any 
> submounts below source. Each of those must be individually protected, 
> either by initially mounting with the security options or by creating a 
> new bind mount as above. Although these cases should be infrequent, they 
> are common enough that Stefan and I think that they should be supported, 
> or at the very least not silently behave in unexpected or insecure ways.
> 
> Additionally, while it's possible to use overlayfs for this purpose, 
> it's overkill, and as far as I understand, doesn't solve the problem of 
> hiding sub-mounts.

Awesome, this is the best answer I could possibly get. Thank you!
Laszlo


