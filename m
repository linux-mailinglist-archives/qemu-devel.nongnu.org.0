Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDB13282D2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:52:18 +0100 (CET)
Received: from localhost ([::1]:46904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGkqH-0006y2-Hk
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lGko6-0005t0-4J
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:50:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lGko3-0001QI-Ls
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:50:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614613796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1TepUgexujrGnyNMcpL0PysLa3n1cwp1PLb9OZS+I8=;
 b=SjCaFxRz3bF3vGrtX8lfLIqop7yMm/uSuxb2uX4aONLrxkgnVboA2EYs1bjEmh+siocxKC
 0Ft/sXP4OqWlR2viVoKPXj/GknDO2MZ1pQNGM9dSK23gNPhXgoZeg6I64VXq8AHaJujC3x
 8+0V/QHtFPVjTKiI9O+UUSg7QxNQDhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-CUWH6xRHNI2IQeJsDaYx_g-1; Mon, 01 Mar 2021 10:49:49 -0500
X-MC-Unique: CUWH6xRHNI2IQeJsDaYx_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40389808B4;
 Mon,  1 Mar 2021 15:49:22 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D197160636;
 Mon,  1 Mar 2021 15:49:21 +0000 (UTC)
Subject: Re: [PATCH] docs: show how to spawn qemu-storage-daemon with fd
 passing
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210301153159.35660-1-stefanha@redhat.com>
 <YD0LQ3fDG6t2VRG4@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5b86b310-8e3b-8bb6-365c-a73b0f2843be@redhat.com>
Date: Mon, 1 Mar 2021 09:49:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YD0LQ3fDG6t2VRG4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 9:41 AM, Daniel P. Berrangé wrote:
> On Mon, Mar 01, 2021 at 03:31:59PM +0000, Stefan Hajnoczi wrote:
>> The QMP monitor, NBD server, and vhost-user-blk export all support file
>> descriptor passing. This is a useful technique because it allows the
>> parent process to spawn and wait for qemu-storage-daemon without busy
>> waiting, which may delay startup due to arbitrary sleep() calls.
>>
>> This Python example is inspired by the test case written for libnbd by
>> Richard W.M. Jones <rjones@redhat.com>:
>> https://gitlab.com/nbdkit/libnbd/-/commit/89113f484effb0e6c322314ba75c1cbe07a04543
>>
>> Thanks to Daniel P. Berrangé <berrange@redhat.com> for suggestions on
>> how to get this working. Now let's document it!
>>

>> +  sock_path = '/tmp/qmp-{}.sock'.format(os.getpid())
> 
> Example code inevitably gets cut+paste into real world apps, and this
> example is a tmpfile CVE flaw. At least put it in $CWD instead.

Except $CWD may be too long for a sock file name to be created.
Creating the sock in a securely-created subdirectory of /tmp is more
reliable.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


