Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E52559849
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 13:02:37 +0200 (CEST)
Received: from localhost ([::1]:60328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4h59-0002ni-MW
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 07:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1o4h2T-00019Q-VW
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:59:50 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:36704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1o4h2K-0007gq-UT
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:59:43 -0400
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 13F742E1EB0;
 Fri, 24 Jun 2022 13:59:26 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Ocf7GKw7NJ-xPJ0OYGk; Fri, 24 Jun 2022 13:59:26 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1656068366; bh=71WVtRDHWw5x11GNXsHhhn6COe+AVvior8lMOvfij4c=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=xazIzna+rKZglMQsOiMV4STp8Z1+oit8wCPu2jpBTgG265tgFq1f0LBqcyHaWwINH
 7YYyQIVG1BF/S20zXCAzyaPgNIY2spBtxiOOQoI8LRwp6mrAT6luQgtLg9AETggo47
 JTsBx16XxSbX+hCWJd+ALZB10QHLXUAUgQE5xPmw=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Received: from [IPV6:2a02:6b8:0:107:3e85:844d:5b1d:60a] (unknown
 [2a02:6b8:0:107:3e85:844d:5b1d:60a])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 mtidUC2ZyC-xPMW0Q3s; Fri, 24 Jun 2022 13:59:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <83350578-69d7-2b17-6aa1-4faf7f51b3f3@yandex-team.com>
Date: Fri, 24 Jun 2022 14:00:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] chardev: don't set O_NONBLOCK on SCM_RIGHTS file
 descriptors.
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, yc-core@yandex-team.ru
References: <20220614111843.24960-1-arbn@yandex-team.com>
 <20220614111843.24960-2-arbn@yandex-team.com>
 <Yqna2umG17+Q73z3@stefanha-x1.localdomain>
From: Andrey Ryabinin <arbn@yandex-team.com>
In-Reply-To: <Yqna2umG17+Q73z3@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=arbn@yandex-team.com; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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



On 6/15/22 16:12, Stefan Hajnoczi wrote:
> On Tue, Jun 14, 2022 at 02:18:42PM +0300, Andrey Ryabinin wrote:
>> This reverts commit 9b938c7262e4 ("chardev: clear O_NONBLOCK on SCM_RIGHTS file descriptors").
>> File descriptor passed to QEMU via 'getfd' QMP command always
>> changed to blocking mode. Instead of that, change blocking mode by QEMU
>> file descriptors users when necessary, e.g. like migration.
>>
>> We need to preserve the state of the file descriptor in case it's still
>> used by an external process and before the QEMU itself started
>> using it.
>>
>> E.g. our local migration scenario with TAP networking looks like this:
>>  1. Create TAP devices and pass file descriptors to source QEMU
>>  2. Launch destination QEMU (-incoming defer) and pass same descriptors to it.
>>  3. Start migration
>>
>> In such scenario setting blocking state at stage (2) will hang source QEMU
>> since TAP fd suddenly become blocking.
> 
> Is it possible to add a special flag or API for preserving the
> O_NONBLOCK open flag? That way the rest of QEMU could continue to safely
> reset the flag while the tap fd passing code would explicitly ask for
> the O_NONBLOCK open flag to be preserved. That seems safer but I haven't
> checked whether it's possible to do this.
> 

The only possibility I see here is embedding some kind 'nonblock' in the message
itself along with fds. Not sure if this sensible approach.

Not changing fd state seems like more correct approach to me. E.g. I would expect
that sending fd to qemu and executing qmp commands 'getfd' & 'closefd' shouldn't
induce any changes in fd state. Which is currently no true.

