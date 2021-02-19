Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8969D31F417
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 03:55:26 +0100 (CET)
Received: from localhost ([::1]:33670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCvwz-0004ub-K0
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 21:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lCvvN-0004AB-RW
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 21:53:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lCvvK-0002dN-PM
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 21:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613703221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eOkpFSVlxj2TFUMsaiCo8LnuxOzExa94tx9aCxl4HE4=;
 b=BhnodLVql4Ng7/G1PI0cTp+w9ql5/XmlEBFnyHBdM4kFZ3BAkx7lNSQR0E7ADaQKn9WWuv
 YHYeMm4IzUT1Nq2dLfhD3LnV2AUNp0ob8ikX2cln3Wm6DVZ3tZK6Z1DitAwO/Fy/XEEsYI
 jK5TT/QdQzxSlg+tvsffgRuvH79A8Uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-qS874f1xOKuuJIxirAebVg-1; Thu, 18 Feb 2021 21:53:39 -0500
X-MC-Unique: qS874f1xOKuuJIxirAebVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D326F1084425;
 Fri, 19 Feb 2021 02:53:37 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-188.pek2.redhat.com
 [10.72.12.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3255510493B4;
 Fri, 19 Feb 2021 02:53:34 +0000 (UTC)
Subject: Re: [PATCH] net: e1000: check transmit descriptor field values
To: P J P <ppandit@redhat.com>
References: <20210210145258.143131-1-ppandit@redhat.com>
 <86ea17a0-fd8b-53d5-f975-c55b19e9005d@redhat.com>
 <4696sr1n-7p2o-6725-s02n-4o158pq38r35@erqung.pbz>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1ddbbe9d-58a3-dc5d-c648-2e849d49bbce@redhat.com>
Date: Fri, 19 Feb 2021 10:53:33 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4696sr1n-7p2o-6725-s02n-4o158pq38r35@erqung.pbz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cheolwoo Myung <cwmyung@snu.ac.kr>,
 Ruhr-University Bochum <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/18 3:47 下午, P J P wrote:
>    Hello Jason,
>
> +-- On Thu, 18 Feb 2021, Jason Wang wrote --+
> | On 2021/2/10 下午10:52, P J P wrote:
> | > From: Prasad J Pandit <pjp@fedoraproject.org>
> | >
> | > While processing transmit (tx) descriptors in process_tx_desc()
> | > various descriptor fields are not checked properly. This may lead
> | > to infinite loop like issue. Add checks to avoid them.
> | >
> | > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> | > Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> | > Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
> | > Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> | > ---
> | >   hw/net/e1000.c | 6 ++++++
> | >   1 file changed, 6 insertions(+)
> |
> | I guess you post the wrong patch :) ?
>
> Wrong patch...?
>
> Thank you.


Yes, I think I sent you a patch a week ago. I think we should use that 
one instead of using assert() here?

Thanks


> --
> Prasad J Pandit / Red Hat Product Security Team
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


