Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CC53B1D18
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:03:38 +0200 (CEST)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4Ph-0006ew-Kx
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lw4Nq-0004Jl-Mo
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lw4Nm-0004Yc-2B
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMoUgppo3jtN9UoOtg3B425DtlhLqHPecRmZNXG9llM=;
 b=DcaTHkTedn0wsuhmrxMncuCmiiBF+9E3Z+jNeOwQgYulqU//ro78L7sU7x1T1eJPZaOM3v
 v4ojBiWyYBh0fxFJTxR9tTtU3f7MU+2pZwLd4F6mcE2/A7fH3k5R2fgvJsyQRYY1zhuZ1l
 zkfVa2f2rM8eD5qbVkViKWj0YPftVPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-BorsPy8dOriavCGcdK-KrA-1; Wed, 23 Jun 2021 11:01:32 -0400
X-MC-Unique: BorsPy8dOriavCGcdK-KrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8432D80430B
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 15:01:31 +0000 (UTC)
Received: from [10.10.118.71] (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FE7C2C016;
 Wed, 23 Jun 2021 15:01:30 +0000 (UTC)
Subject: Re: Auditing QEMU to replace NULL with &error_abort
To: Markus Armbruster <armbru@redhat.com>
References: <7132e6a4-8d3a-828e-1c08-b17954445341@redhat.com>
 <87k0mk4vyg.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <c3fca4e4-52b6-15f0-5de4-7a1109cc3bc3@redhat.com>
Date: Wed, 23 Jun 2021 11:01:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87k0mk4vyg.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 8:16 AM, Markus Armbruster wrote:
> Nevertheless, I'm reluctant to add more differeneces.  That's not a
> "no".  It's a "you need to make a compelling case".

I'm not sure it's my case to make; I believe you are the authority in 
this matter so the work should be defined in terms of what you are 
prepared to accept.

I'm not sure there's a better argument for &error_ignore beyond "It's 
easy to audit", but I find that to be a compelling one especially where 
new contributors are concerned.

If we still wanted to move back to glib (which seems unlikely) replacing 
&error_ignore by NULL seems like a trivial thing to do. Your call.

--js


