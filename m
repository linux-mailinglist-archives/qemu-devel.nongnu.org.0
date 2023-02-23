Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30956A1119
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:18:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVI1S-00039V-1d; Thu, 23 Feb 2023 15:16:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVI1I-000388-Uc
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:16:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVI1F-0008VW-8K
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677183404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhEAhg+gVumsM/eyaB8hov+QmlvtrVjqSST+g/tyyjM=;
 b=OJTWANHKzPOux6HcaboMWZYKchJqbf90tl6PJrPFfcXosdP4ih6h1HNYU0E6aE8+JVj60N
 yieU4RyL8P/bVLCPPTXjsIs5vbX+YkRXrt85uBpj9ygV6nPkYHqIBjedF/tJwQbA57a4Y/
 RxAmwwPA9/vWJ2QGIsoqtRdcMyB3++U=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-ul3fvUjhPd2WRzlaz2xW2g-1; Thu, 23 Feb 2023 15:16:42 -0500
X-MC-Unique: ul3fvUjhPd2WRzlaz2xW2g-1
Received: by mail-il1-f199.google.com with SMTP id
 l5-20020a92d8c5000000b00316f26477d6so2996875ilo.10
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZhEAhg+gVumsM/eyaB8hov+QmlvtrVjqSST+g/tyyjM=;
 b=YALBi3vggbx40FlryFIn3nZsP+FK7ThWdnpBF1JbKTuAKbd18Aj5zzuMoJm5wsV7By
 6bySzpBsFbd69bFCHu6OAVP06khZqDZKTP5lV9pM4uWyaMA64aU9jmJPYp4/9KIIkzxS
 BZFEP+fqPFan0HdgzI44370M8+o6nl5FHF0QLou9ZKsGbXLf7BE4REDp5r7PtX9sz+/w
 Okj+1eEaT5w20qZ/Tae7DPd5yoFdnHUfNfqYUuk6Q30ZnMJs31zV3O9QnFNIoNWFEMzP
 i8p2Hfa7J0v93Sw4hV553WC38HISj6QWrs1f/0Qi8FtOFm1ESBfWP3OIoMFvF/2qpWAw
 Hl+A==
X-Gm-Message-State: AO0yUKVKP0uS2M4nmf/FhEztL5FvzBp6nVGhVia9eqWFcUahxkqWWybf
 QxHo3FnGxaZRbRHjcSF5o+w/iKmn/l8Rb3imzDcldia2O8NS1kiI1Jga87WX4FFA4XzxbYxti2f
 zZ2V7lJ7AJgI1B94=
X-Received: by 2002:a05:6e02:216a:b0:313:cd79:adcb with SMTP id
 s10-20020a056e02216a00b00313cd79adcbmr14401682ilv.18.1677183401790; 
 Thu, 23 Feb 2023 12:16:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8LM0GXCGB+vHEwG0UE6L+PYjBCcyjg9MxIZztYGooaAyTiVrMmK2OZMIVpC9R+wmgfmykWIQ==
X-Received: by 2002:a05:6e02:216a:b0:313:cd79:adcb with SMTP id
 s10-20020a056e02216a00b00313cd79adcbmr14401665ilv.18.1677183401563; 
 Thu, 23 Feb 2023 12:16:41 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g14-20020a056638060e00b003c502198ffbsm2525339jar.22.2023.02.23.12.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:16:41 -0800 (PST)
Date: Thu, 23 Feb 2023 13:16:40 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 11/20] vfio/common: Add device dirty page tracking
 start/stop
Message-ID: <20230223131640.515451b2.alex.williamson@redhat.com>
In-Reply-To: <Y/e+1GmGBtKKhWK/@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-12-avihaih@nvidia.com>
 <20230222154043.35644d31.alex.williamson@redhat.com>
 <Y/bJMIR8stBcJpW7@nvidia.com>
 <20230223122723.6a204e1b.alex.williamson@redhat.com>
 <Y/e+1GmGBtKKhWK/@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Thu, 23 Feb 2023 15:30:28 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Feb 23, 2023 at 12:27:23PM -0700, Alex Williamson wrote:
> > So again, I think I'm just looking for a better comment that doesn't
> > add FUD to the reasoning behind switching to a single range,   
> 
> It isn't a single range, it is a single page of ranges, right?

Exceeding a single page of ranges is the inflection point at which we
switch to a single range.
 
> The comment should say
> 
> "Keep the implementation simple and use at most a PAGE_SIZE of ranges
> because the kernel is guaranteed to be able to parse that"

Something along those lines, yeah.  And bonus points for noting that
the kernel implementation is currently hard coded at this limit, so
there's no point in trying larger arrays as implied in the uAPI.
Thanks,

Alex


