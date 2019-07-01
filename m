Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5895F5B84C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 11:47:04 +0200 (CEST)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhstm-0006LT-Cm
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 05:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52484)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hhsr7-0004ST-I2
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:44:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hhsr5-0003JU-1g
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:44:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53064)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hhsr3-0003Gy-1Z
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:44:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F1304307D913;
 Mon,  1 Jul 2019 09:43:58 +0000 (UTC)
Received: from redhat.com (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F221B5D71C;
 Mon,  1 Jul 2019 09:43:56 +0000 (UTC)
Date: Mon, 1 Jul 2019 10:43:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: P J P <ppandit@redhat.com>
Message-ID: <20190701094353.GF3573@redhat.com>
References: <20190701090904.31312-1-ppandit@redhat.com>
 <20190701090904.31312-2-ppandit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190701090904.31312-2-ppandit@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 01 Jul 2019 09:43:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/3] qemu-bridge-helper: restrict
 interface name to IFNAMSIZ
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Riccardo Schirone <rschiron@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 01, 2019 at 02:39:02PM +0530, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> The interface names in qemu-bridge-helper are defined to be
> of size IFNAMSIZ(=16), including the terminating null('\0') byte.
> The same is applied to interface names read from 'bridge.conf'
> file to form ACLs rules. If user supplied '--br=bridge' name
> is not restricted to the same length, it could lead to ACL bypass
> issue. Restrict interface name to IFNAMSIZ, including null byte.
> 
> Reported-by: Riccardo Schirone <rschiron@redhat.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  qemu-bridge-helper.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> Update v2: report an error and exit
>   -> https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg06239.html
> 
> diff --git a/qemu-bridge-helper.c b/qemu-bridge-helper.c
> index f9940deefd..8ec0a65174 100644
> --- a/qemu-bridge-helper.c
> +++ b/qemu-bridge-helper.c
> @@ -109,6 +109,13 @@ static int parse_acl_file(const char *filename, ACLList *acl_list)
>          }
>          *argend = 0;
>  
> +        if (strcmp(cmd, "include") && strlen(arg) >= IFNAMSIZ) {
> +            fprintf(stderr, "name `%s' too long: %lu\n", arg, strlen(arg));

strlen returns size_t, which does not match %lu - it needs %zu - we can
ignore the non-portability of %zu to windows, since this code is UNIX
only.

I'd prefer also !g_str_equal(cmd, "include")  as to me it reads more
easily.


> +            fclose(f);
> +            errno = EINVAL;
> +            return -1;
> +        }


> +
>          if (strcmp(cmd, "deny") == 0) {
>              acl_rule = g_malloc(sizeof(*acl_rule));
>              if (strcmp(arg, "all") == 0) {
> @@ -259,6 +266,10 @@ int main(int argc, char **argv)
>          usage();
>          return EXIT_FAILURE;
>      }
> +    if (strlen(bridge) >= IFNAMSIZ) {
> +        fprintf(stderr, "name `%s' too long: %lu\n", bridge, strlen(bridge));
> +        return EXIT_FAILURE;
> +    }

%zu too

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

