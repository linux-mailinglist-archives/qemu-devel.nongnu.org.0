Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189EF58A8E9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:38:26 +0200 (CEST)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJtmi-0005TQ-IB
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJteu-0001vE-ME
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:30:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJtes-0008Py-Ns
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659691818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jhZj9QI2oHomG7NWW5qz4N4BAxnKFrP+4YzIJFB8Sy4=;
 b=TqOYu35VQXOlMomCotGWyEHCzKHW6yu/9FHRNSBA3j7Fz/EGrpAPh555sRWitTNd6372Z7
 aKAwymLevf2iaK6r2fPfhHXXm2lituKZoCXDbpnyd++TnEHVsJQp/iYQ1XMYn1/O2FfDs3
 P5mYEsUCPCFSk+9aeS/5UgA1xqXlvqM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-8Mtm2aGwPCKAaCjAmDWfdw-1; Fri, 05 Aug 2022 05:30:14 -0400
X-MC-Unique: 8Mtm2aGwPCKAaCjAmDWfdw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C3A51C1395E;
 Fri,  5 Aug 2022 09:30:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4944E492CA2;
 Fri,  5 Aug 2022 09:30:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 88C7121E6930; Fri,  5 Aug 2022 11:30:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Regression in -readconfig [memory] size (was: [PULL 13/27] machine:
 add mem compound property)
References: <20220512172505.1065394-1-pbonzini@redhat.com>
 <20220512172505.1065394-14-pbonzini@redhat.com>
 <87czfcof27.fsf@pond.sub.org>
Date: Fri, 05 Aug 2022 11:30:12 +0200
In-Reply-To: <87czfcof27.fsf@pond.sub.org> (Markus Armbruster's message of
 "Mon, 13 Jun 2022 15:42:24 +0200")
Message-ID: <87pmhf6nrv.fsf_-_@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Markus Armbruster <armbru@redhat.com> writes:

> Paolo Bonzini <pbonzini@redhat.com> writes:
>
>> Make -m syntactic sugar for a compound property "-machine
>> mem.{size,max-size,slots}".  The new property does not have
>> the magic conversion to megabytes of unsuffixed arguments,
>> and also does not understand that "0" means the default size
>> (you have to leave it out to get the default).  This means
>> that we need to convert the QemuOpts by hand to a QDict.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Message-Id: <20220414165300.555321-4-pbonzini@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

[...]

> This appears to change the meaning of
>
>     [memory]
>       size = "1024"
>
> in a -readconfig file from 1024MiB to 8KiB (1024 Bytes rounded up to
> 8KiB silently).

No reply so far.

If we can't fix this, we better mention it in the release notes.

Can we fix it?

> Aside: the failure mode is nasty: "KVM internal error. Suberror: 1".
> Known issue.  Or rather known again issue (to me); I thought I had
> broken KVM somehow.


