Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87049453448
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:35:07 +0100 (CET)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzYA-0000Om-MT
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:35:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mmzUt-00058Z-2K
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:31:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mmzUr-00050A-Ch
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637073100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sW/O/vuyyo57WeMpnI8zBcDt67n+oNVtYFNuiQXPEyA=;
 b=Om4lo9cPIdGekmiPTymwLujIBRB7Ye8puVHJEnqTrK6dZREcwM1YUlf7i42e+HqbkXRvri
 hRQDgnOJ0EeSh0BHbe6m4GBXhPT25rzuYFqBDcFdR72RRBTD+puYEBJDzbu/fqIkKc9/rA
 6iNHYfMEgMU2N0e1anmeCBDjqentVuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-xTWKOfYiOMWaYYMHfWmRrw-1; Tue, 16 Nov 2021 09:31:37 -0500
X-MC-Unique: xTWKOfYiOMWaYYMHfWmRrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8724987D542;
 Tue, 16 Nov 2021 14:31:36 +0000 (UTC)
Received: from [10.39.192.245] (unknown [10.39.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD44A5D6D5;
 Tue, 16 Nov 2021 14:31:35 +0000 (UTC)
Message-ID: <268647d0-725f-8c8c-82bc-f26c7f8cdeb0@redhat.com>
Date: Tue, 16 Nov 2021 15:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] meson: fix botched compile check conversions
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211116093834.76615-1-pbonzini@redhat.com>
 <CAFEAcA8=RsA37ErttuGKKfrb8Ooy9NJs=F4o4agQbgu=On9P5w@mail.gmail.com>
 <YZOdRHZn9h9Rdjlr@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YZOdRHZn9h9Rdjlr@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 13:00, Daniel P. Berrangé wrote:
> I wonder if the problem is more fundamental than that. Passing
> stuff in --extra-cflags is done to influence the flags used to
> compile the QEMU end user binaries. Unfortunately --extra-cflags
> is also getting applied to all the meson.build feature checks.
> 
> IMHO we would get a more reliable result if the meson.build
> checks were fully isolated from the cflags we used for building
> everything else, so the checks get a well understood, predictable
> environment.
> 
> IIUC, this current behaviour is a result of us adding cflags
> using  add_global_arguments / add_project_arguments.

No, it's not using add_global_arguments/add_project_arguments for 
--extra-cflags.

The --extra-cflags (aka the CFLAGS envvar, or "meson setup -Dc_args") is 
messy: on one hand it's kinda legacy (we have configure flags to set 
-O2, -g, -Werror, etc.), on the other hand not really possible to kill 
it because it's how distros expect to set flags such as -O2.

But it's full of pitfalls, and the only good use of it seems to be for 
-I and -L flags.  We already saw issues with it last week with distros 
adding "-Wall" to CFLAGS or --extra-cflags and that gives you bogus 
warnings.  Unfortunately you certainly want flags such as -g to override 
earlier flags, and you might even want -Wall to override earlier -Wno-* 
flags *unless -Werror is in use*.

Apart from this, the sizeof() issue (which by the way I didn't see with 
GCC) has to be fixed in Meson and is probably visible also in e.g. 
has_members.

Paolo


