Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF62768E253
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:55:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUzf-0003ib-Eo; Tue, 07 Feb 2023 15:55:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPUzc-0003iN-VB
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:55:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPUza-0007gZ-MT
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675803304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xr1/qRUfQ86/z25Q4iMHWkaWFXH7Qy4FWUnCUPjo0rA=;
 b=VgqFg3mYRx5S+AEl4D/KIZAEv7AQrpFMMf7eZ6zwHTelL0NJSB6shZop2nNCGKkNwRU+GC
 TKfJYy8ccgJb3qR7x5igDARHnhJxZJEscO87gTqCOQaD7uD4piJC/CH8bWoUcWJuP3Nibe
 Mo5xT/XnncF1wH4pnHAra86IzNs8En8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-SUJE4hbtMD-Hk0uAia5unA-1; Tue, 07 Feb 2023 15:55:00 -0500
X-MC-Unique: SUJE4hbtMD-Hk0uAia5unA-1
Received: by mail-qk1-f197.google.com with SMTP id
 g22-20020a05620a13d600b00726e7ad3f44so10541622qkl.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 12:54:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xr1/qRUfQ86/z25Q4iMHWkaWFXH7Qy4FWUnCUPjo0rA=;
 b=kNl5xDob3XXhzJ9K7cXK8wFcgSw57hJR9b3YMhcsGVvRUhjwFk+Ag17OV6HwJ9xQli
 iW28kJ/CBKfQlQIs0MAJfSEznh1xEur13MDooiHYDnSDfwy/tRd300QfnUZ+NOSjmGsg
 7bdma/iVTOq55iAgCDOZRzsduGPeGEpB7xca0mgPvW50xPABHMgI9brkIhihhNPws5D6
 XDKNsnrs5Wn9XVBOHLj05C72ERUnoYU2HUgg4kyn24HGkzcIWz98k2WrrrlNzFfG55a3
 s+EpL6B9wlj4uHvrClR6Ey/7NpT0AtWZlj3VW1GwD3qZSyjlqT8mjdKQPDUg40mQqcnk
 1IUQ==
X-Gm-Message-State: AO0yUKU+5+ZFwmQ2ahPM2GohTNWu0rK+y+8d1TYoSyLRWCaUXogYC1I6
 QJtFcSeRIIigju0+T88BX9tpmKUGMENq/iO6RnRu+J9k8t8sLUgcojFusznzzwBWavbpy2Zh/NT
 +dQ969D1VLdeiwJ8=
X-Received: by 2002:a05:622a:1b8c:b0:3bb:75f1:85d8 with SMTP id
 bp12-20020a05622a1b8c00b003bb75f185d8mr247591qtb.55.1675803296329; 
 Tue, 07 Feb 2023 12:54:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/aSKOQCVobRD4O1zciwKZaVNnuUPO9I752TYcDO1QQLn7ncJTBXkUZAsZvN/cRPj4yitZHzg==
X-Received: by 2002:a05:622a:1b8c:b0:3bb:75f1:85d8 with SMTP id
 bp12-20020a05622a1b8c00b003bb75f185d8mr247552qtb.55.1675803295961; 
 Tue, 07 Feb 2023 12:54:55 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 17-20020ac85651000000b003b63a734434sm10021836qtt.52.2023.02.07.12.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 12:54:55 -0800 (PST)
Message-ID: <82627608-0daf-e8f6-c4a5-d8217cd538f5@redhat.com>
Date: Tue, 7 Feb 2023 21:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Mark Burton <mburton@qti.qualcomm.com>, Luc Michel <luc@lmichel.fr>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <87lel9o56z.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Can we unpoison CONFIG_FOO macros?
In-Reply-To: <87lel9o56z.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 07/02/2023 16.39, Markus Armbruster wrote:
> We have a boatload of CONFIG_FOO macros that may only be used in
> target-dependent code.  We use generated config-poison.h to enforce.
> 
> This is a bit annoying in the QAPI schema.  Let me demonstrate with an
> example: QMP commands query-rocker, query-rocker-ports, and so forth.
> These commands are useful only with "rocker" devices.  They are
> compile-time optional.  hw/net/Kconfig:
> 
>      config ROCKER
>          bool
>          default y if PCI_DEVICES
>          depends on PCI && MSI_NONBROKEN
> 
> The rocker device and QMP code is actually target-independent:
> hw/net/meson.build puts it into softmmu_ss.
> 
> Disabling the "rocker" device type ideally disables the rocker QMP
> commands, too.  Should be easy enough: 'if': 'CONFIG_FOO' in the QAPI
> schema.
> 
> Except that makes the entire code QAPI generates for rocker.json
> device-dependent: it now contains #if defined(CONFIG_ROCKER), and
> CONFIG_ROCKER is poisoned.  The rocker code implementing monitor
> commands also becomes device-dependent, because it includes generated
> headers.  We compile all that per target for no sane reason at all.

Well, CONFIG_ROCKER depends on the target config, so that is a sane reason 
in my eyes. Depending on which target you currently compile, it's either set 
or not set - there is no reasonable way to compile generic code and still 
test the CONFIG_ROCKER macro.

So adding such a switch to rocker.json itself just cannot work.

But at the "make" level, we distinguish between config-all-devices.mak and 
*-softmmu-config-devices.mak , so if you want to disable the rocker QMP code 
depending on whether CONFIG_ROCKER is set in *any* target binary or not, you 
would need a similar mechanism to config-all-devices.mak here, e.g. 
something that would switch the inclusion of rocker.json on or off depending 
on the switch in config-all-devices.mak ...
Would it be possible to add such a switch to qapi/meson.build ?
... and to qapi/qapi-schema.json, I guess, since the rocker.json gets 
included from there? Something like that:

diff --git a/qapi/meson.build b/qapi/meson.build
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -59,9 +59,11 @@ if have_system
      'qdev',
      'pci',
      'rdma',
-    'rocker',
      'tpm',
    ]
+  if config_all_devices.has_key('CONFIG_ROCKER')
+    qapi_all_modules += [ 'rocker', ]
+  endif
  endif
  if have_system or have_tools
    qapi_all_modules += [
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -72,7 +72,7 @@
  { 'include': 'job.json' }
  { 'include': 'net.json' }
  { 'include': 'rdma.json' }
-{ 'include': 'rocker.json' }
+{ 'include': 'rocker.json', 'if': 'CONFIG_ROCKER' }
  { 'include': 'tpm.json' }
  { 'include': 'ui.json' }
  { 'include': 'authz.json' }

No clue whether the qapi parser could be extended like that, though...

  Thomas


