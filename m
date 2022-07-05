Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08293566D2B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 14:21:58 +0200 (CEST)
Received: from localhost ([::1]:60162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8hYz-0007an-4z
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 08:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8hXZ-00068H-6n
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:20:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8hXV-00076W-GR
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657023624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4WUIJ6Nv46KdUkuxiGuZ3927ue9m/1pHSr15av70PvU=;
 b=T5TQIBn5ht3L6dBP8sAgiksskdFwUhdreYQ1e32PYRzqi4sn0W7QV50pUazkq3HFs4k8ki
 wB+Azvz6yRzDIALUnlA4rBp9Kr110ID1I+FFYJd27dfdHShRIQ8IUHZa1u3x5lOhb91B6n
 lfdbRN3jAxmNSA8czC8AsVTQWIRtfcA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-didUphW6Mb-_4FPiayqkcQ-1; Tue, 05 Jul 2022 08:20:17 -0400
X-MC-Unique: didUphW6Mb-_4FPiayqkcQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z11-20020a05600c0a0b00b003a043991610so6680157wmp.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 05:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4WUIJ6Nv46KdUkuxiGuZ3927ue9m/1pHSr15av70PvU=;
 b=Msoh8FexvvlVBRsovjxTjCSfrh8YkBtkcCRN6l+TqhAgyjnUdP3KCtN6YPRbZrN/5t
 PB0SXLCFwQrw+qgbLAYyfZWkgATkTt7ei9cgn2y58R23xMQxEH/FkLBS/wdd+GC81TFE
 beNRytDiYqQTSPoVYY6W16zSUXmeCumubCLjyMqENZY1x3/o6dAjDz/fCENRP6FjtifV
 foy9v73+BKMWcQtLBgwZK3e30430SctqFKqr5ZfH7paoyQs6kqrFi4nSld7PfEdjRCrA
 K6Eeq1wh2VmyNCeTfo18RcrkIdQLJxhgn2iRXoNtj/QES52qYIHLCRWB936Bf7Z1sK6N
 N0/Q==
X-Gm-Message-State: AJIora/LN0VEIBAaz9yzgWdOuCIEef+nyiVRtrpLbRleO7VakRRJ+hFe
 q/pATaAXBA7KsTQ8mFfto8IiaR4kGZcmZuS5zTH7Y8wal6uj1K02XKJernpVIEP6OPeLGQF8J+R
 uLPfhVQAa26p9Gw0=
X-Received: by 2002:a7b:c310:0:b0:38c:f07a:e10d with SMTP id
 k16-20020a7bc310000000b0038cf07ae10dmr36851024wmj.110.1657023616380; 
 Tue, 05 Jul 2022 05:20:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uUhQh1S3BtIZaELXHPfmy3reXeWq+4BBK4Ipe+d1hznHywUvIaJ6mWu2mcXdMG+9/Jio49Tw==
X-Received: by 2002:a7b:c310:0:b0:38c:f07a:e10d with SMTP id
 k16-20020a7bc310000000b0038cf07ae10dmr36851000wmj.110.1657023616154; 
 Tue, 05 Jul 2022 05:20:16 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c35cc00b003a04e900552sm21868160wmq.1.2022.07.05.05.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 05:20:15 -0700 (PDT)
Date: Tue, 5 Jul 2022 13:20:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 2/5] multifd: Put around all sync calls tests for each
 iteration
Message-ID: <YsQsfT6BnonfOQeW@work-vm>
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-3-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621140507.1246-3-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> We will sync later in different places.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 5f5e37f64d..35816a3a0a 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2944,11 +2944,12 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>      ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>      ram_control_after_iterate(f, RAM_CONTROL_SETUP);
>  
> -    ret =  multifd_send_sync_main(f);
> -    if (ret < 0) {
> -        return ret;
> +    if (migrate_multifd_sync_each_iteration()) {
> +        ret =  multifd_send_sync_main(f);
> +        if (ret < 0) {
> +            return ret;
> +        }
>      }
> -
>      qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>      qemu_fflush(f);
>  
> @@ -3057,9 +3058,11 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
>  out:
>      if (ret >= 0
>          && migration_is_setup_or_active(migrate_get_current()->state)) {
> -        ret = multifd_send_sync_main(rs->f);
> -        if (ret < 0) {
> -            return ret;
> +        if (migrate_multifd_sync_each_iteration()) {
> +            ret = multifd_send_sync_main(rs->f);
> +            if (ret < 0) {
> +                return ret;
> +            }
>          }
>  
>          qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
> @@ -3125,9 +3128,11 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>          return ret;
>      }
>  
> -    ret = multifd_send_sync_main(rs->f);
> -    if (ret < 0) {
> -        return ret;
> +    if (migrate_multifd_sync_each_iteration()) {
> +        ret = multifd_send_sync_main(rs->f);
> +        if (ret < 0) {
> +            return ret;
> +        }
>      }
>  
>      qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
> @@ -3799,7 +3804,9 @@ int ram_load_postcopy(QEMUFile *f)
>  
>          case RAM_SAVE_FLAG_EOS:
>              /* normal exit */
> -            multifd_recv_sync_main();
> +            if (migrate_multifd_sync_each_iteration()) {
> +                multifd_recv_sync_main();
> +            }
>              break;
>          default:
>              error_report("Unknown combination of migration flags: 0x%x"
> @@ -4075,7 +4082,9 @@ static int ram_load_precopy(QEMUFile *f)
>              break;
>          case RAM_SAVE_FLAG_EOS:
>              /* normal exit */
> -            multifd_recv_sync_main();
> +            if (migrate_multifd_sync_each_iteration()) {
> +                multifd_recv_sync_main();
> +            }
>              break;
>          default:
>              if (flags & RAM_SAVE_FLAG_HOOK) {
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


