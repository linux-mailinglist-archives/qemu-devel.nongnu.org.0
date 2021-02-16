Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B575D31CAD9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:05:15 +0100 (CET)
Received: from localhost ([::1]:46994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC02U-000524-R9
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lC00f-0003pS-70
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:03:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lC00b-0001YQ-JD
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:03:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613480596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CpLVB53c57yY5NZjX3H44AyGV+HBgldADFP6Ead1JXY=;
 b=SgLm12atE1Y6V3nwmCENU6+j+8gne9LJwrT5mONMOD07C9OzaETMsRC9SNPRTrGPetP6eF
 ozIuHh45IRPk3EFDnLYmjtHXau6Nk+/bgQODLSBlR2wHcggQGzx3kMPjdTV6YLRRN6aaqh
 yBNOIRhOAY6Ee0u18jSDr1VE4ni3BEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-XsuDPyqjPd6pwddDCRcLiw-1; Tue, 16 Feb 2021 08:03:14 -0500
X-MC-Unique: XsuDPyqjPd6pwddDCRcLiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58949835E24;
 Tue, 16 Feb 2021 13:03:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-157.ams2.redhat.com [10.36.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DF365D72F;
 Tue, 16 Feb 2021 13:03:11 +0000 (UTC)
Subject: Re: [PATCH v9 0/6] Rework iotests/check
To: John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
 <20210126125301.GE4385@merkur.fritz.box>
 <2628b158-cc41-908e-550f-ec4fe726a31f@virtuozzo.com>
 <20210126150750.GH4385@merkur.fritz.box>
 <5bb6d3fd-2a2c-91a4-f12a-5e195627a7fb@virtuozzo.com>
 <af46aebd-a6b4-cc64-1d6e-d08e78c6b0ae@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <619e5213-435c-8d30-097e-eb953c8c735d@redhat.com>
Date: Tue, 16 Feb 2021 14:03:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <af46aebd-a6b4-cc64-1d6e-d08e78c6b0ae@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: den@openvz.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2021 02.49, John Snow wrote:
> On 1/26/21 10:15 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>
>>
>> OK, thanks for handling it!
>>
>> When will we move to python 3.7?
[...]
> As for RHEL/CentOS, I think it's in the same shape right now. It's 
> 3.6-based, but I don't know if there's an optional 3.7+ package or not.

There is a python 3.8 package available for RHEL8. And according to the QEMU 
support policy, we will soon (IIRC in May 2021) stop supporting RHEL7.

  Thomas


