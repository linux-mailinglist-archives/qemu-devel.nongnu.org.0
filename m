Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CFD1C8EE9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 16:31:09 +0200 (CEST)
Received: from localhost ([::1]:58698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWhYK-0007w4-3D
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 10:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jWhWo-0006rA-PN
 for qemu-devel@nongnu.org; Thu, 07 May 2020 10:29:34 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56852
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jWhWl-0005f5-R5
 for qemu-devel@nongnu.org; Thu, 07 May 2020 10:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588861770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1aOpZPQQ3lTC/MASd3VfLAZLEtvkAT3nSPc+feRUBtU=;
 b=KkGbjHYPyTV/0XyXiV52j4EVOYyBxUwKw+a1cP7RaWCO7qXvyKLpX2ocqZ11OEP5rPnxkO
 QfR2bithPgKjj62j0SuQ66ZRiCGEJk0xJyUCl2xPUp+V8e9PUCQwvHfDkyHhJ3NiYYjnYX
 YblyesjdfnmTXd5vFvsaaw0YwO1Pjs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-uTpnPtidNMC4Z1BAuLvu3w-1; Thu, 07 May 2020 10:29:27 -0400
X-MC-Unique: uTpnPtidNMC4Z1BAuLvu3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6AE118CA26D;
 Thu,  7 May 2020 14:29:26 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 686E110013BD;
 Thu,  7 May 2020 14:29:26 +0000 (UTC)
Subject: Re: [PATCH 0/9] More truncate improvements
To: Kevin Wolf <kwolf@redhat.com>
References: <20200428202905.770727-1-eblake@redhat.com>
 <20200507101502.GB6019@linux.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <355c3850-a164-6474-ec3a-535c6a455143@redhat.com>
Date: Thu, 7 May 2020 09:29:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507101502.GB6019@linux.fritz.box>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 00:55:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/20 5:15 AM, Kevin Wolf wrote:
> Am 28.04.2020 um 22:28 hat Eric Blake geschrieben:
>> Based-on: <20200424125448.63318-1-kwolf@redhat.com>
>> [PATCH v7 00/10] block: Fix resize (extending) of short overlays
>>
>> After reviewing Kevin's work, I questioned if we had a redundancy with
>> bdrv_has_zero_init_truncate.  It turns out we do, and this is the result.
>>
>> Patch 1 has been previously posted [1] and reviewed, the rest is new.
>> I did not address Neils' comment that modern gluster also always
>> 0-initializes [2], as I am not set up to verify it (my changes to the
>> other drivers are semantic no-ops, so I don't feel as bad about
>> posting them with less rigourous testing).
>>
>> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg08070.html
>> [2] https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg04266.html
> 
> block/parallels.c: In function 'parallels_co_writev':
> block/parallels.c:218:12: error: 'ret' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    218 |         if (ret < 0) {
>        |            ^
> block/parallels.c:169:9: note: 'ret' was declared here
>    169 |     int ret;
>        |         ^~~
> cc1: all warnings being treated as errors

Yep, fixup posted here:
https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg05199.html

> 
> Apart from that, you can add:
> 
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>

Do you need me to send a v2?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


