Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56342DD971
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 20:40:38 +0100 (CET)
Received: from localhost ([::1]:36462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpz8f-0000X1-FF
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 14:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kpz60-0007wd-7L
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 14:37:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kpz5t-0008Bi-Ux
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 14:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608233865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PPDlPbtdw69xfNzIVVJmdjDnqAEgdXpuw01fdG69gmg=;
 b=WZ8b9HT+I6M6eyr9B6QdAcz6zlMB597dZKZDroHMqWMEnjrWiU55QLdfsFVZgrbETAKuQo
 SWTxjsNrZPuuiOndlybFKvyuNyXO3gKW1gxGKzPZlRy8Y3e7IGYHg8xKtlaKrf231p+LHJ
 Bjo0A9XapMow7gmExmfDfdDz4VpJWx4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-NEaoc6kpPQqjUkvvPOL1xw-1; Thu, 17 Dec 2020 14:37:43 -0500
X-MC-Unique: NEaoc6kpPQqjUkvvPOL1xw-1
Received: by mail-wr1-f69.google.com with SMTP id g16so28524wrv.1
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 11:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=UL0BDXZVGNojaammSaVjO6r7svVAQPF0Un9DBn4mRnk=;
 b=btB8CE/BkCsgCspp9wFPNgDFHSRtCXRAOINWrjBdW+09DXqSqWBVEAT3LXdXWE175D
 GT/DoCID8d01jnyjd7J7f85st9IfrATfm66Gyo7+c0GUhGNWnHy8AmVTpQCMg0GgevLK
 J/SfljxklhGK5S5cd8ii385fe21mRnRitmkIY2nlTR0GrBqTH3BVw0r7+i8AD2gT1g+r
 I+JqWoc63LJq5e879J2K18kbCg0oYMlgML8BZ0qV6Yu7SX7oxmMjZ0pi1ui0/UoLnjqF
 a/ZISWp8ZXvur/uWzG7KN5vvVOi/0fwA+nVzmrIBOCZjFTDDH2Jun0UsWBasGva3thtQ
 BOaw==
X-Gm-Message-State: AOAM53245IqoVLnpXeCEvhDjBhsJBphsuSgU22ODc8mRvjY+/9JDaNR9
 aDPT4dMt7LPXFXjPDkWFBQaFMS5FZKWyEyHKrkfv3/N4AT8FrqOz2KhTZhNrRvvJl27TFxZzZhI
 HMUXamoJvYXK8Ql0=
X-Received: by 2002:adf:bb89:: with SMTP id q9mr430939wrg.250.1608233862187;
 Thu, 17 Dec 2020 11:37:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+p8OR+JwWG3UzIVKV1OLhk7zA1eknY8oT7C13GbCBqBYwXuHcsHAmd8t0A2GrCYzwoPrN8w==
X-Received: by 2002:adf:bb89:: with SMTP id q9mr430918wrg.250.1608233861985;
 Thu, 17 Dec 2020 11:37:41 -0800 (PST)
Received: from [192.168.3.114] (p5b0c60a5.dip0.t-ipconnect.de. [91.12.96.165])
 by smtp.gmail.com with ESMTPSA id
 n17sm8966670wmc.33.2020.12.17.11.37.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 11:37:41 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 04/10] vfio: Query and store the maximum number of DMA
 mappings
Date: Thu, 17 Dec 2020 20:37:40 +0100
Message-Id: <457CB903-21B9-47E7-BA5E-CB6C159944DF@redhat.com>
References: <bb621937-3d39-bade-082a-892f4126b018@redhat.com>
In-Reply-To: <bb621937-3d39-bade-082a-892f4126b018@redhat.com>
To: David Hildenbrand <david@redhat.com>
X-Mailer: iPhone Mail (18B92)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 17.12.2020 um 20:04 schrieb David Hildenbrand <david@redhat.com>:
>=20
> =EF=BB=BFOn 17.12.20 18:55, Alex Williamson wrote:
>>> On Wed, 16 Dec 2020 15:11:54 +0100
>>> David Hildenbrand <david@redhat.com> wrote:
>>>=20
>>> Let's query the maximum number of DMA mappings by querying the availabl=
e
>>> mappings when creating the container.
>>>=20
>>> In addition, count the number of DMA mappings and warn when we would
>>> exceed it. This is a preparation for RamDiscardMgr which might
>>> create quite some DMA mappings over time, and we at least want to warn
>>> early that the QEMU setup might be problematic. Use "reserved"
>>> terminology, so we can use this to reserve mappings before they are
>>> actually created.
>>=20
>> This terminology doesn't make much sense to me, we're not actually
>> performing any kind of reservation.
>=20
> I see you spotted the second user which actually performs reservations.
>=20
>>=20
>>> Note: don't reserve vIOMMU DMA mappings - using the vIOMMU region size
>>> divided by the mapping page size might be a bad indication of what will
>>> happen in practice - we might end up warning all the time.
>>=20
>> This suggests we're not really tracking DMA "reservations" at all.
>> Would something like dma_regions_mappings be a more appropriate
>> identifier for the thing you're trying to count?  We might as well also
>=20
> Right now I want to count
> - Mappings we know we will definitely have (counted in this patch)
> - Mappings we know we could eventually have later (RamDiscardMgr)
>=20
>> keep a counter for dma_iommu_mappings where the sum of those two should
>> stay below dma_max_mappings.
>=20
> We could, however, tracking active IOMMU mappings when removing a memory
> region from the address space isn't easily possible - we do a single
> vfio_dma_unmap() which might span multiple mappings. Same applies to
> RamDiscardMgr. Hard to count how many mappings we actually *currently*
> have using that approach.
>=20

Thinking about it, might actually be possible when tracking active mappings=
 per iommu / ram discard mgr as well. Will have a look in the new year - th=
anks.


