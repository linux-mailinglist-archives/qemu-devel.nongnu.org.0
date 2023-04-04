Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17116D644B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:58:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhAQ-0003cf-Lg; Tue, 04 Apr 2023 09:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pjhAD-0003bl-MZ
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pjhAB-00053d-In
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680616650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYn7OYIVH83txTjtRmdLLOaHNTCqXl6caXuullcfhyc=;
 b=ehTx8WdUxer7zmlHauI30K4FVvWnW/8OVpsl7pFjn6J52DuccXg9AYr+jRsv9LouoYAYq4
 J9lsDtu4MdD2TVcCOsyJQ5UJVoD/54J9esAf5l7dWylus0IicYyqZZDciph78YebuU+8s3
 /rYh202OPvCYLnYIcuAdIBl58Dp7Q8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-7LQDqqgVOqK7cz1eWn9vKA-1; Tue, 04 Apr 2023 09:57:26 -0400
X-MC-Unique: 7LQDqqgVOqK7cz1eWn9vKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67B5A101A551;
 Tue,  4 Apr 2023 13:57:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B8FA2027062;
 Tue,  4 Apr 2023 13:57:18 +0000 (UTC)
Date: Tue, 4 Apr 2023 15:57:17 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, armbru@redhat.com
Subject: Re: [PATCH v2 05/11] qemu-options: finesse the recommendations
 around -blockdev
Message-ID: <ZCwsvaxRzx4bzbXo@redhat.com>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
 <20230403134920.2132362-6-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403134920.2132362-6-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 03.04.2023 um 15:49 hat Alex Bennée geschrieben:
> We are a bit premature in recommending -blockdev/-device as the best
> way to configure block devices, especially in the common case.
> Improve the language to hopefully make things clearer.
> 
> Suggested-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230330101141.30199-5-alex.bennee@linaro.org>
> ---
>  qemu-options.hx | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c..9a69ed838e 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1143,10 +1143,14 @@ have gone through several iterations as the feature set and complexity
>  of the block layer have grown. Many online guides to QEMU often
>  reference older and deprecated options, which can lead to confusion.
>  
> -The recommended modern way to describe disks is to use a combination of
> +The most explicit way to describe disks is to use a combination of
>  ``-device`` to specify the hardware device and ``-blockdev`` to
>  describe the backend. The device defines what the guest sees and the
> -backend describes how QEMU handles the data.
> +backend describes how QEMU handles the data. The ``-drive`` option
> +combines the device and backend into a single command line options
> +which is useful in the majority of cases. Older options like ``-hda``
> +bake in a lot of assumptions from the days when QEMU was emulating a
> +legacy PC, they are not recommended for modern configurations.

Let's not make the use of -drive look more advisable than it really is.
If you're writing a management tool/script and you're still using -drive
today, you're doing it wrong.

Maybe this is actually the point where we should just clearly define
that -blockdev is the only supported stable API (like QMP), and that
-drive etc. are convenient shortcuts for human users with no
compatibility promise (like HMP).

What stopped us from doing so is that there are certain boards that
don't allow the user to configure the onboard devices, but that look at
-drive. These wouldn't provide any stable API any more after this
change. However, if this hasn't been solved in many years, maybe it's
time to view it as the board's problem, and use this change to motivate
them to implement ways to configure the devices. Or maybe some don't
even want to bother with a stable API, who knows.

Kevin


