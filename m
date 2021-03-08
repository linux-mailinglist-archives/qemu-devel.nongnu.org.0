Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60694330AC8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:03:27 +0100 (CET)
Received: from localhost ([::1]:52632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJCjW-0006Cc-7d
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJCiX-0005mv-N4
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:02:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJCiS-0001gO-OZ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615197739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VR42W3fm8p4f4qNXRohsdhfIB6hoAq7oILLXEIkWtSc=;
 b=GyUWmh6GXh8hn3wj+JESQlWfzNTclSszpiqFS9Z6FCVUysxR8N9neCFmB6xLK356yQJZIV
 27kP7LP3PTvEe1xVXMQS31ayk4O04KMVDZ/6vPXjV/5dhW/Q5U80gScosRnSO+vNjMoa5x
 jARHxPBqBLUgjHgOPyTx6Eu4k8usiBk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-cKHrLJKYMuSzPlCTPvtJKg-1; Mon, 08 Mar 2021 05:02:16 -0500
X-MC-Unique: cKHrLJKYMuSzPlCTPvtJKg-1
Received: by mail-ed1-f69.google.com with SMTP id a2so4754947edx.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 02:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VR42W3fm8p4f4qNXRohsdhfIB6hoAq7oILLXEIkWtSc=;
 b=rcxuBBOxSFPgqdOhSBZOXhAWYK1THgN+LuQ4lCLSj8pVktm7kNr9iA+srWGhMsrnwW
 oqufEobwPoWHsOIaSmOqzhxs68ghAGDv+afW4W3Ez3ZyLXJG4b3uwceGsZlRZRyMNxyp
 UOnx7BkXIknqlEHc4AKNseA6lJ2cdkoK5gRrJ5mqwcWzSZT3gHeAkX3F+vIgMYWCSwjO
 Mvp0RIsQvf99KOL/Cg5ACP/5Qh2LT30iptgdGSo4AYlHAU0WKgV1dOKcaa7YoNM6uFxY
 pCRtP0P7lUGpjvBma69QwEhlR+k45PdmD+ls2iu4yZigBdhGIh5JNdCZZvG0Rj1Y44LO
 RQCg==
X-Gm-Message-State: AOAM5322b9yHeLCEtwtniA2V/v+6rkMJJjuIoZ1WX5VZ3js46hibiB99
 6vGJhxEzZMg7WF/Yr31lGwCk3lponnRAvSCgGqPcQUa66cebuKfMbVifi7C/6S05BQpETLtU4lX
 W9P7IBu98jnW5qYI=
X-Received: by 2002:a17:906:be9:: with SMTP id
 z9mr13968662ejg.35.1615197734906; 
 Mon, 08 Mar 2021 02:02:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsUkYgVNkVwwJMnBF3JheuuzU8nOPT3wKS2OjfRHa4olHIhJT3/vwnamxE8DUJmIMhrNxmxw==
X-Received: by 2002:a17:906:be9:: with SMTP id
 z9mr13968627ejg.35.1615197734576; 
 Mon, 08 Mar 2021 02:02:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id lk12sm6177525ejb.14.2021.03.08.02.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 02:02:14 -0800 (PST)
Subject: Re: [PATCH v2 0/2] Update libslirp & make it a subproject
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210125073427.3970606-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cb8c7d87-1f1d-a262-c35a-00b34f8240f0@redhat.com>
Date: Mon, 8 Mar 2021 11:02:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210125073427.3970606-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: samuel.thibault@ens-lyon.org, j@getutm.app, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc-André,

On 1/25/21 8:34 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> Here is a few patches to update libslirp to git upstream.
> Since it now supports meson subproject(), adapt the build
> system to use it, and related fixes.
> 
> v2:
>  - fix unused variables on macos
>  - fork_exec_child_setup: improve signal handling
> 
> Marc-André Lureau (2):
>   slirp: update to git master
>   build-sys: make libslirp a meson subproject
> 
>  configure            |  2 +-
>  meson.build          | 62 +++-----------------------------------------
>  .gitmodules          |  4 +--
>  slirp                |  1 -
>  subprojects/libslirp |  1 +
>  5 files changed, 8 insertions(+), 62 deletions(-)
>  delete mode 160000 slirp
>  create mode 160000 subprojects/libslirp

Just out of curiosity, why "subprojects"? Should we move
other submodules there (meson, dtc, keycodemapdb)?


