Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3D565D8F4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 17:20:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD6U6-0006Y5-G5; Wed, 04 Jan 2023 11:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pD6Tv-0006XK-3l
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 11:19:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pD6Tt-0000Ak-E9
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 11:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672849148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+HSNzI+YOPFQkjmSGm9B1tfL6z3HIVtzrg97plOMMJg=;
 b=HGq6ZD+MSI5wzwzaVPtq78PmKVGYoGHEx/5c24QkUMPKdSOWKyxfV1yfHOeM5WuZoLGwpo
 RP6g2SpJP0wBjjjSYraZnyh2XiTPPTmgLiYoovBIuhssZ2GVvD5qVDLRBzVPBrdvDDXmtY
 vKR/VSKUuonrrZ0smBrivZlW2e/+73w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-CkCCEHpNMn-MMdvF1hWu2g-1; Wed, 04 Jan 2023 11:19:06 -0500
X-MC-Unique: CkCCEHpNMn-MMdvF1hWu2g-1
Received: by mail-wm1-f70.google.com with SMTP id
 n18-20020a05600c4f9200b003d993e08485so11000500wmq.2
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 08:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+HSNzI+YOPFQkjmSGm9B1tfL6z3HIVtzrg97plOMMJg=;
 b=vErQZooMXrpa5JFkAjIeBtJoNGYI8HwviGFJtKh6UmJNtu/0+/zp6xfIXyhjGFUHmK
 2xPgOvOR7cvGWuNTxBS5J1wc/rFD+J7yK/+CmPJr8ZA0njbbh0ENotAnETJLcdQd/egP
 ptTpdEHiWenPD30inG6eyRFFX3CfZ4hzhV1i9KyRv8Z1cHgUoSrjjQlwVipnfrJATyHv
 mwvcEQLt4RsXLQ1Q7ukRd4Mim+SoH1V3j9f6N5PVSLyqR2pxQySD3beHj+UQcrwLkOhF
 A/IpjwlFIQ7ImjAQKIXlm65LeDb72BgXoPR1fKNmN6TFQzAqUo3/hv8u5W44tlund/ki
 iQYQ==
X-Gm-Message-State: AFqh2kp8wk8JFoy6fJKIXdD+49Zu/lmL0DsxxMW8JF2B+4+Tn/U0CrFH
 qsQrh+Wu0SK4dySaaSsBSFMGBrwxOxJiPiN7PGGSH6zNU5QVj0quoRISaJDLXhAKonxZGaL0R9b
 yeoGgJOhSKbFjPH8=
X-Received: by 2002:a05:6000:1b88:b0:242:5dd7:8115 with SMTP id
 r8-20020a0560001b8800b002425dd78115mr28744776wru.64.1672849145953; 
 Wed, 04 Jan 2023 08:19:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvA5qa1cLdO5pUrucKBoKnZSM5+f2+RV47nAPV4BDN/yyUPI1u+RZ0knEWVB0cMkaey3vGFrQ==
X-Received: by 2002:a05:6000:1b88:b0:242:5dd7:8115 with SMTP id
 r8-20020a0560001b8800b002425dd78115mr28744763wru.64.1672849145759; 
 Wed, 04 Jan 2023 08:19:05 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 r17-20020adfdc91000000b0027973315213sm29575787wrj.89.2023.01.04.08.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 08:19:05 -0800 (PST)
Date: Wed, 4 Jan 2023 16:19:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH v3 02/18] ui: Fix silent truncation of numeric keys in
 HMP sendkey
Message-ID: <Y7Wm94X4gxl738Fd@work-vm>
References: <20221220090645.2844881-1-armbru@redhat.com>
 <20221220090645.2844881-3-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220090645.2844881-3-armbru@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Markus Armbruster (armbru@redhat.com) wrote:
> Keys are int.  HMP sendkey assigns them from the value strtoul(),
> silently truncating values greater than INT_MAX.  Fix to reject them.
> 
> While there, use qemu_strtoul() instead of strtoul() so checkpatch.pl
> won't complain.

Last time through you said you could switch to qemu_strtoui, but
I just noticed we've actually got a qemu_strto*i* - that
would remove the value comparison

Dave

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  monitor/hmp-cmds.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index ed78a87ddd..b8e294e6fa 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1549,8 +1549,13 @@ void hmp_sendkey(Monitor *mon, const QDict *qdict)
>          v = g_malloc0(sizeof(*v));
>  
>          if (strstart(keys, "0x", NULL)) {
> -            char *endp;
> -            int value = strtoul(keys, &endp, 0);
> +            const char *endp;
> +            unsigned long value;
> +
> +            if (qemu_strtoul(keys, &endp, 0, &value) < 0
> +                || value >= INT_MAX) {
> +                goto err_out;
> +            }
>              assert(endp <= keys + keyname_len);
>              if (endp != keys + keyname_len) {
>                  goto err_out;
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


