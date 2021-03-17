Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95D33FB81
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 23:50:50 +0100 (CET)
Received: from localhost ([::1]:39776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMf05-0000hO-Td
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 18:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMeyX-0000Bw-Nw
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:49:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lMeyU-0007FB-S5
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616021349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koNvzeF42Es0+3b4lhWRNWQ9nBppCG+a3hz+Xl+ghUE=;
 b=RY1nm4oa6JwhRgGJUvUCrghSWLvjIPgj3x/N0NyJe4ceU32gtfsfZ7To6g7vrUTcpmIc88
 T+ojqGMoAdtnTZVLdZYRRTxRQzsqmXVSvY/H9gbBmYioWFvOG/cQr82giJ3Y5lvtABDfoa
 lt9kvB29DQeJK8gQIOjKenQcNhkbta0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-j74SKxIfNXON-wUPPRYQ-A-1; Wed, 17 Mar 2021 18:49:07 -0400
X-MC-Unique: j74SKxIfNXON-wUPPRYQ-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C464A5B362;
 Wed, 17 Mar 2021 22:49:06 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69D666C32F;
 Wed, 17 Mar 2021 22:49:06 +0000 (UTC)
Subject: Re: Can not use hmp block_resize command with -blockdev option
To: zhao xiaojun <xiaojun.zhao141@gmail.com>, qemu-devel@nongnu.org
References: <CAAeqyDvGXBLRxB-KRe2QZH6SV7KKZp=oFQ3wQ_bdsUo1z1_rvw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <ac58e1ea-6745-7e62-f8c2-68fceebe1c2d@redhat.com>
Date: Wed, 17 Mar 2021 18:49:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAAeqyDvGXBLRxB-KRe2QZH6SV7KKZp=oFQ3wQ_bdsUo1z1_rvw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 11:43 PM, zhao xiaojun wrote:
> Hi,
> I use -blockdev option to specify a drive when qemu boot and i want to 
> resize it with hmp block_resize command. The hmp block_resize comand's 
> arguments: block_resize device new_size.
> So I query the device by qmp query_block command, but the device filed 
> of the result output is NULL string.
> 
> result output:
> {
>    "return": [
>      {
>        "io-status": "ok",
>        "device": "",
>          ...
> }
> 
> I noticed that the qmp block_resize command supports device or node-name 
> as argument.
> 
> If i can continue use the the hmp block_resize command with the device 
> argument?
> 
> Regards.

I'm not sure what you're asking: hmp's block_resize doesn't accept 
node-name arguments as you've found. Are you not able to use QMP's 
block_resize?

--js


