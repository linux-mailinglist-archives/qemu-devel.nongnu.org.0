Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658C5347DE7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:42:03 +0100 (CET)
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6a2-0003Bz-Fe
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lP6Wx-0002Aq-Ir
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:38:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lP6Wv-0007D0-Tw
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616603929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZF8HRT5IrNOvQL6Pz8F1OKHc43im4d3pUJ9N+IN8ny4=;
 b=UiJFq3NNFtZk8hE/aMYV1npFi+OuCv5fKk0Si34cOwhsd7HcwzYCIGiZGAEMjwSS1FnPdM
 LtsudrLKMcLMW5u83rnYMyFzwL0BlZBBhCo4ihHf45wL0uaDKqG1d8PcNtkx5bbLn5S9Xa
 WodVokodO44l3zyizh36PuzhG97j2rA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-10DHUqbVOXqIBwpW3QFVdg-1; Wed, 24 Mar 2021 12:38:47 -0400
X-MC-Unique: 10DHUqbVOXqIBwpW3QFVdg-1
Received: by mail-wr1-f70.google.com with SMTP id v13so1307138wrs.21
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 09:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZF8HRT5IrNOvQL6Pz8F1OKHc43im4d3pUJ9N+IN8ny4=;
 b=guzTfMjUrKaBTvwI94v1ucyaBBAQ0VGWYpJm37fB/jul8vNDk9RhZj2v1xxl861UA/
 qixF7sziUD9lDD9qWNUP3kilOWco6rA1TGgq7ntJFfwWxuvuWjEUrbHgHAFHgi5iUpV5
 3x7j0UKJRd6XhJYdrrCcSZBLHfX/CZ2tT6SsEBek/cobYxFtfeENz8Aqr5dJwDCoj77I
 ye8EnsB3Qzzz3dMsMi5tyefTaE3CTtk5vxjUIgh6fascHFtCmB17s2luLawUe84gU0ca
 hULW2ink2c80FRw2hgZWoUz+UQLBnObhnUfsRgwq9gNHNr88N1a26QHjatXOMPr3DR5W
 HVLw==
X-Gm-Message-State: AOAM531uHvLUMVjz3EQZwhUlYcsudu6UP/Q3+K1BTDklZhOpjHKDopMd
 OKyY+Opb5EPKzj53oq3N80VemaX6FI+BShsXtnOTG2gGPpF937ceh0cN7bznX0fEjP1hqMQRElK
 Cfi9W+IPuSfhXZlk=
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr4478183wrn.174.1616603926342; 
 Wed, 24 Mar 2021 09:38:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNX1S2tQyoRha/DwjTPN7h2LrSBGyzP5oxKR2eeHPyyIYZd4C89Eg+f14Opdl72aBTlPS3FQ==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr4478163wrn.174.1616603926203; 
 Wed, 24 Mar 2021 09:38:46 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id c8sm4151618wrd.55.2021.03.24.09.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:38:45 -0700 (PDT)
Date: Wed, 24 Mar 2021 12:38:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v8] drivers/misc: sysgenid: add system generation id driver
Message-ID: <20210324123756-mutt-send-email-mst@kernel.org>
References: <1615213083-29869-1-git-send-email-acatan@amazon.com>
 <YEY2b1QU5RxozL0r@kroah.com>
 <a61c976f-b362-bb60-50a5-04073360e702@amazon.com>
 <YFnlZQZOasOwxUDn@kroah.com>
 <E6E517FF-A37C-427C-B16F-066A965B8F42@amazon.com>
 <YFoYwq/RadewiE8I@kroah.com>
MIME-Version: 1.0
In-Reply-To: <YFoYwq/RadewiE8I@kroah.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "areber@redhat.com" <areber@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>,
 "0x7f454c46@gmail.com" <0x7f454c46@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>,
 "avagin@gmail.com" <avagin@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "ptikhomirov@virtuozzo.com" <ptikhomirov@virtuozzo.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "ebiggers@kernel.org" <ebiggers@kernel.org>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "Singh,
 Balbir" <sblbir@amazon.com>, "bonzini@gnu.org" <bonzini@gnu.org>,
 "Graf \(AWS\), Alexander" <graf@amazon.de>, "arnd@arndb.de" <arnd@arndb.de>,
 "jannh@google.com" <jannh@google.com>, "Weiss, Radu" <raduweis@amazon.com>,
 "asmehra@redhat.com" <asmehra@redhat.com>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, "rppt@kernel.org" <rppt@kernel.org>,
 "luto@kernel.org" <luto@kernel.org>, "gil@azul.com" <gil@azul.com>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "MacCarthaigh,
 Colm" <colmmacc@amazon.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "ovzxemul@gmail.com" <ovzxemul@gmail.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>, "w@1wt.eu" <w@1wt.eu>,
 "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 05:35:14PM +0100, Greg KH wrote:
> On Tue, Mar 23, 2021 at 04:10:27PM +0000, Catangiu, Adrian Costin wrote:
> > Hi Greg,
> > 
> > After your previous reply on this thread we started considering to provide this interface and framework/functionality through a userspace service instead of a kernel interface.
> > The latest iteration on this evolving patch-set doesn’t have strong reasons for living in the kernel anymore - the only objectively strong advantage would be easier driving of ecosystem integration; but I am not sure that's a good enough reason to create a new kernel interface.
> > 
> > I am now looking into adding this through Systemd. Either as a pluggable service or maybe even a systemd builtin offering.
> > 
> > What are your thoughts on it?
> 
> I'll gladly drop this patch if it's not needed in the kernel, thanks for
> letting me know.
> 
> greg k-h

Systemd sounds good to me too.

-- 
MST


