Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD915667250
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:36:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwo5-0001Qb-IT; Thu, 12 Jan 2023 07:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFwnz-0001Q8-KL
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:35:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFwnj-0001y0-Nq
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673526908;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=90FlYDKgAQ4M5623IshKE2E6oVr+S5sh1/GWpnJZkbw=;
 b=YsJgiPm3nJAPpf6wyGYD45bhdpmRQaul4o9RlF10VonQJZq2dbQK90wOgzdNVcE2mg+Fet
 Kb1uQqwjDuiUCZ0Bm4sE77QJyqbXwl5zD8cSOLJrQH1xks/m7ebCdWdEsyDscm92EJOC1X
 1fi/g9cigaAwFGowREzyFvfyykDJFJ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-5zELxDFgOK2J-p-CFuzN0w-1; Thu, 12 Jan 2023 07:35:06 -0500
X-MC-Unique: 5zELxDFgOK2J-p-CFuzN0w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C92C3806703;
 Thu, 12 Jan 2023 12:35:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C312C15BA0;
 Thu, 12 Jan 2023 12:35:05 +0000 (UTC)
Date: Thu, 12 Jan 2023 12:35:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Or Ozeri <oro@il.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, dannyh@il.ibm.com,
 idryomov@gmail.com
Subject: Re: [PATCH v4 1/3] block/rbd: encryption nit fixes
Message-ID: <Y7/+d3Zr9ncvCZuV@redhat.com>
References: <20221120102836.3174090-1-oro@il.ibm.com>
 <20221120102836.3174090-2-oro@il.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221120102836.3174090-2-oro@il.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Sun, Nov 20, 2022 at 04:28:34AM -0600, Or Ozeri wrote:
> Add const modifier to passphrases,
> and remove redundant stack variable passphrase_len.
> 
> Signed-off-by: Or Ozeri <oro@il.ibm.com>
> ---
>  block/rbd.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/block/rbd.c b/block/rbd.c
> index f826410f40..e575105e6d 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -330,7 +330,7 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
>  #ifdef LIBRBD_SUPPORTS_ENCRYPTION
>  static int qemu_rbd_convert_luks_options(
>          RbdEncryptionOptionsLUKSBase *luks_opts,
> -        char **passphrase,
> +        const char **passphrase,
>          size_t *passphrase_len,
>          Error **errp)
>  {
> @@ -341,7 +341,7 @@ static int qemu_rbd_convert_luks_options(
>  static int qemu_rbd_convert_luks_create_options(
>          RbdEncryptionCreateOptionsLUKSBase *luks_opts,
>          rbd_encryption_algorithm_t *alg,
> -        char **passphrase,
> +        const char **passphrase,
>          size_t *passphrase_len,
>          Error **errp)
>  {
> @@ -384,8 +384,7 @@ static int qemu_rbd_encryption_format(rbd_image_t image,
>                                        Error **errp)
>  {
>      int r = 0;
> -    g_autofree char *passphrase = NULL;
> -    size_t passphrase_len;
> +    g_autofree const char *passphrase = NULL;

This looks wierd.  If it is as const string, why are
we free'ing it ?  Either want g_autofree, or const,
but not both.

>      rbd_encryption_format_t format;
>      rbd_encryption_options_t opts;
>      rbd_encryption_luks1_format_options_t luks_opts;
> @@ -407,12 +406,12 @@ static int qemu_rbd_encryption_format(rbd_image_t image,
>              opts_size = sizeof(luks_opts);
>              r = qemu_rbd_convert_luks_create_options(
>                      qapi_RbdEncryptionCreateOptionsLUKS_base(&encrypt->u.luks),
> -                    &luks_opts.alg, &passphrase, &passphrase_len, errp);
> +                    &luks_opts.alg, &passphrase, &luks_opts.passphrase_size,
> +                    errp);
>              if (r < 0) {
>                  return r;
>              }
>              luks_opts.passphrase = passphrase;
> -            luks_opts.passphrase_size = passphrase_len;
>              break;
>          }
>          case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> @@ -423,12 +422,12 @@ static int qemu_rbd_encryption_format(rbd_image_t image,
>              r = qemu_rbd_convert_luks_create_options(
>                      qapi_RbdEncryptionCreateOptionsLUKS2_base(
>                              &encrypt->u.luks2),
> -                    &luks2_opts.alg, &passphrase, &passphrase_len, errp);
> +                    &luks2_opts.alg, &passphrase, &luks2_opts.passphrase_size,
> +                    errp);
>              if (r < 0) {
>                  return r;
>              }
>              luks2_opts.passphrase = passphrase;
> -            luks2_opts.passphrase_size = passphrase_len;
>              break;
>          }
>          default: {
> @@ -466,8 +465,7 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
>                                      Error **errp)
>  {
>      int r = 0;
> -    g_autofree char *passphrase = NULL;
> -    size_t passphrase_len;
> +    g_autofree const char *passphrase = NULL;
>      rbd_encryption_luks1_format_options_t luks_opts;
>      rbd_encryption_luks2_format_options_t luks2_opts;
>      rbd_encryption_format_t format;
> @@ -482,12 +480,11 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
>              opts_size = sizeof(luks_opts);
>              r = qemu_rbd_convert_luks_options(
>                      qapi_RbdEncryptionOptionsLUKS_base(&encrypt->u.luks),
> -                    &passphrase, &passphrase_len, errp);
> +                    &passphrase, &luks_opts.passphrase_size, errp);
>              if (r < 0) {
>                  return r;
>              }
>              luks_opts.passphrase = passphrase;
> -            luks_opts.passphrase_size = passphrase_len;
>              break;
>          }
>          case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> @@ -497,12 +494,11 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
>              opts_size = sizeof(luks2_opts);
>              r = qemu_rbd_convert_luks_options(
>                      qapi_RbdEncryptionOptionsLUKS2_base(&encrypt->u.luks2),
> -                    &passphrase, &passphrase_len, errp);
> +                    &passphrase, &luks2_opts.passphrase_size, errp);
>              if (r < 0) {
>                  return r;
>              }
>              luks2_opts.passphrase = passphrase;
> -            luks2_opts.passphrase_size = passphrase_len;
>              break;
>          }
>          default: {
> -- 
> 2.25.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


