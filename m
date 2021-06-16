Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D3A3A9E7F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:04:31 +0200 (CEST)
Received: from localhost ([::1]:48488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltX5i-0007Gi-Kg
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ltX3J-0003z5-Te
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:02:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ltX3H-0000g4-M4
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623855719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NUsbG+Bka7i//EfFo86XfsBYZqmeeU0Yav9BYjigVUo=;
 b=VVztuvt0g0LE65m4l6HZmyWrJs/rf0jis2dANkuH6RBYRlFuK9SaN8faYmCPCFrOq4pV0s
 K/OSODrmlhg/g2O+EDAh1Y4FGmwLvtuCxf22BFJZW88zFCP3GSCfKvKa9FAUE0TjAEPMPI
 pXXHSCKP7emPXlvXrboXK5qu5FInC0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-LAWh7N17P7m7utWXwS9L2w-1; Wed, 16 Jun 2021 11:01:49 -0400
X-MC-Unique: LAWh7N17P7m7utWXwS9L2w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2443AC7402;
 Wed, 16 Jun 2021 15:01:48 +0000 (UTC)
Received: from localhost (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A37065D6AD;
 Wed, 16 Jun 2021 15:01:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/5] linux-user/s390x: Fix psw.mask handling in signals
In-Reply-To: <87431a2f3cdefff42dc375ec888660e4@imap.linux.ibm.com>
Organization: Red Hat GmbH
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
 <87431a2f3cdefff42dc375ec888660e4@imap.linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 16 Jun 2021 17:01:43 +0200
Message-ID: <877ditx38o.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 qemu-s390x
 <qemu-s390x-bounces+jonathan.albrecht=linux.vnet.ibm.com@nongnu.org>,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15 2021, "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com> wrote:

> On 2021-06-14 11:07 pm, Richard Henderson wrote:
>> The PSW_MASK_CC component of psw.mask was not handled properly
>> in the creation or restoration of signal frames.
>> 
>
> Thanks Richard! Peter and I tested this series against:
>   * https://bugs.launchpad.net/qemu/+bug/1886793
>   * https://bugs.launchpad.net/qemu/+bug/1893040
> and they look fixed now.

May I add some Tested-by: tags for this? (I don't know who Peter is.)


