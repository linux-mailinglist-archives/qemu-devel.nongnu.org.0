Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA954CF58
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 19:05:09 +0200 (CEST)
Received: from localhost ([::1]:40530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1WS2-0001hW-JW
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 13:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1WFb-0008Fc-MA
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1WFX-0002Yy-Nk
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655311930;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EhcLt/Q6hcODL6oWTIiU90nOYXZUCVG0MidX6pK2ZBA=;
 b=U8eM6tuWVH8euoyNG1ga6Ww18FGNd+Sa0HNgAXV5os+yFNucdbngX2tn+hPXU9h1eKXG2w
 SJPlEJzmKtnhu+fDwRDDv96fa6YStfuaO0zNWPsziqeD86uc1DkX0xlRZ7Kq7JxmoKZMDe
 WNsJDkkpFwZypN6vukKPCdoQu8YStBY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-nsX9XmyuM_i-nW8N53ujiw-1; Wed, 15 Jun 2022 12:52:07 -0400
X-MC-Unique: nsX9XmyuM_i-nW8N53ujiw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFE49802D1F;
 Wed, 15 Jun 2022 16:52:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E43C400E88E;
 Wed, 15 Jun 2022 16:52:05 +0000 (UTC)
Date: Wed, 15 Jun 2022 17:52:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 1/7] datadir: Simplify firmware directory search
Message-ID: <YqoOMngAPwBJo/bL@redhat.com>
References: <20220615155634.578-1-akihiko.odaki@gmail.com>
 <20220615155634.578-2-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220615155634.578-2-akihiko.odaki@gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 16, 2022 at 12:56:28AM +0900, Akihiko Odaki wrote:
> The old implementation had some code to accept multiple firmware
> directories, but it is not used.

It is used by distros. In Fedora builds for example:

https://kojipkgs.fedoraproject.org/packages/qemu/7.0.0/1.fc37/data/logs/x86_64/build.log

Passes this to configure:

   --firmwarepath=/usr/share/qemu-firmware:/usr/share/ipxe/qemu:/usr/share/seavgabios:/usr/share/seabios:/usr/share/sgabios
 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  softmmu/datadir.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/softmmu/datadir.c b/softmmu/datadir.c
> index 160cac999a6..2a206f2740a 100644
> --- a/softmmu/datadir.c
> +++ b/softmmu/datadir.c
> @@ -105,15 +105,8 @@ static char *find_datadir(void)
>  
>  void qemu_add_default_firmwarepath(void)
>  {
> -    char **dirs;
> -    size_t i;
> -
> -    /* add configured firmware directories */
> -    dirs = g_strsplit(CONFIG_QEMU_FIRMWAREPATH, G_SEARCHPATH_SEPARATOR_S, 0);
> -    for (i = 0; dirs[i] != NULL; i++) {
> -        qemu_add_data_dir(get_relocated_path(dirs[i]));
> -    }
> -    g_strfreev(dirs);
> +    /* add the configured firmware directory */
> +    qemu_add_data_dir(get_relocated_path(CONFIG_QEMU_FIRMWAREPATH));
>  
>      /* try to find datadir relative to the executable path */
>      qemu_add_data_dir(find_datadir());
> -- 
> 2.32.1 (Apple Git-133)
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


