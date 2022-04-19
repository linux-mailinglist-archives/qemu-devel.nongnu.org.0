Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F45507408
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 18:47:03 +0200 (CEST)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngr0I-0006Tf-I1
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 12:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ngqwk-0004BN-6f
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 12:43:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ngqwd-0008RF-Vn
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 12:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650386594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V3ODNWfMW+rRhSokZu86v1GXhJjBricpy30YxedvS1g=;
 b=OPamOgJ2lSVGI4a6XU12sV/ORzzmvPhwKhsr/RFsGwbaHkKXdFyM2cSDybtST+NcurctEM
 OhzxLvH/4cpdFNIHt5GUXTQ2icEQbBMvHz2+FNucFwu1/Qd5QUFc51t5NPw2QQpL823HHE
 PIXq6cIj7Y81bj9vMWSBBR4XvKF3vxc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-L81DbSrmODSiaBV7FxkkGQ-1; Tue, 19 Apr 2022 12:43:10 -0400
X-MC-Unique: L81DbSrmODSiaBV7FxkkGQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 d13-20020a05600c3acd00b0038ff865c043so1594189wms.3
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 09:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V3ODNWfMW+rRhSokZu86v1GXhJjBricpy30YxedvS1g=;
 b=drerYbFbf+0pp5oOJjS1srZtPJGGyqSExCTGVsbQyB4QKzQS8QehdrKz/ZldlJwtXy
 wDWSTE6gRmRTnL+AT9/DxxzHh1XUT8nqiTPinw5dtzqq3luSxz6UXIxq/nLXkxQJ9WqW
 n5noX0bw0EIbjF0iD2cfinkJIDsfl/KeaZpVcz9UZZ4u8RhAt5yAH/n8y5gjfhuSDYDC
 dGwc6uY0hXddukKJSjewW0LCTVymn2M3Jifd1oNDOCTANxn76j4cEl/vqo9OGDeBYSUb
 xag3MmJwnBX5DsU8X6M7OToc9erQAQ4rktDKUrG5f3COzewmo/PA8axnH5uIgEEEUolx
 bZlQ==
X-Gm-Message-State: AOAM533OMEVSCCeyBkVWCWTmDed3untE6KwHz5RfR5RVWUiWoHSuiN3B
 v+9DHIAAh0+iPFd3gNrC0qS3mBgC2LGTJEtV+684jdKcYyoLrce6GgsYgRnDPffpwo9FKrUmTvr
 kftA/dKlliQAoT34=
X-Received: by 2002:adf:f981:0:b0:205:c3e1:9eba with SMTP id
 f1-20020adff981000000b00205c3e19ebamr12387519wrr.244.1650386589541; 
 Tue, 19 Apr 2022 09:43:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/sBvEGx6+IXc/dmS3LEsLdRrH83M0si6np7xgLC//YEu1El92MuYL5XEmIp9phspX0ZKpFQ==
X-Received: by 2002:adf:f981:0:b0:205:c3e1:9eba with SMTP id
 f1-20020adff981000000b00205c3e19ebamr12387485wrr.244.1650386589266; 
 Tue, 19 Apr 2022 09:43:09 -0700 (PDT)
Received: from redhat.com ([2.53.17.80]) by smtp.gmail.com with ESMTPSA id
 v14-20020a7bcb4e000000b0034492fa24c6sm16631515wmj.34.2022.04.19.09.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 09:43:07 -0700 (PDT)
Date: Tue, 19 Apr 2022 12:43:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <20220419124245-mutt-send-email-mst@kernel.org>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <c5181fb5-38fb-f261-9de5-24655be1c749@amazon.com>
 <CAHmME9rTMDkE7UA3_wg87mrDVYps+YaHw+dZwF0EbM0zC4pQQw@mail.gmail.com>
 <47137806-9162-0f60-e830-1a3731595c8c@amazon.com>
 <CAHmME9pwfKfKp_qqbmAO5tEaQSZ5srCO5COThK3vWZR4avRF1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9pwfKfKp_qqbmAO5tEaQSZ5srCO5COThK3vWZR4avRF1g@mail.gmail.com>
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
Cc: "Brown, Len" <len.brown@intel.com>, linux-hyperv@vger.kernel.org,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 adrian@parity.io, KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <graf@amazon.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Theodore Ts'o <tytso@mit.edu>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Laszlo Ersek <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 05:12:36PM +0200, Jason A. Donenfeld wrote:
> Hey Alex,
> 
> On Thu, Mar 10, 2022 at 12:18 PM Alexander Graf <graf@amazon.com> wrote:
> > I agree on the slightly racy compromise and that it's a step into the
> > right direction. Doing this is a no brainer IMHO and I like the proc
> > based poll approach.
> 
> Alright. I'm going to email a more serious patch for that in the next
> few hours and you can have a look. Let's do that for 5.19.
> 
> > I have an additional problem you might have an idea for with the poll
> > based path. In addition to the clone notification, I'd need to know at
> > which point everyone who was listening to a clone notification is
> > finished acting up it. If I spawn a tiny VM to do "work", I want to know
> > when it's safe to hand requests into it. How do I find out when that
> > point in time is?
> 
> Seems tricky to solve. Even a count of current waiters and a
> generation number won't be sufficient, since it wouldn't take into
> account users who haven't _yet_ gotten to waiting. But maybe it's not
> the right problem to solve? Or somehow not necessary? For example, if
> the problem is a bit more constrained a solution becomes easier: you
> have a fixed/known set of readers that you know about, and you
> guarantee that they're all waiting before the fork. Then after the
> fork, they all do something to alert you in their poll()er, and you
> count up how many alerts you get until it matches the number of
> expected waiters. Would that work? It seems like anything more general
> than that is just butting heads with the racy compromise we're already
> making.
> 
> Jason

I have some ideas here ... but can you explain the use-case a bit more?

-- 
MST


