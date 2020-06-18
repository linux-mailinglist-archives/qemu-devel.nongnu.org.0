Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134341FE943
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 05:12:01 +0200 (CEST)
Received: from localhost ([::1]:52320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlky8-0006BS-5Y
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 23:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@hostfission.com>)
 id 1jlkxM-0005kx-HO
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 23:11:12 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:45950)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1jlkxK-00075k-MG
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 23:11:12 -0400
Received: from www1.hostfission.com (www1.hostfission.com [139.99.139.52])
 by mail1.hostfission.com (Postfix) with ESMTP id CADF7449B2;
 Thu, 18 Jun 2020 13:11:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1592449863;
 bh=phj0rmn5ezmWaD0XjTglz0X83yUu9rhSJO9KjKOXo4w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eOm89WSrtL01IsT3axoQfmJl2EDfAAIRVUuTUTD7dtOokugLbE83YXXJSCyfyHo3y
 IqRUctzX02fYUT8MZaYN93IzJBm7hR/UAxh1kSKsI8vkiCACUB8FnuwGehK7T+Sz4J
 /TZma9hejei1qylDPspZDIEBqf8SjdTU7wd14IpA=
Received: from mail.hostfission.com (www1.hostfission.com [127.0.0.1])
 by www1.hostfission.com (Postfix) with ESMTP id B94DC5FB;
 Thu, 18 Jun 2020 13:11:03 +1000 (AEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 18 Jun 2020 13:11:03 +1000
From: Geoffrey McRae <geoff@hostfission.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 5/6] audio/jack: honour the enable state of the audio
 device
In-Reply-To: <20200617124406.7dgne73ttfhgkj3x@sirius.home.kraxel.org>
References: <20200613040518.38172-1-geoff@hostfission.com>
 <20200613040518.38172-6-geoff@hostfission.com>
 <20200617124406.7dgne73ttfhgkj3x@sirius.home.kraxel.org>
Message-ID: <a08a08cc6735d2fb2ba07145befc64c3@hostfission.com>
X-Sender: geoff@hostfission.com
User-Agent: Roundcube Webmail/1.3.8
Received-SPF: pass client-ip=139.99.139.48; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 23:11:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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



On 2020-06-17 22:44, Gerd Hoffmann wrote:
> On Sat, Jun 13, 2020 at 02:05:17PM +1000, Geoffrey McRae wrote:
>> When the guest closes the audio device we must start dropping input
>> samples from JACK and zeroing the output buffer samples. Failure to do
>> so causes sound artifacts during operations such as guest OS reboot, 
>> and
>> causes a hang of the input pipeline breaking it until QEMU is 
>> restated.
>> 
>> Closing and reconnecting to JACK was tested during these 
>> enable/disable
>> calls which works well for Linux guests, however Windows re-opens the
>> audio hardware repeatedly even when doing simple tasks like playing a
>> system sounds. As such it was decided it is better to feed silence to
>> JACK while the device is disabled.
> 
> Hmm, I guess feeding silence into jack needs some cpu cycles?
> Maybe add a timer to close the jack server connection?  Keep the
> connection open for re-use for a while, but in case the guest stops
> playing sound altogether close the jack connection after being unused
> for a few minutes?
> 
> [ Doesn't render the patch invalid, consider it a suggestion for future
>   improvements ]

Thanks, I had considered that however there is a usability issue to 
consider. Each time a jack client registers, it removes the client 
entirely and disconnects any custom plumbing that may have been done by 
the user. JACK does not remember this custom routing and as such it's 
lost until the user re-establishes it, or they have some automation set 
up to do it. While this could likely be worked around, it would likely 
cause more headaches then the few CPU cycles lost in a memset.

Further to this, while I have added some automation to connect ports via 
regex matching, this is likely not going to be used by many as it's not 
the normal method of connecting things up. This was added to open up 
this for general use for those that don't care for custom filters but 
just want the reliable audio interface.

> 
> take care,
>   Gerd

