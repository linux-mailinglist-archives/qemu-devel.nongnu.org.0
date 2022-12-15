Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D136164D74C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 08:34:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5il8-0003dI-2S; Thu, 15 Dec 2022 02:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5il4-0003bK-Ey
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:34:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5il1-0001Yb-2D
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671089657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3j4SjXPBOl1LHuzhz7Vb8EQUigXMiw+igi2wCIDp8TI=;
 b=Ux7Y7drAXADyRiDZAzBjTII9KgiPoizQXMaUZZoIyNZqEuVcZhX9ZBpBUlCEJNTdfnTdHW
 /tnsrFuJYDjAIuxHUpWNh2P8Rk7ukHHuO1iLixsyV1mIQvQBhyvxIiJKkYrMSWO98dptsk
 yPXZQSY7wV3zvkFKJSo3WIL2nea65sg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-E24oKPpUPJSwW30Crql6eQ-1; Thu, 15 Dec 2022 02:34:14 -0500
X-MC-Unique: E24oKPpUPJSwW30Crql6eQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 890DB858F09;
 Thu, 15 Dec 2022 07:34:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1529E40ED76D;
 Thu, 15 Dec 2022 07:34:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0881A21E6900; Thu, 15 Dec 2022 08:34:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: <qemu-devel@nongnu.org>,  <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>,  <philmd@linaro.org>
Subject: Re: [PATCH 6/5] include/hw/cxl: Break inclusion loop
References: <20221209134802.3642942-1-armbru@redhat.com>
 <875yekehnx.fsf@pond.sub.org> <874ju3bur1.fsf@pond.sub.org>
 <20221212105449.000009aa@Huawei.com>
Date: Thu, 15 Dec 2022 08:34:10 +0100
In-Reply-To: <20221212105449.000009aa@Huawei.com> (Jonathan Cameron's message
 of "Mon, 12 Dec 2022 10:54:49 +0000")
Message-ID: <87y1r9aznx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Jonathan Cameron <Jonathan.Cameron@Huawei.com> writes:

> On Sat, 10 Dec 2022 08:09:06 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Markus Armbruster <armbru@redhat.com> writes:
>> 
>> > hw/cxl/cxl_pci.h and hw/cxl/cxl_cdat.h include each other.  Neither
>> > header actually needs the other one.  Drop both #include directives.
>> >
>> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> > ---
>> >  include/hw/cxl/cxl_cdat.h | 1 -
>> >  include/hw/cxl/cxl_pci.h  | 1 -
>> >  2 files changed, 2 deletions(-)
>> >
>> > diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
>> > index 7f67638685..e3fd737f9d 100644
>> > --- a/include/hw/cxl/cxl_cdat.h
>> > +++ b/include/hw/cxl/cxl_cdat.h
>> > @@ -10,7 +10,6 @@
>> >  #ifndef CXL_CDAT_H
>> >  #define CXL_CDAT_H
>> >  
>> > -#include "hw/cxl/cxl_pci.h"
>> >  #include "hw/pci/pcie_doe.h"
>
> The include was to get to CXL_VENDOR_ID which is in hw/cxl/cxl_pci.h
> Can move that elsewhere perhaps, though I don't think we need to
> if we break the loop by dropping the other one.

It's used only in a macro.  If you use the macro, you need to include
cxl_pci.h.

Would you like me to keep this #include?

>> >  /*
>> > diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
>> > index aca14845ab..01e15ed5b4 100644
>> > --- a/include/hw/cxl/cxl_pci.h
>> > +++ b/include/hw/cxl/cxl_pci.h
>> > @@ -11,7 +11,6 @@
>> >  #define CXL_PCI_H
>> >  
>> >  #include "qemu/compiler.h"
>> > -#include "hw/cxl/cxl_cdat.h"
> Guess that's a left over of some earlier refactoring. Good to get rid
> of this one.
>
>> >  
>> >  #define CXL_VENDOR_ID 0x1e98  
>> 
>> Friday afternoon post with insufficient testing...  Everything still
>> builds fine, but cxl_component.h is no longer self-contained.  I'll
>> squash in the appended patch and revise the commit message.
>
> By staring at the code rather than any automation I'm failing to spot
> what it needs from cxl_pci.h.  Can you add that info to the commit message?

It's CXL20_MAX_DVSEC.

>> diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
>> index 5dca21e95b..78f83ed742 100644
>> --- a/include/hw/cxl/cxl_component.h
>> +++ b/include/hw/cxl/cxl_component.h
>> @@ -19,6 +19,7 @@
>>  #include "qemu/range.h"
>>  #include "qemu/typedefs.h"
>>  #include "hw/cxl/cxl_cdat.h"
>> +#include "hw/cxl/cxl_pci.h"
>>  #include "hw/register.h"
>>  #include "qapi/error.h"
>>  
>> 


