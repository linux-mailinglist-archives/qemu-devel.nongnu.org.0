Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5DE25B088
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 18:01:10 +0200 (CEST)
Received: from localhost ([::1]:58958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDVC9-00085D-0P
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 12:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDVAd-0006nL-6S
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDVAb-0006tw-L3
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599062372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9Z65HiJ28SbZ/v2SSoYlJCZb2bFrIldAPXNWZaTe24=;
 b=KFRB0s/xepOg3oEVoPMM3cz3n468esUM5YByBUuV9jc0mJQXXxTqA584ub1U7LACfimrXP
 cq+Rj79wIB3d77h5iCxwXRy6c/tswCf7iejLMZoCFyHx8K9r9Yh/HAo0QiPonASmTCq8qm
 EGzQsyXJAnKPOhjiznRbXnw3RWaj67g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-Gej7SJyaO6i1g3NTBF_UuQ-1; Wed, 02 Sep 2020 11:59:30 -0400
X-MC-Unique: Gej7SJyaO6i1g3NTBF_UuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0469818A2263;
 Wed,  2 Sep 2020 15:59:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF7AA5D9E4;
 Wed,  2 Sep 2020 15:59:22 +0000 (UTC)
Subject: Re: [PATCH] tests/qtest/tpm: Declare input buffers const and static
To: Stefan Berger <stefanb@linux.ibm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200902080909.161034-1-philmd@redhat.com>
 <m2d034tvws.fsf@oracle.com>
 <39c26bc1-16c5-ba7c-3e39-8d56e807e082@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b99baa7f-e908-46a4-fbcf-cecba9ec1827@redhat.com>
Date: Wed, 2 Sep 2020 17:59:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <39c26bc1-16c5-ba7c-3e39-8d56e807e082@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:42:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.324, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/2020 16.37, Stefan Berger wrote:
> On 9/2/20 4:39 AM, Darren Kenny wrote:
>> On Wednesday, 2020-09-02 at 10:09:09 +02, Philippe Mathieu-Daudé wrote:
>>> The functions using these arrays expect a "const unsigned char *"
>>> argument, it is safe to declare these as 'static const'.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> 
> Would this qualify for qemu-trivial?
> 
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

I can take it through the qtest tree.

 Thomas


