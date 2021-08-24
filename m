Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836DB3F59ED
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:39:25 +0200 (CEST)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIRxs-0001lI-JN
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mIRwY-0000Yi-RO
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mIRwW-0006Pt-Ig
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629794280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+2YhZtTNYm7a99FhYzDlU+yX8HOqEsK1H8FZhjOEWA=;
 b=CnhgrqYhU6JIPfCy5nhJY4RCMCcZ/QKcY/7SY+zeC0dJRSdyBibXxN1h/6JJk4FKbKzbVB
 WN+lTzaf87VxkZooDONr2CcjIEwUbesZKEvMWSQIu8iLo4UxbYt6vTQqWIV8mWZiT4WItD
 nHWON8oZts1GR3qsF2zlgv0D8QEhnkk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-eu2nR7TUOCquuYePOCqxUg-1; Tue, 24 Aug 2021 04:37:58 -0400
X-MC-Unique: eu2nR7TUOCquuYePOCqxUg-1
Received: by mail-wm1-f70.google.com with SMTP id
 z186-20020a1c7ec30000b02902e6a27a9962so937580wmc.3
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 01:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=U+2YhZtTNYm7a99FhYzDlU+yX8HOqEsK1H8FZhjOEWA=;
 b=c1rDM+x0nyele5Xj6Ac5OitXMrvQ7kztUqXKdR3bUpBXkbtPP78z0HBX/ff1PS8eJs
 wSRk5z6nG0Mp4pe48Mx9pQDMJ5HSXD9lJAl3sYcEyIwN/A9cmmpSEi92PiwbVItazNx0
 ja6Kt3hWio5pDKlsjt2FvLdAO1JkN2asT933zvvv+Pg55nxJS3sX2KhOaOHY4zDcPjGk
 mNh0By0FWTBoyAU5IIakKTajKtycjrwnPag/ICjqMEFyaPtmsmly7b/VGD9lJdAj3/sp
 iRwngn/Tdt6tYtVMvIzxq+m4iR3OQTd4m/3Egq1ivBrUGFu7ovZ1qkChSFYPA+OzYPVd
 iCzA==
X-Gm-Message-State: AOAM532nJyTO/2V4iNgWkDbWpCBapSTLU3kdVa6nmBfUYokgMcl8qZFv
 62ym+QerSubRiAaXJQQ0F4XMvreWIFfPX9le16mgxVjz9XfrFhzm8HVU9HgSc2FDVXBIatkZDO9
 8tLkUAUcGVXM0vuY=
X-Received: by 2002:a5d:5919:: with SMTP id v25mr17744233wrd.32.1629794277508; 
 Tue, 24 Aug 2021 01:37:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxbw031tIM8P5pQYaOmCF1Y+zhGAMV3MfroosU4JM4lOada3XI0g/ViyvovsvcFmU93+DmYw==
X-Received: by 2002:a5d:5919:: with SMTP id v25mr17744218wrd.32.1629794277324; 
 Tue, 24 Aug 2021 01:37:57 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id g12sm21752109wri.18.2021.08.24.01.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 01:37:56 -0700 (PDT)
Date: Tue, 24 Aug 2021 09:37:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
Message-ID: <YSSv4vwfqDbwNWQI@work-vm>
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
 <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
 <d3cdb3bb-e05f-f909-1a98-ba45ff9b2b28@redhat.com>
 <CAFEAcA8V6gaGZeWeXOwdts771Ni11Eo8vYR2nXNy-w8dEsxdpg@mail.gmail.com>
 <6165f86e-1ce7-d178-1f5c-4b3c5110f0c1@redhat.com>
 <1a63c2d2-7420-5fc1-1023-0504a67dc40b@redhat.com>
 <628a7ee5-b88d-c043-2e67-67e791532c18@redhat.com>
 <e6245d98-173c-2d25-8587-b6690c5f9037@redhat.com>
 <c0bbadf8-d834-168e-9aa5-b3cf1373aa91@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c0bbadf8-d834-168e-9aa5-b3cf1373aa91@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> On 23.08.21 12:34, Philippe Mathieu-Daudé wrote:
> > On 8/23/21 12:24 PM, David Hildenbrand wrote:
> > > On 23.08.21 12:12, Philippe Mathieu-Daudé wrote:
> > > > On 8/23/21 11:29 AM, David Hildenbrand wrote:
> > > > > On 23.08.21 11:23, Peter Maydell wrote:
> > > > > > On Mon, 23 Aug 2021 at 09:40, David Hildenbrand <david@redhat.com>
> > > > > > wrote:
> > > > > > > Not opposed to printing the size, although I doubt that it will really
> > > > > > > stop similar questions/problems getting raised.
> > > > > > 
> > > > > > The case that triggered this was somebody thinking
> > > > > > -m took a byte count, so very likely that an error message
> > > > > > saying "you tried to allocate 38TB" would have made their
> > > > > > mistake clear in a way that just "allocation failed" did not.
> > > > > > It also means that if a future user asks us for help then
> > > > > > we can look at the error message and immediately tell them
> > > > > > the problem, rather than going "hmm, what are all the possible
> > > > > > ways that allocation might have failed" and going off down
> > > > > > rabbitholes like VM overcommit settings...
> > > > > 
> > > > > We've had similar issues recently where Linux memory overcommit handling
> > > > > rejected the allocation -- and the user was well aware about the actual
> > > > > size. You won't be able to catch such reports, because people don't
> > > > > understand how Linux memory overcommit handling works or was configured.
> > > > > 
> > > > > "I have 3 GiB of free memory, why can't I create a 3 GiB VM". "I have 3
> > > > > GiB of RAM, why can't I create a 3 GiB VM even if it won't make use of
> > > > > all 3 GiB of memory".
> > > > > 
> > > > > Thus my comment, it will only stop very basic usage issues. And I agree
> > > > > that looking at the error *might* help. It didn't help for the cases I
> > > > > just described, because we need much more system information to make a
> > > > > guess what the user error actually is.
> > > > 
> > > > Is it possible to get the maximal overcommitable amount on Linux?
> > > 
> > > Not reliably I think.
> > > 
> > > In the "always" mode, there is none.
> > > 
> > > In the "guess"/"estimate" mode, the kernel takes a guess (currently
> > > implemented as checking if the mmap size <= total RAM + total SWAP).
> > >      Committable = MemTotal + SwapTotal
> > > 
> > > In the "never" mode:
> > >      Committable = CommitLimit - Committed_AS
> > > However, the value gets further reduced for !root applications by
> > > /proc/sys/vm/admin_reserve_kbytes.
> > > 
> > > Replicating these calculations in user space would be suboptimal IMHO.
> > 
> > What about simply giving a hint about memory overcommit and display
> > a link to documentation with longer description about how to check
> > and figure out this issue?
> 
> That would be highly OS-specific -- for example, there is no memory
> overcommit under Windows. Sure, we could add a Linux specific hint,
> indication documentation. But I'm not sure if most end users stumbling into
> such an error+hint would be able to make sense of memory overcommit details
> (not to mention that they know what it even is) :)
> 
> You can run into memory allocation issues with many applications. Let me
> give you a simple example
> 
> t480s: ~  $ dd if=/dev/zero of=/dev/null ibs=100G
> dd: memory exhausted by input buffer of size 107374182400 bytes (100 GiB)
> 
> So indicating the size of the failing allocation might be just good enough.
> For the other parts it's usually just "the way the OS was configured, it
> does not think it can allow this allocation".

Does it also get complicated by the use of CGroup?

Dave

> -- 
> Thanks,
> 
> David / dhildenb
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


