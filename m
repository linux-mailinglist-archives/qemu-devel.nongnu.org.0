Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDFC4ED6A5
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:17:55 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqwE-0006X3-Cf
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:17:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1nZqsY-0004CN-Cs
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1nZqsV-0006Rr-7F
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648718040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VNYfHZ7rhasHRbRmyaB7H43BKV9hujOjhBkPw2IhLAE=;
 b=dhpKBrA4moxKET28uZ/s3c04R85OmfQpn1FqvjaXleGupKA937dDKCOA49FoLYC4WTXPaO
 Urcs+dT/aFTL0B5CfO+3X/8L8l3GCLlBjZ2/a8BbtsLWeRIa2rIsm+PGyg/DOC4D8rdkzW
 bG5r9gbxKngLLWNrYMWutD8HesSB6no=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-12bgEwooMaedQrfm8RVbTw-1; Thu, 31 Mar 2022 05:12:45 -0400
X-MC-Unique: 12bgEwooMaedQrfm8RVbTw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D575A10115F6;
 Thu, 31 Mar 2022 09:12:44 +0000 (UTC)
Received: from [10.39.208.2] (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A768401E3B;
 Thu, 31 Mar 2022 09:12:40 +0000 (UTC)
Message-ID: <1354a482-bfb2-1a0e-2c0d-fd6b7446292b@redhat.com>
Date: Thu, 31 Mar 2022 11:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] vdpa: reset the backend device in the end of
 vhost_net_stop()
To: Jason Wang <jasowang@redhat.com>, 08005325@163.com
References: <1648634561-12504-1-git-send-email-08005325@163.com>
 <1648703950-7321-1-git-send-email-08005325@163.com>
 <CACGkMEuGiuQ9DYqpqp9QAWhSgMiRa_aMnYqdDU8vECZxdGRWXg@mail.gmail.com>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
In-Reply-To: <CACGkMEuGiuQ9DYqpqp9QAWhSgMiRa_aMnYqdDU8vECZxdGRWXg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=maxime.coquelin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Cindy Lu <lulu@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, eperezma <eperezma@redhat.com>,
 Michael Qiu <qiudayu@archeros.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 3/31/22 10:55, Jason Wang wrote:
> On Thu, Mar 31, 2022 at 1:20 PM <08005325@163.com> wrote:
> 
> Hi:
> 
> For some reason, I see the patch as an attachment.

We are starting to see this more and more since yesterday on DPDK
mailing list. It seems like an issue with mimecast, when the From: tag
is different from the sender.

Maxime

> Thanks
> 
> 


