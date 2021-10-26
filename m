Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742843B77C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:43:40 +0200 (CEST)
Received: from localhost ([::1]:51538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPY3-00037E-9j
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1mfPTW-0004M6-FX
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:38:58 -0400
Received: from mail.csgraf.de ([85.25.223.15]:49384 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1mfPTU-00052G-Db
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:38:57 -0400
Received: from smtpclient.apple
 (dynamic-077-007-071-240.77.7.pool.telefonica.de [77.7.71.240])
 by csgraf.de (Postfix) with ESMTPSA id A0B00608039E;
 Tue, 26 Oct 2021 18:38:52 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alexander Graf <agraf@csgraf.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
Date: Tue, 26 Oct 2021 18:38:51 +0200
Message-Id: <27B816F7-3670-428C-AA42-95BC7DD635CC@csgraf.de>
References: <13a13852-4fb4-a0f8-6740-354c8054aed1@linaro.org>
In-Reply-To: <13a13852-4fb4-a0f8-6740-354c8054aed1@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: iPhone Mail (19B74)
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: kettenis@openbsd.org,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 26.10.2021 um 18:10 schrieb Richard Henderson <richard.henderson@linaro=
.org>:
>=20
> =EF=BB=BFOn 10/26/21 12:12 AM, Alexander Graf wrote:
>> +        if (cm) {
>> +            /* We don't cache MMIO regions */
>> +            advance_pc =3D true;
>> +            break;
>> +        }
>> +
>>          assert(isv);
>=20
> The assert should come first.  If the "iss valid" bit is not set, then not=
hing else in the word is defined.
>=20
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Yes, but isv=3D0 for cm=3D1. And even in other isv=3D0 situations most other=
 fields are valid (post-idx provides the correct va/pa too for example).

Does cm=3D1 really give you isv=3D1 on other hardware?

Alex


