Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4970347AA9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:28:47 +0100 (CET)
Received: from localhost ([::1]:36388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4V4-00034D-RO
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lP4TF-0001jH-64
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:26:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lP4TA-00059w-Eo
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616596007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZDhdt+CeYVFLVv1fRlDfeIiX/EtafnDIoKUIITQJRE=;
 b=eGNmCWYt2OahZVuuhLs+RdqR1GGGMlb+YHfuZvoeboAv1Oun2osysCfIzQvaR5RUzA5cRa
 BVXlJ4E4106Nmwo8vdzrJW93moM1/sjwFLq7yvRx70Eby7S2voSHt63Kz2uwsgiWi05LVj
 uczn9mGeeC/H9aMnPwEXl3kxkxSuRs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-XcU91Td9MqeTI8CMMaAo_A-1; Wed, 24 Mar 2021 10:26:44 -0400
X-MC-Unique: XcU91Td9MqeTI8CMMaAo_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68D98185304D;
 Wed, 24 Mar 2021 14:26:08 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-161.ams2.redhat.com
 [10.36.113.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F5BB5D767;
 Wed, 24 Mar 2021 14:26:01 +0000 (UTC)
Subject: Re: [PATCH v5 0/6] coroutine rwlock downgrade fix, minor VDI changes
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210317180013.235231-1-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <712353c7-ee20-6dc7-b001-903de9d6e4f3@redhat.com>
Date: Wed, 24 Mar 2021 15:26:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317180013.235231-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.21 19:00, Paolo Bonzini wrote:
> This is a resubmit of David Edmondson's series at
> https://patchew.org/QEMU/20210309144015.557477-1-david.edmondson@oracle.com/.
> After closer analysis on IRC, the CoRwlock's attempt to ensure
> fairness turned out to be flawed.  Therefore, this series
> reimplements CoRwlock without using a CoQueue.  Tracking whether
> each queued coroutine is a reader/writer makes it possible to
> never wake a writer when only readers should be allowed and
> vice versa.

I’m not a maintainer for patches 3 through 6.  Stefan is, though.  So 
Stefan, can you take this series with an R-b from me on 1 and 2?

Max


