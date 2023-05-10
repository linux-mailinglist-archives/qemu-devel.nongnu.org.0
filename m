Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF496FD751
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 08:42:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwdWI-0002Xw-7r; Wed, 10 May 2023 02:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwdWF-0002Wx-F2
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:41:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwdWE-0004D6-0Y
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683700905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=APGrJpkNnWpYxpiqA7nSpN3Mc2emXbT2h1JCry/vwDI=;
 b=UDL/vNofdFqC6zQlYliHDLeGIoTzrf2VzOo+pMprh9vKpeyYqMQmTTsStibvvIHN0QsQ6L
 o300h16QJCjySrB0JNiLzBBeoAEr/1uqxfpXEYN4mvEmTn/3uDqkX0hPNdU+I6I3KKFUb0
 +/me5fAJ7YQzRu+1M5y+FqW4He9uS/U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-hpAeiFzANxWU8aIS0WcaJg-1; Wed, 10 May 2023 02:41:44 -0400
X-MC-Unique: hpAeiFzANxWU8aIS0WcaJg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3079c6648e3so1721312f8f.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 23:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683700903; x=1686292903;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=APGrJpkNnWpYxpiqA7nSpN3Mc2emXbT2h1JCry/vwDI=;
 b=EXe3eoXcU3ywqq0hVkYCqEQ+31/LUbkPOBvqvnyQiDeiJAq8Seb9YA9TkUPXfZavYl
 9o3d4klbcaIB9U00Fpc+EM5sJtPF89R8eBGp4SIdLEreP1eIm19ETZ1pAANA3WA6TJDo
 MQNB1MVQ6akc86Xg8zMVHMy/tX2Se5YwmUOJCOeCPw3dqE7gHcAJ2/F/oHfA8roPkxdh
 CD/C9RW0GBRyN+r7Wf75KhXch9tfzpTAaEB3m56cgcGXQ4bJQfpGdoaOZsbe3xwPKJ2m
 k98zLN+huE9i4uqMyIqmUmxWqkjufq1IFMrbHGLxxNW8oW5gVdXMU92KGjfJxRcZWvqc
 HoqQ==
X-Gm-Message-State: AC+VfDxR7Q/vL3tXH8rgd+yHSeOrOwTPx+6BHNPsebTNDwINmym4u5lk
 PLPblf63JBME7fiQh5GqvJbkImU423fpPEIZMohzb3UWMrWYC2usJMbDVnw+enigEkwgBkzZjTv
 PS1/tbN14YSiUJbQ=
X-Received: by 2002:adf:fe02:0:b0:307:9702:dfc8 with SMTP id
 n2-20020adffe02000000b003079702dfc8mr6133116wrr.48.1683700902809; 
 Tue, 09 May 2023 23:41:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7lmMO38sOj8XrynGtyDHjsxMMMIwzEGz+kJo2GLRfZPOKLox9swVVIM/9xlP930EgXmuTt+Q==
X-Received: by 2002:adf:fe02:0:b0:307:9702:dfc8 with SMTP id
 n2-20020adffe02000000b003079702dfc8mr6133098wrr.48.1683700902476; 
 Tue, 09 May 2023 23:41:42 -0700 (PDT)
Received: from redhat.com ([2.52.1.223]) by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm4105105wro.111.2023.05.09.23.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 23:41:41 -0700 (PDT)
Date: Wed, 10 May 2023 02:41:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-devel@nongnu.org,
 berrange@redhat.com, alex.bennee@linaro.org, philmd@linaro.org,
 wainersm@redhat.com, bleal@redhat.com
Subject: Re: [PATCH v2 0/2] tests/lcitool: Add mtools and xorriso and remove
 genisoimage as dependencies
Message-ID: <20230510024119-mutt-send-email-mst@kernel.org>
References: <20230504154611.85854-1-anisinha@redhat.com>
 <20230509121552-mutt-send-email-mst@kernel.org>
 <5377130a-6eca-f27e-04e8-9058e7ac3403@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5377130a-6eca-f27e-04e8-9058e7ac3403@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 10, 2023 at 08:39:54AM +0200, Thomas Huth wrote:
> On 09/05/2023 18.16, Michael S. Tsirkin wrote:
> > On Thu, May 04, 2023 at 09:16:09PM +0530, Ani Sinha wrote:
> > > mformat and xorriso tools are needed by biosbits avocado tests. This patchset
> > > adds those two tools in the docker container images.
> > > xorriso package conflicts with genisoimage package on some distributions.
> > > Therefore, it is not possible to have both the packages at the same time
> > > in the container image uniformly for all distribution flavors. Further,
> > > on some distributions like RHEL, both xorriso and genisoimage
> > > packages provide /usr/bin/genisoimage and on some other distributions like
> > > Fedora, only genisoimage package provides the same utility.
> > > Therefore, this change removes the dependency on geninsoimage for building
> > > container images altogether keeping only xorriso package. At the same time,
> > > cdrom-test.c is updated to use and check for existence of only xorrisofs.
> > > 
> > > Patch 1 pulls in the latest changes in lcitool in order to add mappings
> > > for these packages in various distros.
> > > Patch 2 updates all Dockerfiles in QEMU repository to add these two
> > > tools. It also removed genisoimage package and updated cdrom-test to not
> > > use genisoimage but xorrisofs.
> > > 
> > > CC: mst@redhat.com
> > > CC: berrange@redhat.com
> > > CC: alex.bennee@linaro.org
> > > CC: philmd@linaro.org
> > > CC: wainersm@redhat.com
> > > CC: bleal@redhat.com
> > > CC: thuth@redhat.com
> > > TO: qemu-devel@nongnu.org
> > > 
> > > Changelog:
> > > v2: remove genisoimage package and update Dockerfile. Also update cdrom-test.c
> > > so that it uses xorrisofs and not genisoimage. I have tested patch #2 on both
> > > Fedora 37 and RHEL 9.1. cdrom-test passed on both.
> > 
> > 
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > who's merging this?
> 
> I guess it's either you, Alex or me ... I'll put it into my queue, but if
> you plan a pull request soon, feel free to take it first.
> 
>  Thomas

yes there's a pull by end of week. sure I'll take this.

-- 
MST


