Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F302D9AFA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:31:27 +0100 (CET)
Received: from localhost ([::1]:36946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopor-0007Vy-2Y
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:31:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kopm7-0006UG-Au
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:28:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kopm4-0005qo-T8
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607959711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSAYvXMcGGD5JyCwhVnQe3PR1KgMNFfrF8qmdsJsLCI=;
 b=Lx2N9CJ4KdMy37r60rrLu0mkKZBqsY+EVFLCCshoO01oc9e5EB77vRlONUETQfn7veuhsW
 yJm/9nADttpSyzgN8pmJ8yiykTKt6GJOI6U+F7HwgcAuOM8ISuiLDrymdb4fjGYfnRGLjU
 HCwXVnomVJYfledbdQlz8DHAj/z2h+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-p262mov0PGqbTUNt6HM00A-1; Mon, 14 Dec 2020 10:28:30 -0500
X-MC-Unique: p262mov0PGqbTUNt6HM00A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DD1E59;
 Mon, 14 Dec 2020 15:28:28 +0000 (UTC)
Received: from [10.36.114.184] (ovpn-114-184.ams2.redhat.com [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85A5E5C1BB;
 Mon, 14 Dec 2020 15:28:27 +0000 (UTC)
Subject: Re: [PATCH v2] s390x: pv: Fence additional unavailable SCLP
 facilities for PV guests
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20201211105109.2913-1-frankja@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <eab9ed1b-aa61-f76a-8b68-87c2805bd942@redhat.com>
Date: Mon, 14 Dec 2020 16:28:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201211105109.2913-1-frankja@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.12.20 11:51, Janosch Frank wrote:
> There's no VSIE support for a protected guest, so let's better not
> advertise it and its support facilities.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


