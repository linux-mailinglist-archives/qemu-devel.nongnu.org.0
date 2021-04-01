Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEEC35100F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 09:25:01 +0200 (CEST)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRrhL-0004Mw-Oc
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 03:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lRrg3-0003W2-Ie
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lRrg1-0001SR-KK
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617261816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAA842ZcBDwjSSpsXChfe1CFXUTlJeXtusgk4Mi1d8U=;
 b=U5YGAn6jyrKC1CCGCRBnp/12jaTSkPayyZfek6VcjHKpPQywNCy73WpOngUk1I9LE0S/Mv
 3dlIiFrM0D3Q6AxVJIEESqSoUGH2F7GliKIyNxcL+maY5Tfy2dTn814o1o+8uULv7Eou1B
 9UV4YmpkeyBqciNthHM74z37N2y0GAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-xBLN1oF2Pcmjojb1Ylc4kQ-1; Thu, 01 Apr 2021 03:23:34 -0400
X-MC-Unique: xBLN1oF2Pcmjojb1Ylc4kQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A166AE49E6;
 Thu,  1 Apr 2021 07:23:33 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-210.pek2.redhat.com
 [10.72.13.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 961A461461;
 Thu,  1 Apr 2021 07:23:30 +0000 (UTC)
Subject: Re: [PATCH] tap-win32: correctly recycle buffers
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210329022006.55532-1-jasowang@redhat.com>
 <CAEUhbmUciCL-kiikmTyR172kZ2A0D-nz+gsEXkwP_MneGsu=SA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <956b1e90-e9a6-19fc-8e21-521504fa7307@redhat.com>
Date: Thu, 1 Apr 2021 15:23:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUciCL-kiikmTyR172kZ2A0D-nz+gsEXkwP_MneGsu=SA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Howard Spoelstra <hsp.cat7@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/29 上午11:01, Bin Meng 写道:
> On Mon, Mar 29, 2021 at 10:20 AM Jason Wang <jasowang@redhat.com> wrote:
>> Commit 969e50b61a28 ("net: Pad short frames to minimum size before
>> sending from SLiRP/TAP") tries to pad frames but try to recyle the
>> local array that is used for padding to tap thread. This patch fixes
>> this by recyling the original buffer.
>>
>> Fixes: 969e50b61a28 ("net: Pad short frames to minimum size before sending from SLiRP/TAP")
>> Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   net/tap-win32.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>
> Tested booting U-Boot with QEMU ppce500 on Windows, without the patch,
> QEMU crashes
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
>

Applied.

Thanks


