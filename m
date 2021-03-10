Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B263B334931
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:54:29 +0100 (CET)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5qe-00040x-9U
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lK5lq-0007c7-N7
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:49:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lK5lo-0000J4-EE
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615409365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWAsAsoB2MtIRahs3uq2EJy5wr2Q/0Sd8OHorn2B41s=;
 b=dhoiy8z2H8UWayHEfyhu5r25zEMCwOzMWzhNnyPHSh84kW8KQ9xNxBGJv3k5QU8mDS2GK8
 hmeaBCA9ZYD/s6ceMDEkQLIISQyhOD/F+5Gh9soVDlfUmNzSZeiKx7nqKi4G6q8ULZ/TmY
 IxrjwcX8Kr3WudBNEC/cUxVxJjAxYdk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-3K4jAvWNNEyNrO68iDatwg-1; Wed, 10 Mar 2021 15:49:24 -0500
X-MC-Unique: 3K4jAvWNNEyNrO68iDatwg-1
Received: by mail-wr1-f69.google.com with SMTP id z17so8493912wrv.23
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 12:49:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=A52h6wu9P54l55Z2FKziKIxOgu7DQRYIR6Th0GEQRbA=;
 b=PGEdPaPrsuHQp+YDV1lA9IlB9ykJG2qobmARz5c6VHxHSqMYRF/y4fFSlkD5cg/juF
 qDODDCBZ3uoKFoCYp18TKG04zTEnfC68kX8irXKNv7MST0MNkO9B0jWxShjvmj1pbGji
 KiYG0/o85STjqoD0Qdbtee1XQliZE0nrh7Ie0fRtoVvaZFrAbRsyX0mD7Xaot0oUUhF8
 3CesW3ICq3Gw5v8dr4imst6S2+HJfHEkt3IQCHEQQkqa/Im5WI1yUeDBw98D0Nq0UVeJ
 2Reum4WGFQlj3IsMvPO5skWLkt/2eEJJ0owwWOj2v2ZwELORnicXAm4ybp5gDiWWLD1X
 UFFQ==
X-Gm-Message-State: AOAM532KSkIhjvGOv1PwKxlKAkwB09D8ARa6ZWPltqShmncymtwN6bfS
 rLLeNXCeqxjwS1nmtBYkdAMsezfrdJau2l94EQIo5m0GbSxolAy+gYaOTSw1tyHAoVwA87uBbzT
 5QMEgmOHvXzNEQwE=
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr5130811wrw.289.1615409363204; 
 Wed, 10 Mar 2021 12:49:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIfXfztMD3ZnzB8iW2qfB7A5fA7bj8TcxiLRQepVCECng6uwuWgtOyAvoyrtgnBDHeE/JoGA==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr5130792wrw.289.1615409362953; 
 Wed, 10 Mar 2021 12:49:22 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6b5e.dip0.t-ipconnect.de. [91.12.107.94])
 by smtp.gmail.com with ESMTPSA id
 i8sm503388wrx.43.2021.03.10.12.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 12:49:22 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
Date: Wed, 10 Mar 2021 21:49:22 +0100
Message-Id: <204A69C9-45EF-4613-8BC4-E2CF18E63180@redhat.com>
References: <5630635a-f605-dd73-4b06-844988f17dc6@redhat.com>
In-Reply-To: <5630635a-f605-dd73-4b06-844988f17dc6@redhat.com>
To: Thomas Huth <thuth@redhat.com>
X-Mailer: iPhone Mail (18D52)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 09.03.2021 um 22:05 schrieb Thomas Huth <thuth@redhat.com>:
>=20
> =EF=BB=BFOn 04/03/2021 09.10, David Hildenbrand wrote:
>>> On 03.03.21 22:36, Richard Henderson wrote:
>>> On 3/3/21 1:22 PM, David Hildenbrand wrote:
>>>>=20
>>>>> Am 03.03.2021 um 22:19 schrieb Richard Henderson <richard.henderson@l=
inaro.org>:
>>>>>=20
>>>>> =EF=BB=BFOn 3/3/21 1:11 PM, David Hildenbrand wrote:
>>>>>> MMIO on s390x? :)
>>>>>=20
>>>>> hw/s390x/s390-pci-bus.c, memory_region_init_io*().
>>>>>=20
>>>>=20
>>>> ... part of system address space where a CPU could stumble over it?
>>>=20
>>> Impossible to tell within 3 layers of object wrappers.  :-(
>>> I suppose I have no idea how "pci" was hacked onto s390x.
>> You've used the right words to describe "pci" (!) on s390x.
>> IIRC, there is no MMIO: configuration space accesses etc. are performed =
using special access instructions - which will "emulate" the MMIO access pe=
rformed on other archs via simple read/write instructions.
>> Ordinary instructions (e.g., mvpg) that operate on the system address sp=
ace should never stumble over MMIO regions - because that concept does not =
exist on s390x.
>=20
> Sorry, guys, you've lost me here ... is there now something left to do fo=
r this patch or is it good as it is?

I think that check for invalid TLB should be replaced by a check against ho=
st =3D=3D NULL.


