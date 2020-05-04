Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612381C3E72
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 17:26:33 +0200 (CEST)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVczI-000677-AB
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 11:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jVcy1-00055B-PH
 for qemu-devel@nongnu.org; Mon, 04 May 2020 11:25:13 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23917
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jVcy0-0002YR-AX
 for qemu-devel@nongnu.org; Mon, 04 May 2020 11:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588605910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8+4v971i16emJ5Ws8/uNGUDkEs1jRqS2R9166EXLHc=;
 b=FWtOyeF7cDEQ6TCe/Er3vrsZrSuEEKYCea4kmNkT+yeCWaY2SwNnz+aVC5haVBGGRS31yv
 xkhUXRwnAlrNFXE8C0ff3u8VYM+n6/n0/SnjKmwkVKPwNfy4OpiCBtNh8TXXkyOR5ueqd4
 R5dK0TDElAT4IUq9zWIf1SXf0qRzea4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-scGtFDNsPbORVEvstHf9Uw-1; Mon, 04 May 2020 11:25:07 -0400
X-MC-Unique: scGtFDNsPbORVEvstHf9Uw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1C09461
 for <qemu-devel@nongnu.org>; Mon,  4 May 2020 15:25:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA7415C1B2;
 Mon,  4 May 2020 15:25:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6BBC811358BC; Mon,  4 May 2020 17:24:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 03/11] s390x/cpumodel: Fix harmless misuse of
 visit_check_struct()
References: <20200424192027.11404-1-armbru@redhat.com>
 <20200424192027.11404-4-armbru@redhat.com>
 <57392357-7422-180f-d965-3f7bf3e657c2@redhat.com>
 <875zdix2k7.fsf@dusky.pond.sub.org>
 <20200504130957.517336fb.cohuck@redhat.com>
Date: Mon, 04 May 2020 17:24:59 +0200
In-Reply-To: <20200504130957.517336fb.cohuck@redhat.com> (Cornelia Huck's
 message of "Mon, 4 May 2020 13:09:57 +0200")
Message-ID: <87pnbjzpro.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cornelia Huck <cohuck@redhat.com> writes:

> On Wed, 29 Apr 2020 07:51:04 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> David Hildenbrand <david@redhat.com> writes:
>>=20
>> > On 24.04.20 21:20, Markus Armbruster wrote: =20
>> >> Commit e47970f51d "s390x/cpumodel: Fix query-cpu-model-FOO error API
>> >> violations" neglected to change visit_end_struct()'s Error ** argumen=
t
>> >> along with the others.  If visit_end_struct() failed, we'd take the =
=20
>> >
>> > s/visit_end_struct/visit_check_struct/ ? =20
>>=20
>> Will fix.
>>=20
>> >> success path.  Fortunately, it can't fail here:
>> >> qobject_input_check_struct() checks we consumed the whole dictionary,
>> >> and to get here, we did.  Fix it anyway. =20
>> >
>> > AFAIKs, if visit_check_struct() failed, we'd still do the memcopy, but
>> > also report the error. Not nice, not bad.
>> >
>> > Reviewed-by: David Hildenbrand <david@redhat.com> =20
>>=20
>> Thanks!
>
> Will you queue this, or shall I queue it?

Me taking the complete series through my tree would be easiest for me.
But I can cope with other maintainers picking up bits.


