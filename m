Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396F24D92A2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 03:32:48 +0100 (CET)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTwzP-0002xj-21
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 22:32:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTwxp-0002DH-Jn
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:31:09 -0400
Received: from smtp65.iad3b.emailsrvr.com ([146.20.161.65]:52758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTwxn-0004JD-9Z
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:31:09 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp17.relay.iad3b.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 3F536A00B3; 
 Mon, 14 Mar 2022 22:31:05 -0400 (EDT)
Date: Mon, 14 Mar 2022 21:31:04 -0500
From: Andrew Deason <adeason@sinenomine.net>
To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 1/3] util/osdep: Avoid madvise proto on modern Solaris
Message-Id: <20220314213104.eff51232a749c537a7545a74@sinenomine.net>
In-Reply-To: <20220315022025.18908-2-adeason@sinenomine.net>
References: <20220315022025.18908-1-adeason@sinenomine.net>
 <20220315022025.18908-2-adeason@sinenomine.net>
Organization: Sine Nomine Associates
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Classification-ID: 8a524ef5-07d1-44f4-95d8-4288c748c927-1-1
Received-SPF: pass client-ip=146.20.161.65;
 envelope-from=adeason@sinenomine.net; helo=smtp65.iad3b.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 21:20:23 -0500
Andrew Deason <adeason@sinenomine.net> wrote:

>  #ifdef CONFIG_SOLARIS
>  #include <sys/statvfs.h>
> +#endif
> +
> +#ifdef HAVE_MADVISE_MISSING_PROTOTYPE

Oh goodness, that's not the right name is it. I'll wait a little bit to
see if there are any other comments, but clearly that needs to be fixed.

(I am testing that the meson checks behave as expected (by editing out
the proto in mman.h), but I didn't run the whole build when doing that.)

-- 
Andrew Deason
adeason@sinenomine.net

