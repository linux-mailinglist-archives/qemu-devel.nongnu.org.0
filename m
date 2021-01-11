Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460522F1010
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 11:28:06 +0100 (CET)
Received: from localhost ([::1]:53452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyuQf-00050I-Ag
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 05:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyuPL-0004Ko-Ip
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 05:26:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyuPI-0001wH-HF
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 05:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610360797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AIUbAAChlK0RbVt5zmLRBVBw18tMKILQLRJzqrokvJ4=;
 b=Lgvq1BuJ/zNJwJNbkzu5W8R8qvwf4F3rhLfzH43msvANPoIwL2mZIKMFKTF3GM0EoWUvpT
 Z30VvkA6hQgGi++lc+tHBAJXSzOB2wQpc8p2KYhy86jiMjC+R+IuLcoNV8Hm4LR2XbFiAU
 uN56QN3liHJUP+r8i70GNt200pwFLfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-rzcf2jy8NnuXB0G7BhKcrQ-1; Mon, 11 Jan 2021 05:26:34 -0500
X-MC-Unique: rzcf2jy8NnuXB0G7BhKcrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 256E8801B14;
 Mon, 11 Jan 2021 10:26:33 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F28C5D769;
 Mon, 11 Jan 2021 10:26:23 +0000 (UTC)
Subject: Re: [PATCH v8 5/7] fuzz: set bits in operand of write/out to zero
To: Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
 <SYCPR01MB3502C84B6346A3E3DE708C7BFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
 <d3294c04-28c5-470a-d011-80dc975c7a62@redhat.com>
 <SYCPR01MB35029A99852F6063CC7C644CFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fc36e336-7295-53f0-85c4-bd3a4e63857f@redhat.com>
Date: Mon, 11 Jan 2021 11:26:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <SYCPR01MB35029A99852F6063CC7C644CFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.012, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: alxndr@bu.edu, bsd@redhat.com, pbonzini@redhat.com, stefanha@redhat.com,
 darren.kenny@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/2021 10.39, Qiuhao Li wrote:
> On Mon, 2021-01-11 at 10:01 +0100, Philippe Mathieu-Daudé wrote:
>> On 1/11/21 7:11 AM, Qiuhao Li wrote:
>>> Simplifying the crash cases by opportunistically setting bits in
>>> operands of
>>> out/write to zero may help to debug, since usually bit one means
>>> turn on or
>>> trigger a function while zero is the default turn-off setting.
>>>
>>> Tested Bug 1908062.
>>
>> Please use the full link as reference:
>> https://bugs.launchpad.net/qemu/+bug/1908062
> 
> Ok, should I submit a new version patch? Or just change the commit
> messages and submit this series again?

I can fix this when picking up the patches, no need to respin just because 
of this.

  Thomas


