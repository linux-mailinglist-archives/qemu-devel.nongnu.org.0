Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0875833AEF5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:40:09 +0100 (CET)
Received: from localhost ([::1]:60176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjho-0000zr-2n
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLjgS-0000G7-IC
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:38:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLjgO-0004e6-3v
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615801114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPdN2KJpedoPzaQFMExe7DtIxJg0DHQ3XLf/67nmX7s=;
 b=bikmDLoi3Wn69KiTkB+dJ1WMI8q3vOqihApysAxPyB1npNk6xcDa7ZjHpy1Ff0mHm0adBi
 pGtnBf7McngqLs5mBkHYlKsxdFuYcmbylhOprLvlBwC/FIPsuS41xEYNrgSpp6vsu85sI0
 4+ZoXqzhtoUuhC2oyht5pKoawIEmZNI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-AkZ1IXaaPny7DyY5BPAhfQ-1; Mon, 15 Mar 2021 05:38:32 -0400
X-MC-Unique: AkZ1IXaaPny7DyY5BPAhfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC1391017DC0;
 Mon, 15 Mar 2021 09:38:30 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F2F6708E2;
 Mon, 15 Mar 2021 09:38:26 +0000 (UTC)
Subject: Re: [PATCH v7 0/2] target/s390x: Implement the MVPG
 condition-code-option bit
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210315085449.34676-1-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <75fb8868-eeb8-1dd0-b107-53b203ea07c5@redhat.com>
Date: Mon, 15 Mar 2021 10:38:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315085449.34676-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2021 09.54, David Hildenbrand wrote:
> Based on work from Richard and Thomas.
> 
> v6 -> v7:
> - "target/s390x: Implement the MVPG condition-code-option bit"
> -- Fix PGM_PROTECTION for QEMU_USER_ONLY (overridden by patch #2)

I just double-checked my version of the MVPG kvm-unit-test and some Linux 
guest images, and all seem to still work fine.

Tested-by: Thomas Huth <thuth@redhat.com>


