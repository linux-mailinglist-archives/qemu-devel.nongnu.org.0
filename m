Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B942099E3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 08:32:38 +0200 (CEST)
Received: from localhost ([::1]:53720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joLR7-0008O4-33
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 02:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1joLOp-0007Nh-QP
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 02:30:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56774
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1joLOm-000541-UG
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 02:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593066611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wej/6UNvhwQh2MA7H3zONvny9T8wz4YvnAyZVj7QLS4=;
 b=Hyc8UuryNfQyo6aiUwSt7kSWYKeXW7B3MuiOJCPpNXLfNL5yaYIFA59r96TggY2uvQTnjl
 aiztL8xRyFWO3ZjnPtWIBpJIi06RzM2mbqAIisHZrsxYXqim/cgmii0Ah8QCtyJZUXZXJg
 bCPJok013grgCEryq9Xbg1GRer9C7xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-rTbaCJNXMgKuhHTYq7JfXQ-1; Thu, 25 Jun 2020 02:30:08 -0400
X-MC-Unique: rTbaCJNXMgKuhHTYq7JfXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AD4C805EE1;
 Thu, 25 Jun 2020 06:30:06 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7C9F2B47C;
 Thu, 25 Jun 2020 06:29:56 +0000 (UTC)
Subject: Re: [PATCH v4 3/8] s390/sclp: rework sclp boundary and length checks
To: Collin Walling <walling@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20200624202312.28349-1-walling@linux.ibm.com>
 <20200624202312.28349-4-walling@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <70dcfc97-be44-3307-58ed-a7ac1fab61c8@redhat.com>
Date: Thu, 25 Jun 2020 08:29:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200624202312.28349-4-walling@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 02:30:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: frankja@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, mst@redhat.com,
 svens@linux.ibm.com, pbonzini@redhat.com, mihajlov@linux.ibm.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/06/2020 22.23, Collin Walling wrote:
> Rework the SCLP boundary check to account for different SCLP commands
> (eventually) allowing different boundary sizes.
> 
> Move the length check code into a separate function, and introduce a
> new function to determine the length of the read SCP data (i.e. the size
> from the start of the struct to where the CPU entries should begin).
> 
> The format of read CPU info is unlikely to change in the future,
> so we do not require a separate function to calculate its length.
> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> Acked-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/s390x/sclp.c | 54 ++++++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 44 insertions(+), 10 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


