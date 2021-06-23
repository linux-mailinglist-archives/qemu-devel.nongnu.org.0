Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3D3B1638
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 10:51:03 +0200 (CEST)
Received: from localhost ([::1]:59748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvyb7-00030B-Vx
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 04:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvyZu-0002Fv-9k
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:49:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvyZs-00082O-BO
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624438181;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=O7Vzl1/2AMszRF0+cE018vQFKxwR1EsoIapE9ZIhpAE=;
 b=DXrKL/rxQl6nGSdL8nqtFAYxYe/LLls0y822ZJRnDKanA+Wgoi7Ey5D8Hl0SPEiSJpgt+Y
 HOLKR9NCMIco4a82Mc0kqvVqy2DYFVmCPER7Wr1vEvJ4lIp4kbUm2pzSj54jOHceL+g7Cv
 A6sEAp21MhfvhSxUJqnz7pmuT8xVwgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-ToSDKFP3MsuQpK4Wyw68dg-1; Wed, 23 Jun 2021 04:49:28 -0400
X-MC-Unique: ToSDKFP3MsuQpK4Wyw68dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB338102C8CB;
 Wed, 23 Jun 2021 08:49:16 +0000 (UTC)
Received: from redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A413860854;
 Wed, 23 Jun 2021 08:49:12 +0000 (UTC)
Date: Wed, 23 Jun 2021 09:49:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
Message-ID: <YNL1hazUg/shU7nU@redhat.com>
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
 <20210621190553.1763020-2-dovmurik@linux.ibm.com>
 <de9d8cd5-fcc3-10d2-6dda-003e4ad5524d@redhat.com>
 <36ff1adc-79c5-5526-2212-0aa28283fd75@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <36ff1adc-79c5-5526-2212-0aa28283fd75@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 11:41:56AM +0300, Dov Murik wrote:
> Hi Connor,
> 
> +cc: Daniel
> 
> On 23/06/2021 0:15, Connor Kuehl wrote:
> > On 6/21/21 2:05 PM, Dov Murik wrote:
> >> +static void fill_sev_hash_table_entry(SevHashTableEntry *e, const uint8_t *guid,
> >> +                                      const uint8_t *hash, size_t hash_len)
> >> +{
> >> +    memcpy(e->guid, guid, sizeof(e->guid));
> >> +    e->len = sizeof(*e);
> >> +    memcpy(e->hash, hash, hash_len);
> > 
> > Should this memcpy be constrained to MIN(sizeof(e->hash), hash_len)? Or
> > perhaps an assert statement since I see below that this function's
> > caller sets this to HASH_SIZE which is currently == sizeof(e->hash).
> > 
> > Actually, the assert statement would be easier to debug if the input
> > to this function is ever unexpected, especially since it avoids an
> > outcome where the input is silently truncated; which is a pitfall that
> > that the memcpy clamping would fall into.
> 
> I agree.  I'll change it to:
> 
>     assert(hash_len == sizeof(e->hash));
>     memcpy(e->hash, hash, sizeof(e->hash));
> 
> This way also the memcpy length is known at compile-time.
> 
> 
> 
> Related: I wondered if I could replace HASH_SIZE in:
> 
> 
>   /* hard code sha256 digest size */
>   #define HASH_SIZE 32
> 
>   typedef struct QEMU_PACKED SevHashTableEntry {
>       QemuUUID guid;
>       uint16_t len;
>       uint8_t hash[HASH_SIZE];
>   } SevHashTableEntry;
> 
> 
> with some SHA256-related constant from crypto/hash.h, but I only found
> the qcrypto_hash_digest_len(QCRYPTO_HASH_ALG_SHA256) function which
> doesn't work for setting sizes of arrays at compile-time.
> 
> Daniel: do you know what would be the proper way?

We don't have any public constants right now - they're just hardcoded
in hash.c struct. We could define public constants, and use those in
the struct instead, as well as in other callers.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


