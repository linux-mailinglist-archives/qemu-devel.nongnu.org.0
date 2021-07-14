Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF823C864D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:44:43 +0200 (CEST)
Received: from localhost ([::1]:58054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3g7u-0004JW-65
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3g6a-0003FW-MZ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:43:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3g6Z-0003qt-1V
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626273798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+uy7uiaUHTh6gmxYUYrFocfKGqOWyGoww6pl2LgYq4=;
 b=Cvh5QuMvdNrWK55GLxnd4kQM0grMINkDxhCzYYhScvoV0FnymWVjEG2zK8tq89VyTnzwKA
 XjAXzTPDn2xbarxBgMozGH+Z6xG6o2ywNwiXavnLVa3VSFS46c/Yxn1KT17Kpf27BwEynY
 7kOTOheh+K855RyRaK6BmufbJIypDB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-R30RJxZVNcGKjNQNmP2f3Q-1; Wed, 14 Jul 2021 10:43:15 -0400
X-MC-Unique: R30RJxZVNcGKjNQNmP2f3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B9C2804145;
 Wed, 14 Jul 2021 14:43:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-81.ams2.redhat.com
 [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 758965C1D1;
 Wed, 14 Jul 2021 14:43:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 032B6113865F; Wed, 14 Jul 2021 16:43:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 0/9] tests: Add test cases for TPM 1.2 ACPI tables
References: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
 <bb8d222a-be8a-02b7-3ddc-de443290e29d@redhat.com>
 <36bcf543-0b56-7e2f-26e7-648ca3cf58dd@linux.ibm.com>
 <dd9e11e5-c39f-296b-e74a-4c66c8531500@redhat.com>
Date: Wed, 14 Jul 2021 16:43:08 +0200
In-Reply-To: <dd9e11e5-c39f-296b-e74a-4c66c8531500@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 12 Jul 2021 18:26:32
 +0200")
Message-ID: <87a6mpez2b.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> +Markus
>
> On 7/12/21 5:47 PM, Stefan Berger wrote:
>>=20
>> On 7/12/21 11:29 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Hi Stefan,
>>>
>>> On 7/12/21 5:09 PM, Stefan Berger wrote:
>>>> This series of patches adds test case for TPM 1.2 ACPI tables.
>>>>
>>>> =C2=A0=C2=A0 Stefan
>>>>
>>>> v3:
>>>> =C2=A0=C2=A0 - Define enum TPMVersion for when CONFIG_TPM is not defin=
ed
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 affected patches 2 and 6
>>> I think in 11fb99e6f48..e542b71805d we missed an extra patch
>>> for qtests. Probably (untested):
>>=20
>> Shouldn't we have seen test compilation errors already?
>>=20
>> I didn't go down this route for the build system (as you show below)
>> because in this series we are testing ACPI tables and I introduce the
>> reference to enum TPMVersion here, which wasn't needed before. The
>> alternative may be to go into 8/9 and eliminate all TPM code if
>> CONFIG_TPM is not set. The introduction of the enum now passes the tests
>> with --enable-tpm and --disable-tpm.
>>=20
>> Otherwise the BIOS test are skipped due to this here:
>>=20
>>=20
>> static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t base, enum TPMVersion tpm_version)
>> {
>> #ifdef CONFIG_TPM
>> [...]
>>=20
>> #else
>> =C2=A0=C2=A0=C2=A0 g_test_skip("TPM disabled");
>> #endif
>> }
>>=20
>> So I didn't want to clutter this code with more #ifdef CONFIG_TPM but
>> maybe that would be the right solution.
>
> IMO the "right" solution is to check via QMP if TMP is supported
> or not. This is now doable since commit caff255a546 ("tpm: Return
> QMP error when TPM is disabled in build").
>
> Long term we'd like to decouple the tests/ build from the various
> QEMU configurations, and build the tests once.

This argument applies only to macros from target-specific headers like
$TARGET-config-target.h, not to macros from config-host.h.  #ifdef
CONFIG_TPM should be fine, shouldn't it?


