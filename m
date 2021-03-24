Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2BA347AA8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:28:39 +0100 (CET)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4Uw-0002pC-SB
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lP4T0-0001S3-VX
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lP4Sx-0004zP-KH
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616595994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72dNZuYih/pUKhxGOdSxh6XoIsaCV6Jr8cHlwVJKC/Y=;
 b=fXBfKT+2nI+AYKx/Gv27Q+9/U85M0VL9g5NynHeRckMgFrM7YsHT3/nic4Ie4i7SMCFWgC
 ckRaU4E8YOH+fe1UKJsOHb88yThUMpr44j327AUxA1qRwptmAe8SfNlo8wxOaH/f7XTxrW
 VA76/bYVtOjApo7qXSnvWDFhLej574M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-9bq4i6tDMdutgPQxPRGkFg-1; Wed, 24 Mar 2021 10:26:31 -0400
X-MC-Unique: 9bq4i6tDMdutgPQxPRGkFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59F18100E45D;
 Wed, 24 Mar 2021 14:25:56 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-161.ams2.redhat.com
 [10.36.113.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14F655D9CA;
 Wed, 24 Mar 2021 14:25:54 +0000 (UTC)
Subject: Re: [PATCH 1/6] block/vdi: When writing new bmap entry fails, don't
 leak the buffer
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210317180013.235231-1-pbonzini@redhat.com>
 <20210317180013.235231-2-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <955ac063-62da-bb6d-2c00-ccb0a77b1c1c@redhat.com>
Date: Wed, 24 Mar 2021 15:25:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317180013.235231-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.21 19:00, Paolo Bonzini wrote:
> From: David Edmondson <david.edmondson@oracle.com>
> 
> If a new bitmap entry is allocated, requiring the entire block to be
> written, avoiding leaking the buffer allocated for the block should
> the write fail.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> Message-Id: <20210309144015.557477-2-david.edmondson@oracle.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/vdi.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Max Reitz <mreitz@redhat.com>


