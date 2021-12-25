Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C447F46C
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Dec 2021 21:49:19 +0100 (CET)
Received: from localhost ([::1]:46170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1Dyg-0006JA-Fp
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 15:49:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n1Dxo-0005eM-9T
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 15:48:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n1Dxl-0000PR-7q
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 15:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640465299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJ/rzNkTBb9/b4hdfSoObGHmB9EUsg8nhvC/sTufQEw=;
 b=TVrt1Uh/sTT9imaJaK7rNLPihzSkDJBelXnDqp9c3RbSOQGKpUjhfVVuP//HbYWf7Z8wUg
 kMzwSFQefibHBkGhvrOJ+uLHPbfKynEtEE19/qsfh6XwdsKiPJtUDfYMeX7uLYEalLtc7g
 tQSPuhPYcXlGGarnEnTNicJq9wpiavM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-1HP5GhEGNsy2WVQT5zqMJA-1; Sat, 25 Dec 2021 15:48:18 -0500
X-MC-Unique: 1HP5GhEGNsy2WVQT5zqMJA-1
Received: by mail-ed1-f69.google.com with SMTP id
 q15-20020a056402518f00b003f87abf9c37so8461941edd.15
 for <qemu-devel@nongnu.org>; Sat, 25 Dec 2021 12:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uJ/rzNkTBb9/b4hdfSoObGHmB9EUsg8nhvC/sTufQEw=;
 b=3iYWAVBqyJvSHG3XcbM+NqiHOiFQXIzb+fH4RtsHEke4nbfu2v6tSk5M1XYNyxehUj
 udhCZZJipwNwzM3S+6+ssjlEcLmFXkcbVC0PSkLCuXllGPYqSSsgQqdgT8yxQMWgcbhY
 PiE3SQrPMrGAfZKJ0fRE+yUs2/ptsPdFrAnGtuxpFOlL2uICZcuhx29NZIcnHni8N8Qd
 QMZK7w2kO70b69S/HjmXkCPhSdn/aGIyN6+qJ4o0nttNlirMWGfIT4S4nVlU6e+Dl0Pb
 j7prGy8xS0z/ajbiFvlNxh3swCNSq1ayXFNBwZrCpiU4R0AjymzleJCDSFfTRUla4WvP
 EeEQ==
X-Gm-Message-State: AOAM533l8gVxTNvL9DKAw2qJgMp/ESkdh3yA8ADet/SsGMcIUQKwc+ih
 4vM2ckjoJ6oyMZE/YBc5ZZVB6U1zvo0BHnKbgJ05eZCQIp+r+eMxMutAfxVfTGQp+Sv4UcHC8Ca
 63hOVoOiKfSWgqU0=
X-Received: by 2002:a17:907:86a6:: with SMTP id
 qa38mr8879845ejc.170.1640465296629; 
 Sat, 25 Dec 2021 12:48:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7PXqSSEJ7fFdKgv4lxOX8F7ehmeY070MS1GnjqJvtwILM9tcRrNiwefSRZTTzf2f++bQJDA==
X-Received: by 2002:a17:907:86a6:: with SMTP id
 qa38mr8879834ejc.170.1640465296356; 
 Sat, 25 Dec 2021 12:48:16 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id s16sm4341058edt.30.2021.12.25.12.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Dec 2021 12:48:15 -0800 (PST)
Message-ID: <81a99f68-9959-8d78-8457-b59f465953ae@redhat.com>
Date: Sat, 25 Dec 2021 21:48:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tpm: fixed be_buffer_size size in in tpm_crb
To: Yuri Konotopov <ykonotopov@gnome.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20211225123806.113368-1-ykonotopov@gnome.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211225123806.113368-1-ykonotopov@gnome.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.202,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.196, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Marc-André

On 12/25/21 13:38, Yuri Konotopov wrote:
> Trying to boot VM with TPM 2.0 CRB in passthrough mode without this change
> I got "Requested buffer size of 3968 is smaller than host TPM's fixed
> buffer size of 4096".
> Looks like it can not be less than backend buffer size nor less than
> CRB_CTRL_CMD_SIZE.
> 
> Signed-off-by: Yuri Konotopov <ykonotopov@gnome.org>
> ---
>  hw/tpm/tpm_crb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> index 58ebd1469c..8243645453 100644
> --- a/hw/tpm/tpm_crb.c
> +++ b/hw/tpm/tpm_crb.c
> @@ -270,7 +270,7 @@ static void tpm_crb_reset(void *dev)
>      s->regs[R_CRB_CTRL_RSP_SIZE] = CRB_CTRL_CMD_SIZE;
>      s->regs[R_CRB_CTRL_RSP_ADDR] = TPM_CRB_ADDR_BASE + A_CRB_DATA_BUFFER;
>  
> -    s->be_buffer_size = MIN(tpm_backend_get_buffer_size(s->tpmbe),
> +    s->be_buffer_size = MAX(tpm_backend_get_buffer_size(s->tpmbe),
>                              CRB_CTRL_CMD_SIZE);
>
>      if (tpm_backend_startup_tpm(s->tpmbe, s->be_buffer_size) < 0) {

This doesn't look correct: if the backend buffer size is smaller,
we can not use a bigger size, otherwise we might end up overflowing
the buffer.

What about checking the backend buffer size at realization?
Could the backend change this size on reset?

-- >8 --
diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 58ebd1469c3..57346eaa857 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -270,9 +270,6 @@ static void tpm_crb_reset(void *dev)
     s->regs[R_CRB_CTRL_RSP_SIZE] = CRB_CTRL_CMD_SIZE;
     s->regs[R_CRB_CTRL_RSP_ADDR] = TPM_CRB_ADDR_BASE + A_CRB_DATA_BUFFER;

-    s->be_buffer_size = MIN(tpm_backend_get_buffer_size(s->tpmbe),
-                            CRB_CTRL_CMD_SIZE);
-
     if (tpm_backend_startup_tpm(s->tpmbe, s->be_buffer_size) < 0) {
         exit(1);
     }
@@ -290,6 +287,12 @@ static void tpm_crb_realize(DeviceState *dev, Error
**errp)
         error_setg(errp, "'tpmdev' property is required");
         return;
     }
+    s->be_buffer_size = tpm_backend_get_buffer_size(s->tpmbe);
+    if (s->be_buffer_size < CRB_CTRL_CMD_SIZE) {
+        error_setg(errp, "'tpmdev' buffer size too small (%zu, minimum:
%u)",
+                   s->be_buffer_size, CRB_CTRL_CMD_SIZE);
+        return;
+    }

     memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
         "tpm-crb-mmio", sizeof(s->regs));
---


