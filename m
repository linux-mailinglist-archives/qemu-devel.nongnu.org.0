Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90174CC977
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 23:49:58 +0100 (CET)
Received: from localhost ([::1]:46632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPuGj-0004Vf-UF
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 17:49:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPuF9-0003dQ-JS
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 17:48:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPuF7-00087B-Va
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 17:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646347697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVjzwa6E6H1A583xa+fMVlOaB5OJZYmLwYB/4XcJFF8=;
 b=hWLL65dor4FrRnIZNQBxmZXF4/2edO5pgEw5TX/nyILG9/Y3jv7ocx7PVI5U6WVsKGGTHR
 td0nWL3bMPCMNqNLne/sYXE/e1CJGxf1HewgBRyulF38Twylv9ztixuchwzAGWDCaOs5d2
 6HtTbroL8VJTopsSjN6AyTsYEzRqzHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-xX8ojP2hOsCSSQ-zu8Y-sw-1; Thu, 03 Mar 2022 17:48:13 -0500
X-MC-Unique: xX8ojP2hOsCSSQ-zu8Y-sw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC33F8042D3;
 Thu,  3 Mar 2022 22:48:12 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 969544CEE2;
 Thu,  3 Mar 2022 22:47:57 +0000 (UTC)
Date: Thu, 3 Mar 2022 16:47:55 -0600
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 04/12] qemu-nbd: add --tls-hostname option for TLS
 certificate validation
Message-ID: <20220303224755.zrwhg7gp272upo76@redhat.com>
References: <20220303160330.2979753-1-berrange@redhat.com>
 <20220303160330.2979753-5-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303160330.2979753-5-berrange@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 04:03:22PM +0000, Daniel P. Berrangé wrote:
> When using the --list option, qemu-nbd acts as an NBD client rather
> than a server. As such when using TLS, it has a need to validate
> the server certificate. This adds a --tls-hostname option which can
> be used to override the default hostname used for certificate
> validation.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/tools/qemu-nbd.rst | 14 ++++++++++++++
>  qemu-nbd.c              | 17 ++++++++++++++++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
> index 6031f96893..acce54a39d 100644
> --- a/docs/tools/qemu-nbd.rst
> +++ b/docs/tools/qemu-nbd.rst
> @@ -169,6 +169,20 @@ driver options if ``--image-opts`` is specified.
>    option; or provide the credentials needed for connecting as a client
>    in list mode.
>  
> +.. option:: --tls-hostname=hostname
> +
> +  When validating an x509 certificate received over a TLS connection,
> +  the hostname that the NBD client used to connect will be checked
> +  against information in the server provided certificate. Sometimes
> +  it might be required to override the hostname used to perform this
> +  check. For example if the NBD client is using a tunnel from localhost
> +  to connect to the remote server. In this case the `--tls-hostname`

For example, if the ... to the remote server, the `--tls-hostname`


> +  option should be used to set the officially expected hostname of
> +  the remote NBD server. This can also be used if accessing NBD over
> +  a UNIX socket where there is no inherant hostname available. This

inherent

> +  only is only permitted when acting as a NBD client with the `--list`

s/only is/is/

> +  option.
> +
>  .. option:: --fork
>  

> @@ -835,6 +841,10 @@ int main(int argc, char **argv)
>              error_report("TLS authorization is incompatible with export list");
>              exit(EXIT_FAILURE);
>          }
> +        if (tlshostname && !list) {
> +            error_report("TLS hostname is only required with export list");

maybe s/required/supported/

> +            exit(EXIT_FAILURE);
> +        }
>          tlscreds = nbd_get_tls_creds(tlscredsid, list, &local_err);
>          if (local_err) {
>              error_reportf_err(local_err, "Failed to get TLS creds: ");
> @@ -845,6 +855,10 @@ int main(int argc, char **argv)
>              error_report("--tls-authz is not permitted without --tls-creds");
>              exit(EXIT_FAILURE);
>          }
> +        if (tlshostname) {
> +            error_report("--tls-hostname is not permitted without --tls-creds");
> +            exit(EXIT_FAILURE);
> +        }
>      }
>  
>      if (selinux_label) {
> @@ -861,7 +875,8 @@ int main(int argc, char **argv)
>  
>      if (list) {
>          saddr = nbd_build_socket_address(sockpath, bindto, port);
> -        return qemu_nbd_client_list(saddr, tlscreds, bindto);
> +        return qemu_nbd_client_list(saddr, tlscreds,
> +                                    tlshostname ? tlshostname : bindto);

With the grammar fixes,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


