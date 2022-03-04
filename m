Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B04CD2B7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:48:05 +0100 (CET)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5Tg-00078x-Un
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:48:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ5KW-0004L1-R0
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:38:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ5KU-0002am-MK
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646390313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lz5RITfbuxi7prNXljqL/BkcwaBGah78jbB9QQ7ar/o=;
 b=VWleXt+hGKh3RR4JW2lzG7MU7QVr0D026I6vHWVV52+mFCFM1j86gojO4aiTByJsfKjVFK
 3dm4dmjOxHVt++hqCXIQK2HHJ2IizAIi2s0tybPgvv8XxiotmN26o0A4C97PAjr4SMuKuA
 rfO/w2Bkfmgh3bU7CI5sT22koEIPoVg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-YDmWsc3wP-SrPxOeOJQo8w-1; Fri, 04 Mar 2022 05:38:30 -0500
X-MC-Unique: YDmWsc3wP-SrPxOeOJQo8w-1
Received: by mail-wr1-f70.google.com with SMTP id
 z16-20020adff1d0000000b001ef7dc78b23so3201370wro.12
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lz5RITfbuxi7prNXljqL/BkcwaBGah78jbB9QQ7ar/o=;
 b=yh6KXv4UGPxBoP5wDjdTzKfU7Of0ASajREnqrn0Sj72NQOJC6+pBD26Cxxg2ZOCQsu
 gNDsU13dX04RmzvxeyrnmhfCLsyyCeOLTIshF3SAqtV6dQ023DxZHLnyIo/50paYrYcF
 ITT35WK9v34P0GypzLnAmITJe8QCmHklvy+Sa/Nj9yQJiNdcV0ddk/FXFm6FdO0FCGXr
 VD3RR66cxWul0I9BqQkNg6/ZVns8KNUvvvGguIKiF/ux5kgr+7exNsmDiyQ19rbLa3DF
 kMg55sJMyMPiO6rb7/L5z0XMhtxcStXhEmaZwe6KoUC7jcZePDDPnpmiCA7DUqGD2GxG
 ZGHQ==
X-Gm-Message-State: AOAM532PurArJP1/c82WYVXbj4vWcgopYh4qG0vByqVSI01SHtCzNT92
 i4lKrHoPuZN0IG3cn+IRgz5qDO/U5PjQd2CY64R9MuqFGuZAQBGMExuVfSWLHIyqxVyqwQYMItD
 J7caUJf0aNyVEt24=
X-Received: by 2002:a5d:6b06:0:b0:1e3:3e52:8a6 with SMTP id
 v6-20020a5d6b06000000b001e33e5208a6mr29170207wrw.148.1646390308821; 
 Fri, 04 Mar 2022 02:38:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWSO2vMtR421emZNfVw1PPEBsPuI7pwJ1SnQREXhldYhaQLx8hgCPGjgLYLXwejapDNC0UGw==
X-Received: by 2002:a5d:6b06:0:b0:1e3:3e52:8a6 with SMTP id
 v6-20020a5d6b06000000b001e33e5208a6mr29170192wrw.148.1646390308607; 
 Fri, 04 Mar 2022 02:38:28 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 e6-20020a5d5006000000b001e75916a7c2sm4242027wrt.84.2022.03.04.02.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:38:27 -0800 (PST)
Date: Fri, 4 Mar 2022 05:38:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v3 0/4] Enable vhost-user to be used on BSD systems
Message-ID: <20220304053759-mutt-send-email-mst@kernel.org>
References: <20220303115911.20962-1-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303115911.20962-1-slp@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 John G Johnson <john.g.johnson@oracle.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 kvm@vger.kernel.org, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 12:59:07PM +0100, Sergio Lopez wrote:
> Since QEMU is already able to emulate ioeventfd using pipefd, we're already
> pretty close to supporting vhost-user on non-Linux systems.
> 
> This two patches bridge the gap by:
> 
> 1. Adding a new event_notifier_get_wfd() to return wfd on the places where
>    the peer is expected to write to the notifier.
> 
> 2. Modifying the build system to it allows enabling vhost-user on BSD.
> 
> v1->v2:
>   - Drop: "Allow returning EventNotifier's wfd" (Alex Williamson)
>   - Add: "event_notifier: add event_notifier_get_wfd()" (Alex Williamson)
>   - Add: "vhost: use wfd on functions setting vring call fd"
>   - Rename: "Allow building vhost-user in BSD" to "configure, meson: allow
>     enabling vhost-user on all POSIX systems"
>   - Instead of making possible enabling vhost-user on Linux and BSD systems,
>     allow enabling it on all non-Windows platforms. (Paolo Bonzini)


I picked 1,2.
Waiting on updated doc patch to apply 3,4.

> v2->v3:
>   - Add a section to docs/interop/vhost-user.rst explaining how vhost-user
>     is supported on non-Linux platforms. (Stefan Hajnoczi)
> 
> Sergio Lopez (4):
>   event_notifier: add event_notifier_get_wfd()
>   vhost: use wfd on functions setting vring call fd
>   configure, meson: allow enabling vhost-user on all POSIX systems
>   docs: vhost-user: add subsection for non-Linux platforms
> 
>  configure                     |  4 ++--
>  docs/interop/vhost-user.rst   | 18 ++++++++++++++++++
>  hw/virtio/vhost.c             |  6 +++---
>  include/qemu/event_notifier.h |  1 +
>  meson.build                   |  2 +-
>  util/event_notifier-posix.c   |  5 +++++
>  6 files changed, 30 insertions(+), 6 deletions(-)
> 
> -- 
> 2.35.1
> 


