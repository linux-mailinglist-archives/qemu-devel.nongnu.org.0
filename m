Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D937C37FDF6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 21:18:26 +0200 (CEST)
Received: from localhost ([::1]:38800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhGqn-0006tS-W8
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 15:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhGpO-00068a-Vm
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:16:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhGpI-0000zi-V3
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620933411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htsh9DHkzJpwG0f9nqAi1Vy8efgdhVZVteVZUrriZRY=;
 b=b80rX25jjAIG7GJm+LV1dNKf6p4L3SAKexbJtTdrJ6by0EQBGHpI6fDAgbIp1PVSkyRe6a
 F1m5mXoVmCP9nHdQmuBJLVUN7Fynh56dPIUFquOQoiIMk6ejWL+49ZObsejY+UG4oddA6E
 JY9AjQsBToWMF87z3AgXbH7hziakWAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-U0lYWsmbN92Wf4U9QIs7yA-1; Thu, 13 May 2021 15:16:50 -0400
X-MC-Unique: U0lYWsmbN92Wf4U9QIs7yA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6AF99F92A;
 Thu, 13 May 2021 19:16:48 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F74461145;
 Thu, 13 May 2021 19:16:28 +0000 (UTC)
Subject: Re: [PATCH v2 03/10] Python: add utility function for retrieving port
 redirection
To: Cleber Rosa <crosa@redhat.com>
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-4-crosa@redhat.com>
 <285df9a6-479f-dd27-f079-3acc6bdd0ea5@redhat.com>
 <YHOr5MEYzj1D/CMt@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <744a0786-4113-57a5-4bf2-c103268ad4d3@redhat.com>
Date: Thu, 13 May 2021 15:16:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YHOr5MEYzj1D/CMt@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/11/21 10:09 PM, Cleber Rosa wrote:
> At this time I don't have a need for it in the PyPI upload, but I
> wonder if this exception is justified.  I mean, what would be gained,
> besides dealing with the exception itself, by not including it?
> 

I just don't want to support or maintain little one-off misc utilities 
and things, but also don't wish to impose a larger design burden on you 
to integrate it in a more holistic and subjectively pleasant way.

Having a misc/utils package where we just stick "kinda-sorta" stuff but 
never intend to ship or support is a useful middle ground. It's for your 
benefit so that we don't have to agonize about the interfaces, but still 
create common code that the rest of the QEMU tree can use.

Even shipping 0.x stuff, releasing it onto PyPI imposes quite a design 
burden. At least within the QEMU tree I can see who is using which 
interfaces and how and avoid breakage. Once we pull that lever ... we 
won't have that benefit anymore.

--js


