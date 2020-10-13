Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10FD28C58C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 02:09:50 +0200 (CEST)
Received: from localhost ([::1]:54334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS7sz-0001AN-VB
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 20:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kS7sI-0000kJ-03
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 20:09:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kS7sG-0002NL-BF
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 20:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602547743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAP1T1JAnG2HJETBGKHtI+zO8NC5NvDJAklkJA95KlI=;
 b=ArQzbOgJaZA5ABYdXmcW9O2hcHC3XS6KfBQVtYCCzNiuKGJEKSRFKAuIf/h/Wi73u9g3HD
 iKiUUpxbhFxyjZ69nGvdJW5rOjsbUq0MZPyLNtQrUymkbISKFlHVWqLuhE4boTqm17aWaY
 YUmXkGPKkBV9ezrmSrxTxMVHaI9c23E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-XEu3x5wSOryDNKrHD3xpGA-1; Mon, 12 Oct 2020 20:08:59 -0400
X-MC-Unique: XEu3x5wSOryDNKrHD3xpGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4CE71018F63;
 Tue, 13 Oct 2020 00:08:57 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B0B65C269;
 Tue, 13 Oct 2020 00:08:56 +0000 (UTC)
Subject: Re: [PATCH v3 RESEND] fcntl: Add 32bit filesystem mode
To: Linus Walleij <linus.walleij@linaro.org>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>
References: <20201012220620.124408-1-linus.walleij@linaro.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e395753a-115c-57d1-4312-b28e5f0d6ebf@redhat.com>
Date: Mon, 12 Oct 2020 19:08:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201012220620.124408-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org, Florian Weimer <fw@deneb.enyo.de>,
 Andy Lutomirski <luto@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 5:06 PM, Linus Walleij wrote:
> It was brought to my attention that this bug from 2018 was
> still unresolved: 32 bit emulators like QEMU were given
> 64 bit hashes when running 32 bit emulation on 64 bit systems.
> 
> This adds a flag to the fcntl() F_GETFD and F_SETFD operations
> to set the underlying filesystem into 32bit mode even if the
> file handle was opened using 64bit mode without the compat
> syscalls.
> 
> Programs that need the 32 bit file system behavior need to
> issue a fcntl() system call such as in this example:
> 
>    #define FD_32BIT_MODE 2
> 
>    int main(int argc, char** argv) {
>      DIR* dir;
>      int err;
>      int fd;
> 
>      dir = opendir("/boot");
>      fd = dirfd(dir);
>      err = fcntl(fd, F_SETFD, FD_32BIT_MODE);

This is a blind set, and wipes out FD_CLOEXEC. Better would be to do a 
proper demonstration of the read-modify-write with F_GETFD that portable 
programs will have to use in practice.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


