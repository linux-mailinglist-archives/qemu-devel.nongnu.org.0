Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FF131AAE3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 11:32:58 +0100 (CET)
Received: from localhost ([::1]:36272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAsET-0002QB-JO
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 05:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lAsC7-0001Sm-Em
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 05:30:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lAsC3-0004e1-94
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 05:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613212223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KvR8sFRoyn7ryOpdJZhiZdWkfpflMOvlygTA4kORERM=;
 b=B31qNnF0wgwUURPX1Xz6mLVIcnfjtG0Ii8rgJLwowlCbP133odULhzxm6VhiNzQ2N9FOrz
 +x/UXY1BXPWayRKu79+w++oXDTDU77KbI5faEUiqDGf4DWhWphg0vGdV+6E8qPoJObqOnE
 GQ9+6vCuezlKrZF99gIuVEalpPUH6cs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-vSz8qkZ3MLaja3nQVX8BYA-1; Sat, 13 Feb 2021 05:30:19 -0500
X-MC-Unique: vSz8qkZ3MLaja3nQVX8BYA-1
Received: by mail-wr1-f69.google.com with SMTP id w16so3186033wrl.15
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 02:30:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=FgsvD3M9UtE8C7WacHVzbQ7wE5X4uSz+BVrpXNwOjm4=;
 b=hJhrbU+jDL6MTfIuPnhLFE97BLolTHSCFzQnhD8dtvZqoJVaBYb+NuYMYIeEMIbobZ
 ixOVQhHFAHpZ93UmhL+OwEm4jfFU/i4UbrAnsSpll/hUsV8q4gontOnuZggurmYYEzzT
 /5zK0AN5sGSVmvSGKuJidXzfawBqn7IQWcXoqrsm0UldKnIPR9p7hyJl3Kl8umyAZyy0
 QCBILvgPaNW2MsPEsmSvjPTVCBN0XZNBiB2HZU1B4nXL/ZYKLx0IcJKm8gktMxlqSeHz
 wD1dBK4Y9B2XrOu6amBUdXRKB/rYLpktuDTGJ++54VhI/YHps0Hfluexzp9SpHE+mOO2
 HVYg==
X-Gm-Message-State: AOAM530/psnJyc26seQnKms470V2OAg1CkD9bs7wbkPy+YdJXIIptDxr
 clBklIeKpgx/HJdToX4++yPra59v9BXDCACjs30mLai7YxGfqKtEnMADKA5K/YzTUiO1Biw+fVx
 c/LVDJHCO4yd8+VA=
X-Received: by 2002:a5d:610a:: with SMTP id v10mr2243515wrt.334.1613212218810; 
 Sat, 13 Feb 2021 02:30:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+CQCE3m4hk42lpHR05KqWuSCKI1MY8LU+bLWKL6fv6qnY/4rq6ld58odSmziR8zOkcl3g6g==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr2243490wrt.334.1613212218639; 
 Sat, 13 Feb 2021 02:30:18 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6bba.dip0.t-ipconnect.de. [91.12.107.186])
 by smtp.gmail.com with ESMTPSA id h9sm14782787wrc.94.2021.02.13.02.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Feb 2021 02:30:18 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Date: Sat, 13 Feb 2021 11:30:13 +0100
Message-Id: <2F054442-2D28-43E2-95F7-570B0F748F06@redhat.com>
References: <add5eef8-ff5b-5708-5383-f76262738e94@virtuozzo.com>
In-Reply-To: <add5eef8-ff5b-5708-5383-f76262738e94@virtuozzo.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
X-Mailer: iPhone Mail (18D52)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 13.02.2021 um 10:34 schrieb Andrey Gruzdev <andrey.gruzdev@virtuozzo.c=
om>:
>=20
> =EF=BB=BF
>> On 12.02.2021 19:11, Peter Xu wrote:
>>>> On Fri, Feb 12, 2021 at 09:52:52AM +0100, David Hildenbrand wrote:
>>>>> On 12.02.21 04:06, Peter Xu wrote:
>>>>>> On Thu, Feb 11, 2021 at 10:09:58PM +0100, David Hildenbrand wrote:
>>>>>> The issue is when the discard happened before starting the snapshot.=
 Write-protection won=E2=80=98t work and the zeroed content won=E2=80=98t b=
e retained in the snapshot.
>>>>> I see what you mean now, and iiuc it will only be a problem if init_o=
n_free=3D1.
>>>>> I think CONFIG_INIT_ON_FREE_DEFAULT_ON should be off for most distros=
, so the
>>>> Yes, some distros seem to enable init_on_alloc instead. Looking at the
>>>> introducing commit 6471384af2a6 ("mm: security: introduce init_on_allo=
c=3D1
>>>> and init_on_free=3D1 boot options") there are security use cases and i=
t might
>>>> become important with memory tagging.
>>>>=20
>>>> Note that in Linux, there was also the option to poison pages with 0,
>>>> removed via f289041ed4cf ("mm, page_poison: remove
>>>> CONFIG_PAGE_POISONING_ZERO"), available in some kernels that supported=
 free
>>>> page reporting.
>>>>=20
>>>> It got removed and use cases got told to use init_on_free.
>> I think we talk about init_on_free()/init_on_alloc() on guest side, righ=
t?
>> Still can't get how it relates to host's unpopulated pages..
>> =20
>> Try to look from hardware side. Untouched SDRAM in hardware is required =
to contain zeroes somehow? No.
>> These 'trash' pages in migration stream are like never written physical =
memory pages, they are really
>> not needed in snapshot but they don't do any harm as well as there's no =
harm in that never-written physical
>> page is full of garbage.
>>=20
>> Do these 'trash' pages in snapshot contain sensitive information not all=
owed to be accessed by the same VM?
>> I think no. Or we need a good example how it can be potentially exploite=
d.
I tried to explain how your implementation breaks *the guest inside the sna=
pshot* (I have no idea why you talk about sensitive information). If you ru=
n the snapshot, the guest will run into trouble, because the snapshot conta=
ins different data than the guest expects:

1. with discards before snapshotting started and free page reporting is run=
ning
2. with discards after snapshotting started

Maybe Peter can enlighten you, or the links I shared.


