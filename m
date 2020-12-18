Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9742DE3A2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:03:01 +0100 (CET)
Received: from localhost ([::1]:56070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGLU-0001Ok-Fs
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqGDR-0004pn-S4
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:54:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqGDP-00038N-MI
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608299678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=75Hlg/w34iwRCJNDpyzfauJ1DQ5p3hHng9Irf+nkhns=;
 b=BTBOBzDdzAeJbqlOWZttbT5Y62hce6/suhU2RSsdy3wNJ/ziaM9kMhRRDd1x1K0q68VaQx
 2AZHPFuw3XjlDJ1+pvfDgC+S1OEjfL4KZUyOY6kpiFED7+hDzMWL5C1UitveSXKP6yNbQW
 3F7joecajJ8HOMmBR+Bz9jkVyrRC58I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-P0L-BT8jNUKoz9z6ZC8acQ-1; Fri, 18 Dec 2020 08:54:37 -0500
X-MC-Unique: P0L-BT8jNUKoz9z6ZC8acQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44057801817;
 Fri, 18 Dec 2020 13:54:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCA5150DD3;
 Fri, 18 Dec 2020 13:54:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 713911130358; Fri, 18 Dec 2020 14:54:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 4/9] block/vpc: Make vpc_checksum() take void *
References: <20201217162003.1102738-1-armbru@redhat.com>
 <20201217162003.1102738-5-armbru@redhat.com>
 <6a870072-bccc-d7b9-5da5-acd9ecea62c7@redhat.com>
Date: Fri, 18 Dec 2020 14:54:34 +0100
In-Reply-To: <6a870072-bccc-d7b9-5da5-acd9ecea62c7@redhat.com> (Max Reitz's
 message of "Fri, 18 Dec 2020 11:54:28 +0100")
Message-ID: <87wnxf8bj9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Max Reitz <mreitz@redhat.com> writes:

> On 17.12.20 17:19, Markus Armbruster wrote:
>> Some of the next commits will checksum structs.  Change vpc_checksum()
>> to take void * instead of uint8_t, to save us pointless casts to
>> uint8_t *.
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   block/vpc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> diff --git a/block/vpc.c b/block/vpc.c
>> index 34186640ee..5af9837806 100644
>> --- a/block/vpc.c
>> +++ b/block/vpc.c
>> @@ -172,8 +172,9 @@ static QemuOptsList vpc_runtime_opts = {
>>     static QemuOptsList vpc_create_opts;
>>   -static uint32_t vpc_checksum(uint8_t *buf, size_t size)
>> +static uint32_t vpc_checksum(void *p, size_t size)
>>   {
>> +    uint8_t *buf = p;
>>       uint32_t res = 0;
>>       int i;
>
> Using this opportunity to add consts would be nice, but not necessary:

Didn't think of it, missed opportunity.  Not worth a respin all by
itself, I think.  I'm fine with the maintainer adding const.

> Reviewed-by: Max Reitz <mreitz@redhat.com>

Thanks!


