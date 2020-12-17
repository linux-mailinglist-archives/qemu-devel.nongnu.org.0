Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E202DCCF2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 08:28:07 +0100 (CET)
Received: from localhost ([::1]:34990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpnhm-0006mT-SF
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 02:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kpnff-0005wI-G4
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:25:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kpnfc-0002vt-7s
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608189950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWWk0gsbKNp6ZxW6KLnFBtFCQfsBPuESGDBvW4YANW4=;
 b=Myt5xrc4phyFQ7c0uHexaiz4IJbdIMg2pTEANy6TC6pxiOz822CYV7rjCSrEQT2ThvTTev
 emqxNyLtCd0jC0XQN7K5hLj0tSN2EAorTUaxrNPc8DiIBq9pkxhJpITEHXdtCICBVUbJGL
 Mfz0TMSikybnFuRbk85aVf1wQTI6o8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-hQqeRl6jOniFVChDNoRZ7g-1; Thu, 17 Dec 2020 02:25:48 -0500
X-MC-Unique: hQqeRl6jOniFVChDNoRZ7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 772991005504;
 Thu, 17 Dec 2020 07:25:47 +0000 (UTC)
Received: from [10.72.12.223] (ovpn-12-223.pek2.redhat.com [10.72.12.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F380760C47;
 Thu, 17 Dec 2020 07:25:45 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] net: checksum: Skip fragmented IP packets
To: Bin Meng <bmeng.cn@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <1607679312-51325-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmX=Dz_uPwWvBHtuoatBwGf2kE954R3wjRRoF9M_kH7GVw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4783ab39-b93d-1d70-fbda-e9a243206b24@redhat.com>
Date: Thu, 17 Dec 2020 15:25:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmX=Dz_uPwWvBHtuoatBwGf2kE954R3wjRRoF9M_kH7GVw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/12/17 下午1:41, Bin Meng wrote:
> Hi Jason,
>
> On Fri, Dec 11, 2020 at 5:35 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> From: Markus Carlstedt <markus.carlstedt@windriver.com>
>>
>> To calculate the TCP/UDP checksum we need the whole datagram. Unless
>> the hardware has some logic to collect all fragments before sending
>> the whole datagram first, it can only be done by the network stack,
>> which is normally the case for the NICs we have seen so far.
>>
>> Skip these fragmented IP packets to avoid checksum corruption.
>>
>> Signed-off-by: Markus Carlstedt <markus.carlstedt@windriver.com>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>> (no changes since v1)
>>
>>   net/checksum.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
> Ping?
>
> Regards,
> Bin


Queued.

Thanks


>


