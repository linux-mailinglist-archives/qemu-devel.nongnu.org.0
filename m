Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1FF3678E6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:50:36 +0200 (CEST)
Received: from localhost ([::1]:32984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZRIS-0002rl-0K
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZRFf-0001Od-Go
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:47:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZRFc-0006zr-IR
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619066859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YycjBmv4F0+nju3HHWEounKS9MOpDZN6nFI9gI/i1+0=;
 b=BkppA+lFmIpz0lPXMrE2Nta99elNOvKH4AASZjxKcT7NH386iCzmkjeIB/cv6yM125/GAm
 gricMPZLFyNUzfJjlTGceBcdb6U39FxGW83uldQU5/Pdm1TblUrvgrAJM9jeTF4JDW4ljl
 vbU/b5Il9x/CTYzeLS9f4KwUcyVBFJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-GUFsiE4fPbG6aWeYRnbDSg-1; Thu, 22 Apr 2021 00:47:37 -0400
X-MC-Unique: GUFsiE4fPbG6aWeYRnbDSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DB2E18397A3;
 Thu, 22 Apr 2021 04:47:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 206EC60C05;
 Thu, 22 Apr 2021 04:47:33 +0000 (UTC)
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>
References: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
Date: Thu, 22 Apr 2021 06:47:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/04/2021 06.18, Philippe Mathieu-Daudé wrote:
> Hi Thomas, Daniel, Stefano,
> 
> Regarding the following warning (GCC 11 on Fedora 34):
> 
> In file included from pc-bios/s390-ccw/main.c:11:
> 
> In function ‘memset’,
> 
>      inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,
> 
>      inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:
> 
> pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of
> size 0 [-Wstringop-overflow=]
> 
>     28 |         p[i] = c;
> 
>        |         ~~~~~^~~
> 
> Daniel were right on IRC:
> 
> danpb: it is from a call  memset((char *)S390EP, 0, 6)     where  S390EP
> is just a constant address 0x10008
> danpb: the compiler doesn't now how big that is, so it seems to assume
> it is zero length
> 
> This is a known GCC issue:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
> "gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing a
> pointer from integer literal"

  Hi Philippe,

thanks for following up with the gcc bugzilla!

... so the problem is that GCC thinks we're in fact dereferencing a NULL 
pointer at offset 0x10008 here? Wow, that's ... crazy.

Not sure what to do now - wait for the bug to get resolved? Compile the 
s390-ccw bios with -Wno-stringop-overread ? Add "volatiles" here and there 
to hope that these silence the compiler warnings? ... I tend to wait for the 
bug ticket to see whether the GCC folks change the behavior of the compiler 
again, but I'm open for other suggestions.

  Thomas


