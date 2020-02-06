Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA63E154F7D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 00:46:48 +0100 (CET)
Received: from localhost ([::1]:48038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izqr9-0007FZ-Qz
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 18:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47563)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1izqq0-0006r0-0H
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 18:45:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1izqpw-0007Mz-Rz
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 18:45:35 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51176
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1izqpw-0007LK-Nz
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 18:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581032731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phD6NLa6Xg7bmJEDNA98lq0zDp5UNkQWOeV4kzA6fPQ=;
 b=g7NDdQnhjf8XGTeovy7DuiP1XXnqy1Y/wGXTbJ44mFmrB3S/Hmpbc4jqtYGqjjwUy5pKfk
 ccNryen0jPfv+3kfUERJoiCeN/qfx825Bh1i2P1tb7JjlBfdswBY+vX1VGmAe76fnfODVP
 6ALwOSjkLH6EkD6QupmMUk4nOsDb0R8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-7L-XjknpOgiugLw55gsxYw-1; Thu, 06 Feb 2020 18:45:23 -0500
Received: by mail-wr1-f71.google.com with SMTP id x15so272671wrl.15
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 15:45:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=phD6NLa6Xg7bmJEDNA98lq0zDp5UNkQWOeV4kzA6fPQ=;
 b=PK7TbWt3OFxRrPaZtnLDhDtiAGtIVYbdKqIsBGEWI937Z8QtrnlhRb668HZyQD7Et7
 kWFa/CZbkHscbDTDGtiat1kpA/m/mNmJ6LMo/FprBh8Yn1Ru5sO6K76hUVyzL6Hw6RYJ
 69vkyWb1jNBb8foc3bTNX5LXFKCOQyMS9Xmltz8E9O7h2ocZo7fAiGMZBQqk7w4nvUfz
 lBp9wE8Vp/nWFlFhv1FKTK3tcNp7YtcwF8cbqbg9DmxYboZU9CTXnF17+b2Jo2I4KMF4
 OWIc0oHxu0Xpz0a86l1QBFye6awDqE+ZsskFM/S60LHGardmTpdogdhhYHdMvcnUh839
 Rgsw==
X-Gm-Message-State: APjAAAV2QrXMRKvK7lBjuGCRs0NEgDwKOtzTHht7diTiyM9HewsTC7o8
 WEkI5gA1rKzxC8J86yE2q+DY1am1rs5fkjZQ1AvQy6ZgXHyJPDFJakSLC5BFgA6z3ikuZfU3wQo
 lhSi+hYktmse4ZgE=
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr508518wrt.229.1581032722065; 
 Thu, 06 Feb 2020 15:45:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfzCVfGxp9tu9n8Cifpa3ILvRPW06BRSX+x1/+y+u5KCFdOAESof8Ez6SMORs9S/JA7ev7IQ==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr508498wrt.229.1581032721834; 
 Thu, 06 Feb 2020 15:45:21 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:a9f0:cbc3:a8a6:fc56?
 ([2001:b07:6468:f312:a9f0:cbc3:a8a6:fc56])
 by smtp.gmail.com with ESMTPSA id x132sm14931411wmg.0.2020.02.06.15.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 15:45:21 -0800 (PST)
Subject: Re: VW ELF loader
To: Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
References: <f881c2e7-be92-9695-6e19-2dd88cbc63c1@ozlabs.ru>
 <e3ee4b4d-1b24-2900-4304-05fa521a9b47@redhat.com>
 <20200203012842.GD52446@umbus.fritz.box>
 <ec81cca1-d5fb-3f1e-b433-3328d81a117e@redhat.com>
 <de7e4d34-eb63-904c-3475-7feee154c72c@ozlabs.ru>
 <8420784f-b4c7-9864-8534-b94dbc5f74ff@redhat.com>
 <d63ba962-ffbb-9f27-34fb-657188e90194@ozlabs.ru>
 <CABgObfYwtrh_uy8zFmg2qDjK6iynniN6=jJ9_MKfNxXUaOkPKw@mail.gmail.com>
 <71d1cc16-f07d-481d-096b-17ee326157bb@ozlabs.ru>
 <CABgObfa4tUVBbpBtoY3JFSF8-0mRVxgGbzQokc+JrJGPagwPaQ@mail.gmail.com>
 <20200205060634.GI60221@umbus.fritz.box>
 <62d62fab-46a4-240b-037b-409ba859b93d@redhat.com>
 <47e6a49d-f1c7-aaf6-b9ef-7e81773cff6e@ozlabs.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8993c6b4-2a2c-b7e5-8342-4db480d0af9d@redhat.com>
Date: Fri, 7 Feb 2020 00:45:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <47e6a49d-f1c7-aaf6-b9ef-7e81773cff6e@ozlabs.ru>
Content-Language: en-US
X-MC-Unique: 7L-XjknpOgiugLw55gsxYw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cornelia Huck <conny@cornelia-huck.de>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/02/20 00:17, Alexey Kardashevskiy wrote:
> This is a lot and what is exactly the benefit? My alternative does not
> need drivers at all.

Anything you put in the host is potential attack surface.  Plus, you're
not doing a different thing than anyone else and as you've found out it
may be easy for block device but not for everything else.

Every platform that QEMU supports is just using a firmware to do
firmware things; it can be U-Boot, EDK-2, SLOF, SeaBIOS, qboot, with
varying level of complexity.  Some are doing -kernel in QEMU rather than
firmware, but that's where things end.

Paolo


