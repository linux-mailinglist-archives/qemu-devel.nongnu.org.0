Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6B8212B59
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 19:35:49 +0200 (CEST)
Received: from localhost ([::1]:57058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr37k-0000Rb-QR
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 13:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jr36y-0008Si-Vj
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 13:35:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40470
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jr36x-0005OQ-Eb
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 13:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593711298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9YNmg/mFKu7luS99ZFfFPg7Kb+7UQzf5+JxwHDHkkmo=;
 b=RDNjLjazEc1U+GJsHbPnpnuXNC5nRgjgSogk+IorEeaJfqcJKKv0q4bfeex4jufE2rLSE9
 8SxhdSKqjIsbDqbXSVyz0L7lzC70e7e+JZDv0KUDFlyotqpSD1mAHCoAHGFolSicw7zOv0
 SVM5GSqXuoFgWadmPPQ6RLKoliL2eYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-RBB11cMyPtKDmUAhzB-bkA-1; Thu, 02 Jul 2020 13:34:57 -0400
X-MC-Unique: RBB11cMyPtKDmUAhzB-bkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18D07800C64;
 Thu,  2 Jul 2020 17:34:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-212.ams2.redhat.com [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F4B277899;
 Thu,  2 Jul 2020 17:34:55 +0000 (UTC)
Subject: Re: [PATCH] configure / util: Auto-detect the availability of
 openpty()
To: Michele Denber <denber@mindspring.com>
References: <20200702143955.678-1-thuth@redhat.com>
 <5EFE07BC.6040407@mindspring.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1e699fdc-639e-ef8a-313f-7e665cad868c@redhat.com>
Date: Thu, 2 Jul 2020 19:34:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5EFE07BC.6040407@mindspring.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Tribble <peter.tribble@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/07/2020 18.13, Michele Denber wrote:
> 
> 
> On 07/02/20 10:39, Thomas Huth wrote:
>> Recent versions of Solaris (v11.4) now feature an openpty() function,
>> too, causing a build failure since we ship our own implementation of
>> openpty() for Solaris in util/qemu-openpty.c so far. Since there are
>> now both variants available in the wild, with and without this function,
>> let's introduce a proper HAVE_OPENPTY define for this to fix the build
>> failure.
>>
>> Signed-off-by: Thomas Huth<thuth@redhat.com>
>> ---
>>   Note: Untested, since I do not have a VM with Solaris. Michele,
>>   Peter, I'd really appreciate a "Tested-by:" from you here. Thanks!
> Sorry, I was off on another project (doing my taxes).  Is this patch 
> missing something?  It looks like there should be more.  The last line is
> 
> static void cfmakeraw (struct termios *termios_p) {
> 
> with no matching "}".

That's just the context, cut at three lines after the last change. 
Simply try to apply the patch with "patch -p1 -i ..." or "git am" in a 
separate git branch if you're using git. It should hopefully apply cleanly.

  Thomas


