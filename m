Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE8D4B6B99
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 13:01:40 +0100 (CET)
Received: from localhost ([::1]:36952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJwWW-0007oW-TS
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 07:01:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nJwUR-00070C-35
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:59:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nJwUN-0000H4-Iy
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644926362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nMTX8UElpHCnofQZTXpFWTTE5lV82fAljWeEs3OufkI=;
 b=IF+HJeI2pR1A4n89GLPekc2yhu4Va6c1LIybnsG4bssWt59MqR+s6190n4crrFC7CeHCYd
 vdNvA2BHHAtcaMhfcBCaqyXYrcP1LFt7WPV1sz0ug2lTy7FqBfmoyoW2oyFc7aI7O+sLRn
 +O8SrJaY3aiScaOuqmPzVrqfpPkUWn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-Q1QRrgJrM2Ozrm04T1nP-Q-1; Tue, 15 Feb 2022 06:59:21 -0500
X-MC-Unique: Q1QRrgJrM2Ozrm04T1nP-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F64D814246;
 Tue, 15 Feb 2022 11:59:20 +0000 (UTC)
Received: from localhost (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72B8A6E197;
 Tue, 15 Feb 2022 11:58:49 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, Eric Auger
 <eric.auger@redhat.com>
Subject: Re: [PATCH v3 0/4] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
In-Reply-To: <Ygt3A4jETnmy0K0Y@myrica>
Organization: Red Hat GmbH
References: <20220214124356.872985-1-jean-philippe@linaro.org>
 <87o839s67g.fsf@redhat.com>
 <ef945ca8-ee6b-8b17-2fe2-add32dfb9dd4@redhat.com>
 <Ygt3A4jETnmy0K0Y@myrica>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Tue, 15 Feb 2022 12:58:47 +0100
Message-ID: <87leycs5mw.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15 2022, Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> On Tue, Feb 15, 2022 at 10:16:40AM +0100, Eric Auger wrote:
>> Hi Connie,
>> 
>> On 2/14/22 6:34 PM, Cornelia Huck wrote:
>> > On Mon, Feb 14 2022, Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
>> >
>> >> Replace the VIRTIO_IOMMU_F_BYPASS feature with
>> >> VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
>> >> global bypass on and off.
>> >>
>> >> Add a boot-bypass option, which defaults to 'on' to be in line with
>> >> other vIOMMUs and to allow running firmware/bootloader that are unaware
>> >> of the IOMMU. x86 doesn't need a workaround to boot with virtio-iommu
>> >> anymore.
>> >>
>> >> Since v2 [1]:
>> >> * Added the new bypass bits to the migration stream.
>> >>   As discussed on the v2 thread, we assume that cross-version
>> >>   compatibility is not required for live migration at the moment, so we
>> >>   only increase the version number. Patch 2 says: "We add the bypass
>> >>   field to the migration stream without introducing subsections, based
>> >>   on the assumption that this virtio-iommu device isn't being used in
>> >>   production enough to require cross-version migration at the moment
>> >>   (all previous version required workarounds since they didn't support
>> >>   ACPI and boot-bypass)."
>> >>
>> >> [1] https://lore.kernel.org/qemu-devel/20220127142940.671333-1-jean-philippe@linaro.org/
>> > One thing that we could do to avoid surprises in the unlikely case that
>> > somebody has a virtio-iommu device and wants to migrate to an older
>> > machine version is to add a migration blocker for the virtio-iommu
>> > device for all compat machines for versions 6.2 or older (i.e. only 7.0
>> > or newer machine types can have a migratable virtio-iommu device
>> > starting with QEMU 7.0.) Not too complicated to implement, but I'm not
>> > sure whether we'd add too much code to prevent something very unlikely
>> > to happen anyway. I would not insist on it :)
>> As nobody has shout and we are not aware of anybody using the device in
>> production mode yet due to the missing boot bypass feature this series
>> brings, I would be personally in favour of leaving things as is. Now, up
>> to Jean if he wants to go and implement your suggestion.
>
> I agree, it seems too unlikely that someone would want to migrate it back
> to 6.2 where it wasn't really useable except for experiments

Fair enough. Let's make this an

Acked-by: Cornelia Huck <cohuck@redhat.com>

(for the series)


