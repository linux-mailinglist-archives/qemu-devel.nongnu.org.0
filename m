Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C79C355C52
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 21:39:44 +0200 (CEST)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTrY7-0001zS-Ca
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 15:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lTrWw-0001Ym-Nb
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lTrWu-00057b-H0
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617737907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UqJPnwt26nhU9NhH+HCfrds3J0CVgI8fs0HDe4vqdsA=;
 b=ZGlyE5JjRz7gLM+YhQOYutE6eaz94g5IdA8uhBuUxJsr0uZF9S9QWTHhLpNkkocZsIInvW
 Oa2uVMrVB1D/yKmLOAqySFKXAwNBgz8twhKp+Wyx63cYTpjPZR2/TJFPtVMpvbqsEpduvC
 2kJpJsamWvGuMMdHJ/JH+Hby6U0WIUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-A2P6lLaYNeqb_1PRuR0CpQ-1; Tue, 06 Apr 2021 15:38:24 -0400
X-MC-Unique: A2P6lLaYNeqb_1PRuR0CpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FAA4107ACCD;
 Tue,  6 Apr 2021 19:38:23 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 106BE19D80;
 Tue,  6 Apr 2021 19:38:22 +0000 (UTC)
Subject: Re: dectree.py uses env python3 rather than configured python
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, tsimpson@quicinc.com
References: <YGys2+lETQO5havV@work-vm>
From: John Snow <jsnow@redhat.com>
Message-ID: <55e804a2-c709-6b2e-699a-ef89f1941250@redhat.com>
Date: Tue, 6 Apr 2021 15:38:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YGys2+lETQO5havV@work-vm>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/6/21 2:50 PM, Dr. David Alan Gilbert wrote:
> Hi Taylor,
>    I tripped over dectree.py using 'env python3'; the qemu configure
> script lets you specify a python with e.g.:
>      --with-python=/usr/libexec/platform-python
> 
> and I think everywhere else in qemu uses the configured python.
> (This host, like most standard rhel8, doesn't have a python3 binary out
> of the box)
> 
> Dave
> 

Hi,

Instead of allowing meson to invoke this script directly (and have the 
shebang be processed by the shell), meson ought to be taught to invoke 
it directly using the user's configured python interpreter.

The shebang "#!/usr/bin/env python3" is otherwise the correct one to 
use, and should (probably) be left alone.

--js


