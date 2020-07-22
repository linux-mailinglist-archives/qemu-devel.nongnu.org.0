Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0374122A0E5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 22:48:51 +0200 (CEST)
Received: from localhost ([::1]:44760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyLfV-00016Z-Pu
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 16:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jyLeO-0000dj-E9
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 16:47:40 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58972
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jyLeM-0008Ea-2z
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 16:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595450855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hoeGS2zUUtZylugqOyvRjvvrIzwDUBWru8+dil06ROc=;
 b=G+keV0W8YAQ4k3LrSkhTINcYu5IFg0ERDmfB5SK2Pu0b7pgO2VJD13aWqOT/016vA6KExH
 u030eQbQ/Nd0Kb4n5Qsb2/WfB7IUyEafG6ecBOtaRYAVzCjibBeNCITGrRUElnJ8DpO1i0
 IOG8j4gxH8qhTrmxqhiZ/3q3Ne1LJ1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-rvQXOkbNOXeAj8w4gGFbuA-1; Wed, 22 Jul 2020 16:47:33 -0400
X-MC-Unique: rvQXOkbNOXeAj8w4gGFbuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B82280183C;
 Wed, 22 Jul 2020 20:47:32 +0000 (UTC)
Received: from localhost (unknown [10.10.67.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B484E100EBDB;
 Wed, 22 Jul 2020 20:47:31 +0000 (UTC)
Date: Wed, 22 Jul 2020 16:47:31 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: 5.1.0-rc1 regression: reset fails with kvm and -cpu host
Message-ID: <20200722204731.GP1274972@habkost.net>
References: <bf007af9-f81e-3542-0237-5ea467f34377@siemens.com>
 <20200722173513.GO1274972@habkost.net>
 <7be95bd6-dfc6-2c22-85a1-a1c932d07fdd@siemens.com>
MIME-Version: 1.0
In-Reply-To: <7be95bd6-dfc6-2c22-85a1-a1c932d07fdd@siemens.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:34:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 22, 2020 at 08:05:01PM +0200, Jan Kiszka wrote:
> On 22.07.20 19:35, Eduardo Habkost wrote:
> > Hi Jan,
> > 
> > What was the last version where it worked for you?  Does using
> > "-cpu host,-vmx" help?
> 
> Yeah, -vmx does indeed help.
> 
> I didn't have the time to bisect yet. Just check my reflog, picked
> eb6490f544, and that works.

Thanks!

I could reproduce it locally[1], I will bisect it.

The good news is that "-cpu host,+vmx" still works, on commit
eb6490f544.

[1] Linux 5.6.19-300.fc32.x86_64, Intel Core i7-8665U CPU.

-- 
Eduardo


