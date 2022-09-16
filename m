Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562C35BA830
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 10:26:38 +0200 (CEST)
Received: from localhost ([::1]:42748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ6gG-0001Ey-Db
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 04:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZ6Yx-0005NZ-RH
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:19:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZ6Yt-0004sF-Sd
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663316338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7836hMqLTy/ZqNJKPAQZ7/OMwOmn5pZg16Bjjw0hSaY=;
 b=SBMJkBy65mFAr8awusP2bNJ+g+ZEPFdxYyZkMAuyuJfdZegKXh9kzG0ifdf5S1+efQE9c/
 h0FeWXnPAuuF50DzD6Lok1YXbN1gDWshHzeshmNs6awx+PGO07HnC/n6iSoGlBI7Ry+SWc
 +0oNjm4THTfNc6xMYoHe2thEIs9t2vs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-BYGmDb8DM0OthU5RBo1rOA-1; Fri, 16 Sep 2022 04:18:54 -0400
X-MC-Unique: BYGmDb8DM0OthU5RBo1rOA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 889AD800B30;
 Fri, 16 Sep 2022 08:18:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EA602166B26;
 Fri, 16 Sep 2022 08:18:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 42AD221E6900; Fri, 16 Sep 2022 10:18:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  jsnow@redhat.com,
 eblake@redhat.com,  "Michael S . Tsirkin" <mst@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 06/27] qapi acpi: Elide redundant has_FOO in generated C
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-7-armbru@redhat.com>
 <CAARzgwyZK9EuKKj0UpUxC8BYEUBDwRYG==eTfndgNmKOE_FgKA@mail.gmail.com>
Date: Fri, 16 Sep 2022 10:18:52 +0200
In-Reply-To: <CAARzgwyZK9EuKKj0UpUxC8BYEUBDwRYG==eTfndgNmKOE_FgKA@mail.gmail.com>
 (Ani Sinha's message of "Fri, 16 Sep 2022 13:30:22 +0530")
Message-ID: <87illnenpv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ani Sinha <ani@anisinha.ca> writes:

> On Fri, Sep 16, 2022 at 2:13 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> The has_FOO for pointer-valued FOO are redundant, except for arrays.
>> They are also a nuisance to work with.  Recent commit "qapi: Start to
>> elide redundant has_FOO in generated C"
>
> Commit is referenced using <commit hash 13 chars min> ("commit header")

Apply my patches in your tree, and your hashes will differ from mine.
Hashes can serve as stable reference only when we git-fetch patches, not
when we git-send-email then.

>> provided the means to elide
>> them step by step.  This is the step for qapi/acpi.py.
>>
>> Said commit explains the transformation in more detail.  The invariant
>> violations mentioned there do not occur here.
>>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Ani Sinha <ani@anisinha.ca>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>


