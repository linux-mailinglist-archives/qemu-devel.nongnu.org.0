Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B322D2E1F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:23:32 +0100 (CET)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmepv-00024Z-Mj
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmee6-0000iG-90
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:11:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kmee3-0006UV-1K
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607440272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5O7leiP6WkAn+S4+7EJ0MxnZXqhGLLu0u+F/gn1Bh+c=;
 b=L46Wgg6Gs/SNCH37YRRHD5fMIAa8G4dIjp7sxthBDPfyg5cic6OUSaLtkZAhvFAkETz717
 aCe4FGgaUkXKag+7uy2Mq+UJUze/sKpitS9/mg+xKkJ/8i836bxbsEp1Zq5JolUMJyBq1d
 9hjt639iOtoWQNOm7/gICdnM5WHFQEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-PlnPngLaMQe1Kz8ES4SGLw-1; Tue, 08 Dec 2020 10:11:11 -0500
X-MC-Unique: PlnPngLaMQe1Kz8ES4SGLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F1A9E6222;
 Tue,  8 Dec 2020 15:09:13 +0000 (UTC)
Received: from [10.10.116.117] (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7E9F60636;
 Tue,  8 Dec 2020 15:09:11 +0000 (UTC)
Subject: Re: [RFC PATCH] python: add __repr__ to ConsoleSocket to aid debugging
To: Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201207200737.5090-1-alex.bennee@linaro.org>
 <CAKJDGDbdHXPAKUXpJFXufs6ip0LNikacvBstdyxr4v3kv8ox=w@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <c615c623-61d1-4b8d-495d-0c4568471687@redhat.com>
Date: Tue, 8 Dec 2020 10:09:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDbdHXPAKUXpJFXufs6ip0LNikacvBstdyxr4v3kv8ox=w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 4:35 PM, Willian Rampazzo wrote:
> We could use something more pythonic for this file. Instead of 3
> string concatenations, my suggestion is to go with string formatting,
> like:
> 
> s = "%s,  logfile=%s, drain_thread=%s>" % (s, self._logfile, self._drain_thread)
> 
> As str is immutable in Python, it avoids unnecessary copies.

Sure, this is fine too. I'm not too worried about performance of 
debugging methods.

Alex, use your own discretion -- feel free to keep my RB/ACK and merge 
alongside your other tests when ready. Thanks!

--js


