Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B202D99FA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:30:19 +0100 (CET)
Received: from localhost ([::1]:35302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koori-000052-Mi
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1koocM-0005sc-Lu
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:14:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1koocI-00057i-CQ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:14:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607955260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBeCFQu4TSVq4u19lw/v8H+C3+vwAsfe2/K+PIRPe9c=;
 b=I0R2/D5dVEICMIPaRJVHEztLg38COLSyfsKWtsZ9ppitWEYCSuMjPPCZrfLMKejLYQFqfs
 SEv3scaFVDjdLn/nq1YaLRzKHDeyayuFzEeCycE8GyfDF9yia6ENNOZPbitY1usToT5vON
 9HXCCGlWfaGM0I6sB0Mw4xPKyzfE93E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-gZqNngX8PHKGXZ0h3ueBGw-1; Mon, 14 Dec 2020 09:14:16 -0500
X-MC-Unique: gZqNngX8PHKGXZ0h3ueBGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D440FBBEE0;
 Mon, 14 Dec 2020 14:14:14 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-221.ams2.redhat.com
 [10.36.113.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1874717CFE;
 Mon, 14 Dec 2020 14:14:11 +0000 (UTC)
Subject: Re: [PATCH 3/3] sev: update sev-inject-launch-secret to make gpa
 optional
To: Tom Lendacky <thomas.lendacky@amd.com>, jejb@linux.ibm.com,
 qemu-devel@nongnu.org
References: <20201209172334.14100-1-jejb@linux.ibm.com>
 <20201209172334.14100-4-jejb@linux.ibm.com>
 <afe66ae1-a1d9-c017-b05d-12247350338b@amd.com>
 <aa8ebbb5b14821bcaf1d599511f75060d9dcc460.camel@linux.ibm.com>
 <0ef7d374-e284-4b11-3b10-301609f3495e@amd.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <678ac9e8-10b7-9b6c-088f-e334bb2be204@redhat.com>
Date: Mon, 14 Dec 2020 15:14:11 +0100
MIME-Version: 1.0
In-Reply-To: <0ef7d374-e284-4b11-3b10-301609f3495e@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ashish.kalra@amd.com, brijesh.singh@amd.com, david.kaplan@amd.com,
 jon.grimm@amd.com, tobin@ibm.com, frankeh@us.ibm.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, dovmurik@linux.vnet.ibm.com,
 Dov.Murik1@il.ibm.com, pbonzini@redhat.com, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 23:54, Tom Lendacky wrote:
> On 12/11/20 4:45 PM, James Bottomley wrote:
>> On Fri, 2020-12-11 at 16:00 -0600, Tom Lendacky wrote:
>>> On 12/9/20 11:23 AM, James Bottomley wrote:
>>
>> So for this one I'm not checking the length, which argues it wouldn't
>> be subject to the added length new data rule and I'd have to use a new
>> guid for new information.  However, I could also see situations where
>> you would check the length and thus would have the ability to add
>> fields (either at the beginning or the end).
> 
> I think this paragraph explains it nicely and a slightly expanded
> comment with this information would be enough.

Sounds good to me as well, thank you.

Laszlo


