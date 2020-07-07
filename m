Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC95216C9E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 14:15:36 +0200 (CEST)
Received: from localhost ([::1]:34190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsmVb-00015t-Ff
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 08:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jsmU8-0000Bg-4Y
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 08:14:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34184
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jsmU5-0006Fy-RB
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 08:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594124040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=wzCblOMjOcRCdmstSk2KSH4SxvzXr1ZI5duyBkvP6bs=;
 b=YFiEeGcEKuufu+Fy3UfF3+n0shWhaFPjMeW2qYpzXVvhwAGNdloQCGWmuanqENZiCwCfOp
 rwqqLlD2ElvfQqqB05mx3x5Mqh99k9yAgptWA+tKfaDVMeXPf712SJxtf+OiYtgkGHwKBE
 OyxHQGuiIkGoulhZgDZbJzwLSdIwSeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-U9-BYozfM4yfGYSsn6VqdA-1; Tue, 07 Jul 2020 08:13:59 -0400
X-MC-Unique: U9-BYozfM4yfGYSsn6VqdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E286D802DD4;
 Tue,  7 Jul 2020 12:13:26 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-248.ams2.redhat.com [10.36.114.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDA8919D61;
 Tue,  7 Jul 2020 12:13:25 +0000 (UTC)
Subject: Re: [qemu-web PATCH] blog post: Anatomy of a Boot, a QEMU perspective
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20200703173948.22156-1-alex.bennee@linaro.org>
 <4b10e325-32df-9bc8-99ab-27f26eeed46f@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <8675bec7-6ff5-3f3b-c125-f2244660eb0a@redhat.com>
Date: Tue, 7 Jul 2020 14:13:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4b10e325-32df-9bc8-99ab-27f26eeed46f@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:46:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/07/2020 12.33, Paolo Bonzini wrote:
> On 03/07/20 19:39, Alex Bennée wrote:
>> While working on some test cases I realised there was quite a lot of
>> assumed knowledge about how things boot up. I thought it would be
>> worth gathering this together in a user facing document where we could
>> pour in the details and background to the boot process. The consensus
>> seems to be this is better as a blog post.
>>
>> The post follows the socratic method and leaves the reader to ask
>> themselves some questions in an effort to elucidate them about any
>> problems they may be having before telling them that they probably
>> wanted to use virt-manager all along.
>>
>> Based on Message-Id: <20200701161153.30988-2-alex.bennee@linaro.org>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> [rth: review of doc form]
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Looks good to me.

Looks good to me, too. Pushed.

 Thanks,
  Thomas


