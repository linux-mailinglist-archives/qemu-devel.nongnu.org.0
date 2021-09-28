Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF3D41AC07
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 11:36:07 +0200 (CEST)
Received: from localhost ([::1]:54610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV9Ww-00023I-5n
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 05:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mV9Ty-00087Y-0u
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mV9Tu-0004rf-I6
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632821576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4u5+E3pq+OHFV59SOwZS/+9hz6KnQqYD2srSQVPgMA=;
 b=AbCSnfcHxLI4tRx5WT2I2+5sW8FW3mWlG4a8014bioIPu2FUb4AuZolpu6y5zmU9C6jlHR
 SB58RIkQ2biP9Gk8WtbuLSVjG2khs2CgL9vL9r1GeVHuoSksselicGvPd9KGFEm4Svh6/9
 8JCWCq6BZ05z9mmqY44kPAvApCldEMM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-jTOuTSAgOBOIqfb_cC3L9Q-1; Tue, 28 Sep 2021 05:32:55 -0400
X-MC-Unique: jTOuTSAgOBOIqfb_cC3L9Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 70-20020a1c0149000000b0030b7dd84d81so1730008wmb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 02:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W4u5+E3pq+OHFV59SOwZS/+9hz6KnQqYD2srSQVPgMA=;
 b=6AVDpRAl/EQNmTyTMeFIeQdh9mbC2GHTQ1Ba+vp+1qjxrEurK/ViLh11meR1H/kc3w
 lyXWQqA9veML6wt5U/BcAp2PHNBYYSY1AzZanFzRgg0w22hM79cCa2syW9g6ZIB1cMcA
 kh8Q5j3SxjOldP2ter0JPH23NHQJs/J0HnAkwPzv4qornHmMpJWnU1R42nd2zkbsJSUZ
 bWwkAOBh6Eh6VlR/jiMVPS3Ql/jWj67bzynQwsn8uYSe/cEJqRjzWIHzxdr9xuwLEg+Z
 ZAkKZeGBdlxr0Jbq8rk6vdyOvgvnIug4kO/U0S2RkNrfrmX7fBSShfRB7Dy1aQd5K818
 RyAg==
X-Gm-Message-State: AOAM531JRhvh9V8084pOfjY9iwCn8zCN/ZNQjw6cSAHhK7l7yNugaQcq
 oPXS3aoVPqWqB7aQwQCoFVJGTyFccTMYZ95RdK4NfrtAWq2HPxxN6wIrKh3xp90ceBshtfXkkRb
 fndjoeoq0rwytk2A=
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr3644589wmj.146.1632821573958; 
 Tue, 28 Sep 2021 02:32:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI3i9l0TAlXkk4niMcJLuaXN3h/UfhXu8OSmNdoW+7v5iyEi1WAXbWrNufzKG3VWG9Q3dJyg==
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr3644573wmj.146.1632821573676; 
 Tue, 28 Sep 2021 02:32:53 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u14sm2119744wml.24.2021.09.28.02.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 02:32:52 -0700 (PDT)
Message-ID: <e3d9ceca-bd6f-f184-c02e-f2cf28d5204f@redhat.com>
Date: Tue, 28 Sep 2021 11:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/5] meson_options.txt: Switch the default value for
 the vnc option to 'auto'
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210903081358.956267-1-thuth@redhat.com>
 <20210903081358.956267-3-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210903081358.956267-3-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/21 10:13, Thomas Huth wrote:
> There is no reason why VNC should always be enabled and not be set to
> the default value. We already switched the setting in the "configure"
> script in commit 3a6a1256d4 ("configure: Allow vnc to get disabled with
> --without-default-features"), so let's do that in meson_options.txt now,
> too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson_options.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson_options.txt b/meson_options.txt
> index a9a9b8f4c6..2c89e79e8b 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -120,7 +120,7 @@ option('usb_redir', type : 'feature', value : 'auto',
>          description: 'libusbredir support')
>   option('virglrenderer', type : 'feature', value : 'auto',
>          description: 'virgl rendering support')
> -option('vnc', type : 'feature', value : 'enabled',
> +option('vnc', type : 'feature', value : 'auto',
>          description: 'VNC server')
>   option('vnc_jpeg', type : 'feature', value : 'auto',
>          description: 'JPEG lossy compression for VNC server')
> 

Queued this one for now, thanks.

Paolo


