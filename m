Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E839B456C19
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:07:24 +0100 (CET)
Received: from localhost ([::1]:43880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnzrf-0002aC-WB
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:07:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mnzpj-0000yA-UB
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:05:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mnzpe-0003Da-QL
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637312715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWWjbO9kKTxCXckfTY+60sTzW+PmtXTboLwOJb9cruM=;
 b=SF9jSmD8oX9zA5JNY8O+bTNCLEanJj5b7lAIEqkSQ+JAs6BfWdFYMallc5+8efwYkWKwm6
 Q6rKNQAYPdL8Xpz+bfSyGvPZYaZG1m/VRiUSXpB5wBYrHssX1zKJToCyKg9XDnIPn3GYI2
 3PW234l0q1a/uAai4CCdcG+WKkeK5SU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-GODmBgCTP7ynJ6vlqcnDkQ-1; Fri, 19 Nov 2021 04:05:13 -0500
X-MC-Unique: GODmBgCTP7ynJ6vlqcnDkQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48AFC87180C;
 Fri, 19 Nov 2021 09:05:12 +0000 (UTC)
Received: from [10.39.194.192] (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53DC05DAA5;
 Fri, 19 Nov 2021 09:05:11 +0000 (UTC)
Message-ID: <ce8f09e2-a780-e1eb-c3dd-04f1a713ae38@redhat.com>
Date: Fri, 19 Nov 2021 10:05:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] nvmm: Fix support for stable version
To: nia <nia@NetBSD.org>, Kamil Rytarowski <kamil@netbsd.org>
References: <YWblCe2J8GwCaV9U@homeworld.netbsd.org>
 <e0e46321-86d8-349a-2850-b82cd8e716a2@netbsd.org>
 <YZZ2NBRs8udySgr4@homeworld.netbsd.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YZZ2NBRs8udySgr4@homeworld.netbsd.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: reinoud@netbsd.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 16:50, nia wrote:
> Ping? It would be very nice if this could make it into 6.2
> so we don't have to continue patching around this.

Queued, thanks.

Paolo


