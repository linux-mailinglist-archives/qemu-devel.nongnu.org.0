Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7712298DA9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 14:17:54 +0100 (CET)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX2Nl-0008UH-HU
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 09:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kX2ME-0007xi-H0
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kX2MC-0004w0-I0
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603718175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyJg9Gol7DGlAaLmtZHdIB0GAWDywozE3NSW3vSAQFg=;
 b=bND9b/e+ymRzFiJnO28vFpxZIFvK9FmXATtCoNdIPL1F/hY5lzC5Gno8lDHtRechNOxBWF
 3L52BxqLw5uplKkZxr4FKarOEkPVE//HrHXrfD7G8vF6vNo9Izg/3DCpVsQ5AHjoCIhiuh
 hYQ8vxynfakP27QzxpFqW7zo5phvY7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-Y1My2nUKOwqYY7kG2uYOOA-1; Mon, 26 Oct 2020 09:16:13 -0400
X-MC-Unique: Y1My2nUKOwqYY7kG2uYOOA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E54E01882FB3
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 13:16:11 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-104.ams2.redhat.com [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC43755762;
 Mon, 26 Oct 2020 13:16:10 +0000 (UTC)
Subject: Re: [PATCH] device-crash-test: Check if path is actually an
 executable file
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20201026125238.2752882-1-ehabkost@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <675b8d44-29ea-0d0b-263f-6fd708d8b0c0@redhat.com>
Date: Mon, 26 Oct 2020 14:16:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201026125238.2752882-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.167, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/10/2020 13.52, Eduardo Habkost wrote:
> After the transition to Meson, the build directory now have
> subdirectories named "qemu-system-*.p", and device-crash-test
> will try to execute them as if they were binaries.  This results
> in errors like:
> 
>   PermissionError: [Errno 13] Permission denied: './qemu-system-or1k.p'
> 
> When generating the default list of binaries to test, check if
> the path is actually a file and if it's executable.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  scripts/device-crash-test | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/device-crash-test b/scripts/device-crash-test
> index 866baf7058..04118669ba 100755
> --- a/scripts/device-crash-test
> +++ b/scripts/device-crash-test
> @@ -383,7 +383,9 @@ def binariesToTest(args, testcase):
>      if args.qemu:
>          r = args.qemu
>      else:
> -        r = glob.glob('./qemu-system-*')
> +        r = [f.path for f in os.scandir('.')
> +             if f.name.startswith('qemu-system-') and
> +                f.is_file() and os.access(f, os.X_OK)]
>      return r

Thanks, this seems to fix the issue for me!

Tested-by: Thomas Huth <thuth@redhat.com>


