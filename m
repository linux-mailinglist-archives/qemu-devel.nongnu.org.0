Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59233278968
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 15:23:02 +0200 (CEST)
Received: from localhost ([::1]:41210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLngj-0004es-E9
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 09:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kLna2-0005Jz-A8
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:16:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kLna0-0004R3-BF
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:16:05 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601039763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nBmyhzNnhDBnIhdj903UpYR3zTgYFKYFjQqwYt5dJOQ=;
 b=K9lyV6GagDPWNgnDTzGzlz7GFm4k4pJYx0iAgUfr1e9Ntb4kqfr+dSGaVKyWNqQ1NDJlpv
 cZlzk8KgHMv19yMihGSqljPZhqbuksOTn4jSlvYHrr1G79vBLKGbpmc5+fjdvrJSKD2U3h
 hb754riazAFkvn7gh0U6hi9kZQcbz9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-o3vX4a0tNlKIXJyX9cKPIg-1; Fri, 25 Sep 2020 09:16:00 -0400
X-MC-Unique: o3vX4a0tNlKIXJyX9cKPIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD0FD10BBED4;
 Fri, 25 Sep 2020 13:15:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-70.ams2.redhat.com
 [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9769C73667;
 Fri, 25 Sep 2020 13:15:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 23856113865F; Fri, 25 Sep 2020 15:15:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 28/38] qapi/gen.py: update write() to be more idiomatic
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-29-jsnow@redhat.com>
 <20200923152624.GO3312949@habkost.net>
 <c0b8ed9e-c66a-a6fa-43e1-c3c61581d928@redhat.com>
 <20200924155959.GC191229@localhost.localdomain>
Date: Fri, 25 Sep 2020 15:15:57 +0200
In-Reply-To: <20200924155959.GC191229@localhost.localdomain> (Cleber Rosa's
 message of "Thu, 24 Sep 2020 11:59:59 -0400")
Message-ID: <87r1qqro8i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 01:07:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleber Rosa <crosa@redhat.com> writes:

> On Wed, Sep 23, 2020 at 02:37:27PM -0400, John Snow wrote:
>> On 9/23/20 11:26 AM, Eduardo Habkost wrote:
>> > On Tue, Sep 22, 2020 at 05:00:51PM -0400, John Snow wrote:
>> > > Make the file handling here just a tiny bit more idiomatic.
>> > > (I realize this is heavily subjective.)
>> > > 
>> > > Use exist_ok=True for os.makedirs and remove the exception,
>> > > use fdopen() to wrap the file descriptor in a File-like object,
>> > > and use a context manager for managing the file pointer.
>> > > 
>> > > Signed-off-by: John Snow <jsnow@redhat.com>
>> > 
>> > Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> > 
>> > I really miss a comment below explaining why we use
>> > open(os.open(pathname, ...), ...) instead of open(pathname, ...).

This code:

        fd = os.open(pathname, os.O_RDWR | os.O_CREAT, 0o666)
        f = open(fd, 'r+', encoding='utf-8')

>> Not known to me. It was introduced in 907b846653 as part of an effort to
>> reduce rebuild times. Maybe this avoids a modification time change if the
>> file already exists?
>> 
>> Markus?
>
> AFACIT the change on 907b846653 is effective because of the "is new
> text different from old text?" conditional.  I can not see how the
> separate/duplicate open/fdopen would contribute to that.
>
> But, let's hear from Markus.

This was my best attempt to open the file read/write, creating it if it
doesn't exist.

Plain

        f = open(pathname, "r+", encoding='utf-8')

fails instead of creates, and

        f = open(pathname, "w+", encoding='utf-8')

truncates.

If you know a better way, tell me!


