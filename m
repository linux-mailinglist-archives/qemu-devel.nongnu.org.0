Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BF04C9155
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 18:19:40 +0100 (CET)
Received: from localhost ([::1]:41760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP69z-0008N1-8M
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 12:19:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nP68C-0006a8-1T
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 12:17:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nP688-0004tj-IV
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 12:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646155063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vU3c8INkyRrLYmMmG6yRKZ1MJ2tssrI6rFUsT1snRg0=;
 b=LI4N+48OsQHomdrVNAKBoKHpxQ6dNDSuA78AkSTP8QwHedAMzOhXdyeS00T/50xPBloNcX
 HyYjg43K8VRh4r+JyuxAviDrja0RJCHUk4UcI0KVDuCNvzSxRJ/1DGV+J+I8LrSnvlhYyp
 daAzQ33kuecB+0qpuNjelobBFi8Eotc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-zXwbKyZZNbuFblEJD16_9g-1; Tue, 01 Mar 2022 12:17:41 -0500
X-MC-Unique: zXwbKyZZNbuFblEJD16_9g-1
Received: by mail-wr1-f70.google.com with SMTP id
 a5-20020adfdd05000000b001f023fe32ffso381500wrm.18
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 09:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vU3c8INkyRrLYmMmG6yRKZ1MJ2tssrI6rFUsT1snRg0=;
 b=cPpnNJ8avJKwlP9xWy2XA3PwgPOFwqaN6xdchh2/dWMOCkfoP+pg/3H/8PE5YNP1Yh
 Q8HFczO3rZqezdisclnZQyzYOZ7dd2Td+LNBptxKpQ1N/Be7GXQOmlRuPbUvNdlFEs3f
 NTvPJgfG/TXcHHknWoy6BMcPp6NFp42O5bIe1Q7j0KDH8frrfEz4SmqnMAxD7ShHT+Nr
 7FcgxKcgqGJEdYBe3eIli9VIGHXAs4TLU90wT3t3yQhFALJwX7YsQQgqu8ypnDSa1Odp
 REy+S+ufo0K1uRC3WKUoo2ahkJ4mmTV8RIpgrDj1L0uWSjaHoThbnPYm0smCahd8DYaa
 joDQ==
X-Gm-Message-State: AOAM531SIpvQa7RmpuavoBFat4DFMstTFDYLnyMGmYsa/nQt8R8Y1xdi
 wcBmBlEOCyyVpXosrf9VwDCxAcVDNRpWsClKrdZSEBdCTTj71i+JO6px0Ll54gkbeT+SzKTdBr9
 BENbqMlDiafBlp/E=
X-Received: by 2002:a5d:61ca:0:b0:1f0:22ef:bb9f with SMTP id
 q10-20020a5d61ca000000b001f022efbb9fmr1534537wrv.56.1646155059889; 
 Tue, 01 Mar 2022 09:17:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzm0/sILq9s5oSrG8KTBgACJNRqT1mtZa0IVWQDeU62j8WMqO9Pb3os150cIhmIfKb7xYMP0Q==
X-Received: by 2002:a5d:61ca:0:b0:1f0:22ef:bb9f with SMTP id
 q10-20020a5d61ca000000b001f022efbb9fmr1534511wrv.56.1646155059630; 
 Tue, 01 Mar 2022 09:17:39 -0800 (PST)
Received: from redhat.com ([2.53.2.184]) by smtp.gmail.com with ESMTPSA id
 w26-20020a7bc11a000000b0037bf8fa8c02sm2970118wmi.13.2022.03.01.09.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 09:17:38 -0800 (PST)
Date: Tue, 1 Mar 2022 12:17:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220301121419-mutt-send-email-mst@kernel.org>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <223f858c-34c5-3ccd-b9e8-7585a976364d@redhat.com>
 <Yh5JwK6toc/zBNL7@zx2c4.com>
MIME-Version: 1.0
In-Reply-To: <Yh5JwK6toc/zBNL7@zx2c4.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: len.brown@intel.com, linux-hyperv@vger.kernel.org, colmmacc@amazon.com,
 berrange@redhat.com, adrian@parity.io, kvm@vger.kernel.org, jannh@google.com,
 gregkh@linuxfoundation.org, linux-pm@vger.kernel.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org, linux@dominikbrodowski.net,
 qemu-devel@nongnu.org, graf@amazon.com, linux-crypto@vger.kernel.org,
 pavel@ucw.cz, tytso@mit.edu, mikelley@microsoft.com,
 Laszlo Ersek <lersek@redhat.com>, arnd@arndb.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 05:28:48PM +0100, Jason A. Donenfeld wrote:
> Hi Laszlo,
> 
> On Tue, Mar 01, 2022 at 05:15:21PM +0100, Laszlo Ersek wrote:
> > > If we had a "pull" model, rather than just expose a 16-byte unique
> > > identifier, the vmgenid virtual hardware would _also_ expose a
> > > word-sized generation counter, which would be incremented every time the
> > > unique ID changed. Then, every time we would touch the RNG, we'd simply
> > > do an inexpensive check of this memremap()'d integer, and reinitialize
> > > with the unique ID if the integer changed.
> > 
> > Does the vmgenid spec (as-is) preclude the use of the 16-byte identifier
> > like this?
> > 
> > After all, once you locate the identifier via the ADDR object, you could
> > perhaps consult it every time you were about to touch the RNG.
> 
> No, you could in fact do this, and there'd be nothing wrong with that
> from a spec perspective. You could even vDSO it all the way through
> onward to userspace. However, doing a 16-byte atomic memcmp on
> each-and-every packet is really a non-starter. For that kind of "check
> it in the hot path" thing to be viable, you really want it to be a
> counter that is word-sized. The "pull"-model involves pulling on every
> single packet in order to be better than the "push"-model. Anyway, even
> with a word-sized counter, it's unclear whether the costs of checking on
> every packet would be worth it to everyone, but at least it's more
> tenable than a 16-byte whammy.
> 
> Jason

Hmm okay, so it's a performance optimization... some batching then? Do
you really need to worry about every packet? Every 64 packets not
enough?  Packets are after all queued at NICs etc, and VM fork can
happen after they leave wireguard ...

-- 
MST


