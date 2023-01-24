Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BDC67923E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 08:46:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKDzZ-0006XI-S4; Tue, 24 Jan 2023 02:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pKDzV-0006Wh-Si
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:45:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pKDzU-0008GY-83
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674546308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=18sCRuJCRxVd4FC99p9glLCTDST8RoJ+zIi1rCi6UWM=;
 b=QB6+j21gRX0o24h2VVBvMuU99J55JA4OXYPl/MMphq1FZK9+IseEx+a0BM4qN+kyWEUqlf
 Wg+TlO2tjvK15gVRPkZTTw9YunTKGY7xP7FIk91jYx4pCek/0am3G+dr+XOa8vgGJlzD+m
 fbP+tYATTOUjWRQHiB+AdWTZhOh+aGc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-HVg-zSsoNxyJc8z5VAVS6g-1; Tue, 24 Jan 2023 02:45:02 -0500
X-MC-Unique: HVg-zSsoNxyJc8z5VAVS6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 083D3857A84;
 Tue, 24 Jan 2023 07:45:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AECD72166B26;
 Tue, 24 Jan 2023 07:45:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5F3AA180060E; Tue, 24 Jan 2023 08:45:00 +0100 (CET)
Date: Tue, 24 Jan 2023 08:45:00 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Kim, Dongwon" <dongwon.kim@intel.com>,
 Frediano Ziglio <freddy77@gmail.com>
Subject: Re: [RFC v2 2/2] spice: Add an option to forward the dmabuf directly
 to the encoder (v2)
Message-ID: <20230124074500.f6aly3r3rjn3vr3r@sirius.home.kraxel.org>
References: <20230123083755.1038286-1-vivek.kasireddy@intel.com>
 <20230123083755.1038286-3-vivek.kasireddy@intel.com>
 <20230123100654.bqiauwjbkkqroq7f@sirius.home.kraxel.org>
 <IA0PR11MB71852AF9DF58977B578C2F43F8C99@IA0PR11MB7185.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB71852AF9DF58977B578C2F43F8C99@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  Hi,

> The other option I can think of is to just not deal with drawables at all and somehow
> directly share the dmabuf fd with the Encoder.

This is what I expected to happen.  This also the case when using
dma-bufs for local display.

> > IMHO we should not hard-code todays spice-server capabilities like this.
> > For starters this isn't true for spice-server versions which don't (yet)
> > have your patches.  Also the capability might depend on hardware
> > support.  IMHO we need some feature negotiation between qemu and spice
> > here.
> [Kasireddy, Vivek] Ok, I can get rid of this chunk in v3. However, given the numerous
> features supported by the Spice server, I suspect implementing feature negotiation
> might get really challenging. Is there any other way around this that you can think of?

I'm thinking about a simple bool, i.e. replace the current hard failure
for the remote case with a query whenever the server supports dma-buf
video encoding or not.

take care,
  Gerd


