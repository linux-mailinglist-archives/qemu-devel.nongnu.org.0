Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379C54B9B22
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:31:29 +0100 (CET)
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcCG-0005Tz-85
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:31:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKbaN-0006xB-Na
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:52:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKbaJ-00052n-SG
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645084334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ze5mCOPZq69ADP8HGXxIF0b4t1ZYGyveeqt9XTR2ncE=;
 b=emz7fE5oYGH53UcQVTc/6xppWbr81HvtrMj0APvMcirFziDJOVwFgh06k15iYKsoJkWLCW
 eMOVP97Mk71DnRZJq5W2g8DN7MpY7CY/E8cq27ZICg80kY+l2faqDDE0HPUr8IL997iptc
 7AhBqLDZBjXQB6SiBK9d/9En3QiZEDQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-ykBzW7HyMm-9-A88_6r9og-1; Thu, 17 Feb 2022 02:52:11 -0500
X-MC-Unique: ykBzW7HyMm-9-A88_6r9og-1
Received: by mail-wm1-f72.google.com with SMTP id
 m3-20020a7bcb83000000b0034f75d92f27so1319211wmi.2
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 23:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ze5mCOPZq69ADP8HGXxIF0b4t1ZYGyveeqt9XTR2ncE=;
 b=3BXX7OPyGfux16fsHhYxIotX2k1zdU2IqbftWLHYFX9dsgT/912oZTfzkV224++wQ8
 y0RfmQh7VYytCMOTugPTJR03VWr+bBeMX45PmuJi/qsTf2CI4FxXHRlr/Kn6FnRqkYvi
 WztLgj7InHGxPKnky462MqRKisxt3EGplXrvG8o+Y8zD4ErzasA8rm4YrOl407g0WqrL
 XOTWw1cBB3b3h7YuPX8iobtJ6pXw7siBrfOVSzBaHszSNDDffh9dvzT0RiQ3RmvZulDS
 xyUyXUK2ifmmpjCnZOhDAFN+CGChSQTnlZJdIevocO+5QgtJvjAoxnUP6HKOtiK5g5h2
 hBIA==
X-Gm-Message-State: AOAM532ikE/AYbuoWAqMcMxIpbF3Cg+r8MaEJ66dHdQVf9ES2Bv3aDcU
 p2BVLhK/wQBLi0WsCDYaQQ+twX346Ye4J7TZDINYUMPYR/onWwBuKWLwSTldKkKJXJEp+e7eQRa
 RXwgk+U/heOSeQjY=
X-Received: by 2002:a05:600c:2b88:b0:34d:e6bb:8143 with SMTP id
 j8-20020a05600c2b8800b0034de6bb8143mr4901593wmc.93.1645084329931; 
 Wed, 16 Feb 2022 23:52:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzW9svO2C8qIUarTe6WAuxGQRkFpwx4OoVj3xomueTtQBvMfb9262QlXYsyWtmJ8LEiFczqRg==
X-Received: by 2002:a05:600c:2b88:b0:34d:e6bb:8143 with SMTP id
 j8-20020a05600c2b8800b0034de6bb8143mr4901571wmc.93.1645084329627; 
 Wed, 16 Feb 2022 23:52:09 -0800 (PST)
Received: from redhat.com ([2.55.139.83])
 by smtp.gmail.com with ESMTPSA id o16sm364218wmc.25.2022.02.16.23.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 23:52:08 -0800 (PST)
Date: Thu, 17 Feb 2022 02:52:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <20220217025108-mutt-send-email-mst@kernel.org>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
 <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
 <Yg03HB5KHGYWyI0J@work-vm> <Yg042JzxCjgF2siM@redhat.com>
 <Yg067jLmVM4aIFIq@work-vm>
 <45e4f959-8f04-3baf-5e95-d23ed62e4b27@redhat.com>
MIME-Version: 1.0
In-Reply-To: <45e4f959-8f04-3baf-5e95-d23ed62e4b27@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: eduardo@habkost.net,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 08:46:55AM +0100, Thomas Huth wrote:
> On 16/02/2022 18.57, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Wed, Feb 16, 2022 at 05:40:44PM +0000, Dr. David Alan Gilbert wrote:
> > > > * Thomas Huth (thuth@redhat.com) wrote:
> > > > > On 16/02/2022 12.01, Dr. David Alan Gilbert wrote:
> > > > > > * Gerd Hoffmann (kraxel@redhat.com) wrote:
> > > > > > >     Hi,
> > > > > > > > Given the semantic differences from 'i440fx', changing the default
> > > > > > > > machine type has effects that are equivalent to breaking command
> > > > > > > > line syntax compatibility, which is something we've always tried
> > > > > > > > to avoid.
> > > > > > > 
> > > > > > > And if we are fine breaking backward compatibility I'd rather *not* pick
> > > > > > > a default, effectively making -M $something mandatory, similar to arm.
> > > > > > 
> > > > > > Oh, that's probably easy to do;  what are other peoples thoughts on
> > > > > > that?
> > > > > 
> > > > > I agree with Gerd. Getting rid of a default machine on x86 is likely better
> > > > > than silently changing it to q35. But I'd maybe say that this should go
> > > > > through the deprecation process first?
> > > > 
> > > > So just adding something like the following under 'System emulator
> > > > machines':
> > > > 
> > > > x86 default machine type
> > > > ------------------------
> > > > 
> > > > x86 currently defaults to the very old ```pc``` machine type
> > > > which is based on the very old ```i440f``` chipset.  This default
> > > > will be removed and the user will be required to specify a machine
> > > > type explicitly using -M; users are encouraged to switch to the
> > > > not quite as old ```q35``` machine types.
> > > > 
> > > > 
> > > > (This option is going to take a lot more work switching all the
> > > > test cases over; in my world here I'd only changed the tests that broke
> > > > on q35, now everything is going to need to specify a type).
> > > 
> > > ....which is still nothing compared to how many users will be impacted
> > > and the docs all over the internet we'll never be able to change, which
> > > give illustrations using qemu command lines without '-M pc'
> > 
> > What's your prreference - it sounds like you'd prefer to leave the
> > default as 'pc' ?
> > 
> > aarch's message is:
> > qemu-system-aarch64: No machine specified, and there is no default
> > Use -machine help to list supported machines
> > 
> > We could add a:
> > 'Use -machine pc for the old default behaviour'
> 
> Sounds like a good idea, but then I'd also do:
> 
> 'Use -M pc for the old default behaviour, or -M q35 for a more modern
> machine' or so.
> 
>  Thomas
> 


How about we start by going through a deprecation period then?  Make
attempts to create a machine without -machine produce a warning for a
couple of cycles.

-- 
MST


