Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C973F5264F3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:43:30 +0200 (CEST)
Received: from localhost ([::1]:42462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWVt-0007lU-U5
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1npWRn-0004sm-Qr
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1npWRl-0005UB-6i
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652452752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BrJyCy31WdOBh4q/SWnST8ILiWnPxWDXrCZrdSNZ91Q=;
 b=GtCDusy5umZo+416eiblfYd7kTxLtnNRGhcognOJ1CZ+vhT87YTWXPLvUOKPmVe+61gubW
 RDTPyD/YDTt/dEyb4OxPZJo/RcnpuO4JsVQp7/NfQugXOW6pHtc1NIrpyv+lfbJ8sj2kqp
 o5qcVFQxPJes0F1d+FrlVD6HfOLlHs4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-XJA8bxbnNSicbn1eU3VITg-1; Fri, 13 May 2022 10:39:09 -0400
X-MC-Unique: XJA8bxbnNSicbn1eU3VITg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F9F6185A79C;
 Fri, 13 May 2022 14:39:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E133F111F3C1;
 Fri, 13 May 2022 14:39:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D036F21E690D; Fri, 13 May 2022 16:39:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  berrange@redhat.com,  Mark
 Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v2 1/8] qmp: Support for querying stats
References: <20220511084833.195963-1-pbonzini@redhat.com>
 <20220511084833.195963-2-pbonzini@redhat.com>
 <87wnepy4qd.fsf@pond.sub.org>
 <7462f89a-264b-866e-dcdb-6df93499b14a@redhat.com>
Date: Fri, 13 May 2022 16:39:07 +0200
In-Reply-To: <7462f89a-264b-866e-dcdb-6df93499b14a@redhat.com> (Paolo
 Bonzini's message of "Fri, 13 May 2022 16:06:09 +0200")
Message-ID: <87pmkhv6no.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/13/22 14:52, Markus Armbruster wrote:
>>> +# @StatsResult:
>>> +#
>>> +# @provider: provider for this set of statistics.
>>> +# @qom-path: QOM path of the object for which the statistics are returned
>> Since @qom-path is optional, we better document when it's present.  In
>> the review thread for v1, you explained "Only if the target is vcpus,
>> for the current set of targets."  More general, and hopefully still
>> correct, would be "Present if that object is a QOM object", but the
>> phrasing feels rather clumsy.  Would appending ", if any" suffice?
>> 
>
> Alternatively:
>
> # @qom-path: Path to the object for which the statistics are returned,
> #            if the object is exposed in the QOM tree

Sold!


