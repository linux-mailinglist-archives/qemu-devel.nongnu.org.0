Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC533839FB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:33:38 +0200 (CEST)
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligBV-0004mT-9e
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lifqS-0001dt-Mg
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:11:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lifqQ-0006nB-2B
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621267909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agvP28OISJkeQaUrCI+Gyd/V/YxDLifi0hZ2xE18N1s=;
 b=NWgv+prg/219f/RyV3k0yBzxO3/WWh0OJeKyART5+NelUDVixrDfganwApnbUTqNzSKisK
 RA174ZAGSj37Ld+YAZBQTKuWh+nUsXAO38ZlRC8XJY8x7pObV6D9vRD5FmF/VIERSxbD9l
 Ctu6L5od1LK/zoVZ7CCbKmBZOwAMAjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-Hoq_yOgVMAmfvI1PqCjXYA-1; Mon, 17 May 2021 12:11:45 -0400
X-MC-Unique: Hoq_yOgVMAmfvI1PqCjXYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACC2B8015F5;
 Mon, 17 May 2021 16:11:44 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AD302B6FA;
 Mon, 17 May 2021 16:11:43 +0000 (UTC)
Subject: Re: [PATCH 00/10] Python: delint iotests, machine.py and
 console_socket.py
To: qemu-devel@nongnu.org
References: <20210512214642.2803189-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <c88b2878-fb79-7382-81c6-ea764d7f3ada@redhat.com>
Date: Mon, 17 May 2021 12:11:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512214642.2803189-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 5:46 PM, John Snow wrote:
> gitlab CI: https://gitlab.com/jsnow/qemu/-/pipelines/301924893
> branch: https://gitlab.com/jsnow/qemu/-/commits/python-package-pre-cleanup
> 
> This series serves as a pre-requisite for packaging the python series
> and getting the linters running via CI. The first patch fixes a linter
> error we've had for a while now; the subsequent 9 fix a new warning that
> was recently added to pylint 2.8.x.
> 
> If there's nobody opposed, I'll take it through my Python queue,
> including the iotests bits.
> 
> John Snow (10):
>    python/console_socket: avoid one-letter variable
>    python/machine: use subprocess.DEVNULL instead of
>      open(os.path.devnull)
>    python/machine: use subprocess.run instead of subprocess.Popen
>    python/console_socket: Add a pylint ignore
>    python/machine: Disable pylint warning for open() in _pre_launch
>    python/machine: disable warning for Popen in _launch()
>    iotests: use subprocess.run where possible
>    iotests: use 'with open()' where applicable
>    iotests: silence spurious consider-using-with warnings
>    iotests: ensure that QemuIoInteractive definitely closes
> 
>   python/qemu/console_socket.py    | 11 ++++---
>   python/qemu/machine.py           | 28 ++++++++++------
>   tests/qemu-iotests/iotests.py    | 55 +++++++++++++++++++-------------
>   tests/qemu-iotests/testrunner.py |  1 +
>   4 files changed, 57 insertions(+), 38 deletions(-)
> 

The iotests stuff was handled by Emanuele Giuseppe Esposito instead, and 
-- I must admit -- better than I did. Dropping patches 7-10.

--js


