Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7B631C29B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:44:47 +0100 (CET)
Received: from localhost ([::1]:47266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBjna-00026i-Nl
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:44:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBjmr-0001hI-71
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:44:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBjmo-0004tf-3h
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613418236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qsk7h4T0g1t96UzrWXwC1LH/RSXtVd9HGazNQDwWV+s=;
 b=buOSypHZV1LdTsJn7rvdXqc5+kUBD/dOQTnpr1yljUYJprfAj1hOMskx2aqH07AccvKAme
 c3aSmj6RwAs9UsNZDaPqcUuFJt0SiuO8j72so/axKGqLaYFcx5uza12nxkuDwK37YPO569
 2wmJom2eAovSpF5WT6EtQlQCckqG5rs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-_LJxaEwCM-ySKvk-W8BZew-1; Mon, 15 Feb 2021 14:43:54 -0500
X-MC-Unique: _LJxaEwCM-ySKvk-W8BZew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8206107ACE3;
 Mon, 15 Feb 2021 19:43:52 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DBF160CEF;
 Mon, 15 Feb 2021 19:43:43 +0000 (UTC)
Subject: Re: [PATCH 10/22] Python: add utility function for retrieving port
 redirection
To: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-11-crosa@redhat.com>
 <4d848476-c5b4-2fd0-cbcc-01f87e4dfb71@redhat.com>
 <20210215182714.GC72984@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <62e2b6a5-780f-9217-f093-3a892c34773f@redhat.com>
Date: Mon, 15 Feb 2021 14:43:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210215182714.GC72984@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 1:27 PM, Cleber Rosa wrote:
> It's hard to find the right balance here.  If you take a look at what John
> is proposing wrt the packaging the "qemu" Python libs, I believe one module
> is a good compromise at this point.  I really to expect that it will grow
> and that more modules will be created.
> 

Yeah. We have a "qmp" package and a "machine" package, and these seem 
very well-defined.

Then we have everything else which is mostly a few random bits and 
pieces (at the moment: just accel.py). Over time those bits and pieces 
might take shape as something more important/meaningful, but for now 
it's pretty nebulous.

An emerging pattern I see is that these functions are "environment 
analysis" helpers; things designed to help interrogate the local 
environment to choose appropriate QEMU flags, or otherwise "QEMU output 
analysis", things designed to make better sense of the output received 
from QEMU.

accel.py is the former, this patch targets the latter.

I suspect accel.py will want to belong to "smart" tools for booting up 
an arbitrary VM (interrogate, decide on config, launch) whereas this 
patch fits into a class of API-esque tools designed for making sense of 
I/O information.

It's meant to digest HMP, though -- is this evidence that we need a 
better QMP command? We shouldn't be using HMP for machine driven 
testing. (I know we have to sometimes, but we should be working towards 
eliminating it.)

-js


