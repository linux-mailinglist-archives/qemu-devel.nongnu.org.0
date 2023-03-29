Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB1C6CDB5A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 16:00:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phWLi-0005rU-7w; Wed, 29 Mar 2023 10:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phWLd-0005rE-Om
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:00:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phWLa-0001GF-Hp
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:00:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680098417;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vEJKIxy331WvchjAVf9q+5cz9JwdQBmOFv+/+gKob5A=;
 b=I5XQn16qHr++4Gpt8lr5vrh7fBq4TtWIo1y0hvK9kIddd24GyUYK6rTV7tk2D7GiuPr7SM
 b7RPztrHIFHkiuccqJsBdckkGgLXEXJ5779fQg1zObGa9loEazIM1uWTCUAbeo1z8YnO7K
 /RpOYggMFJJH8j9yktt4Hgy7DsbR+ac=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-lR9BPHl-Om6QQnC6QDGLPg-1; Wed, 29 Mar 2023 10:00:13 -0400
X-MC-Unique: lR9BPHl-Om6QQnC6QDGLPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3C1D1C07546;
 Wed, 29 Mar 2023 14:00:12 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA9FC4042AC5;
 Wed, 29 Mar 2023 14:00:11 +0000 (UTC)
Date: Wed, 29 Mar 2023 15:00:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andreas Schwab <schwab@suse.de>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] linux-user: preserve incoming order of environment
 variables in the target
Message-ID: <ZCREaEiPyzYogkFj@redhat.com>
References: <mvmy1nfslvi.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mvmy1nfslvi.fsf@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 29, 2023 at 03:55:13PM +0200, Andreas Schwab wrote:
> Do not reverse the order of environment variables in the target environ
> array relative to the incoming environ order.  Some testsuites depend on a
> specific order, even though it is not defined by any standard.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  linux-user/main.c | 6 ++++++
>  1 file changed, 6 insertions(+)

bsd-user/main.c appears to have an identical code pattern that
will need the same fix

> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 4b18461969..dbfd3ee8f1 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -691,7 +691,13 @@ int main(int argc, char **argv, char **envp)
>      envlist = envlist_create();
>  
>      /* add current environment into the list */
> +    /* envlist_setenv adds to the front of the list; to preserve environ
> +       order add from back to front */
>      for (wrk = environ; *wrk != NULL; wrk++) {
> +        continue;
> +    }
> +    while (wrk != environ) {
> +        wrk--;
>          (void) envlist_setenv(envlist, *wrk);
>      }
>  
> -- 
> 2.40.0
> 
> 
> -- 
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


