Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66CF40B003
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:58:33 +0200 (CEST)
Received: from localhost ([::1]:36332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8xD-0002u1-Mm
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ8mw-0004li-3E
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:47:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQ8mu-00057Z-0C
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631627269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LYOmJVUdXgwRD4TaWWQ8WTs77gDNknFelqTK7cMDqSo=;
 b=Pm2WnlCgyiP6mBil7lx8x2Oop3MgFogNv7okO1zQb8vTEv1+6rN7DiHKrng2CCC35Ch6zO
 Yd0lVCAIRfPCz4ncgatDqmsJX7fwTcuSgTkQNY3M/fPGwq/w2WxUdJc1Fx3PTyfCf9laaI
 ImGfgvINgyCVfVXxgWUmtG83FzPMj9I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-kOierqu7Ok6_QXzdCcrcYg-1; Tue, 14 Sep 2021 09:47:48 -0400
X-MC-Unique: kOierqu7Ok6_QXzdCcrcYg-1
Received: by mail-wr1-f70.google.com with SMTP id
 m1-20020a056000180100b0015e1ec30ac3so697698wrh.8
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LYOmJVUdXgwRD4TaWWQ8WTs77gDNknFelqTK7cMDqSo=;
 b=Ur4ZFetigAmHn4uyBzre2g8X4sfWQOat9ZdA9RPtNez6HQLZakplV7jDih14jEg68U
 gdxXR/hEN3oGFlAno951WlhB0xI1DPGqVZ0YRaSur6xIkSs+cZfYK2JrjTIvv4VmJ4QX
 ELIfNF/l2MxknmCOsYZGU3TPRtVDGlWCzJ31Wwu3Nu1ONQNbTPf0UjWu4hlLqCoUIrEX
 hUL1KT9LeJ9CrVRm0ZE5ArGmKxRG2qUV7YIHo0ozO88FT9IkCdEVkRsb6y6GyoDAAz2m
 mXHntvmh+4EEY5gjZgrtMdRS9E3JH8WNBW26W96sHWH3zNT9WTeArXXyMIkWTev8tbuy
 caZw==
X-Gm-Message-State: AOAM533HEyG3m+mKP1NIi1fNQ0uTNqM0kw2uLk8iPqXHZHXxAw+9df6q
 OL8JB+EJi92eNuEEswW1j0eLYRgqIlU6cCbN1JJzN3qdMw4OXzYcTtQuhgYYS8xX5Uxfq6ubaR+
 w5VG8ZkaXperYFwo=
X-Received: by 2002:a05:600c:4b87:: with SMTP id
 e7mr1207630wmp.108.1631627267358; 
 Tue, 14 Sep 2021 06:47:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPC0wl87GXChdavlOTAFwqMcniQekRpjJeEKJE8FtNaKkOn0C1Y+G1W1HUuV0TeTPGaG8m7A==
X-Received: by 2002:a05:600c:4b87:: with SMTP id
 e7mr1207604wmp.108.1631627267147; 
 Tue, 14 Sep 2021 06:47:47 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id m3sm13688747wrg.45.2021.09.14.06.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 06:47:46 -0700 (PDT)
Subject: Re: [PATCH] virtio-balloon: Fix page-poison subsection name
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, mst@redhat.com, david@redhat.com
References: <20210914131716.102851-1-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <32aacbf5-4693-9765-4d4d-410332669294@redhat.com>
Date: Tue, 14 Sep 2021 15:47:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914131716.102851-1-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: stefanha@redhat.com, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 3:17 PM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The subsection name for page-poison was typo'd as:
> 
>   vitio-balloon-device/page-poison
> 
> Note the missing 'r' in virtio.
> 
> When we have a machine type that enables page poison, and the guest
> enables it (which needs a new kernel), things fail rather unpredictably.

IIUC since v5.1 guests have 'page-poison'=true but once migrated
they become 'page-poison'=unset=false?

> The fallout from this is that most of the other subsections fail to
> load, including things like the feature bits in the device, one
> possible fallout is that the physical addresses of the queues
> then get aligned differently and we fail with an error about
> last_avail_idx being wrong.
> It's not obvious to me why this doesn't produce a more obvious failure,
> but virtio's vmstate loading is a bit open-coded.

:/

> Fixes: 7483cbbaf82 ("virtio-balloon: Implement support for page poison reporting feature")
> bz: https://bugzilla.redhat.com/show_bug.cgi?id=1984401
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/virtio/virtio-balloon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 5a69dce35d..c6962fcbfe 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -852,7 +852,7 @@ static const VMStateDescription vmstate_virtio_balloon_free_page_hint = {
>  };
>  
>  static const VMStateDescription vmstate_virtio_balloon_page_poison = {
> -    .name = "vitio-balloon-device/page-poison",
> +    .name = "virtio-balloon-device/page-poison",
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .needed = virtio_balloon_page_poison_support,
> 


