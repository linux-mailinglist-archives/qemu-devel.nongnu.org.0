Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BC350DE04
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:36:44 +0200 (CEST)
Received: from localhost ([::1]:41906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niw5D-0006Wr-Sj
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nivzh-00044c-Nw
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nivze-0005W6-Lg
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650882653;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zikedJY2Bc/nZGl1FsUJq7x7sKjpzgd7hgj5uaKggU=;
 b=OgwMmWALIusHcLJusKgQX3vg3Wx/K+AWBJ6vXbtuG4LXBRLrXduCPnwP3tUe1rt4cDLKwz
 Ffe+x8pTvDVx6GCO1tH/I6qqqNN9Wg61Vl9qXnybtvsakrcuD4f62TWtqoBbZPd6xWeS6E
 henHbg9M/9V6gxIMWXHWVyYvmTLZO14=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-Of34PunuP9CKnrpTCLzCyQ-1; Mon, 25 Apr 2022 06:30:44 -0400
X-MC-Unique: Of34PunuP9CKnrpTCLzCyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B38EE3811F24;
 Mon, 25 Apr 2022 10:30:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA19E40D282C;
 Mon, 25 Apr 2022 10:30:42 +0000 (UTC)
Date: Mon, 25 Apr 2022 11:30:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Haiyue Wang <haiyue.wang@intel.com>
Subject: Re: [PATCH v2] error-report: fix g_date_time_format assertion
Message-ID: <YmZ4UA5xe8dhUqZu@redhat.com>
References: <20220424103120.284688-1-haiyue.wang@intel.com>
 <20220424105036.291370-1-haiyue.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220424105036.291370-1-haiyue.wang@intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 24, 2022 at 06:50:35PM +0800, Haiyue Wang wrote:
> The 'g_get_real_time' returns the number of microseconds since January
> 1, 1970 UTC, but 'g_date_time_new_from_unix_utc' needs the number of
> seconds, so it will cause the invalid time input:
> 
> (process:279642): GLib-CRITICAL (recursed) **: g_date_time_format: assertion 'datetime != NULL' failed
> 
> Call function 'g_date_time_new_now_utc' instead, it has the same result
> as 'g_date_time_new_from_unix_utc(g_get_real_time() / G_USEC_PER_SEC)';
> 
> Fixes: 73dab893b569 ("error-report: replace deprecated g_get_current_time() with glib >= 2.62")
> Signed-off-by: Haiyue Wang <haiyue.wang@intel.com>
> ---
> v2: use 'g_date_time_new_now_utc' directly, which handles the time
>     zone reference correctly.
> ---
>  util/error-report.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/error-report.c b/util/error-report.c
> index dbadaf206d..5edb2e6040 100644
> --- a/util/error-report.c
> +++ b/util/error-report.c
> @@ -173,7 +173,7 @@ static char *
>  real_time_iso8601(void)
>  {
>  #if GLIB_CHECK_VERSION(2,62,0)
> -    g_autoptr(GDateTime) dt = g_date_time_new_from_unix_utc(g_get_real_time());
> +    g_autoptr(GDateTime) dt = g_date_time_new_now_utc();
>      /* ignore deprecation warning, since GLIB_VERSION_MAX_ALLOWED is 2.56 */
>  #pragma GCC diagnostic push
>  #pragma GCC diagnostic ignored "-Wdeprecated-declarations"

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Always nice when the bug fix is simpler than the original code too :-)

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


