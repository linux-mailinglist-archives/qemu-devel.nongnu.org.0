Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C502ECDBF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:27:02 +0100 (CET)
Received: from localhost ([::1]:57448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSVR-0007nA-9p
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kxSTE-00063d-NV
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:24:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kxSTD-0007En-3c
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610015082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+hJRharyZvVDTuPCBgjdYbyLl2t68dUuEnDzfhjyow=;
 b=ayTb1sgQmTzjO0oESFBi7A+DIy2acrRT+VXzeJcvCAefNP1Gixt0ulhffiH3y6ajEf24on
 mlCdeUmETjKFDbJ6ELin9n+aCLkbzgZWXfmN9thrGzY5NuiimVjHNLkJIbpaKds05cic3E
 W7KXRIC3jqTliW/onfR0BnJJ6p9LQBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-wjXP-5QVOsWx8Mhfqa5mWw-1; Thu, 07 Jan 2021 05:24:40 -0500
X-MC-Unique: wjXP-5QVOsWx8Mhfqa5mWw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE4FC8049C2;
 Thu,  7 Jan 2021 10:24:39 +0000 (UTC)
Received: from starship (unknown [10.35.206.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 303485B6A2;
 Thu,  7 Jan 2021 10:24:37 +0000 (UTC)
Message-ID: <2ca49172510fc5a989a222b693f3cdcee879af07.camel@redhat.com>
Subject: Re: [PATCH v2 0/2] Quality of life patches for qemu coroutine
 debugging
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 07 Jan 2021 12:24:36 +0200
In-Reply-To: <20201217155436.927320-1-mlevitsk@redhat.com>
References: <20201217155436.927320-1-mlevitsk@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-12-17 at 17:54 +0200, Maxim Levitsky wrote:
> These are two patches that improve a bit the qemu gdb scripts in regard to
> coroutines.
> 
> First patch fixes a bug in 'qemu coroutine' in regard to usage on non topmost
> stack frame.
> 
> Second patch implements 'qemu bt' as Stefan suggested.
> 
> V2, because after hitting 'send' I noticed a few bugs:
>    1. Switch to try/catch around bt, so that when regular bt fails, we
>       print the same message as original bt.
>    2. Print the correct co-routine address
> 
> Best regards,
>         Maxim Levitsky
> 
> Maxim Levitsky (2):
>   scripts/gdb: fix 'qemu coroutine' when users selects a non topmost
>     stack frame
>   scripts/gdb: implement 'qemu bt'
> 
>  scripts/qemu-gdb.py          |  1 +
>  scripts/qemugdb/coroutine.py | 35 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
> 
> -- 
> 2.26.2
> 
> 
> 
Any update on this?
Best regards,
	Maxim Levitsky



