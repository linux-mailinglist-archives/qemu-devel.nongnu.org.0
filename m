Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF69305570
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 09:18:08 +0100 (CET)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4g1f-0007MX-34
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 03:18:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l4g0n-0006i9-8a
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 03:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l4g0k-0004kW-Lp
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 03:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611735428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qq0I+o8cfrTmTY6VsRuvCvLEoTMBAvNn6xB4JktOb60=;
 b=cHHcMnZCKUfaWrQlvCUi8xJGvpf0pwAvgdQY+H3/fvU6uonIzqVDEMXSapigBBDDEPgvtE
 g1rGIc1y2bU415YY600SdRxjPMEajxxXlwpX2gbfCiNxQtlvlxhgs3mJSMcpfNtxQhVtvc
 WrkJKSrjIL8d84RbGHz2YJPKfSAfv/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-y4vdMsRKOe2Ak5Xjr5O5cg-1; Wed, 27 Jan 2021 03:17:06 -0500
X-MC-Unique: y4vdMsRKOe2Ak5Xjr5O5cg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FDC3CC62E
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 08:17:05 +0000 (UTC)
Received: from [10.72.12.140] (ovpn-12-140.pek2.redhat.com [10.72.12.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 435877095C;
 Wed, 27 Jan 2021 08:17:00 +0000 (UTC)
Subject: Re: [PATCH v3 5/5] vhost-vdpa: add callback function for configure
 interrupt
To: Cindy Lu <lulu@redhat.com>
References: <20210126074254.3225-1-lulu@redhat.com>
 <20210126074254.3225-6-lulu@redhat.com>
 <639e39d7-e210-e2d6-5d42-0afb01dcddf7@redhat.com>
 <CACLfguWXOBXbbW7cro4vU6XfDezaaQfXbNbzx618y9+XV8sURw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <55ba73a1-ad2c-05ac-f0dd-5a05305622a3@redhat.com>
Date: Wed, 27 Jan 2021 16:16:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACLfguWXOBXbbW7cro4vU6XfDezaaQfXbNbzx618y9+XV8sURw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/27 下午3:51, Cindy Lu wrote:
>>> +     /*set the fd call back to vdpa driver*/
>> I guess checkpatch.pl might warn here. Please try to silent checkpath.pl
>> before submitting patches.
>>
> Actually I do have run this script, but seems not warned here. I will
> pay attention next time


Oh right, I remember kernel checkpath did the check but I don't know if 
the qemu one check the comment sytle.

Thanks


