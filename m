Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036113C7E09
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 07:45:08 +0200 (CEST)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Xhj-0000np-2l
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 01:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3Xge-0008Oh-Re
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:44:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3Xga-0005FX-PU
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626241433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RoVhVFQyLeAINU1jldEGljAKx3AolMbWTr9N8t2XjnM=;
 b=IS1cTYgtlQr9iZ+E+4RsyfxCG/wgYgNMirdYgsLGEjBRVTC4kDN3T+TXdsyT57jRiy6XiD
 iYHd6AvpZZR7ZKLFNSqnChKVlgs7hpSZyGXkCTA7fX8mgOVU3MgXljNZTPllfSFLItl/ko
 zvCydkcEXRy2mFvMze3yQVkFGfEL//Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-cpe2m3mEMUeFv1z5fLDHAg-1; Wed, 14 Jul 2021 01:43:52 -0400
X-MC-Unique: cpe2m3mEMUeFv1z5fLDHAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62C74804141;
 Wed, 14 Jul 2021 05:43:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-81.ams2.redhat.com
 [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17F8960C05;
 Wed, 14 Jul 2021 05:43:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9E2C5113865F; Wed, 14 Jul 2021 07:43:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/4] configure: Fix --without-default-features
 propagation to meson
References: <20210713093155.677589-1-thuth@redhat.com>
 <20210713093155.677589-2-thuth@redhat.com>
 <0ea4b6c5-c0f9-9ce2-a291-9cc1171ed93a@redhat.com>
Date: Wed, 14 Jul 2021 07:43:49 +0200
In-Reply-To: <0ea4b6c5-c0f9-9ce2-a291-9cc1171ed93a@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 13 Jul 2021 18:42:31
 +0200")
Message-ID: <877dhtmove.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> +Alex
>
> On 7/13/21 11:31 AM, Thomas Huth wrote:
>> A typo prevents that many features get disabled when the user
>> runs "configure" with the --without-default-features switch.
>>=20
>> Reported-by: Cole Robinson <crobinso@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  configure | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/configure b/configure
>> index 85db248ac1..229ea52516 100755
>> --- a/configure
>> +++ b/configure
>> @@ -5205,7 +5205,7 @@ if test "$skip_meson" =3D no; then
>>          -Ddocs=3D$docs -Dsphinx_build=3D$sphinx_build -Dinstall_blobs=
=3D$blobs \
>>          -Dvhost_user_blk_server=3D$vhost_user_blk_server -Dmultiprocess=
=3D$multiprocess \
>>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek -Dguest_agent_msi=3D$=
guest_agent_msi -Dbpf=3D$bpf\
>> -        $(if test "$default_features" =3D no; then echo "-Dauto_feature=
s=3Ddisabled"; fi) \
>> +        $(if test "$default_feature" =3D no; then echo "-Dauto_features=
=3Ddisabled"; fi) \
>
> The option should be name plural (default_features)...

Actually, no.  The variable holds the initial value for the feature
variables that are to be controlled by --with-default-features.
Example:

    vde=3D"$default_feature"

Perhaps $feature_default would be a better name.

> What is 'auto_features' used for?
>
>>  =09-Dtcg_interpreter=3D$tcg_interpreter \
>>          $cross_arg \
>>          "$PWD" "$source_path"
>>=20


