Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4490829343F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 07:22:44 +0200 (CEST)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUk6d-0006Ui-9H
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 01:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUk3e-0004VH-4q
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 01:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUk3a-0000BA-G4
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 01:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603171171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=taOzKHIxLq8lPduH4GToLxTo66KEDRLQ3aLHkNazjzA=;
 b=ViBGKmBi4beRN6yTJFTZCpT3pbG4xepofJGjhrgiUqsszizoWVOuARx2I1lNyFVLGNvMqm
 JNWfFaM/8C4SF3d2Sn54Pw3tRVoqm64+wwlVOfqUbzy8InG/ZWRrAbtpWcgZobDsVm5AoU
 bFngSL+Q911hitOxg0uR/xkOfOIEDko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-kaJj9idxO_WDIQmtCLnCiw-1; Tue, 20 Oct 2020 01:19:27 -0400
X-MC-Unique: kaJj9idxO_WDIQmtCLnCiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 465051084C97;
 Tue, 20 Oct 2020 05:19:26 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-107.ams2.redhat.com [10.36.112.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88F4D5C641;
 Tue, 20 Oct 2020 05:19:25 +0000 (UTC)
Subject: Re: [PATCH v2 9/9] block: check availablity for preadv/pwritev on mac
To: Joelle van Dyne <j@getutm.app>
References: <20201019013928.72770-1-j@getutm.app>
 <20201019013928.72770-10-j@getutm.app>
 <54ea1dc9-f4e5-7827-6d05-c574b8c411d1@redhat.com>
 <CA+E+eSAO0-0FFTBuM7c54cXOQMJkUhcPZ=kf-=RtSvwKdjmViA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8bebc004-5a63-8936-b8ef-d1bf68dbf220@redhat.com>
Date: Tue, 20 Oct 2020 07:19:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CA+E+eSAO0-0FFTBuM7c54cXOQMJkUhcPZ=kf-=RtSvwKdjmViA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2020 00.20, Joelle van Dyne wrote:
> On Mon, Oct 19, 2020 at 1:27 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 19/10/2020 03.39, Joelle van Dyne wrote:
>>> From: osy <osy86@users.noreply.github.com>
>>
>> That "From:" line looks wrong ... could you please fix the "Author" of your
>> patches / your git config?
> osy wrote the original changes. I joined the UTM project to help bring
> the changes upstream with permission. However, they have agreed that
> if required that we can use my name as the author.

In any way, that "users.noreply.github.com" does not look like a valid
e-mail address and should be replaced.

>>
>>> macOS 11/iOS 14 added preadv/pwritev APIs. Due to weak linking, configure
>>> will succeed with CONFIG_PREADV even when targeting a lower OS version. We
>>> therefore need to check at run time if we can actually use these APIs.
>>
>> That sounds like the wrong approach to me ... could you please try to fix
>> the check in "configure" instead? E.g. by running compile_prog with
>> "-Werror", so that the test fails if there is no valid prototype available?
> It's not that simple. Xcode 11 and below (supporting macOS 10.15 and
> below, iOS 13 and below, etc) does not have preadv/pwritev symbols
> defined and would fail to compile. Xcode 12 (supporting macOS 11 and
> below, iOS 14 and below, etc) have preadv/pwritev weakly defined so if
> it runs on, for example, 10.15, it would abort. There is no way to
> determine at compile time if you can use preadv/pwritev or not when
> building with Xcode 12. The availability checks are Apple's preferred
> way to handle this kind of situation (they discourage directly
> checking if an API exists on a system).

Ok, got it now, thanks for the detailed explanation!

 Thomas


